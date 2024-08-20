Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F2A95894D
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FF44846;
	Tue, 20 Aug 2024 16:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FF44846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724164230;
	bh=27VQnEMdnqOcGlF7LNJhoGhfIvxG5khxXm1G5k4+TBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BgGAWr8lJbfL/++ITzzmjSA1FkENyH9eef6hCp3qZrfVzMc9NfsqiMz6a0Cl8x8h0
	 JMXcGyNwvG7zyI9ovRtDTiV1J3J4wintpG+JPNGlA7vMg7+nfNkZC21Gl7MW4xvWx6
	 osfCXbEa5XQhnllt0GIHOf2E+G2tEUCK3eEC+tho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C3F9F805F9; Tue, 20 Aug 2024 16:29:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F868F80579;
	Tue, 20 Aug 2024 16:29:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03B7AF8049C; Tue, 20 Aug 2024 11:40:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2E36F8025E
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 11:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2E36F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ALSiNT2y
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 197BFCE0B96;
	Tue, 20 Aug 2024 09:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE989C4AF0F;
	Tue, 20 Aug 2024 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724146631;
	bh=27VQnEMdnqOcGlF7LNJhoGhfIvxG5khxXm1G5k4+TBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ALSiNT2yd7HBz2jpgfAZUiv/N9akqjpIfqYDV2dGBAQxcGOvvtNzRQw/6ZGrTz+7n
	 od3kHyuyX1kOEGTcaPT5TBPArVDBKT2OAm/BaNLKVmpYkoBFHidxSRVXawekbFZpJv
	 zXtPypbCl/B2PA1Xp/d1hFS+PHO2+AmFL3ycIO8Q47dFIc0Gd+DWH8MYUeLjU6fhD5
	 kA2+Yfz5UOIJcK09FP4b+aSPlaqt/MeORAPj/8L9MZiyRXWwPovpTuiuf1yvMG38QM
	 LcjfZwayQWMBxQ+awv7SpTKVAqBzlig1Wk1dAVwbyS/VPh+hU7Pen00cVkbw1q35d7
	 jsBuwuX10CFHg==
Message-ID: <f608289a-3e84-4ef4-8ced-2c615a67dd55@kernel.org>
Date: Tue, 20 Aug 2024 11:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] ASoC: qcom: apq8016_sbc.c: Add Quinary support
To: Adam Skladowski <a39.skl@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-1-163f23c3a28d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-1-163f23c3a28d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: konradybcio@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HU7WSLRORZNSSDRQJTUOILEDA3GHUXSI
X-Message-ID-Hash: HU7WSLRORZNSSDRQJTUOILEDA3GHUXSI
X-Mailman-Approved-At: Tue, 20 Aug 2024 14:26:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HU7WSLRORZNSSDRQJTUOILEDA3GHUXSI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31.07.2024 5:25 PM, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add support for configuring Quinary Mi2S interface
> it will be used on MSM8953 and MSM8976 platform.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: Split from MSM8953 support patch,add msg]
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 3023cf180a75..5a29adbd3f82 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -20,12 +20,13 @@
>  #include "common.h"
>  #include "qdsp6/q6afe.h"
>  
> -#define MI2S_COUNT  (MI2S_QUATERNARY + 1)
> +#define MI2S_COUNT  (MI2S_QUINARY + 1)
>  
>  struct apq8016_sbc_data {
>  	struct snd_soc_card card;
>  	void __iomem *mic_iomux;
>  	void __iomem *spkr_iomux;
> +	void __iomem *quin_iomux;
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
>  	int mi2s_clk_count[MI2S_COUNT];
> @@ -86,6 +87,12 @@ static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
>  			SPKR_CTL_TLMM_DATA1_EN | SPKR_CTL_TLMM_WS_OUT_SEL_SEC |
>  			SPKR_CTL_TLMM_WS_EN_SEL_SEC, pdata->spkr_iomux);
>  		break;
> +	case MI2S_QUINARY:
> +		/* Configure Quinary MI2S */
> +		if (!pdata->quin_iomux)
> +			return -ENOENT;
> +		writel(readl(pdata->quin_iomux) | 0x01, pdata->quin_iomux);

I'm nitpicking, but 0x01 here is BIT(0)

Acked-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad
