Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC03A0C3
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 18:49:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EA1E1616;
	Sat,  8 Jun 2019 18:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EA1E1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560012571;
	bh=Fteu0/uZSJjvpQx8JBf8c58JrJdMgqJwERKc1t9nB6w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GsQ/rtLiVTSlibTQkSaJMwih5WliyXK1/J7Ako1fP+s9Fl8hi2USC5tiAGeAv3L6M
	 s4k03Z5VP8PaYCxlTSPAh74722Z6aYkjz9ZhR/FlkYGJ0Kf5S5klKVcSUUPfwUw7cN
	 i5qfD8T3mheX2rKPxVVKZeOiuRIJLj6Gdxg18yQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A519F8976B;
	Sat,  8 Jun 2019 18:40:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA7FAF896F7; Wed,  5 Jun 2019 00:21:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C826BF896CE
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 00:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C826BF896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="wuYW9LMU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HzINfIomz+jZdDZc97zZbwwoQK6CJjian9eesz7qoBM=; b=wuYW9LMUQjVQcHs2Y2ESPd6+K3
 X29JmF0KjfmZsjMYoiwarTXYF7CFXv9nwdG7ZqARfUhg3Ucb7/WXe8tE0RqrR7xgBX9VNccnno79z
 mCBUcLf4I0cnXRFyxXER2r6+iynwkGSdoiP02Ts/nxaV+XL62S0mTwoc4wjkKfjyovxWWoy4SbBIg
 K2AZlr+0x1Yl0iQrw2d0eZJwgqFvYqekB7UAas8ITyv24MycrzpeCmOv7AhG20sGsH8wZ+yV/CDMT
 CdJjdoZNOPJspYSxFnZmPKPn+D8iwvfvKcaU7/btUc+TQyt6ffVjRIMYsdhhaTCQfDn0juvRO4uAV
 FZa78N7g==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYHle-00019X-JV; Tue, 04 Jun 2019 22:18:54 +0000
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0a5acc33-40f9-9235-505e-92f534ddc7e2@infradead.org>
Date: Tue, 4 Jun 2019 15:18:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604152019.16100-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 08 Jun 2019 18:39:50 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Enno Luebbers <enno.luebbers@intel.com>, gwendal@chromium.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-doc@vger.kernel.org,
 Wolfram Sang <wsa@the-dreams.de>, Mark Brown <broonie@kernel.org>,
 Juergen Fitschen <jfi@ssv-embedded.de>, alsa-devel@alsa-project.org,
 Stefan Agner <stefan@agner.ch>, Douglas Anderson <dianders@chromium.org>,
 Jilayne Lovejoy <opensource@jilayne.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Guido Kiener <guido@kiener-muenchen.de>, linux-i2c@vger.kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Guenter Roeck <groeck@chromium.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ravi Chandra Sadineni <ravisadineni@chromium.org>, kernel@collabora.com,
 dtor@chromium.org, Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Jean Delvare <jdelvare@suse.de>, Vignesh R <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
 Sean Young <sean@mess.org>, Jonathan Corbet <corbet@lwn.net>,
 Lee Jones <lee.jones@linaro.org>, Patrick Lai <plai@codeaurora.org>,
 Brian Norris <briannorris@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Evan Green <evgreen@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>,
 Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
 linux-input@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Wu Hao <hao.wu@intel.com>,
 Ettore Chimenti <ek5.chimenti@gmail.com>, linux-pwm@vger.kernel.org,
 Jiri Kosina <jikos@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Hartmut Knaack <knaack.h@gmx.de>, Marco Felsch <m.felsch@pengutronix.de>,
 Florian Fainelli <f.fainelli@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ajay Gupta <ajayg@nvidia.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-iio@vger.kernel.org,
 Jacky Bai <ping.bai@nxp.com>,
 Fabien Lahoudere <fabien.lahoudere@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Colin Ian King <colin.king@canonical.com>, linux-media@vger.kernel.org,
 Eddie James <eajames@linux.vnet.ibm.com>, Jonathan Cameron <jic23@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [alsa-devel] [PATCH 00/10] Move part of cros-ec out of MFD
	subsystem
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 6/4/19 8:20 AM, Enric Balletbo i Serra wrote:
> Hi,
> 
> This is the first attempt to clean up a bit more the cros-ec drivers
> to have a better separation on what is part of the MFD subsystem and what
> is part of platform/chrome.
> 
> It'd be really nice have some reviews, acks and tested on different
> platforms from the chromiumos people before merge all this patchset, as
> this moves a lot of code.
> 
> The major changes introduced by this patchset are:
> 1. Move the core driver to platform/chrome, as is not really related to
> an MFD device driver.
> 2. Create a new misc chardev driver to replace the chardev bits from
> cros-ec-dev (MFD)
> 3. Added some convenience structs in cros-ec-dev (MFD) to easy add more
> subdrivers and avoid to add more boiler plate.
> 
> Once applied we have moved all the code to platform/chrome except the
> cros-ec-dev driver, which is the one that instantiates the different
> subdrivers as cells of the MFD device.
> 
> I tested the following patches on Veyron, Kevin, Samus, Peach Pi and
> Peach Pit without noticing any problem, but they would need a lot of
> more tests. I'll continue testing while the reviewing process of this
> patchset.
> 
> Waiting for your feedback,
>  Enric
> 

