Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 403D6870402
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 15:25:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5452F3E7;
	Mon,  4 Mar 2024 15:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5452F3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709562330;
	bh=6gCiVFXmpuEznUgKdT1gpn2oh/lHn5kfV0SnIxnZcus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XYXSZMfDTB5VOAy91iOHhTqVnIEJ0ph/XgDReue0u4uofPHzbbITyyR8L2y70qLtS
	 eAyzBW9cCe/hs6uErPJyKCaUiA/jRLU0U4h+wnAEMG/RmBJHYO45WyXw+wuNloaSyt
	 dpIaGKLgkdCx5oJRGmF4TWCypNb1EF5GB8jEdagU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D602CF80588; Mon,  4 Mar 2024 15:24:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EF22F8057E;
	Mon,  4 Mar 2024 15:24:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18B84F802E8; Mon,  4 Mar 2024 15:24:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C6DAF801F5
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 15:24:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C6DAF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LLlpWI/p
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 81C81CE1390;
	Mon,  4 Mar 2024 14:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9ABEC433C7;
	Mon,  4 Mar 2024 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709562289;
	bh=6gCiVFXmpuEznUgKdT1gpn2oh/lHn5kfV0SnIxnZcus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLlpWI/pBrzJtatXQW11HUwzKuXsVyGKKfBiSSowA2WXESzIhQfnBkrEpzBl7V0Nv
	 q2pxS5bCEpGYLg32QR2Tm5c0LnIDmwpdSp+RMa19knG97b3bvgw3njuCgv/oyJ/o7b
	 DrZg9BfvRaYfzndcxmrDqH9vjbU4TLg/WRLaaCjZdJbBFqHPbXZugIwDd9vBvMjvbU
	 P9KOQfg3KdqyBgxq71VObOK7ZS3L1VvR8/nnIefqsB6aO+fOJclNQ6Z92TMMaa8rkx
	 YDNZFqvAZ3wTH/Osq8uQvrg8WsfBXGn/PynwJKAjuPrNr+HL1SVCJiZniXKAZHOhPS
	 LA1aR6hX2oBww==
Date: Mon, 4 Mar 2024 08:24:46 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, wenst@chromium.org, lgirdwood@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
	trevor.wu@mediatek.com, maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com, shraash@google.com,
	amergnat@baylibre.com, nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de, dianders@chromium.org,
	frank.li@vivo.com, allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com, ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com, nfraprado@collabora.com,
	alsa-devel@alsa-project.org, shane.chien@mediatek.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 20/22] ASoC: dt-bindings: mt8186: Document audio-routing
 and dai-link subnode
Message-ID: <20240304142446.GA171936-robh@kernel.org>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
 <20240227120939.290143-21-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20240227120939.290143-21-angelogioacchino.delregno@collabora.com>
Message-ID-Hash: W2XTOGRUT7B3EQUUXG4AR344ZXJ7HF3S
X-Message-ID-Hash: W2XTOGRUT7B3EQUUXG4AR344ZXJ7HF3S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W2XTOGRUT7B3EQUUXG4AR344ZXJ7HF3S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 27, 2024 at 01:09:37PM +0100, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with the driver's partially hardcoded configuration.

This can be combined with patch 19. Same comments apply.

> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 112 ++++++++++++++++--
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 112 ++++++++++++++++--
>  2 files changed, 210 insertions(+), 14 deletions(-)
