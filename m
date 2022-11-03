Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB206192A5
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:19:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA6CE1675;
	Fri,  4 Nov 2022 09:18:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA6CE1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667549988;
	bh=gFrR/HZJVFnrzTPsnlsBz7pKq21Q9tONjun5QAgfrBM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=KRz9T+g8NF+p9Ig7plIJSaLrKQZRA6/cSDhHrL6UX35Zz1aSsUabp4SPOF1Ym3bPO
	 V3xqj3KqghaXUV7MaHs8YI4An11ZtEWpOR6NMusTiIywNfulhmmua4EydBK5Sjb3J2
	 +SMPKg1k1o8yVRhyz62M715mzAq7VKSPNaaDvGAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53092F805A1;
	Fri,  4 Nov 2022 09:16:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 625A5F801D5; Thu,  3 Nov 2022 17:37:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=FREEMAIL_FROM, FREEMAIL_REPLYTO,
 HTML_MESSAGE,KHOP_HELO_FCRDNS,MIME_HTML_ONLY,PRX_BODY_30,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr
 [80.12.242.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 178BBF80155
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 17:37:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 178BBF80155
Received: from opme11oxm02aub.pom.fr.intraorange ([10.110.82.2])
 by smtp.orange.fr with ESMTP
 id qdDQoMDFB94emqdDQoFLjH; Thu, 03 Nov 2022 17:37:17 +0100
X-ME-Helo: opme11oxm02aub.pom.fr.intraorange
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Thu, 03 Nov 2022 17:37:17 +0100
X-ME-IP: 92.184.110.22
Date: Thu, 3 Nov 2022 17:37:16 +0100 (CET)
From: Jarzmik Robert <jarzmik.robert@orange.fr>
To: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 robert.jarzmik@free.fr
Message-ID: <803778517.2279639.1667493436959.JavaMail.open-xchange@opme11oxm02aub.pom.fr.intraorange>
In-Reply-To: <7d9eebc8-39b6-4dc1-9ffc-f17ec584bee2@app.fastmail.com>
References: <20221019161831.3864786-1-arnd@kernel.org>
 <m2r0z3h5yr.fsf@sopl295.home>
 <7d9eebc8-39b6-4dc1-9ffc-f17ec584bee2@app.fastmail.com>
Subject: Re: [PATCH 00/30] ARM: pxa: remove all unused boards&drivers
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.6.3-Rev65
X-Originating-IP: 92.184.110.22
X-Originating-Client: open-xchange-appsuite
X-Mailman-Approved-At: Fri, 04 Nov 2022 09:16:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, sre@kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mtd@lists.infradead.org,
 philipp.zabel@gmail.com, Miquel Raynal <miquel.raynal@bootlin.com>,
 kernel@wantstofly.org, linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Russell King <linux@armlinux.org.uk>, marek.vasut@gmail.com,
 Alan Stern <stern@rowland.harvard.edu>, linux-input@vger.kernel.org,
 slapin@ossfans.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 lost.distance@yahoo.com, Haojian Zhuang <haojian.zhuang@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-fbdev@vger.kernel.org,
 tiwai@suse.com, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, mkpetch@internode.on.net,
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
 jingoohan1@gmail.com, linux-usb@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 lgirdwood@gmail.com, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, patches@opensource.cirrus.com,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Mack <daniel@zonque.org>
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
Reply-To: Jarzmik Robert <jarzmik.robert@orange.fr>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

   I'm sorry Arnd, my mailer messed up again, and instead of using my
   normal [1]robert.jarzmik@free.fr, it used my ISP mail ...

   This answer will most probably look horrible, probably in html with no
   way of using plain text... sorry for that.

   The reason you're not seeing the AC97_BUS_NEW used is because this
   becomes visible only in device-tree files, which were posted (for
   mioa701 for example) but never properly reviewed nor merged.

   As from memory, at least mioa701, zylonite, em_x270 are DT ported, ie.
   there is a DT file which makes them boot. For the mioa701, the DT file
   offers the same functionnality, ie. all drivers in mioa701.c legacy
   file are working as well in a DT variant (not using mioa701.c
   obviously).

   > Any idea where I went wrong here? Did I make a mistake in following
   the Kconfig dependencies, or are some parts of this
   incorrectly annotated?

   I don't think you did a mistake, I think I did. When I saw the patch of
   "deprecation" of mioa701 and all the other pxa files, I took it that
   the platform-device was deprecated, and was to be removed. This is the
   right thing to do in my opinion. I wouldn't mind if all board file go
   actually (expect the QEMU one), as this would leave only the boards
   with proper DT support, and would remove some clutter from the kernel.

   I also thought the drivers won't get touched by the purge, exception
   made of "platform similar ones", such as in the sound tree
   (sound/soc/pxa) where we have some of them, and maybe mfd tree.

   Cheers.

   --

   Robert

References

   1. mailto:robert.jarzmik@free.fr,
