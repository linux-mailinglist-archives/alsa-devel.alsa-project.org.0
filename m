Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC177699DE
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 16:43:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11529827;
	Mon, 31 Jul 2023 16:42:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11529827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690814628;
	bh=69mQC6fnEsNRZxdtZt5579ZteTJM7jQF0SpAVlrFzK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nxQ3hnW18sL0dGrY6i6H95CG1PXf5yyc6vcVue+rT2SYFHSqQ9KU1z+1Ah4VPKgjc
	 15H0kIRA46tVYgOEJXKBWYg/0/6ttKye2WgT/iuAFCLbAwMVdWz1tSdK/8HKtMUia6
	 PGNHQaPCoq6d0YNRKRShzrRQrRKTHv/YSTFQY8wc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0A39F80549; Mon, 31 Jul 2023 16:42:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A326F8016D;
	Mon, 31 Jul 2023 16:42:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59B66F801D5; Mon, 31 Jul 2023 16:42:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0C20F80163
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 16:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C20F80163
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uAP1nlMf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7CCE06118C;
	Mon, 31 Jul 2023 14:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD835C433C8;
	Mon, 31 Jul 2023 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690814569;
	bh=69mQC6fnEsNRZxdtZt5579ZteTJM7jQF0SpAVlrFzK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAP1nlMftmbn9ilJP4NHPTbJzf25EUGPBqnl23T2rMGKsHBVLVFo+AuZKDABHV1Z2
	 32IWH3yG9uObiQpjX3Umr6H4IzZsZIB6GLYh2/WT3keJbcktdbs4x/0MKXkgKGsviL
	 k1kVm3CilfY3ztVxEbqRMX5khT1o08Aylc2EwR1x3s6hxAPZIl7E19NGnnjs+wREbG
	 j1xIRZt2KrHrNYtXuHgLYsJ/Nw1YeaQSAlICSjHEfI2XdwrMkEf/0V0JtDGjH7BoJf
	 8oy7lmFCzEt87W8MY17NnitfExhatQFsh1ceV1ftbBMa/JAUbUzHZbESBIrKhkzVZM
	 SH/6l+4o16NiQ==
Received: (nullmailer pid 2935728 invoked by uid 1000);
	Mon, 31 Jul 2023 14:42:46 -0000
Date: Mon, 31 Jul 2023 08:42:46 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@l, ists.infradead.org@alsa-project.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 02/12] ASoC: dt-bindings: Add common sound card properties
Message-ID: <20230731144246.GA2934642-robh@kernel.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731094303.185067-3-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: LZWRYNXXOL6JII7HPZRJG75CAKRW6CVD
X-Message-ID-Hash: LZWRYNXXOL6JII7HPZRJG75CAKRW6CVD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LZWRYNXXOL6JII7HPZRJG75CAKRW6CVD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 31, 2023 at 11:42:53AM +0200, Krzysztof Kozlowski wrote:
> Almost every board machine / sound cards has "audio-routing" and "model"
> properties, so move them to common schema to have only one definition of
> these properties.
> 
> For amlogic,gx-sound-card, leave the "audio-routing" constraints in the
> original binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../sound/amlogic,axg-sound-card.yaml         | 15 +++--------
>  .../bindings/sound/amlogic,gx-sound-card.yaml | 14 +++-------
>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 17 +++---------
>  .../bindings/sound/google,sc7180-trogdor.yaml | 17 +++---------
>  .../sound/google,sc7280-herobrine.yaml        | 17 +++---------
>  .../bindings/sound/imx-audio-card.yaml        | 18 +++----------
>  .../bindings/sound/sound-card-common.yaml     | 27 +++++++++++++++++++
>  7 files changed, 50 insertions(+), 75 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/sound-card-common.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
