Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C651750B93C
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68608181D;
	Fri, 22 Apr 2022 15:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68608181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635712;
	bh=0vRCxKznfsUI9hIjj5OVe1z6+xofAFlPjoFe7uzz/UM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Llno+J2Ejbesna3ycufFV7cyQ11Be5Muel52xLX+f9ND1BHAEC3J/JoYBf7KchPBh
	 OdvgCQpCCSrfmuFIi0jRktKklWVRDO4yOaGKEEXnA1O1uX9zpPiX1kVTDGZ7BqHGQ7
	 FsgsiQSQE8wDSQUrvlZ7JoaOCQwQCHJoKcCyNyko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36FF2F80C17;
	Fri, 22 Apr 2022 15:32:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70A4CF80279; Thu, 21 Apr 2022 08:24:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 40F6FF800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 08:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40F6FF800C1
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 53E33811B;
 Thu, 21 Apr 2022 06:21:49 +0000 (UTC)
Date: Thu, 21 Apr 2022 09:24:39 +0300
From: Tony Lindgren <tony@atomide.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 40/41] [TO BE REBASED] ARM: OMAP1: clock: Convert to CCF
Message-ID: <YmD4p+09B/dq54XL@atomide.com>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-41-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419133723.1394715-41-arnd@kernel.org>
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 aaro.koskinen@iki.fi, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, jmkrzyszt@gmail.com,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

* Arnd Bergmann <arnd@kernel.org> [220419 13:39]:
> From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> +	/* protect clk->enable_reg from concurrent access via clk_set_rate() */
> +	if (clk->enable_reg == OMAP1_IO_ADDRESS(ARM_CKCTL))
> +		spin_lock_irqsave(&arm_ckctl_lock, flags);
> +	else if (clk->enable_reg == OMAP1_IO_ADDRESS(ARM_IDLECT2))
> +		spin_lock_irqsave(&arm_idlect2_lock, flags);
> +	else if (clk->enable_reg == OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0))
> +		spin_lock_irqsave(&mod_conf_ctrl_0_lock, flags);
> +	else if (clk->enable_reg == OMAP1_IO_ADDRESS(MOD_CONF_CTRL_1))
> +		spin_lock_irqsave(&mod_conf_ctrl_1_lock, flags);
> +	else if (clk->enable_reg == OMAP1_IO_ADDRESS(SWD_CLK_DIV_CTRL_SEL))
> +		spin_lock_irqsave(&swd_clk_div_ctrl_sel_lock, flags);
> +

Eventually there should be just separate clock controller instances for
the clock registers banks, and then this should all disappear as the
lock is instance specific. Anyways, that's probably best done as a separate
changes later on.

Regards,

Tony
