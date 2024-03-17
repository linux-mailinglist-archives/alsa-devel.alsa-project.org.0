Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC2087DF6F
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 19:57:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3A34238A;
	Sun, 17 Mar 2024 19:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3A34238A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710701864;
	bh=C1Qhz7RVqLKa7aHBWi3LhaNuIEVA6aUWA51sPBVTAu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TiS22vIgEyTJQIeheRYJjmaJl2g5U/V2vyodSM1FUfyE7Qym5JRjrMMQWxQbilUph
	 Wie7KVSsCtcuVZ/wN1P2U46qjIskxrirQRphPa9krRcZESI1FNdYWpA5PUa5BHKmuX
	 GNKCVpGLauv9Vjp8+KY/ILoS1q/Fki3FFa/s89l0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31297F80570; Sun, 17 Mar 2024 19:57:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10C6AF80578;
	Sun, 17 Mar 2024 19:57:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FE6DF804E7; Sun, 17 Mar 2024 19:57:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F31AFF80093
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 19:57:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F31AFF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L5HhIvuv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0AA18CE091B;
	Sun, 17 Mar 2024 18:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5428C433F1;
	Sun, 17 Mar 2024 18:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710701813;
	bh=C1Qhz7RVqLKa7aHBWi3LhaNuIEVA6aUWA51sPBVTAu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L5HhIvuvC0Xd2nB2Rr2eXkrHIHAgMhFoOvCNUMOpvinqWDDpj6mnggSOFGku9EPup
	 6Qtd95gN3+9SoABc4z+wH3nBE+2f1pj5yhyJMKydaia7qcbD4NHBy4EUxtc7y/0c6i
	 0NpEi5e6pE5aoPkv8dy5P+A5vb6wgplbits4tFi0ewLe5lj8H8E7w67Pxb7E3Ea1Z0
	 EpIWZ2XRY7BZ2knGzqNrTJ6TAzBGF4q9AqNKVyRHtrI4XYdO4RfRYxpDpOtgV8DQSf
	 p8vK/0GAAo6N/VHP2GKg3Lb0ro8nnEjixcx5Jbz4wqns5olFR/Ez4Nq1tKqDCo1TV7
	 hz7tPsdQFoHnA==
Date: Sun, 17 Mar 2024 12:56:50 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: zhourui@huaqin.corp-partner.google.com, amergnat@baylibre.com,
	allen-kh.cheng@mediatek.com, trevor.wu@mediatek.com,
	wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, u.kleine-koenig@pengutronix.de,
	shane.chien@mediatek.com, claudiu.beznea@tuxon.dev,
	ckeepax@opensource.cirrus.com, arnd@arndb.de, dianders@chromium.org,
	maso.huang@mediatek.com, linux-kernel@vger.kernel.org,
	broonie@kernel.org, matthias.bgg@gmail.com,
	kuninori.morimoto.gx@renesas.com, perex@perex.cz, frank.li@vivo.com,
	nicolas.ferre@microchip.com, eugen.hristev@collabora.com,
	linux-sound@vger.kernel.org, kernel@collabora.com,
	jiaxin.yu@mediatek.com, alsa-devel@alsa-project.org,
	xiazhengqiao@huaqin.corp-partner.google.com, conor+dt@kernel.org,
	shraash@google.com, krzysztof.kozlowski+dt@linaro.org,
	jarkko.nikula@bitmer.com, tiwai@suse.com,
	devicetree@vger.kernel.org, nfraprado@collabora.com,
	lgirdwood@gmail.com, alpernebiyasak@gmail.com
Subject: Re: [PATCH v3 18/22] ASoC: dt-bindings: mt8195: Document
 audio-routing and dai-link subnode
Message-ID: <171070180968.2064436.13730344505165818889.robh@kernel.org>
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
 <20240313110147.1267793-19-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20240313110147.1267793-19-angelogioacchino.delregno@collabora.com>
Message-ID-Hash: XF4F6MC6LHFVON2M5KWBN75FJWAW4QO7
X-Message-ID-Hash: XF4F6MC6LHFVON2M5KWBN75FJWAW4QO7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XF4F6MC6LHFVON2M5KWBN75FJWAW4QO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 13 Mar 2024 12:01:43 +0100, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with driver hardcoded configuration.
> 
> Also, since describing machine specific audio hardware and links replaces
> the now deprecated old logic doing the same in a driver hardcoded fashion,
> it is not allowed to have both the old and new properties together.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/sound/mt8195-mt6359.yaml         | 134 ++++++++++++++++++
>  1 file changed, 134 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

