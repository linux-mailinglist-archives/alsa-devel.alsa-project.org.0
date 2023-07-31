Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FCD7699D8
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 16:43:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AFF384B;
	Mon, 31 Jul 2023 16:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AFF384B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690814588;
	bh=6zs0p262FWZnT2q/CfUaDwyUeYXnBXhuseu1gVc38XQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ahz8062l4Rap91NlVV9tHqkPS4fnJ4CaOAA7IMZ+mSQgM5qLOnCChOxtgurPCqCam
	 39Ggib5Wzw5vtiMcGNQS8HM/BNIEB0Y2yN+fm3/8STTUWMtOrlGmMT8RdyOCfUKY0O
	 ucQq/hNkdgzTdPI1PS7ugWwSVbc+9jrbQXGuQaIw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D876F80425; Mon, 31 Jul 2023 16:41:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88E94F80544;
	Mon, 31 Jul 2023 16:41:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E65D3F80563; Mon, 31 Jul 2023 16:41:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0713FF8055B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 16:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0713FF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=C/t+Ag8x
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ED5556118C;
	Mon, 31 Jul 2023 14:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5064C433C7;
	Mon, 31 Jul 2023 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690814501;
	bh=6zs0p262FWZnT2q/CfUaDwyUeYXnBXhuseu1gVc38XQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/t+Ag8xPMkM4w/sN7awWdOpwxKL34AbhifM3ApfHy4wOszK/s4+Ee3pM1mlmxUHh
	 v3ZzKncG+rC5CxEti9EIBWxgYFXoBwcLkKlSMrY6e3Lhtmjqic8diE+lH2SNhaJ14k
	 PtrRzG2dTZ7uqXx/ovkZiPH/4TDr8HZgv06SC5w0LnHDMrw5vZb6+D3i/3YQHsZk2O
	 zKJCFoYvZIJgkEyenckCSLpBgCRynXYx39uIE/6LvGshuAOhb2uAUy5VM77KQYMPWi
	 ZU2HUveBRZOXlFXxUrQZsjwhUzAKIgFokee643ITPbAkWj227rcbvABFWI/mPu1Z+d
	 UTgXJLPm/UV7Q==
Received: (nullmailer pid 2934485 invoked by uid 1000);
	Mon, 31 Jul 2023 14:41:38 -0000
Date: Mon, 31 Jul 2023 08:41:38 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org,
 Jonathan Bakker <xc-racer2@live.ca>, Rao Mandadapu <srivasam@codeaurora.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>, Judy Hsiao <judyhsiao@chromium.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Trevor Wu <trevor.wu@mediatek.com>,
 alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Gu
 o <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 05/12] ASoC: dt-bindings: samsung,midas-audio: use common
 sound card
Message-ID: <169081449785.2934415.14179927279002446763.robh@kernel.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731094303.185067-6-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: EC6NT22WR65NW6RZLWOMP74IP2P676A6
X-Message-ID-Hash: EC6NT22WR65NW6RZLWOMP74IP2P676A6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EC6NT22WR65NW6RZLWOMP74IP2P676A6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 31 Jul 2023 11:42:56 +0200, Krzysztof Kozlowski wrote:
> Reference the common sound card properties and deprecate the
> custom "samsung,audio-routing" in favor of generic one.  This allows to
> remove "model" property and make the binding closer to other sounds
> cards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/samsung,midas-audio.yaml      | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

