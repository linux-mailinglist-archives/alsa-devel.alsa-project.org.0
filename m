Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E4C3A0C9
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 18:52:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50BD5166A;
	Sat,  8 Jun 2019 18:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50BD5166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560012770;
	bh=5UtbFVBanUnv6DaKpPt4e6jOlk0nZP6hc1l0wYo56X8=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZlZ/91mkeuluEZYfL1kOwthaMDgt2VtOd4DcT5jjWJJLOBdy/VmHzTr3pHEmnW3qR
	 0lrTZzjMb/yj9JetDfXTZpaTQbks0ZUDJTiDYkNiCg+C0Pjk0mhYBZ3Zos5KAnv6FE
	 o+lAttCZqqIfkXsEwHcieS4EiJ7IJcJsoKXh7tjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F225F89783;
	Sat,  8 Jun 2019 18:40:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56D69F896F7; Thu,  6 Jun 2019 08:28:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8F76F80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 08:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F76F80768
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3AA2AAF50;
 Thu,  6 Jun 2019 06:28:24 +0000 (UTC)
Date: Thu, 6 Jun 2019 08:28:18 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20190606082818.424c783c@endymion>
In-Reply-To: <0a5acc33-40f9-9235-505e-92f534ddc7e2@infradead.org>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <0a5acc33-40f9-9235-505e-92f534ddc7e2@infradead.org>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 08 Jun 2019 18:39:50 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Enno Luebbers <enno.luebbers@intel.com>, gwendal@chromium.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-doc@vger.kernel.org,
 Wolfram Sang <wsa@the-dreams.de>, Mark Brown <broonie@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Juergen Fitschen <jfi@ssv-embedded.de>, alsa-devel@alsa-project.org,
 Stefan Agner <stefan@agner.ch>, Sebastian Reichel <sre@kernel.org>,
 Jilayne Lovejoy <opensource@jilayne.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Guido Kiener <guido@kiener-muenchen.de>, linux-i2c@vger.kernel.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Dong Aisheng <aisheng.dong@nxp.com>, Guenter Roeck <groeck@chromium.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ravi Chandra Sadineni <ravisadineni@chromium.org>, kernel@collabora.com,
 dtor@chromium.org, Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Vignesh R <vigneshr@ti.com>, linux-rtc@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>,
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
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Florian Fainelli <f.fainelli@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Lars-Peter Clausen <lars@metafoo.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ajay Gupta <ajayg@nvidia.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Jacky Bai <ping.bai@nxp.com>,
 Fabien Lahoudere <fabien.lahoudere@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
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

Hi Randy,

On Tue, 4 Jun 2019 15:18:43 -0700, Randy Dunlap wrote:
> Was there a patch 02/10?  I didn't see it.
> What mailing list(s) was it sent to?

There was, but I can't find it in list archives, probably because there
were too many recipients.

I'll bounce the copy I received to you.

-- 
Jean Delvare
SUSE L3 Support
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
