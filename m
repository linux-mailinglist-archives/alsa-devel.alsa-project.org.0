Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F537699E1
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 16:43:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D007844;
	Mon, 31 Jul 2023 16:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D007844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690814638;
	bh=bfVnlz+ZpONPzpnw+9KZ5pk17OTp4y7q4qj1f/1lZHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tByJ935xu3ZgWvRbvzxT6YoqpAuhNyALA5UJzbg/iEMiDqXXWizGSWGuMa7I22T8m
	 SPxVUSo42alqoGfIQI4pJ/nlsbsLIyVrhLkUNJcgKTnJmF3+BcS29LIr4gewbEFzSM
	 5wwE85pl+3x5LUV2bwCe9fj40f4rKEKfQidKrM6o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E85EF80149; Mon, 31 Jul 2023 16:43:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D558BF801D5;
	Mon, 31 Jul 2023 16:43:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A31D1F80552; Mon, 31 Jul 2023 16:43:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C02A2F801D5
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 16:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C02A2F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fW9VEtmk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 724C96117E;
	Mon, 31 Jul 2023 14:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71937C433C7;
	Mon, 31 Jul 2023 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690814580;
	bh=bfVnlz+ZpONPzpnw+9KZ5pk17OTp4y7q4qj1f/1lZHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fW9VEtmk60AymIJNr/5NnjELHABT6pfJQnODJos0dJat0/dRcZnvxb/NtH9aTfMph
	 3oyaYpPEDO6hi3yeswda7e4NV7i/XVCklHxh2C5sIHhmbg4Rqp/bTpOHOfEmge2mTv
	 5mnUJuPgJDFg2HLBwabvdITDY5BLt0HfPyY+t8TFz7U1KLAkY0HX6S/sgSb+gpeg0F
	 vdX5XS4NIa51Tilrk4sxkcGDcTEfiwweWIBdATZTZ8eGErcfOCcAPLCurKAMpk8W92
	 dX6YEY0d8K63bKSMg1qQKhaq2ZkLQnMT9WSIt+HU+JPOMlzqwqjWkJ2I8AQxU6I6NI
	 zilJ2+cR4WAfA==
Received: (nullmailer pid 2936008 invoked by uid 1000);
	Mon, 31 Jul 2023 14:42:57 -0000
Date: Mon, 31 Jul 2023 08:42:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Shawn Guo <shawnguo@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>,
	Fabio Estevam <festevam@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	NXP Linux Team <linux-imx@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Takashi Iwai <tiwai@suse.com>, Conor Dooley <conor+dt@kernel.org>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Judy Hsiao <judyhsiao@chromium.org>, linux-kernel@vger.kernel.org,
	Trevor Wu <trevor.wu@mediatek.com>, alsa-devel@alsa-project.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kerne@alsa-project.org, l@lists.infradead.org,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 06/12] ASoC: dt-bindings: samsung,odroid: use common
 sound card
Message-ID: <169081457687.2935944.17219588644760772491.robh@kernel.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731094303.185067-7-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: A2KULCB66QHICBOT2NGN3X7DH7OLYKSC
X-Message-ID-Hash: A2KULCB66QHICBOT2NGN3X7DH7OLYKSC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2KULCB66QHICBOT2NGN3X7DH7OLYKSC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 31 Jul 2023 11:42:57 +0200, Krzysztof Kozlowski wrote:
> Reference the common sound card properties and deprecate the
> custom "samsung,audio-routing" in favor of generic one.  This allows to
> remove "model" property and make the binding closer to other sounds
> cards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/samsung,odroid.yaml  | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

