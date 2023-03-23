Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FCB6CEEBD
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:07:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5958D1F7;
	Wed, 29 Mar 2023 18:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5958D1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106046;
	bh=QLz+dBVN44xqZj1ma4qnMOGZEacDvJIUbtUrBRXe378=;
	h=References:From:To:Subject:Date:In-reply-to:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nRG5FubSZUOwx5fCgTYMKxbJZaNQ0MQevgw/651s6c48TaONIvoIXDZ0tJVrm/Uar
	 CDfa7cTsg6AGDOF9nNLbe1UQ5BuYUaUqqnOEpZJf21GSrao10jf6sEUEr7hQmJ1iT0
	 e/fDPr5t32gm8rSRCKlj8cpLEf3XwZwrG49vRPis=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 660BFF80533;
	Wed, 29 Mar 2023 18:05:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B004DF804FE; Fri, 24 Mar 2023 12:09:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F98AF80529
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 12:09:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F98AF80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hzyILuXn
Received: by mail-wr1-x433.google.com with SMTP id l27so1391539wrb.2
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Mar 2023 04:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679656180;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :references:from:to:cc:subject:date:message-id:reply-to;
        bh=KKGzHAjESOwY5CJ6aIkXRblEUT9vcmLWXQ+M0lRFaT8=;
        b=hzyILuXnSZ7lMaDYB5rhB/bnNUkufwU6fB5inzHRnGwGUpJquemA3X84Lzp++Y2YJ+
         xX92fJNLk8xQHwS1+YxTda7OSm5DtCOvp4pDLhNSgUC+z/fJXup9nphjXvyJHgvtZySv
         Ing1oEJUNGaC5fkPShiXmhVhP4ZVm14D3SAO1J3Mw26nhpiPZuGPtANkaXRqnth94OzX
         eWmkntp/5aW21aNCDZJKirG9vn5GmZabE2CYZSk/g1dEY9qxrgIgg/yw5kqOFSzwoNBS
         JwX3UeufEHb7ANEt7KtJeAKptHBPlTmLr2bfmp8WEFpNkr4PD3Q/FNi6OhewGezr1Z61
         Chlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679656180;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :references:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKGzHAjESOwY5CJ6aIkXRblEUT9vcmLWXQ+M0lRFaT8=;
        b=TKsOGeYafp9ctw94FLPoBjhDTAK56cADIsMpPN8kxkP9ljBu2zShqBF74Uaui9ipP1
         upwBIxNrNeB84BmhzndVO9pRLMGF+C5Dn7jtsYQUDpO3IQrhQ4v6dFckPUn/VYDCoWgu
         qpAIKA0h2Wg24c4Vls1lUHPaYek534vcu7K7zZv3DXKZOpxO/fpJwLe+rFMeccKcFpGB
         UNy+AR2SGxDC6rzpo4ZSoOq7aFVN5+6bgDAprOyjJhm0qMvY4nNMvXWvT1zO8GVBdlfP
         UxIXxlqje24sfk9z22nUzpwn7a4hy3SBqM55wWbHfa1AII42P8OQf/xmoZQuqx5vnt2u
         KCxg==
X-Gm-Message-State: AAQBX9cB2mrSZ06YIqiM4e2ZDigJGbU7vxZ08xtQtVQJ9ufOcGp1cxM8
	CE1ACDMoiR6/p9tqqvD9T1c=
X-Google-Smtp-Source: 
 AKy350ZmBQJTJNYHdzNhp0Qvsm2ha5bci7Pffhjn47i2N4HkGJnSU/0GajVbD8LVTLhlg10uq2ysNw==
X-Received: by 2002:a5d:6290:0:b0:2da:53e3:57cf with SMTP id
 k16-20020a5d6290000000b002da53e357cfmr1959487wru.71.1679656180460;
        Fri, 24 Mar 2023 04:09:40 -0700 (PDT)
Received: from localhost (188.28.8.105.threembb.co.uk. [188.28.8.105])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a056000100800b002d8566128e5sm9760336wrx.25.2023.03.24.04.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 04:09:39 -0700 (PDT)
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
 <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
