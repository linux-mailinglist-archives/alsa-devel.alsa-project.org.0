Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CABCFEFEDF
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 14:42:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B66516FF;
	Tue,  5 Nov 2019 14:41:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B66516FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572961360;
	bh=Blko775ne5TmMfDvHhBTIj+LhyXqpn1h6kEzm8yriLc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hTx3owCXxMSyOdnUVgp0zzkDok72fMbGeHbfAGy7pkwR/OJLHcJWVvab7fJfQw/8d
	 Ezg+y5bzzKQ8p7Yz7aUUNb2CWkAKRZ5LgpFDhN2Q/y9aKMkrkOr4mIuz5I3UQtH9tn
	 c9HsBIgXbagoBY9MdZJLtat2/Vtn3iF9AuRXc798=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73DE9F80639;
	Tue,  5 Nov 2019 14:38:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CB1DF8049B; Tue,  5 Nov 2019 14:11:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A733F80271
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 14:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A733F80271
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 05:11:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="195815283"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 05 Nov 2019 05:11:33 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iRycH-00033W-5L; Tue, 05 Nov 2019 15:11:25 +0200
Date: Tue, 5 Nov 2019 15:11:25 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Message-ID: <20191105131125.GP32742@smile.fi.intel.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
 <20191105122042.GO32742@smile.fi.intel.com>
 <4e6fa62d7022c7b1426477a150a93c899725f5b0.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e6fa62d7022c7b1426477a150a93c899725f5b0.camel@fi.rohmeurope.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 05 Nov 2019 14:38:15 +0100
Cc: "semi.malinen@ge.com" <semi.malinen@ge.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
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

On Tue, Nov 05, 2019 at 12:54:55PM +0000, Vaittinen, Matti wrote:
> On Tue, 2019-11-05 at 14:20 +0200, Andy Shevchenko wrote:
> > On Tue, Nov 05, 2019 at 12:09:10PM +0200, Matti Vaittinen wrote:
> > > The patch series adds definitions for GPIO line directions.
> > > 
> > > For occasional GPIO contributor like me it is always a pain to
> > > remember
> > > whether 1 or 0 was used for GPIO direction INPUT/OUTPUT. Judging
> > > the
> > > fact that I removed few comments like:
> > > 
> > > /* Return 0 if output, 1 if input */
> > > /* This means "out" */
> > > return 1; /* input */
> > > return 0; /* output */
> > > 
> > > it seems at least some others may find it hard to remember too.
> > > Adding
> > > defines for these values helps us who really have good - but short
> > > duration - memory :]
> > > 
> > > Please also see the last patch. It adds warning prints to be
> > > emitted
> > > from gpiolib if other than defined values are used. This patch can
> > > be
> > > dropped out if there is a reason for that to still be allowed.
> > > 
> > > This idea comes from RFC series for ROHM BD71828 PMIC and was
> > > initially
> > > discussed with Linus Walleij here:
> > > https://lore.kernel.org/lkml/c06725c3dd34118a324907137758d8b85b3d4043.camel@fi.rohmeurope.com/
> > > but as this has no dependencies to BD71828 work (which probably
> > > takes a
> > > while) I decided to make it independent series.
> > > 
> > > Patches are compile-tested only. I have no HW to really test them.
> > > Thus I'd
> > > appreciate carefull review. This work is mainly about converting
> > > zeros
> > > and ones to the new defines but it wouldn't be first time I get it
> > > wrong
> > > in one of the patches :)
> > 
> > For all patches I have been Cc'ed to, NAK.
> > 
> > I don't see the advantages now since all known hardware uses the
> > single bit to
> > describe direction (even for Intel where we have separate gating for
> > in and out
> > buffers the direction we basically rely on the bit that enables out
> > buffer).
> > 
> > So, that said the direction is always 1 bit and basically 0/1 value. 
> 
> Yes. At least for now. And this patch didn't change that although it
> makes it possible to do so if required.
> 
> > Which one
> > is in and which one is out just a matter of an agreement we did.
> 
> This one is exactly the problem patch series was created for. Which one
> is IN and which is OUT is indeed a matter of an agreement - but this
> agreement should be clearly visible, well defined and same for all.
> 
> It's *annoying* to try finding out whether it was 1 or 0 one should
> return from get_direction callback for OUTPUT. This is probably the
> reason we have comments like
> 
> return 1; /* input */
> 
> there.
> 
> As this is global agreement for all GPIO framework users - not
> something that can be agreed per driver basis - we should have GPIO
> framework wide definitions for this. We can just add definitions for
> new drivers to benefit - but I think adding them also for existing
> drivers improves readability significantly (see below).
> 
> > I would also like to see bloat-o-meter statistics before and after
> > your patch.
> > My guts tell me that the result will be not in the favour of yours
> > solution.
> 
> Can you please tell me what type of stats you hope to see? 

bloat-o-meter. It's a script that compares two object files to see which
functions got fatter, and which are slimmer. You may find it in the kernel tree
sources (scripts/ folder).

> I can try
> generating what you are after. The cover letter contained typical +/-
> change stats from git and summary:
> 
> 62 files changed, 228 insertions(+), 104 deletions(-)
> 
> It sure shows that amount of lines was increased (roughly 2 lines more
> / changed file)

Which is making unneeded churn.

> - but I guess that was expected as I don't like
> ternary.

And I like them, so, what to do?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
