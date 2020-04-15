Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB01AAD49
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 18:25:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BE93950;
	Wed, 15 Apr 2020 18:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BE93950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586967929;
	bh=JQT+HuM/zCJTs/fwRKaUbyNCMqGquigm+0jCk+etBu4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cIBca8KSaRHjs2GYtBL+4aBoxtTLCN7+cUuuliUibipKWhJyPvJwzmL9I7T122k5T
	 IYFPuFNHTitP8OeFD3ZJFL+iDTZl7oyhMTO86aP9A9XCBDyyWNSS+JaBOajrcozxVo
	 J8rMx47x62LY6UedpSOckWqpZf01PI/i5PCJt6cs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A1A9F80266;
	Wed, 15 Apr 2020 18:23:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7919EF80266; Wed, 15 Apr 2020 18:23:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E3E6F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 18:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E3E6F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fJ7OMWyy"
Received: by mail-wr1-x443.google.com with SMTP id d27so632776wra.1
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kcC5qrP6lxTN1bpMkTFtJey878YdcmfOfdqMdienk8M=;
 b=fJ7OMWyy7qFjUirTnI0docDJt58yTpgVEo6ANazO+reesGXk76M7yy6aJaNPPbNI3y
 sd5bj1WtrWFdAItXHxclSwqqwj6FNpoM51grUgNZMv9JLeyLFTG4uECZ2bkiqdapSYAs
 pSCLmTxHGDXNZdSa3aRXnP0p7Dbs/2/5h6jX8/FUmGqHnYjGsVkkbufxU+Z+36wmbskf
 B7pCrc0cuckvf+iS4b6hcIiGTgJwhBwiq7gTuaAiWUVSEbImXvl9hF7UFWMpklUAKlqZ
 ZKH5hopTA1EjtJ1pDYd8SQtIFxVfVTs7Gy1yLQsBXn1WOEwF8biNONcmG5lh1WMkTbAu
 udNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kcC5qrP6lxTN1bpMkTFtJey878YdcmfOfdqMdienk8M=;
 b=RA3aSB4emLapj8aQb1A+I1Yf07psp5QHI7Ro7HJpJK4N8s+iddWZigsUmE8ergfZ8r
 2Z3+KPGhF+W+EMRlYWsk0GHZscZsWAooMXG/+n/KCV8l6h8YcD79zi/ED8vYUNotftDd
 +zn9PS9sR123Iz9yW9mXduL91wG+SgeDAVXX+m9pR4k3u+oq0PvLlg6C2uh6A1bCBDMr
 sOjLexd09a/4n6QlCmqNtMlLklx1A0RLh+sY5uPk0Z1UcD5JjbEEQRrm0bSat0yi0Lv0
 7+tLJWHyVObcoN37UmD6AVZOhJWu/kEHI3PhXpsAtisyR2AmOoXQz0p7EV9Q9HPBoGUz
 LXPg==
X-Gm-Message-State: AGi0PuYefGrTAm2vPm1w8Z9cF+dv7/t6dDThit9UXUoasgO5sleCm11C
 j6vRYn9khEMlrAWJqiPhHvQPmA==
X-Google-Smtp-Source: APiQypL4bpCX/4+MH2JpnPfyGaDtORfMr5BfRwUzdf/j2p47frdwbq3qevkXrlCJWx4ErCfvXwoRYQ==
X-Received: by 2002:a5d:4cd0:: with SMTP id c16mr23693829wrt.98.1586967817240; 
 Wed, 15 Apr 2020 09:23:37 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id h188sm112330wme.8.2020.04.15.09.23.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 09:23:36 -0700 (PDT)
Subject: Re: [PATCH] ASoC: q6dsp6: q6afe-dai: add missing channels to MI2S DAIs
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20200415150050.616392-1-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <30d5c723-d840-3e0f-17c8-dcbfb45a3528@linaro.org>
Date: Wed, 15 Apr 2020 17:23:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200415150050.616392-1-stephan@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Banajit Goswami <bgoswami@codeaurora.org>, alsa-devel@alsa-project.org,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
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



