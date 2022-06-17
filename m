Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C6954FE8B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 22:54:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 485401E77;
	Fri, 17 Jun 2022 22:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 485401E77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655499250;
	bh=3n5Klw2CMTyq2sdzn4bKj0tODPt3MrXgPTCq79ehF3A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=flV6ts3ziIJxpGb726ZhyIXcDEXDo3CAtGPtA9flhSwFH6YJRTMNeruBa88V4niLY
	 TMJl5+hY1WA0ibJWUgysyp3fo4PEMR42O68TZWUu7VkEaqt0BvldRFwRrGksrRWqJN
	 0Oxs6rv7Q4ZWswPSmtPAWQPHJ1TwPJMhuQc6fM8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C08FAF80528;
	Fri, 17 Jun 2022 22:53:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D6A3F800B0; Fri, 17 Jun 2022 22:53:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 459D9F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 22:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 459D9F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YtY+zp8B"
Received: by mail-pf1-x432.google.com with SMTP id u37so5114429pfg.3
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 13:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JzCoePPltyIJ1REZe29g/ry+WmVSWZaFBIw/sVJ2Jb4=;
 b=YtY+zp8B3TVD1muP4s9LC83VkIeHz9a9vrx+Tgme9Bs8vDuSQ/fFnXEksI5mWZqojT
 SPCNXX7Zf6MMTTcUvOLNrCVSZLM5lI/lU6lqccrmNHyNu3s0oc1EPXTWn+qs0BseZdBW
 RMh9sHSM2rBE/T7x5eWzwASfy/PL9dI0ZIx/LE5hGNuAHgip0FR5o6l66L/CljWWZgbZ
 PrQogLDlhV/LtvSu7ww0jmtN0jV8y7YBCeu2Il6oEaV9ey+qY5IcMMMDhOhtIkl3/MM+
 YWeCdf4dl3TW0HMdQ9R31W/6r75/mw5LJObPq2PUBcmq2jhQwKlEK04urt5OEcU/A69t
 jLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JzCoePPltyIJ1REZe29g/ry+WmVSWZaFBIw/sVJ2Jb4=;
 b=eOXwfs7BTWh00sjZGMWK8IgMip7LwXmKRT/2RlnSX/4arxCqHRbX1p2/JdhZYkVSnD
 9ff6sTW9+SCHrwz9kugqz7ioWhBYUQIysk1RmH4OaJzQXXowiBkvAggFYKWjT/B21hMb
 CVHct5INfmYsyq3rH25MSxAimGCwFdOvVHqB0fK9NDlEv0NkBaSdP5f1wJLhLrC+xZug
 xpfbMkhynvrTrGoNW1U/9TmDZ7OXuFs5v+rAmiNkBI40QGFXJmA5vwyTXTutAF0TG0cM
 UwLMBu0P/CvN2/KGwFrHnUOJtaGNVGtKc1qjyOstyEmoLHAU+td8Ae4pvnS/x6f2uFSa
 svmQ==
X-Gm-Message-State: AJIora8DVUOkR4vmkmHbF9n3NMjcJdoAFzgCgPEWoEaXR472GRVElljS
 HO0d/eGowGZR8LRXXHk9rMalM1pSSdewfQ==
X-Google-Smtp-Source: AGRyM1s0RJHZl208xR17sJB49POLXSqf28nRDtL1lkg0keJvUcbwhL57O4Qt52t3wvqeWdFfo4GJHA==
X-Received: by 2002:a62:1603:0:b0:522:c66b:70ac with SMTP id
 3-20020a621603000000b00522c66b70acmr11586382pfw.83.1655499182008; 
 Fri, 17 Jun 2022 13:53:02 -0700 (PDT)
Received: from [172.31.214.180] ([216.9.110.13])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170902e14c00b001624dab05edsm1903782pla.8.2022.06.17.13.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 13:53:01 -0700 (PDT)
Message-ID: <7f9cafb8-a223-c16d-38af-fcb0df05b659@linaro.org>
Date: Fri, 17 Jun 2022 13:52:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 05/11] ASoC: wsa881x: use pm_runtime_resume_and_get()
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
 <20220616220427.136036-6-pierre-louis.bossart@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220616220427.136036-6-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 16/06/2022 15:04, Pierre-Louis Bossart wrote:
> simplify the flow. No functionality change, except that on -EACCESS
> the reference count will be decreased.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
Thanks Pierre,

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
>   sound/soc/codecs/wsa881x.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
> index f3a56f3ce4871..dc954b85a9881 100644
> --- a/sound/soc/codecs/wsa881x.c
> +++ b/sound/soc/codecs/wsa881x.c
> @@ -749,11 +749,9 @@ static int wsa881x_put_pa_gain(struct snd_kcontrol *kc,
>   	unsigned int mask = (1 << fls(max)) - 1;
>   	int val, ret, min_gain, max_gain;
>   
> -	ret = pm_runtime_get_sync(comp->dev);
> -	if (ret < 0 && ret != -EACCES) {
> -		pm_runtime_put_noidle(comp->dev);
> +	ret = pm_runtime_resume_and_get(comp->dev);
> +	if (ret < 0 && ret != -EACCES)
>   		return ret;
> -	}
>   
>   	max_gain = (max - ucontrol->value.integer.value[0]) & mask;
>   	/*
