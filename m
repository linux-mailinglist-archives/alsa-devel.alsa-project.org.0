Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 108754192B1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 13:02:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8122F168B;
	Mon, 27 Sep 2021 13:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8122F168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632740536;
	bh=Iaf/IR4SFyg/tk/cm26SEoC9bidGQcxlRdgMQcEyO44=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kG11xkId43QhNNsFplMqhfv9W6MOZnAbZkpRITGi9fZfKP+TiDmijSJ5GAPyHtX5e
	 ZV0goJOI1L9N4KKnMuoVMrqUDxJl3XRj0kR66bFE35sq0Fc6XDNzSofAPCjeFUOYvq
	 /4cP6or4vQ0SNI8czOGeqTPKbNlePDvf4iPzFPYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD579F8026D;
	Mon, 27 Sep 2021 13:00:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 720EAF80227; Mon, 27 Sep 2021 13:00:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28345F801EC
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 13:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28345F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NhQBnKK7"
Received: by mail-wm1-x331.google.com with SMTP id v127so113124wme.5
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 04:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XRPjobKyc5ikQATTaoAB7Ef8aUh+iksQjqZVpv1jq0M=;
 b=NhQBnKK7mtJZsLT0zSi+otuLrck7DozDRVmMoSvgzMD93dzVcJOKzGYhZxIjH4Me/7
 0Du+8TL/5Zv7xbbGINbEKEr3BlW2T1WtrKDtIxtHwrCWrT1kTf2fvkY0Lkw5Ix/m7wLD
 qgi7LDb45wt2PtYD7GCfsz2zurrBUaZRZnv7e74kb/1JkfaST+mzzlaFg9qNniw/NEg3
 uo3VJkpdIImegi8yjsYhVZbQ+dlKIUEH0N1PclJgtSxmKM3IS3DjqGmB8gHutPGAPfoP
 n+mmVrXB5N6PXNTlSz1wjhNfKwdx/7GK1+CvLRehLUY0ETXlI16Ufwcl5Rs+GX+f1b7F
 FtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XRPjobKyc5ikQATTaoAB7Ef8aUh+iksQjqZVpv1jq0M=;
 b=J7S/pRJky7dIP8ukb4PXdhV6HdqmgvVR/lac+F+/cyRKQBCggoWL3uvBURX4dP2Zqc
 LhxPsEVhkJJArPJC8I34fQ9yIV2Bj2vCeL7DGUV/WB12xJz0OHByWceKxjUvBxj7zUdG
 sgZFLMH/ghOg78eGCMIeNUXhLz2tX1o5UL6XxsMP1DsQT6DE0Gn2W8p0B6fo2kkW7cS5
 5Nz/yyNzqZfkEnuFjaQTr/Fj6WPsH+RpoPM/uALkWSiIsSpDUYRkGi88gjD0ZBo1D7bN
 fai1LmiKqkw96adX9WjkRJI/XNSavg/hNfX7pjI9LQlQb491DiV/PmcSfPKLnZiVb1oQ
 IOdg==
X-Gm-Message-State: AOAM531R+sWdL8xB00TTy+OH5A1zke8qHaKc8vjzO048ehsMgpKxnVpm
 0duhDxmiRZYRBWhMpNZOfv5YEA==
X-Google-Smtp-Source: ABdhPJxdLf3oTwzJd3Le+/Za8FBBJicKwqsOBTFqoxg/0i9px3fsuAJIV0kgo6XJ5xIUB6tdqPE/4A==
X-Received: by 2002:a05:600c:aca:: with SMTP id
 c10mr15023179wmr.174.1632740447259; 
 Mon, 27 Sep 2021 04:00:47 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id j14sm16114810wrp.21.2021.09.27.04.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 04:00:46 -0700 (PDT)
Subject: Re: [PATCH] ASoC: wcd9335: Use correct version to initialize Class H
To: Yassine Oudjana <y.oudjana@protonmail.com>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20210925022339.786296-1-y.oudjana@protonmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <43d70ca3-bd14-c83a-12df-8cd64056256a@linaro.org>
Date: Mon, 27 Sep 2021 12:00:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210925022339.786296-1-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 25/09/2021 03:24, Yassine Oudjana wrote:
> The versioning scheme was changed in an earlier patch, which caused the version
> being used to initialize WCD9335 to be interpreted as if it was WCD937X, which
> changed code paths causing broken headphones output. Pass WCD9335 instead of
> WCD9335_VERSION_2_0 to wcd_clsh_ctrl_alloc to fix it.
> 
> Fixes: 19c5d1f6a0c3 ("ASoC: codecs: wcd-clsh: add new version support")
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---

Thanks for the fix,

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini


>   sound/soc/codecs/wcd9335.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> index d885ced34f60..bc5d68c53e5a 100644
> --- a/sound/soc/codecs/wcd9335.c
> +++ b/sound/soc/codecs/wcd9335.c
> @@ -4859,7 +4859,7 @@ static int wcd9335_codec_probe(struct snd_soc_component *component)
>   
>   	snd_soc_component_init_regmap(component, wcd->regmap);
>   	/* Class-H Init*/
> -	wcd->clsh_ctrl = wcd_clsh_ctrl_alloc(component, wcd->version);
> +	wcd->clsh_ctrl = wcd_clsh_ctrl_alloc(component, WCD9335);
>   	if (IS_ERR(wcd->clsh_ctrl))
>   		return PTR_ERR(wcd->clsh_ctrl);
>   
> 
