Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9A4115AE
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 15:26:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A266316BB;
	Mon, 20 Sep 2021 15:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A266316BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632144412;
	bh=Pmmtt1wB4DpMbBeT3za21g8eG5VUMj4Kvh479+RCnTE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Juj4HwbZcc0/I0+vEs5RqKb8eFwkXFNI16uXZqjiSpmvFFZXzA/1J3sE3aA2M85DT
	 GEtnJbCiUD0HyeYJ3KENri9WbpAiOxLw13ofKl2IWH4PeVAM3d1L72dVWReqR48Rqd
	 yAeXQBQO5cJz4BON3xNHaNa7QTJv7ugsXCf3xdvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A4CBF804E5;
	Mon, 20 Sep 2021 15:25:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEEB2F804E4; Mon, 20 Sep 2021 15:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF4E3F80152
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 15:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF4E3F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WpaAQKMb"
Received: by mail-ed1-x532.google.com with SMTP id c22so61331477edn.12
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 06:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5Z/peYbs19scCEIFsnkY9ZT+Ng56kA6OzfkT1Vupsss=;
 b=WpaAQKMbLMi8KUDY8D4vzykEZLpjiSzI1V9dR9E4Q6JgPva+/tb9cGXkDyncA8qetG
 /mYUMpknYMbJ8/mj/wRyDOpDx8mrLsRM0WCZdxuH93MczwgYvHV4ia1HyMveZXxHRJIi
 kIdYFXJFxdF4/n/VUmFwzkYDn4UVoaal8k7kJOITgxnGYleYhutubEcBzfrP5w2kowx5
 +OW54W0unAVmY3jRlABJ/I6g/wZs4CsyniBO5CHJ5vhX+wGqR5VGF7ZeQ6o8He43bIlO
 0ncTQQaNV7PdodS5VRqXZad+9j7UZEXAptZKVWC/MIKpcITILj1hbdpoWtO1QPQvDp8O
 7gLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Z/peYbs19scCEIFsnkY9ZT+Ng56kA6OzfkT1Vupsss=;
 b=ayEHgbPYUVAhKRTp/sYuD3hFkxafIR/3eDj7v2pu++EWj2WhVQP8Cg2dxjo0c+SmLL
 0tgX8ItdUG3uLd/hixOjAGloapIegTeRUkh3fZ58AgFBopo6LEay9PmUXHJ7bvB4hs46
 PQWTPEVa3k3sKXZ5KhrPk7+kdgktmaxCdXuRyXnx+0r92JuU9QNh8tbJhxuaqxJO0cBC
 IBhuJz7rEn5DSBLNBt0yMcjb50g6fbWmXgAMUimA4/KNIhHr44TOyfjM3MEVOih51tDK
 0hX25wP+i0ezFwkvWazxec9+CIv+elfRPLce8O2JoLNaK7iZ9JYyYY1pXJ4KvG+OqvOD
 Wj/A==
X-Gm-Message-State: AOAM5302vVAzofPkxDhS0W7xIBMvF8akexmrqWW1GNfQ7Szis6hwJrKw
 rvAWuRgmn6rKjITfsi74aAG5PA==
X-Google-Smtp-Source: ABdhPJzgF59K4i1R043ONbfVpeUA1ioxtRrNGTbbHkteOOznyAHryJjFhJRy7tPrvrsZ0DhF/JIFxg==
X-Received: by 2002:a17:906:520b:: with SMTP id
 g11mr28539621ejm.502.1632144298580; 
 Mon, 20 Sep 2021 06:24:58 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id o7sm6960081edt.68.2021.09.20.06.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 06:24:58 -0700 (PDT)
Subject: Re: [PATCH 3/7] ASoC: codecs: tx-macro: Change mic control registers
 to volatile
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
 <1632123331-2425-4-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c1c7b1e8-98f5-99a3-1374-11d1d61535b4@linaro.org>
Date: Mon, 20 Sep 2021 14:24:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1632123331-2425-4-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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



On 20/09/2021 08:35, Srinivasa Rao Mandadapu wrote:
> Update amic and dmic related tx macro control registers to volatile
> 
> Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for lpass tx macro)
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/codecs/lpass-tx-macro.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 9273724..e65b592 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -423,6 +423,13 @@ static bool tx_is_volatile_register(struct device *dev, unsigned int reg)
>   	case CDC_TX_TOP_CSR_SWR_DMIC1_CTL:
>   	case CDC_TX_TOP_CSR_SWR_DMIC2_CTL:
>   	case CDC_TX_TOP_CSR_SWR_DMIC3_CTL:
> +	case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
> +	case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
> +	case CDC_TX_CLK_RST_CTRL_MCLK_CONTROL:
> +	case CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL:
> +	case CDC_TX_CLK_RST_CTRL_SWR_CONTROL:
> +	case CDC_TX_TOP_CSR_SWR_CTRL:
> +	case CDC_TX0_TX_PATH_SEC7:

Why are these marked as Volatile?
Can you provide some details on the issue that you are seeing?

--srini


>   		return true;
>   	}
>   	return false;
> @@ -1674,6 +1681,12 @@ static int tx_macro_component_probe(struct snd_soc_component *comp)
>   
>   	snd_soc_component_update_bits(comp, CDC_TX0_TX_PATH_SEC7, 0x3F,
>   				      0x0A);
> +	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0xFF, 0x00);
> +	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0xFF, 0x00);
> +	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_DMIC0_CTL, 0xFF, 0x00);
> +	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0xFF, 0x00);
> +	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0xFF, 0x00);
> +	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0xFF, 0x00);
>   
>   	return 0;
>   }
> 
