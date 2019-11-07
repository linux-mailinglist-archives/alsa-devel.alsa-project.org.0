Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35516F2D6B
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 12:27:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3F1D169E;
	Thu,  7 Nov 2019 12:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3F1D169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573126075;
	bh=N6MvLMX3zBJvuG1lLUSvTLHLDbHTQAjpFQxcOvREOx4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ruu4DG/wA6/TF0HrglRPhixrlLX/MWhsmuH7tpFRcCxvwYdMKJdRIL27ZGzXncPRo
	 2QJCBZf/6pO2GnCfTyJUWrc4/7RFC7E+cCCtq6O6w6VZEYWR0Azro9+lXqxAKzXoZD
	 /I5vQk2vOY1jgZndXqxuZQUTmXWpbB6oZURKU4po=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 339DEF80633;
	Thu,  7 Nov 2019 12:24:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA5B5F8049B; Thu,  7 Nov 2019 09:22:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37620F800F3
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 09:22:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37620F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aihVYo6v"
Received: by mail-lf1-x141.google.com with SMTP id j14so884991lfb.8
 for <alsa-devel@alsa-project.org>; Thu, 07 Nov 2019 00:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W1kMVjXy8TfTB/av4qsnw1G4ZHclSRdrlLtTCyTAB3g=;
 b=aihVYo6vGJcSeMzZA2gHQagzuZuVYL80Tl8HsV3o3LI/DBg/S5MVPTitfm7pDFAG6E
 KU7Z1uXIrrxA5+r3lGKAenb9vmOH8pAHta+z2HuVGSB9kZOdz5AgkNdvAbRde2xOvpoT
 UzS8yGbMFd4DKYtsb3RNUpUElWYw56B6yCUzHCngiVaTKGxNs8EmIs8SqB757Vwf7VCX
 fwVEWkW6ZJ96L32Zj0dhvc0ujr2loUfyfL3PJK2DRlar2WzaN4hH3/gqSQ4Ye2vE2W10
 yDUxaSTMoU4hyrN/yWNS9R4ldaKnokRAtrRVSfZzc1jrl3LQMW5QsT76aHAI4spwff8o
 FNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W1kMVjXy8TfTB/av4qsnw1G4ZHclSRdrlLtTCyTAB3g=;
 b=Mlpf3mrLpq72VGLZgJEw6U14yMUzNqSQ82CMfjBuZ+6MqwVZalGDylcd3v7NQX5sQ0
 k/9IzGFnB5WcUByUioipeCjFPiv2hWWuIGLSAhGBVWV7vCzaMa8QhOanm0nobfRRgDUi
 vdtCNEHI35CW8yx1YLruPiKWjDV3VQX5Mjof5YutxFYeAQQiF9/RxZQGohJMvvf/0Zcz
 8ZJSGanGKZvOR2Oy/BbWyDEveeMedHsznn7IdlkxroLh2psLKccvYVbRU4Ss62BrkIJZ
 wUezzqBhJhzvHNQzVfzy297MC+bBc7OBIDcWVo+Vozl86//ktyiyTEVvln5dwY7ScurM
 P8KA==
X-Gm-Message-State: APjAAAXijkQWvtDR94qD6/yPoDUupLIOG7y3dBMZnWEuBSz42fUlzmfD
 QrI4cruCdzG08bUJrHBdgLgv3WaoWdGt++r4rrk0IA==
X-Google-Smtp-Source: APXvYqy/AiAWlfAU/KnMLcnvlDO6zbO8H2HQsF3Z0XznPUZPaxE+dGbrTI9u/vdRHxraIochQ2FKHYEfNic+fopaYJs=
X-Received: by 2002:a19:ca13:: with SMTP id a19mr1415050lfg.133.1573114966856; 
 Thu, 07 Nov 2019 00:22:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <20191106120846.5bunrqj3uz4khih5@earth.universe>
 <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
In-Reply-To: <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2019 09:22:35 +0100
Message-ID: <CACRpkdbaRsv+cKz7yxKxvs+99GRK50-d_kpKcdVn3NVV9Qr6Ng@mail.gmail.com>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
X-Mailman-Approved-At: Thu, 07 Nov 2019 12:24:22 +0100
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "sre@kernel.org" <sre@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
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
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
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
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "info@metux.net" <info@metux.net>
Subject: Re: [alsa-devel] [PATCH v2 0/2] Add definition for GPIO direction
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

On Wed, Nov 6, 2019 at 1:25 PM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Wed, 2019-11-06 at 13:08 +0100, Sebastian Reichel wrote:
> > On Wed, Nov 06, 2019 at 10:51:06AM +0200, Matti Vaittinen wrote:
> > > The patch series adds definitions for GPIO line directions.
> > >
> > > For occasional GPIO contributor like me it is always a pain to
> > > remember
> > > whether 1 or 0 was used for GPIO direction INPUT/OUTPUT.
> >
> > Maybe also update the GPIO drivers in pinctrl?
(...)
> Ouch. I didn't check from pinctrl but I see those should be converted
> as well. I'm a bit short on time right now so if anyone else is
> interested I won't mind :)
>
> Luckily the value for IN and OUT is not changed - only the defines were
> added - so all of the drivers do not need to be done at once. If no one
> else will take the pinctrl part then I can probably do pinctrl patches
> for v5.6 cycle.

No hurry with that. This is a good start, we don't have to fix
the whole world at once.

Let's look at this for v5.6.

Yours,
Linus Walleij
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
