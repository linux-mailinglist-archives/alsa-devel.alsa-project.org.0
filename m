Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A446D7699E8
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 16:44:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE88E84A;
	Mon, 31 Jul 2023 16:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE88E84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690814664;
	bh=ZZP/+vM0qz6EaB+8dhpI2Dpi6RMKi1QnNhcTct6HcJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gTNQ75F9K7ZSiC1/QCGU+agPIChzP/u738ykOvwNPFhfvx495VAFX9wNT9skCYZAh
	 m2C2TG+QjA/Kr04pigxY4s4cHwrStH1pxTvoCprGZFTXrZnX8B777gw7zQb+odZowI
	 V5OJz2/QcMBZU4ISz0BGk2lGjkV9asVixO/0FvH4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7AB2F80563; Mon, 31 Jul 2023 16:43:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F95DF8025A;
	Mon, 31 Jul 2023 16:43:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3912F8025A; Mon, 31 Jul 2023 16:43:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4CEEF80425
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 16:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4CEEF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gcf81MxH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 830046117B;
	Mon, 31 Jul 2023 14:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D868C433CB;
	Mon, 31 Jul 2023 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690814605;
	bh=ZZP/+vM0qz6EaB+8dhpI2Dpi6RMKi1QnNhcTct6HcJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcf81MxHKfKQ6cb1/4LQVxpQJQBDyR9UMg13U+PabS/04OLLUefmHt1dU84ssOZZ9
	 c0d2AZj+FB2qTva5iWdNN2E2AnFwsvtEv2Ks3VIQVYigWOnFqi8McciDtMf9PLGZ6M
	 E7L790xhMnUuSiTkRqelk95M70e9aKxn9e36LUlS8rJrhYMm0ZfWUxDKfAz65ycs4a
	 Yh9WU014M9UDp6ZN2WSStBAcAdiA4qFE270JVmBfnzxtgCdX8k3+ni8PhdGty4vieM
	 iYEXJaLGPnQkoKYur2AJgZnuT44dfJ5BZ1fdXMvd/eCtycaMLqAzSXuqnMchXyUc2W
	 prELTN76RjOsw==
Received: (nullmailer pid 2936636 invoked by uid 1000);
	Mon, 31 Jul 2023 14:43:21 -0000
Date: Mon, 31 Jul 2023 08:43:21 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <quic_rohkumar@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>,
 Jonathan Bakker <xc-racer2@live.ca>, Fabio Estevam <festevam@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 Trevor Wu <trevor.wu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Rao Mandadapu <srivasam@codeaurora.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 07/12] ASoC: dt-bindings: samsung,tm2: use common sound
 card
Message-ID: <169081460128.2936591.465135796589060685.robh@kernel.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731094303.185067-8-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: OCB7DTUCEU7ETWL4ZGWOQLA5QLSYZX5H
X-Message-ID-Hash: OCB7DTUCEU7ETWL4ZGWOQLA5QLSYZX5H
X-MailFrom: SRS0=3R/A=DR=robh_at_kernel.org=rob@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCB7DTUCEU7ETWL4ZGWOQLA5QLSYZX5H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 31 Jul 2023 11:42:58 +0200, Krzysztof Kozlowski wrote:
> Reference the common sound card properties and deprecate the
> custom "samsung,audio-routing" in favor of generic one.  This allows to
> remove "model" property and make the binding closer to other sounds
> cards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/samsung,tm2.yaml   | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

