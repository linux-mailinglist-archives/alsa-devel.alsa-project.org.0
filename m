Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D677638670
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 10:44:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A18651726;
	Fri, 25 Nov 2022 10:43:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A18651726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669369450;
	bh=WwUxQGuZZcCTTxUvcxDekoFEE/xDxHDx2OFyAc4Oy2U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nknI++L+2rHuMzOb8h59/6sX9EsQq/F0JxEgV4FEMVR1Dcs/tk+O5D0lVI4Lbl/IW
	 GAWysrh90oeiN4ZZcIRSc5jbwEhP2vHPQWtCSRObjLBmBfYDT3hcS3y72ku1MhTKFE
	 qk8VOgIk+UZpKfILGtXYb2yVcLOsx1x6r7gETsYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15CDCF8047C;
	Fri, 25 Nov 2022 10:43:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0D19F800F4; Fri, 25 Nov 2022 10:43:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 159B3F800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 10:43:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 159B3F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RIq1CCGS"
Received: by mail-wm1-x32f.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso5751125wme.5
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 01:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BtoCJqUpK4o5szevvw+ybfVTb/LNHn5NkHemMgXxags=;
 b=RIq1CCGS1Wy//7bL7UDssjZV6iSmgRRpEEsXZIHIH5LIzgWYus6V80uiQfneQg+azX
 5BjASqgh+TvA1DzUn0M0qq7tJf+ETQkQPfMpErMmI7ywBlFJhnCWqSaHv0Hp95hBd8A8
 5bc/ml/2Qq4vbYw2HSt5fQC4djAzwLo4m1hn1rYit2OfBv93hBUGDc4dzuu50xAjxjz4
 yvGbIBdQM/sANhStoY2zULaxDGXcWr/Hm+oRCiMkdeJaiIvc6CZs1mfbkKLYpAo/vQGu
 ep3Fo1Gf2vS2Lc6T94mXHiylTXPM3d2Tve/VEh7DCwZw8fcViKrED8EbnzylDWAiOPiB
 W4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BtoCJqUpK4o5szevvw+ybfVTb/LNHn5NkHemMgXxags=;
 b=1fPu7bro0oCQtwtvUH490zeXYXQvp5Xn2jX5QdShmxc/61EOPX1/IbMBDl+MAmC1q1
 LI8TVXEkdXEV/DK0nRJqcMKaTznXa2gR5FeASw8N3FQE5gRtacbudmntTapQ25HwFDM7
 m0NvbUNX1NT5Tf2LWnU1XlifAu4EYTrzzbIAH7yLZsyDHMOGsrApNvZvi15/fbyUsL04
 AHc1tdtygwARy4qlh2UaCDnuzr3ypAcPHudd3cEKfdIruYcEKr5O6VW2zu/XmVqXdpNM
 1EnOlbF+QKxWRKpUJ6atwGQhUDLeaYHC687E8oi3wDoP5dC26OGI5IQaljeRc2NQMtv0
 /OUA==
X-Gm-Message-State: ANoB5pkDZ+qd9EOxMMLsIsXVr5OdXFKTmxk0J3Fjfcz4pdZAmIoHfnJ7
 chqz2ny2wm2ZMcOo8SgUkLW62G57asAfSA==
X-Google-Smtp-Source: AA0mqf4sFKwnaFLm9VUzLrAKTNaebOAx2sGm+q9PGsK/IvMojE7dvatbEZyuGMpB3ORSaUWeMHlTlA==
X-Received: by 2002:a7b:cc85:0:b0:3bf:d1e2:1d9 with SMTP id
 p5-20020a7bcc85000000b003bfd1e201d9mr20274173wma.115.1669369385088; 
 Fri, 25 Nov 2022 01:43:05 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 o9-20020a5d4a89000000b00241fde8fe04sm3326606wrq.7.2022.11.25.01.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 01:43:04 -0800 (PST)
Message-ID: <d8b9222f-e5a0-9686-732e-fd8530167678@linaro.org>
Date: Fri, 25 Nov 2022 09:43:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: qcom: Fix build error if CONFIG_SOUNDWIRE=m
To: Zhang Qilong <zhangqilong3@huawei.com>, bgoswami@quicinc.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
References: <20221125074458.117347-1-zhangqilong3@huawei.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221125074458.117347-1-zhangqilong3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 25/11/2022 07:44, Zhang Qilong wrote:
> If CONFIG_SND_SOC_APQ8016_SBC=y || CONFIG_SND_SOC_MSM8996=y,
> CONFIG_SND_SOC_QCOM_COMMON=y, CONFIG_SOUNDWIRE=m, building fails:
> 
> sound/soc/qcom/common.o: in function `qcom_snd_sdw_hw_free':
> common.c:(.text+0x294): undefined reference to `sdw_disable_stream'
> common.c:(.text+0x2a0): undefined reference to `sdw_deprepare_stream'
> sound/soc/qcom/common.o: in function `qcom_snd_sdw_prepare':
> common.c:(.text+0x314): undefined reference to `sdw_prepare_stream'
> common.c:(.text+0x324): undefined reference to `sdw_enable_stream'
> common.c:(.text+0x364): undefined reference to `sdw_disable_stream'
> common.c:(.text+0x36c): undefined reference to `sdw_deprepare_stream'
> common.c:(.text+0x3a8): undefined reference to `sdw_deprepare_stream'
> 
> Make SND_SOC_APQ8016_SBC,SND_SOC_MSM8996 depends on
> 'SOUNDWIRE || !SOUNDWIRE' to fix this.

This is not really the case, QCOM_COMMON is the one depending on soundwire


I have submitted a patch to clean this up.

https://lore.kernel.org/lkml/20221124140351[PATCH]%20ASoC:%20qcom:%20cleanup%20and%20fix%20dependency%20of%20QCOM_COMMON.407506-1-srinivas.kandagatla@linaro.org/T/#u



--srini
> 
> Fixes: 3bd975f3ae0a ("ASoC: qcom: sm8250: move some code to common")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> -- >   sound/soc/qcom/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 8c7398bc1ca8..f5f0b48d74af 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -58,6 +58,7 @@ config SND_SOC_STORM
>   
>   config SND_SOC_APQ8016_SBC
>   	tristate "SoC Audio support for APQ8016 SBC platforms"
> +	depends on SOUNDWIRE || !SOUNDWIRE
>   	select SND_SOC_LPASS_APQ8016
>   	select SND_SOC_QCOM_COMMON
>   	help
> @@ -141,6 +142,7 @@ config SND_SOC_MSM8996
>   	tristate "SoC Machine driver for MSM8996 and APQ8096 boards"
>   	depends on QCOM_APR
>   	depends on COMMON_CLK
> +	depends on SOUNDWIRE || !SOUNDWIRE
>   	select SND_SOC_QDSP6
>   	select SND_SOC_QCOM_COMMON
>   	help
