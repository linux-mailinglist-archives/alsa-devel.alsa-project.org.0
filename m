Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB5550679B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 11:20:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D0AB1728;
	Tue, 19 Apr 2022 11:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D0AB1728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650360056;
	bh=PM4yDBCXI9p/adg6CYLWz+h9Yi2r2kI2OnLqIQ3AuiA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TulB0HHV0Oj0h3A2aKwEMpj4qGXyw4FeaAYDBPW/vJtcSyq2EZNSHeobrn4nsUc/y
	 Pai+G3RtiD+y25jgIRWzBO5LocW2AetEkYl+AYLCDEOIquAtC7JGAZu5hU5d3Z3cW5
	 tyOP3xxmMloCu3qYAabMPIRdUOLzxckPFHKqMuII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98CB2F80237;
	Tue, 19 Apr 2022 11:19:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8C6CF8025D; Tue, 19 Apr 2022 11:19:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 965E2F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 11:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 965E2F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ItWrtcCo"
Received: by mail-wm1-x329.google.com with SMTP id
 n40-20020a05600c3ba800b0038ff1939b16so1059054wms.2
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AfuD0adMHdVdGBphmISzdkHuokPa7yMy38/SGYT3mOg=;
 b=ItWrtcCoxUOYpMXnC+OMSnDOHEWg2fruvwm9KfP91sOMKDuseMDDfBTUC0h3GVseB6
 iFJbjKWOOYqLwUo6oIEImV2ToiTAaaB1xls+faQO1R7dMgEsgM5KqfHfUNILYaaq7H1s
 g/ri7FmiNrxRVwU2V0n0NWW/q5w+i4Uvun5tdabAa4kTCDI4PRch90yE21P4RGmoT0Ki
 uLTwkVlM3+KvuWrqXMQqBIgf2pROKy4OrmCyjF+g4YaNqq+ursjTUA+S8IAolrkR0AJU
 D2CT3YBjgnwoJDQaKVRLFf1ChF35VA5Iz35V/ZQpbfVWw/NUAngBf03VTCsvYthgJ8Qb
 3SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AfuD0adMHdVdGBphmISzdkHuokPa7yMy38/SGYT3mOg=;
 b=Cqc/paIaba4pfdq8+E6x5k4kjCeo9AZbIFGq9/fAsJCuiLmP16ASBwE8qyq6ryiVMk
 /emsgPbEyUvQw/GTaooreuMyRbJ3FSd3jzUJmzqKQZE17Y9HhiZS++peMqneyLGEeqHp
 te4ea8sCST+hxWrzuYmaTNN3Vl8GKz9+qXQxUp0xOOyqZk+63i4W/TflwfXWG7pEVUGs
 X+MGUTlkBDhazza7GO+zIM8mbxeO4SmhV3nvDX0dn+28mt53Mlr2vQ5xQ9/j7He21DKI
 I327361EDG2KNgh9mTCghXgcF8ikXrgN5Vb/MmB2TzElxv6nbogWG1kvnFnAO1kF3QBH
 mRUw==
X-Gm-Message-State: AOAM532Pfrj+m3Zap9rDxSGX/zwAytzKn8T0W3tSmOyW2sT9poGbI01s
 VkeUVtALxPYBJbhwOqPJBKYXdg==
X-Google-Smtp-Source: ABdhPJxMtEy5OVKBvXQyiQaQLB+1ZlgvXxNp1br3PfkLvMXCyl08/iacL8tlG4PyVh53cioM9VNxhw==
X-Received: by 2002:a7b:c844:0:b0:38e:7c92:a9e3 with SMTP id
 c4-20020a7bc844000000b0038e7c92a9e3mr14569718wml.140.1650359987755; 
 Tue, 19 Apr 2022 02:19:47 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 o13-20020a05600c4fcd00b00392951086efsm6400282wmq.34.2022.04.19.02.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 02:19:47 -0700 (PDT)
Message-ID: <102ad140-dc26-d266-a716-4e22003ec601@linaro.org>
Date: Tue, 19 Apr 2022 10:19:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: qcom: SC7280: Update machine driver startup,
 shutdown callbacks
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
 perex@perex.cz, tiwai@suse.com, quic_rohkumar@quicinc.com,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1650352619-17370-1-git-send-email-quic_srivasam@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1650352619-17370-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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



On 19/04/2022 08:16, Srinivasa Rao Mandadapu wrote:
> Update machine driver startup, shutdown callback functions to support
> codec DMA paths. Without this change, platforms with WCD codec is failing
> to register sound card.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>   sound/soc/qcom/sc7280.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
> index 4ef4034..d64df11 100644
> --- a/sound/soc/qcom/sc7280.c
> +++ b/sound/soc/qcom/sc7280.c
> @@ -295,6 +295,10 @@ static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
>   		break;
>   	case LPASS_DP_RX:
>   		break;
> +	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
> +		break;
>   	default:
>   		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
>   			cpu_dai->id);

Why not just make sc7280_snd_startup code like this:

static int sc7280_snd_startup(struct snd_pcm_substream *substream)
{
	struct snd_soc_pcm_runtime *rtd = substream->private_data;
	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
	int ret = 0;

	switch (cpu_dai->id) {
	case MI2S_PRIMARY:
		ret = sc7280_rt5682_init(rtd);
		break;
	default:
		break;
	}
	return ret;
}

and sc7280_snd_shutdown with something similar

--srini
> @@ -316,6 +320,10 @@ static int sc7280_snd_startup(struct snd_pcm_substream *substream)
>   		break;
>   	case LPASS_DP_RX:
>   		break;
> +	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
> +		break;
>   	default:
>   		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
>   			cpu_dai->id);
