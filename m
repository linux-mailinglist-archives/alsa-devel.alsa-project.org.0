Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A12D4E0803
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 17:55:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E4521662;
	Tue, 22 Oct 2019 17:54:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E4521662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571759744;
	bh=eXZhOsaOOa54DPIdUz3q7Rog1L8R48K6KCXkhoxoEmY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HLt5njb7vbvx02V2iNr/IueGkW7XttkvIR6ZwGfGbUI2ANx0yqeNAs7QKWtYuXN6w
	 H5EejqD364H4Fnu6HaX1PWIpWEXx/JM6uzW3GeU7BX8sm9ity+n/XzjQ+AITPT/iXP
	 Axqh8w4Lhp2JDiYEA9cGsJrs7mArGaRjPGmWPLvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CB05F8031A;
	Tue, 22 Oct 2019 17:54:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 582C3F8031A; Tue, 22 Oct 2019 17:53:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C866FF800C0
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 17:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C866FF800C0
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iMwT7-0006Ja-Jx; Tue, 22 Oct 2019 17:53:09 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iMwT5-0002EX-5J; Tue, 22 Oct 2019 17:53:07 +0200
Date: Tue, 22 Oct 2019 17:53:07 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191022155307.izh4ryorm7thw7tq@pengutronix.de>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-11-arnd@arndb.de>
 <20191011055149.4dudr4tk2znpt65u@pengutronix.de>
 <CAK8P3a1st8gR7u+8-oyP6HrzZdmrzhq7PRonYuz0a5O8rfKaSA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1st8gR7u+8-oyP6HrzZdmrzhq7PRonYuz0a5O8rfKaSA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kukjin Kim <kgene@kernel.org>,
 =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-spi <linux-spi@vger.kernel.org>, Faiz Abbas <faiz_abbas@ti.com>,
 Olof Johansson <olof@lixom.net>
Subject: Re: [alsa-devel] [PATCH 11/36] ARM: s5pv210: split from plat-samsung
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

On Tue, Oct 22, 2019 at 04:01:12PM +0200, Arnd Bergmann wrote:
> > > @@ -235,7 +235,6 @@ machine-$(CONFIG_PLAT_SPEAR)              +=3D sp=
ear
> > >  # by CONFIG_* macro name.
> > >  plat-$(CONFIG_ARCH_OMAP)     +=3D omap
> > >  plat-$(CONFIG_ARCH_S3C64XX)  +=3D samsung
> > > -plat-$(CONFIG_ARCH_S5PV210)  +=3D samsung
> >
> > Would it make more sense to make this
> >
> >         plat-$(PLAT_SAMSUNG) +=3D samsung
> >
> > (in a separate patch)? Hmm, it seems there is no plat-y for
> > PLAT_S3C24XX=3Dy builds. Is this intended? If yes, the directory name
> > containing "samsung" suggests something that seems untrue.
> =

> By the end of the series, the plat-samsung directory is completely
> removed (folded into mach-s3c), so that would only add more
> churn for the same result I think.

fine for me. The background of my question was me wondering if builds
for PLAT_S3C24XX=3Dy (before your patch series) don't need plat-samsung.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
