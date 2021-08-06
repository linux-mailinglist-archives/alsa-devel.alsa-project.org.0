Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B47B53E2A56
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 14:07:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D5F116E3;
	Fri,  6 Aug 2021 14:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D5F116E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628251676;
	bh=eudImTHebuXzISONw5Lde65E7fQbPCiVOKJ0D4gBvuE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tdkgFJEByOD9vNY9Nuk4T6CshCEP2YJ+/hK6W6bsDMV7Xfh8mScr2MpcVgyNg45ms
	 YxWEvOJpbjASusaiMl8nAYv7FR2E5HGu+x5Vax0VjuBknIuBqV9RLYbq75Cfi4BvnW
	 K0wHE6n9WWCEAaWn6Jf0KE2hax40RJM3ear8lfE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 870E3F80108;
	Fri,  6 Aug 2021 14:06:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B54AF801F7; Fri,  6 Aug 2021 14:06:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A94F9F80108
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 14:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A94F9F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="O7Esh5bM"
Received: by mail-wr1-x434.google.com with SMTP id p5so10795967wro.7
 for <alsa-devel@alsa-project.org>; Fri, 06 Aug 2021 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zIkPlaepn7cVcLOlogP6tw0QtR3s5KOOKLFL6W1I1W8=;
 b=O7Esh5bM7oIRAVW8/fvggmwsEzQcwYSJ6FyLR+xYmRzr3lmCuVujcv1hegf0teu7/A
 K8aA60nMMx925AfIFzvofaxB6u3FegMJ4ySiqQa/VMG3PiKfk53WEDfwE/u1NjjvHm4n
 z/LiMy2qmkT2NKM49iiHGKeSs4ZC8RdzgEOhCSNK3T0dUEpBP1+1J3CiBXUmF3xOC+oD
 oVw19cTYJq6Ga5S878FJ8nALwWee6n+NiNgtvtwqV3mRnFz1h+7lyRwKMYJ9YP7grjfe
 ZktoAh5164GlnZJvrje+fdjDb6vIoa3VFau5aopcZ0+KzmoSkmd7/SEtzLgQqJOghFGO
 35jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zIkPlaepn7cVcLOlogP6tw0QtR3s5KOOKLFL6W1I1W8=;
 b=AC2lHurS6li2IgvJL3jO0nI6qxLuSQN8x8QbCHR/Q3/8fuN32Z9aNNxduVzd3JWdFj
 vA6QFu3IZw65Ygo4IlCOY5LArsFS4LkYepVvA9jzp3YOLU66SZIFnRcwuT4TNIGnpuyu
 X5zJyl6BRdRRyGLyJmkzNMMGDS0r3CGTbfNTe5ibf+joP79ZBl4K6NAgQ0+3eCkIXfDS
 hW6GgvZsvlRJTwwyDXVRASUG6yWs28yUIy/3L9pz+9nsiFqcd0FjG54BZ5jwfiChzSfm
 /yjpdTWaV9KNq1hSzUktX3KMNNudilkGjjw2uAeQUQZihBD1H0R3TwYdZaOegQSZVpRd
 HwRw==
X-Gm-Message-State: AOAM530dn57x3KZXb6dv8d+ssd5oYWUqJB6wEstYPwDmjl4ci20oZ6mo
 1hhyXljRzy6GM9hKR6rRVrsjkA==
X-Google-Smtp-Source: ABdhPJxTl539JAuxpt6ru9+KOop6BTMQtlaB06v648QGj3hRa7CfCjgLIUyK4ar3zP3KVyDPnMY70w==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr10641921wrq.204.1628251579670; 
 Fri, 06 Aug 2021 05:06:19 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id x18sm8335417wmc.17.2021.08.06.05.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 05:06:19 -0700 (PDT)
Subject: Re: [PATCH v2] ASoC: qcom: apq8016_sbc: Add SEC_MI2S support
To: Vincent Knecht <vincent.knecht@mailoo.org>, tiwai@suse.com, perex@perex.cz
References: <20210806114116.895473-1-vincent.knecht@mailoo.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <facfd3cb-7546-ce65-c342-70b88b46b36e@linaro.org>
Date: Fri, 6 Aug 2021 13:06:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806114116.895473-1-vincent.knecht@mailoo.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, stephan@gerhold.net,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 06/08/2021 12:41, Vincent Knecht wrote:
> This patch adds external codec support on secondary mi2s.
> It is used for headphones on some devices, eg. alcatel-idol347.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

Thanks for rework, LGTM.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
> v1->v2: thanks Srinivas for the review, and Stephan for guidance
> - Add _SEC suffix to defines to highlight usage for secondary mi2s
> - Clear TLMM_WS_OUT_SEL and TLMM_WS_EN_SEL fields before setting value
> ---
>   sound/soc/qcom/apq8016_sbc.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 08a05f0ecad7..ba2a98268ee4 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -30,6 +30,13 @@ struct apq8016_sbc_data {
>   #define MIC_CTRL_QUA_WS_SLAVE_SEL_10	BIT(17)
>   #define MIC_CTRL_TLMM_SCLK_EN		BIT(1)
>   #define	SPKR_CTL_PRI_WS_SLAVE_SEL_11	(BIT(17) | BIT(16))
> +#define SPKR_CTL_TLMM_MCLK_EN		BIT(1)
> +#define SPKR_CTL_TLMM_SCLK_EN		BIT(2)
> +#define SPKR_CTL_TLMM_DATA1_EN		BIT(3)
> +#define SPKR_CTL_TLMM_WS_OUT_SEL_MASK	GENMASK(7, 6)
> +#define SPKR_CTL_TLMM_WS_OUT_SEL_SEC	BIT(6)
> +#define SPKR_CTL_TLMM_WS_EN_SEL_MASK	GENMASK(19, 18)
> +#define SPKR_CTL_TLMM_WS_EN_SEL_SEC	BIT(18)
>   #define DEFAULT_MCLK_RATE		9600000
>   
>   static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
> @@ -40,6 +47,7 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
>   	struct snd_soc_card *card = rtd->card;
>   	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
>   	int i, rval;
> +	u32 value;
>   
>   	switch (cpu_dai->id) {
>   	case MI2S_PRIMARY:
> @@ -53,6 +61,15 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
>   			MIC_CTRL_TLMM_SCLK_EN,
>   			pdata->mic_iomux);
>   		break;
> +	case MI2S_SECONDARY:
> +		/* Clear TLMM_WS_OUT_SEL and TLMM_WS_EN_SEL fields */
> +		value = readl(pdata->spkr_iomux) &
> +			~(SPKR_CTL_TLMM_WS_OUT_SEL_MASK | SPKR_CTL_TLMM_WS_EN_SEL_MASK);
> +		/* Configure the Sec MI2S to TLMM */
> +		writel(value | SPKR_CTL_TLMM_MCLK_EN | SPKR_CTL_TLMM_SCLK_EN |
> +			SPKR_CTL_TLMM_DATA1_EN | SPKR_CTL_TLMM_WS_OUT_SEL_SEC |
> +			SPKR_CTL_TLMM_WS_EN_SEL_SEC, pdata->spkr_iomux);
> +		break;
>   	case MI2S_TERTIARY:
>   		writel(readl(pdata->mic_iomux) | MIC_CTRL_TER_WS_SLAVE_SEL |
>   			MIC_CTRL_TLMM_SCLK_EN,
> 
