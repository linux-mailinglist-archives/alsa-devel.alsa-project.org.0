Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D436D756F
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:31:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFDB3E8B;
	Wed,  5 Apr 2023 09:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFDB3E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680679867;
	bh=hXtgBK14KPM4e26uH259a5f8IZMJzPMN2I/MMharuS0=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lgQEc4eDzgF1ucdLoqlqudUgAt72ZYE0B9i90032SKvE/wkRM4Zm9JZ8Qh2uKvMH8
	 miyS1ro5GGtiOAEbOp3r/sSdodEgrXIx/Ctu8uiE7voQxfAL9tbt1sfQnfic8WsfVr
	 VkYDNFOPP+d2LM3T2trvtlLU/JLmxzttRKoNRLqg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 661DFF8062E;
	Wed,  5 Apr 2023 09:21:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E03FDF8024C; Tue,  4 Apr 2023 15:44:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93A23F80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 15:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93A23F80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YoKEFBnF
Received: by mail-yb1-xb2c.google.com with SMTP id e65so38666560ybh.10
        for <alsa-devel@alsa-project.org>;
 Tue, 04 Apr 2023 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680615877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXtgBK14KPM4e26uH259a5f8IZMJzPMN2I/MMharuS0=;
        b=YoKEFBnF4R/KLVFNoyxiZPhJmsqA79Ywp7c5w9VoTLbxOHPkU2UC3C6r9llU7auOt2
         itjfCCAlEVj9pzFONUJdlZR26DS+6eTnTItG8/BdsRaJG+jnGN8Mar9S9nT8YJ6YbIvt
         PczIEgFKHpzSiJdwEFeV5bQ6D7RX1kxyHOzWUeUHZxaA2y7tu1cxjyIo01gmk0ySlvUZ
         2ItBXfsRfASPgjZS7NTX/6Gf1VUStSpHFkFEFZGlN6IDFrz+MYZjApX3UW6qF8oUnIFx
         zKX/hy1RXkULjEErSDvMl/vL0BBq9FAoK0R7e10J9U08+BUnKq4oXitONkTYlPsXrglz
         sC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680615877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXtgBK14KPM4e26uH259a5f8IZMJzPMN2I/MMharuS0=;
        b=E3mSvvToWTe7KT0hmacgSo32VYpZJD38vF8rbC5owrzH7MBILF8Bybq6lqQSp2DOW/
         jPCROfNhDJaogIQ4F+KuZ09c11fuCWTqQeJ8tvfRIKG9JEQC+qUmAdrJGj9AbtP98KQ1
         Y+JjLqjA0D4sMyXIC7irtzIpdZjYdgDlUoAmx5BC9wgCewaU3dw25+S2vI5cG1r5+YYO
         Z6FhJ9aeGUwn9udCwwVA3g8xrD89W6iW7BnqyTwyIzcCwkejmO9pC/jB34dv5SKjYeGK
         4gFRinI1AGgnp+N7plvYLoWbRPT/tHJosig6VM2ZGasL0LkCkQOM5MC1M1L4GubmKqgd
         ePOw==
X-Gm-Message-State: AAQBX9dj0aOXTH6mkeWBA133yFDWel4KfQg+j77ar+OXxU2X2xO8Gkc9
	fpqyYRq/fqE6ugSoEYgWuNHUObPiCIafhG2PDay+rA==
X-Google-Smtp-Source: 
 AKy350ZS+8XVi9C6uhFr1kyc6XrkkRM+FluRwKkVz9PMLEz3Sm01NQlNpsxUuoJH/tcqHDQrLl5d34Nf5Z8uV0fle0E=
X-Received: by 2002:a25:df10:0:b0:b75:8ac3:d5d2 with SMTP id
 w16-20020a25df10000000b00b758ac3d5d2mr1901844ybg.4.1680615876928; Tue, 04 Apr
 2023 06:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-34-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-34-9a1358472d52@cerno.tech>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Apr 2023 15:44:25 +0200
Message-ID: 
 <CACRpkdYcHaUBG1qFVb=mi40SyEp=VyYzPmxNn-Zrmpqs1QH+kQ@mail.gmail.com>
Subject: Re: [PATCH v3 34/65] clk: ux500: prcmu: Add a determine_rate hook
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: NX6KSIWNGPTY7Z75TSOVEYFTQGPVFXNJ
X-Message-ID-Hash: NX6KSIWNGPTY7Z75TSOVEYFTQGPVFXNJ
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:18:45 +0000
CC: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
 Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NX6KSIWNGPTY7Z75TSOVEYFTQGPVFXNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 4, 2023 at 2:45=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> wr=
ote:

> The UX500 PRCMU "clkout" clock implements a mux with a set_parent hook,
> but doesn't provide a determine_rate implementation.
>
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.

Not even that.

The parent is selected from the second cell of the device tree
specifier, and the divisor from the third cell. See:
Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml

So this definitely does not reparent.

Yours,
Linus Walleij
