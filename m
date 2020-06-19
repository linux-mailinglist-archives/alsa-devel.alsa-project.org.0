Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 922A520048B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 11:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4073B167D;
	Fri, 19 Jun 2020 11:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4073B167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592557466;
	bh=HXAjTqP5mbERJoNBXsyMut+4Ns6FO1dT9pvJUP0k4aY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kNQR8DbPkaSKvZVmSwuu9NbJu2SAIIBqpPpZIcfXhf1/6b382uDo2cIZ5x+fKm1oy
	 fhYhyFGCtXzEurrPyppa+f+GtLterwHvW6y20RXsCTgM0zXyOa3O9PVm/4VYkHMntf
	 M/4MzUW/khCcVJzI4K3ySAr17DdQ6LsCoHdsG1/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6231DF80255;
	Fri, 19 Jun 2020 11:02:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C85CBF80252; Fri, 19 Jun 2020 11:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21C87F80232
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 11:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21C87F80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="L7oT52IN"
Received: by mail-wr1-x441.google.com with SMTP id l10so8891985wrr.10
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bHC3389Agiw1YGQvJXvHdNrdxAHDGZlLAi2j1YUz3Ag=;
 b=L7oT52INJmfuzrCEKMR1hBDeG0jedYNR2VO9PizxWA+nkG0/ydzobyDwjG3/unZRjx
 ZfiNugZi8GzJa0PQYXr3IuQipPBcQqxZxsphTT6XJ9mOA2EuMBUWpxdCfQx5GlQyIZce
 1eMuxvFrjtEysokvv14hovdv2zQSA/LfUNQkJMx9mGwk3HUW3Iscr9BEntSUMG3VtLuW
 1LrG6X7Hi9kOzQG704YUjZsSdBK6VB8x4HQBGeaWBwmgJERCvvJhnrnosBnU+VLNP1T3
 sUnKQ6iXW7k80THjcn64s9s+rHmnN2CR97Qw7PfXMlnFHQ3nfvZ1I/lRX61qA2cebtgP
 AT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bHC3389Agiw1YGQvJXvHdNrdxAHDGZlLAi2j1YUz3Ag=;
 b=AxdumfA13JcubZ6G8ug6Mmt06ID/6tb+IUr9uhLYfNnLbDYNkpajH560syjsf89RMQ
 w+o2nBjiGgyGd/IVJIZ++a3VC8IyBXRu39BAMqgrt4KOsBLyPwjcppf+lyZD/lXSiKIc
 AlzuejbodvBlK99cjpyQl+bwEc1BzEB0WVXXjlWGxi39jD73bWn2UzqoSVUZ4hT0AGM0
 KLCSfSv6tvnPg3vmYkXjJotTvzepSyzcsC/T63GSewULwe/hjzwByNkaiQaEskBDEEix
 rL1acuo/Ov8+qn3YoSKkG1K8+wFnmO+/SOocMeGr8lXnVWJcjnTMt1eTh7iW9fbOad9/
 gPrQ==
X-Gm-Message-State: AOAM5336xCxHqj3OhKa/VcO0nhu3oRPgr068Hxlt/TIwclykr2b6fFqO
 Za8Ii07DXnAIZFxi3DyDpFBnhgs8hS8=
X-Google-Smtp-Source: ABdhPJzvao0Uhczcik/HaAS9ovCKJDBpVDhnTG4tb5POQnrBuPZa8heBN5Bmo8ETEZIOrhFpT1Ht3w==
X-Received: by 2002:a5d:6283:: with SMTP id k3mr2855792wru.422.1592557354487; 
 Fri, 19 Jun 2020 02:02:34 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id v7sm6586948wrp.45.2020.06.19.02.02.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 02:02:33 -0700 (PDT)
Subject: Re: [PATCH v3] ASoC: qcom: Kconfig: Tweak dependencies on
 SND_SOC_SDM845
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
References: <20200619031407.116140-1-john.stultz@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <803a1a44-0454-8b75-bcac-f06ef5bd89ec@linaro.org>
Date: Fri, 19 Jun 2020 10:02:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200619031407.116140-1-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>
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



On 19/06/2020 04:14, John Stultz wrote:
> CROS_EC isn't strictly required for audio to work
> on other SDM845 platforms (like the Dragonboard 845c).
> 
> So lets remove the dependency and select the related
> CROS_EC options via imply.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Rohit kumar <rohitkr@codeaurora.org>
> Cc: Patrick Lai <plai@codeaurora.org>
> Cc: Banajit Goswami <bgoswami@codeaurora.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> v2: Switch to using imply as suggested by Srinivas
> ---
>   sound/soc/qcom/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index f51b28d1b94d..0ea4cde9f4f0 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -99,12 +99,12 @@ config SND_SOC_MSM8996
>   
>   config SND_SOC_SDM845
>   	tristate "SoC Machine driver for SDM845 boards"
> -	depends on QCOM_APR && CROS_EC && I2C && SOUNDWIRE
> +	depends on QCOM_APR && I2C && SOUNDWIRE
>   	select SND_SOC_QDSP6
>   	select SND_SOC_QCOM_COMMON
>   	select SND_SOC_RT5663
>   	select SND_SOC_MAX98927
> -	select SND_SOC_CROS_EC_CODEC
> +	imply SND_SOC_CROS_EC_CODEC
>   	help
>   	  To add support for audio on Qualcomm Technologies Inc.
>   	  SDM845 SoC-based systems.
> 
