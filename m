Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BF199146
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 12:47:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA2F8166A;
	Thu, 22 Aug 2019 12:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA2F8166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566470864;
	bh=HvvMH9OCHhvSxAs4NgZA+12+f8lzI7uNc4XWXVqMtLc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eTxwNuHOz+4+yMGTREMzb54xEjcSUacIkcUyK13hREEyqdgRXPD5o3m7E0Ner98Ob
	 AmhfN9QWUz23wswbkf/cn5xkv9SpztOoPVYetlu2TC3oMgMSA01Quo+FZXCS/HndDm
	 +VOjUrwrR8EqYRjIkHeu++mALM8fgexqauX1QQKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A85F2F8036D;
	Thu, 22 Aug 2019 12:46:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8100F8036E; Thu, 22 Aug 2019 12:45:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03FB0F80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 12:45:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03FB0F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="H1nHUAjL"
Received: by mail-wr1-x443.google.com with SMTP id t16so4942298wra.6
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 03:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/DjOjyPKJGO/AF9O06K0OKutOBMRAX78D/FmEPCYTxg=;
 b=H1nHUAjLEMs4Dr3/Rfk4r8Z7hCsoI3/15V+TnydrEwdtdKJA4Vc1HidnpZVfn+XmKl
 M6c1XvAax0EAAkoyitioea/2HCCVE1kmjwMwIAjvxB+0UG4ZuBIXSXnsrp6qrNbOK2ou
 1LNkD31uLewoJA83SLRrTHR4ab5eKPpOv4kWrt3yq2GQp6I9PhIrrAOu6/f+X6Lc+lTs
 c8lUCbNH5kByi28P2a/nH0BWzQ1kPO3QIEnykizpOuAnVKmFCj3WtHqU77o7TFSxEDVn
 FaxpSJ6tRo8eAhO8WYS62HfIlPeN2EjKweqdADxmZVST0H7rSwQIlVMXXvk5ld4BtERk
 3Q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/DjOjyPKJGO/AF9O06K0OKutOBMRAX78D/FmEPCYTxg=;
 b=cR6dPqF7Me+ztd2b+Fn9deERr8T/LK6ZAMrGv1mulAZKzMXZaMf1E91ZQpVjSPfS+1
 djrwRGc7BEUKVgyGONtsa7v9lq2xQ3MYStExdkus6KesJWua0inpJYVE9vp14QhDHg91
 jrTMj1zZb/srk2k4EqVIFt8Y8HHQzOmtyFxzlAxzVuA03wC+D/q5e/0I6Nc2ttrBOHJj
 neA6ijU09uLM1h5heJig4ta4UnNcmO4C6NeUJaAiD2awg/awghyvvr+q+SBjfASSD582
 dpP/UPD1hb7qdBGvHBZE1coZ21AzlrOMjgkl0oC5veY8BYpOunlMaAJGHEFjJc5ejFLf
 qrZw==
X-Gm-Message-State: APjAAAVhJosV50jw2XEis+gjxt+SPsm+h8VFrmRYQmHnuhpNFWNPd8SG
 sfdK5988dxNk9HyP6wROHI8ahg==
X-Google-Smtp-Source: APXvYqxPje/72ek540Wsgy2FREnCYVC+6jwVQWIqUyJBEi7qym21drEX2bFUj7QhfEDtCBnjXkOH0g==
X-Received: by 2002:adf:e801:: with SMTP id o1mr47743779wrm.45.1566470750528; 
 Thu, 22 Aug 2019 03:45:50 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id f134sm5264028wmg.20.2019.08.22.03.45.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 03:45:49 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <20190822095653.7200-1-srinivas.kandagatla@linaro.org>
 <20190822095653.7200-4-srinivas.kandagatla@linaro.org>
 <s5h7e75v7en.wl-tiwai@suse.de>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <923f1d65-d908-c64c-3109-0da1938d3824@linaro.org>
Date: Thu, 22 Aug 2019 11:45:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5h7e75v7en.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, plai@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/4] ASoC: qdsp6: q6afe-dai: Update max
 rate for slim and tdm dais
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 22/08/2019 11:09, Takashi Iwai wrote:
> On Thu, 22 Aug 2019 11:56:52 +0200,
> Srinivas Kandagatla wrote:
>>
>> QDSP supports up to 384000 rates on SLIM dais and 352800 rate on TDM dais.
>> Add this missing rates.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/qcom/qdsp6/q6afe-dai.c | 92 +++++++++++---------------------
>>   1 file changed, 32 insertions(+), 60 deletions(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
>> index c1a7624eaf17..ae2baefdb6e2 100644
>> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
>> @@ -18,14 +18,14 @@
>>   			.stream_name = pre" TDM"#num" Playback",	\
>>   			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
>>   				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
>> -				SNDRV_PCM_RATE_176400,			\
>> +				SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_352800,\
> 
> This will support a lot more than advertised, e.g. it contains 64000Hz
> or 22050Hz.  Is this supposed?  If yes, mention it clearly in the
> changelog, too.

Some of the rates inbetween are not in the DSP supported rate list for TDM.

DSP should return error if we try to set any unsupported rate!

--srini
> 
> thanks,
> 
> Takashi
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
