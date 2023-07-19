Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D57A75A136
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 00:02:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF90C1F4;
	Thu, 20 Jul 2023 00:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF90C1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689804128;
	bh=ZGb/L/F75EEAk4xb9XJDB34DOMqNWMaoiBCf5BKg7kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GvK7XzUgYyLZ5vLDOCdT/+5nhDXhG6p7JIDAZf6fcQK5g+hDwjOFpe2Ro5MyJzZ8B
	 /CymAhVFOveCBe7nEL917Ob4um7sx+MpUDwnplwjr8irKKw9wpGKEVbYo86FYvmS7W
	 30KYQTCtxbDX9Kt+0Xr2nxH0f/6ZLglzkwJ2p8Bg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 882BAF80544; Thu, 20 Jul 2023 00:01:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB72CF80520;
	Thu, 20 Jul 2023 00:01:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F60BF80527; Thu, 20 Jul 2023 00:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5E24F800D2
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 00:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5E24F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NecdG9Ph
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A73E461821;
	Wed, 19 Jul 2023 22:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EB3C433C8;
	Wed, 19 Jul 2023 22:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689804068;
	bh=ZGb/L/F75EEAk4xb9XJDB34DOMqNWMaoiBCf5BKg7kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NecdG9Ph3Krgbg+CsKdXh5LepQDlhrl8ytKtLD6KedMjev4exultyLmv75OkBIM/Q
	 dqruvO3Pb0r9uGnIy2To1eqkb++G2/jKuMYItQ6WkgtFQN9qU2WwrIJCTvR+HBPCnJ
	 J/MGEJI7QQXCUBBzdiJPDeaytkgXk1X4+PKDcqOSWc+cNvgcdIsPaEyctrp3PE6t2U
	 yKGbqIPa6j3UGBIQzEAZCzuQFzxdGqy46W35ptGm6tb6A5T2udL7wxDt9DHOU6DdM4
	 3JcETakyxKSC8QdME+eH/UG49QkwsB5vEd0QHXwkJbTvXmTrQrRsdG6qICYa9AusyD
	 fA8jYh6L2vWtg==
Received: (nullmailer pid 855035 invoked by uid 1000);
	Wed, 19 Jul 2023 22:01:05 -0000
Date: Wed, 19 Jul 2023 16:01:05 -0600
From: Rob Herring <robh@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Mark Brown <broonie@kernel.org>,
 Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 3/6] ASoC: dt-bindings: pm8916-analog-codec: Drop invalid
 mclk
Message-ID: <168980406491.854976.10503527558613116747.robh@kernel.org>
References: <20230718-pm8916-mclk-v1-0-4b4a58b4240a@gerhold.net>
 <20230718-pm8916-mclk-v1-3-4b4a58b4240a@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718-pm8916-mclk-v1-3-4b4a58b4240a@gerhold.net>
Message-ID-Hash: 5VWZYDGWDIPPUNM3R6HSBAORUFLYLMPV
X-Message-ID-Hash: 5VWZYDGWDIPPUNM3R6HSBAORUFLYLMPV
X-MailFrom: SRS0=QU89=DF=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5VWZYDGWDIPPUNM3R6HSBAORUFLYLMPV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 18 Jul 2023 13:40:15 +0200, Stephan Gerhold wrote:
> The audio codec typically used for the MSM8916 SoC is split into two
> parts: the digital codec is part of the SoC, while the analog codec is
> part of the PM8916 PMIC.
> 
> The analog codec in the PMIC has no direct connection to the mclk of
> the SoC (GCC_CODEC_DIGCODEC_CLK). As the name of the clock suggests
> this is supplied to the digital part of the codec. During playback it
> will use this clock to transmit the audio data via the "CDC PDM" pins
> to the PMIC. In this case the analog codec indirectly receives the
> clock signal through the digital codec.
> 
> GCC_CODEC_DIGCODEC_CLK is already managed by the driver of the digital
> part of the codec in the SoC. Having this clock on the analog PMIC part
> additionally is redundant and incorrect because the analog codec cannot
> receive the clock signal without going through the digital codec.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml           | 10 ----------
>  1 file changed, 10 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

