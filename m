Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 712A287DF92
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 20:15:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6E1023E3;
	Sun, 17 Mar 2024 20:14:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6E1023E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710702906;
	bh=fztyQgbF2q1PoJtiGulktjTHyUhlHcKdvlGV1V2IrWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BVPbf1x4sFIbgYk1PVlzVthWy6tDFssHEarnFRGE3wwNZVZRsCsZF7SRfLCj5uQ6r
	 flGvflq+07ZOWcnVE+fBFsaSUaIxuktygrAiH9kgdVGHzlKBdmusMsfxHRjkswce0Y
	 Qt4wi6fEMwjlZQwFq42Ks9msDsNPPHPVyiO4HaE8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6096F805A0; Sun, 17 Mar 2024 20:14:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43105F8055B;
	Sun, 17 Mar 2024 20:14:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C423F804E7; Sun, 17 Mar 2024 20:14:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32077F80088
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 20:14:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32077F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Czq4BK2u
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C942D60B8C;
	Sun, 17 Mar 2024 19:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F67C433F1;
	Sun, 17 Mar 2024 19:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710702866;
	bh=fztyQgbF2q1PoJtiGulktjTHyUhlHcKdvlGV1V2IrWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Czq4BK2uZkizeJ8j9pxUjylVlTTZiixjX/OQAeXZE3CCK3ozdfkU3QT6VfDA8EVdb
	 QwJECovGef+zpZH1YYoBZbnusq5LB7GgKd9aYM3WPjvowQbmDNXblNlPr384UbAHrH
	 Ty+5SEprnxK3ewfqWkYu27lx55p5eQXuI4qOzeyqP8XrOdIDKmaHX2F/opT2USpUVK
	 +FusKo2TRReDaiOTfNGPscYskM2UXGBGxDKyEuRwGJPRGJ9KjzXg9ciMEEiERGbQyY
	 WGsEbV4HBY24+Ot9Pj4Wl0tRgL9myDmj/GdcTx94cxoFswDbS2GsYbTY8P+d2Wet8H
	 7eljF77ZnHYHQ==
Date: Sun, 17 Mar 2024 13:14:24 -0600
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Takashi Iwai <tiwai@suse.com>, Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	kernel@salutedevices.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Philipp Zabel <p.zabel@pengutronix.de>, alsa-devel@alsa-project.org,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 18/25] ASoC: dt-bindings: meson: axg-pdm: claim support
 of A1 SoC family
Message-ID: <171070286359.2088899.4357091464110739659.robh@kernel.org>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-19-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314232201.2102178-19-jan.dakinevich@salutedevices.com>
Message-ID-Hash: KIAL22BJNUFFOON4BC46YDWZI6TCXUOR
X-Message-ID-Hash: KIAL22BJNUFFOON4BC46YDWZI6TCXUOR
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KIAL22BJNUFFOON4BC46YDWZI6TCXUOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 15 Mar 2024 02:21:54 +0300, Jan Dakinevich wrote:
> Add "amlogic,a1-pdm" compatible string alias to "amlogic,axg-pdm".
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