On 15/04/2020 16:00, Stephan Gerhold wrote:
> For some reason, the MI2S DAIs do not have channels_min/max defined.
> This means that snd_soc_dai_stream_valid() returns false,
> i.e. the DAIs have neither valid playback nor capture stream.
> 
> It's quite surprising that this ever worked correctly,
> but in 5.7-rc1 this is now failing badly: :)
> 
> Commit 0e9cf4c452ad ("ASoC: pcm: check if cpu-dai supports a given stream")
> introduced a check for snd_soc_dai_stream_valid() before calling
> hw_params(), which means that the q6i2s_hw_params() function
> was never called, eventually resulting in:
> 
>      qcom-q6afe aprsvc:q6afe:4:4: no line is assigned
> 
> ... even though "qcom,sd-lines" is set in the device tree.
> 
> Commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow playback/capture if supported")
> now even avoids creating PCM devices if the stream is not supported,
> which means that it is failing even earlier with e.g.:
> 
>      Primary MI2S: ASoC: no backend playback stream
> 
> Avoid all that trouble by adding channels_min/max for the MI2S DAIs.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Fixes: 24c4cbcfac09 ("ASoC: qdsp6: q6afe: Add q6afe dai driver")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>


Thanks for the patch,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>



> ---
>   sound/soc/qcom/qdsp6/q6afe-dai.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
> index c1a7624eaf17..2a5302f1db98 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
> @@ -902,6 +902,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
>   				 SNDRV_PCM_RATE_16000,
>   			.formats = SNDRV_PCM_FMTBIT_S16_LE |
>   				   SNDRV_PCM_FMTBIT_S24_LE,
> +			.channels_min = 1,
> +			.channels_max = 8,
>   			.rate_min =     8000,
>   			.rate_max =     48000,
>   		},
> @@ -917,6 +919,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
>   				 SNDRV_PCM_RATE_16000,
>   			.formats = SNDRV_PCM_FMTBIT_S16_LE |
>   				   SNDRV_PCM_FMTBIT_S24_LE,
> +			.channels_min = 1,
> +			.channels_max = 8,
>   			.rate_min =     8000,
>   			.rate_max =     48000,
>   		},
> @@ -931,6 +935,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
>   			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
>   				 SNDRV_PCM_RATE_16000,
>   			.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +			.channels_min = 1,
> +			.channels_max = 8,
>   			.rate_min =     8000,
>   			.rate_max =     48000,
>   		},
> @@ -946,6 +952,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
>   				 SNDRV_PCM_RATE_16000,
>   			.formats = SNDRV_PCM_FMTBIT_S16_LE |
>   				   SNDRV_PCM_FMTBIT_S24_LE,
> +			.channels_min = 1,
> +			.channels_max = 8,
>   			.rate_min =     8000,
>   			.rate_max =     48000,
>   		},
> @@ -960,6 +968,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
>   			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
>   				 SNDRV_PCM_RATE_16000,
>   			.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +			.channels_min = 1,
> +			.channels_max = 8,
>   			.rate_min =     8000,
>   			.rate_max =     48000,
>   		},
> @@ -975,6 +985,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
>   				 SNDRV_PCM_RATE_16000,
>   			.formats = SNDRV_PCM_FMTBIT_S16_LE |
>   				   SNDRV_PCM_FMTBIT_S24_LE,
> +			.channels_min = 1,
> +			.channels_max = 8,
>   			.rate_min =     8000,
>   			.rate_max =     48000,
>   		},
> @@ -989,6 +1001,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
>   			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
>   				 SNDRV_PCM_RATE_16000,
>   			.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +			.channels_min = 1,
> +			.channels_max = 8,
>   			.rate_min =     8000,
>   			.rate_max =     48000,
>   		},
> @@ -1004,6 +1018,8 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
>   				 SNDRV_PCM_RATE_16000,
>   			.formats = SNDRV_PCM_FMTBIT_S16_LE |
>   				   SNDRV_PCM_FMTBIT_S24_LE,
> +			.channels_min = 1,
> +			.channels_max = 8,
>   			.rate_min =     8000,
>   			.rate_max =     48000,
>   		},
> 