Date: Thu, 23 Mar 2023 15:35:30 +0000
In-reply-to: <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
Message-ID: <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: aidanmacdonald.0x0@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: ZZFNGHZ332VW35QXUEC2QHWA2DAQVAQT
X-Message-ID-Hash: ZZFNGHZ332VW35QXUEC2QHWA2DAQVAQT
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:05:51 +0000
CC: Maxime Ripard <maxime@cerno.tech>, Paul Cercueil <paul@crapouillou.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Daniel Vetter <daniel@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Vinod Koul <vkoul@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sekhar Nori <nsekhar@ti.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 David Airlie <airlied@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <david@lechnology.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-stm32@st-md-mailman.stormreply.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 patches@opensource.cirrus.com, linux-tegra@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZFNGHZ332VW35QXUEC2QHWA2DAQVAQT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Stephen Boyd <sboyd@kernel.org> writes:

> Quoting Maxime Ripard (2022-11-09 03:00:45)
>> On Mon, Nov 07, 2022 at 08:57:22PM +0000, Aidan MacDonald wrote:
>> >
>> > Maxime Ripard <maxime@cerno.tech> writes:
>> >
>> > > Hi,
>> > >
>> > > On Fri, Nov 04, 2022 at 05:35:29PM +0000, Aidan MacDonald wrote:
>> >
>> > Assigning the parent clock in the DT works once, at boot, but going off
>> > what you wrote in the commit message, if the clock driver has a
>> > .determine_rate() implementation that *can* reparent clocks then it
>> > probably *will* reparent them, and the DT assignment will be lost.
>>
>> Yes, indeed, but assigned-clock-parents never provided any sort of
>> guarantee on whether or not the clock was allowed to reparent or not.
>> It's just a one-off thing, right before probe, and a clk_set_parent()
>> call at probe will override that just fine.
>>
>> Just like assigned-clock-rates isn't permanent.
>>
>> > What I'm suggesting is a runtime constraint that the clock subsystem
>> > would enforce, and actively prevent drivers from changing the parent.
>> > Either explicitly with clk_set_parent() or due to .determine_rate().
>> >
>> > That way you could write a .determine_rate() implementation that *can*
>> > select a better parent, but if the DT applies a constraint to fix the
>> > clock to a particular parent, the clock subsystem will force that parent
>> > to be used so you can be sure the clock is never reparented by accident.
>>
>> Yeah, that sounds like a good idea, and CLK_SET_RATE_NO_REPARENT isn't
>> too far off from this, it's just ignored by clk_set_parent() for now. I
>> guess we could rename CLK_SET_RATE_NO_REPARENT to CLK_NO_REPARENT, make
>> clk_set_parent handle it, and set that flag whenever
>> assigned-clock-parents is set on a clock.
>>
>> It's out of scope for this series though, and I certainly don't want to
>> deal with all the regressions it might create :)
>>
>
> This sounds like a new dt binding that says the assigned parent should
> never change. It sounds sort of like gpio hogs. A clock-hogs binding?

Ideally we want the clock driver to be able to reparent clocks freely
to get the best rate. But we also need some control over that to stop
consumers from being reparented in undesired ways. Eg. you might want
to make sure the GPU gets its own PLL so it can be reclocked easily,
and putting another device on the GPU's PLL could prevent that.

The only way to achieve this today is (1) never do any reparenting in
the clock driver; and (2) use assigned-clock-parents in the DT to set
up the entire clock tree manually.

Maxime said that (2) is basically wrong -- if assigned-clock-parents
provides no guarantee on what the OS does "after boot" then the OS is
pretty much free to ignore it.

My suggestion: add a per-clock bitmap to keep track of which parents
are allowed. Any operation that would select a parent clock not on the
whitelist should fail. Automatic reparenting should only select from
clocks on the whitelist. And we need new DT bindings for controlling
the whitelist, for example:

    clock-parents-0 = <&clk1>, <&pll_c>;
    clock-parents-1 = <&clk2>, <&pll_a>, <&pll_b>;

This means that clk1 can only have pll_c as a parent, while clk2 can
have pll_a or pll_b as parents. By default every clock will be able
to use any parent, so a list is only needed if the machine needs a
more restrictive policy.

assigned-clock-parents should disable automatic reparenting, but allow
explicit clk_set_parent(). This will allow clock drivers to start doing
reparenting without breaking old DTs.
