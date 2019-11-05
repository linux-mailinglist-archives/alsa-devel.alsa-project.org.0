Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0F3EFEE5
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 14:44:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB154170B;
	Tue,  5 Nov 2019 14:43:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB154170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572961470;
	bh=g+EGhbSbsTL7s4e/2sWX3XH5GTGFo9RidIVTfRaBLxA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hQ3azfVXtiDY4AFKhXGsrDf14zELO9TeiMWsUDKNoOnyYpUXuX9XvOt6iZN+6zcgJ
	 a3sJj5w4DPL6F8zvcAWXQFw+QVH/i3KjH0rXTXA0ZV0c4t4OsobOvO+K92W9iRncnq
	 fBAdE01GlS73V/HgCmCjX578ZMiXuvRi8vPPGk6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30064F80674;
	Tue,  5 Nov 2019 14:38:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B0F6F8049B; Tue,  5 Nov 2019 14:36:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_28,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82734F800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 14:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82734F800F3
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iRz0B-000869-V7; Tue, 05 Nov 2019 14:36:07 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iRz08-0007MZ-9i; Tue, 05 Nov 2019 14:36:04 +0100
Date: Tue, 5 Nov 2019 14:36:04 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Message-ID: <20191105133604.d2xcasxw7pwzwvh7@pengutronix.de>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
 <20191105122042.GO32742@smile.fi.intel.com>
 <4e6fa62d7022c7b1426477a150a93c899725f5b0.camel@fi.rohmeurope.com>
 <20191105131038.duol3rwwkbuvgvwv@pengutronix.de>
 <938a5ec7b41ae9ce7b0de83764d6b774cfdaa781.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <938a5ec7b41ae9ce7b0de83764d6b774cfdaa781.camel@fi.rohmeurope.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Tue, 05 Nov 2019 14:38:15 +0100
Cc: "semi.malinen@ge.com" <semi.malinen@ge.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "nandor.han@ge.com" <nandor.han@ge.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "info@metux.net" <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Subject: Re: [alsa-devel] [PATCH 00/62] Add definition for GPIO direction
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

On Tue, Nov 05, 2019 at 01:30:20PM +0000, Vaittinen, Matti wrote:
> On Tue, 2019-11-05 at 14:10 +0100, Uwe Kleine-K=F6nig wrote:
> > Hello,
> > =

> > On Tue, Nov 05, 2019 at 12:54:55PM +0000, Vaittinen, Matti wrote:
> > > On Tue, 2019-11-05 at 14:20 +0200, Andy Shevchenko wrote:
> > > > I would also like to see bloat-o-meter statistics before and
> > > > after
> > > > your patch.
> > > > My guts tell me that the result will be not in the favour of
> > > > yours
> > > > solution.
> > > =

> > > Can you please tell me what type of stats you hope to see? I can
> > > try
> > > generating what you are after. The cover letter contained typical
> > > +/-
> > > change stats from git and summary:
> > > =

> > > 62 files changed, 228 insertions(+), 104 deletions(-)
> > =

> > I guess he wants to see
> > =

> > 	scripts/bloat-o-meter vmlinuz.old vmlinuz
> > =

> > . I would expect a 0 there. I didn't look in detail, but in general I
> > like the idea to give 0 and 1 a symbolic name.
> =

> Thanks Uwe. This far I have only cross-compiled the series for arm
> which I use for developing the ROHM PMICs. scripts/bloat-o-meter /
> tools it uses does not seem to recognize the image format (not a big
> surprize as my host is x86_64).

It works for me, I guess that's because my binutils support several
architectures:

	$ nm --help
	...
	nm: supported targets: elf64-x86-64 elf32-i386 elf32-iamcu elf32-x86-64
	pei-i386 pei-x86-64 elf64-l1om elf64-k1om elf64-little elf64-big
	elf32-little elf32-big elf64-littleaarch64 elf64-bigaarch64
	elf32-littleaarch64 elf32-bigaarch64 elf32-littlearm elf32-bigarm
	elf64-alpha ecoff-littlealpha elf32-littlearm-fdpic elf32-bigarm-fdpic
	elf32-hppa-linux elf32-hppa elf64-ia64-little elf64-ia64-big pei-ia64
	elf32-m32r-linux elf32-m32rle-linux elf32-m68k elf32-tradbigmips
	elf32-tradlittlemips ecoff-bigmips ecoff-littlemips elf32-ntradbigmips
	elf64-tradbigmips elf32-ntradlittlemips elf64-tradlittlemips
	elf32-powerpc aixcoff-rs6000 elf32-powerpcle ppcboot elf64-powerpc
	elf64-powerpcle aixcoff64-rs6000 aix5coff64-rs6000 elf64-littleriscv
	elf32-littleriscv elf32-s390 elf64-s390 elf32-sh-linux elf32-shbig-linux
	elf32-sh-fdpic elf32-shbig-fdpic elf32-sparc elf64-sparc pe-x86-64
	pe-bigobj-x86-64 pe-i386 plugin srec symbolsrec verilog tekhex binary
	ihex

(added line breaks for easier reading). I got this by installing
binutils-multiarch (on Debian).

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