Hi,
Was there a patch 02/10?  I didn't see it.
What mailing list(s) was it sent to?

thanks.

> 
> Enric Balletbo i Serra (10):
>   mfd / platform: cros_ec: Handle chained ECs as platform devices
>   mfd / platform: cros_ec: Move cros-ec core driver out from MFD
>   mfd / platform: cros_ec: Miscellaneous character device to talk with
>     the EC
>   mfd: cros_ec: Switch to use the new cros-ec-chardev driver
>   mfd / platform: cros_ec: Rename config to a better name
>   mfd / platform: cros_ec: Reorganize platform and mfd includes
>   mfd: cros_ec: Update with SPDX Licence identifier and fix description
>   mfd: cros_ec: Use kzalloc and cros_ec_cmd_xfer_status helper
>   mfd: cros_ec: Add convenience struct to define dedicated CrOS EC MCUs
>   mfd: cros_ec: Add convenience struct to define autodetectable CrOS EC
>     subdevices
> 
>  Documentation/ioctl/ioctl-number.txt          |   2 +-
>  drivers/extcon/Kconfig                        |   2 +-
>  drivers/extcon/extcon-usbc-cros-ec.c          |   3 +-
>  drivers/hid/Kconfig                           |   2 +-
>  drivers/hid/hid-google-hammer.c               |   4 +-
>  drivers/i2c/busses/Kconfig                    |   2 +-
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c       |   4 +-
>  drivers/iio/accel/cros_ec_accel_legacy.c      |   3 +-
>  drivers/iio/common/cros_ec_sensors/Kconfig    |   2 +-
>  .../common/cros_ec_sensors/cros_ec_sensors.c  |   3 +-
>  .../cros_ec_sensors/cros_ec_sensors_core.c    |   3 +-
>  drivers/iio/light/cros_ec_light_prox.c        |   3 +-
>  drivers/iio/pressure/cros_ec_baro.c           |   3 +-
>  drivers/input/keyboard/Kconfig                |   2 +-
>  drivers/input/keyboard/cros_ec_keyb.c         |   4 +-
>  drivers/media/platform/Kconfig                |   3 +-
>  .../media/platform/cros-ec-cec/cros-ec-cec.c  |   4 +-
>  drivers/mfd/Kconfig                           |  26 +-
>  drivers/mfd/Makefile                          |   4 +-
>  drivers/mfd/cros_ec_dev.c                     | 433 +++++-------------
>  drivers/platform/chrome/Kconfig               |  48 +-
>  drivers/platform/chrome/Makefile              |   2 +
>  drivers/{mfd => platform/chrome}/cros_ec.c    |  64 +--
>  drivers/platform/chrome/cros_ec_chardev.c     | 279 +++++++++++
>  drivers/platform/chrome/cros_ec_debugfs.c     |   3 +-
>  drivers/platform/chrome/cros_ec_i2c.c         |  12 +-
>  drivers/platform/chrome/cros_ec_lightbar.c    |   3 +-
>  drivers/platform/chrome/cros_ec_lpc.c         |   7 +-
>  drivers/platform/chrome/cros_ec_lpc_reg.c     |   4 +-
>  drivers/platform/chrome/cros_ec_proto.c       |   3 +-
>  drivers/platform/chrome/cros_ec_rpmsg.c       |   6 +-
>  drivers/platform/chrome/cros_ec_spi.c         |  12 +-
>  drivers/platform/chrome/cros_ec_sysfs.c       |   3 +-
>  drivers/platform/chrome/cros_ec_trace.c       |   2 +-
>  drivers/platform/chrome/cros_ec_trace.h       |   4 +-
>  drivers/platform/chrome/cros_ec_vbc.c         |   3 +-
>  drivers/platform/chrome/cros_usbpd_logger.c   |   5 +-
>  drivers/power/supply/Kconfig                  |   2 +-
>  drivers/power/supply/cros_usbpd-charger.c     |   5 +-
>  drivers/pwm/Kconfig                           |   2 +-
>  drivers/pwm/pwm-cros-ec.c                     |   4 +-
>  drivers/rtc/Kconfig                           |   2 +-
>  drivers/rtc/rtc-cros-ec.c                     |   3 +-
>  .../linux/iio/common/cros_ec_sensors_core.h   |   3 +-
>  include/linux/mfd/cros_ec.h                   | 302 +-----------
>  .../{mfd => platform_data}/cros_ec_commands.h |   0
>  include/linux/platform_data/cros_ec_proto.h   | 315 +++++++++++++
>  .../uapi/linux/cros_ec_chardev.h              |  18 +-
>  sound/soc/codecs/cros_ec_codec.c              |   4 +-
>  sound/soc/qcom/Kconfig                        |   2 +-
>  50 files changed, 902 insertions(+), 732 deletions(-)
>  rename drivers/{mfd => platform/chrome}/cros_ec.c (85%)
>  create mode 100644 drivers/platform/chrome/cros_ec_chardev.c
>  rename include/linux/{mfd => platform_data}/cros_ec_commands.h (100%)
>  create mode 100644 include/linux/platform_data/cros_ec_proto.h
>  rename drivers/mfd/cros_ec_dev.h => include/uapi/linux/cros_ec_chardev.h (70%)
> 


-- 
~Randy
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
