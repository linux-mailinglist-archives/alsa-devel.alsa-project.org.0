Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7126EF00E2
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:13:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF13E16F0;
	Tue,  5 Nov 2019 16:12:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF13E16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572966796;
	bh=WaRD5v7XAimbUwwJs6ZtVoxNsdNyeMa1PO9fKf2CCRU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O3892RDGyx7s2uolJv07QPY3LoEOMuNYPNbVavWRV3G/UNMxbFva1lTGWWRYbgH7p
	 p8HGJni5Wk87BU2P2zEOGtl+QogbQ+V7zhsczbmORJLpMvRwZ3nbMArFPsLEaMeqfi
	 2oaeqXucsvfNiipj1Bk9EUyqvj43PAmpNXAUZGeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34766F80638;
	Tue,  5 Nov 2019 16:09:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A88DF8049B; Tue,  5 Nov 2019 15:33:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BF58F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:33:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BF58F8015B
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 06:33:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="285323461"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga001.jf.intel.com with ESMTP; 05 Nov 2019 06:32:52 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iRzt3-00044T-EF; Tue, 05 Nov 2019 16:32:49 +0200
Date: Tue, 5 Nov 2019 16:32:49 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Message-ID: <20191105143249.GT32742@smile.fi.intel.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
 <20191105122042.GO32742@smile.fi.intel.com>
 <4e6fa62d7022c7b1426477a150a93c899725f5b0.camel@fi.rohmeurope.com>
 <20191105131125.GP32742@smile.fi.intel.com>
 <fdcfc69b39990dd382804db45422ed692881ea15.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdcfc69b39990dd382804db45422ed692881ea15.camel@fi.rohmeurope.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 05 Nov 2019 16:08:56 +0100
Cc: "semi.malinen@ge.com" <semi.malinen@ge.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
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
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
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
 "nandor.han@ge.com" <nandor.han@ge.com>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "info@metux.net" <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Nov 05, 2019 at 01:54:27PM +0000, Vaittinen, Matti wrote:
> On Tue, 2019-11-05 at 15:11 +0200, andriy.shevchenko@linux.intel.com
> wrote:

> Unfortunately I don't right now have the time to waste arguing over it
> ;)

Neither do I.

P.S. I have already wasted enough on this discussion, as I said before I'm fine
with the change as long as maintainers of the subsystem are fine.

That's my last message on the topic till then.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
