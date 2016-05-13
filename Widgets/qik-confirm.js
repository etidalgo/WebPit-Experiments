/*!
 * Patterned after jquery-confirm v1.0.0 (http://craftpip.github.io/jquery-confirm/)
 * Created to take advantage of existing styles

 */

if (typeof jQuery === 'undefined') {
    throw new Error('qik-confirm requires jQuery');
}

var qconfirm, QConfirm;
(function ($) {
    "use strict";

    $.qikconfirm = function (options) {
        options.type = 'confirm';
        return qconfirm(options);
    };


    $.qikalert = function (options) {
        options.type = 'alert';
        return qconfirm(options);
    };

    qconfirm = function (options) {

        /*
         * initial function for calling.
         */

        if (qconfirm.defaults) {
            /*
             * Merge global defaults with plugin defaults
             */
            $.extend(qconfirm.pluginDefaults, qconfirm.defaults);
        }

        /*
         * merge options with plugin defaults.
         */
        var options = $.extend({}, qconfirm.pluginDefaults, options);
        return new QConfirm(options);
    };

    QConfirm = function (options) {

        /*
         * constructor function QConfirm, 
         * options = user options.
         */
        $.extend(this, options);
        this.animation = this.animation.toLowerCase();
        this._init();
    };

    QConfirm.prototype = {
        _init: function () {
            this._buildHTML();
            this._bindEvents();

            var that = this;
            setTimeout(function () {
                that.open();
            }, 100);
        },
        animations: ['anim-scale', 'anim-top', 'anim-bottom', 'anim-left', 'anim-right', 'anim-zoom', 'anim-opacity', 'anim-none', 'anim-rotate', 'anim-rotatex', 'anim-rotatey', 'anim-scalex', 'anim-scaley', 'anim-blur'],
        _buildHTML: function () {
            var that = this;
            /*
             * append html to body.
             */
            this.$el = $(this.template).appendTo('body')
                    .addClass(this.theme);
            this.$b = this.$el.find('.qconfirm-msgbox')
                    .css({
                        '-webkit-transition': 'all ' + this.animationSpeed / 1000 + 's',
                        'transition': 'all ' + this.animationSpeed / 1000 + 's'
                    });
            this.$body = this.$b; // alias
					

            /*
             * cleaning animations
             */
            this.animation = this.animation.split('|');
            $.each(this.animation, function (i, a) {
                that.animation[i] = 'anim-' + a;
            });
            this.$b.addClass(this.animation.join(' '));

            /*
             * setup html contents
             */
            this.$el.find('div.title').html('<i class="' + this.icon + '"></i> ' + this.title);
            this.$el.find('p.content').html(this.content);
			
			if ( this.height ) {
				this.$b.css("height", this.height);
			}

			if ( this.width ) {
				this.$b.css("width", this.width);
			}
			
			if ( this.msgHeight ) {
				this.$b.find('p.content').css("height", this.msgHeight);
			}

            var $btnc = this.$el.find('.buttons');
            if (this.confirmButton) {
                this.$confirmButton = $('<span class="btn">' + this.confirmButton + '</span>').appendTo($btnc);
                this.$confirmButton.addClass(this.confirmButtonClass);
            }
            if (this.cancelButton && this.type !== 'alert') {
                this.$cancelButton = $('<span class="btn">' + this.cancelButton + '</span>').appendTo($btnc);
                this.$cancelButton.addClass(this.cancelButtonClass);
            }
            if (this.autoClose)
                this._startCountDown();
        },
        _startCountDown: function () {
            var opt = this.autoClose.split('|');

            if (/cancel/.test(opt[0]) && this.type === 'alert')
                return false;

            if (/confirm|cancel/.test(opt[0])) {
                this.$cd = $(' <span class="countdown"></span>').appendTo(this['$' + opt[0] + 'Button']);
                var that = this;

                that.$cd.parent().click();
                var time = opt[1] / 1000;

                this.interval = setInterval(function () {
                    that.$cd.html(' [' + (time -= 1) + ']');
                    if (time === 0) {
                        that.$cd.parent().trigger('click');
                        clearInterval(that.interval);
                    }
                }, 1000);
            }
        },
        _bindEvents: function () {
            var that = this;

            this.$el.find('.qconfirm-bg').click(function (e) {
                if (that.backgroundDismiss) {
                    that.cancel();
                    that.close();
                } else {
                    that.$b.addClass('hilight');
                    setTimeout(function () {
                        that.$b.removeClass('hilight');
                    }, 400);
                }
            });

            this.$confirmButton.click(function (e) {
                that.close();
                that.confirm();
            });

            if (this.$cancelButton) {
                this.$cancelButton.click(function (e) {
                    that.close();
                    that.cancel();
                });
            }
        },
        close: function () {
            var that = this;
			that.$el.fadeOut(this.animationSpeed, function(){that.$el.remove();});
        },
        open: function () {
            var that = this;
			this.$el.fadeIn();
        }
    };

    qconfirm.pluginDefaults = {
        template: `
				<div class="qconfirm-bg" >
                    <div class="qconfirm-msgbox" >
                        <div class="title">Confirmation</div>
                        <p class="content"></p>
						<div class="buttons" />
                    </div>
                </div> 
				`,
        title: 'Confirmation',
        content: 'Are you sure to continue?',
        icon: '',
        confirmButton: 'Okay',
        cancelButton: 'Cancel',
        confirmButtonClass: 'btn-default',
        cancelButtonClass: 'btn-default',
        theme: 'white',
        animation: 'scale',
        animationSpeed: 400,
        confirm: function () {
        },
        cancel: function () {
        },
        backgroundDismiss: false,
        autoClose: false
    };
})(jQuery);