Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 299DD3A0E56
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 10:02:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DE1316E4;
	Wed,  9 Jun 2021 10:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DE1316E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623225740;
	bh=llfHoZOWjotjRSRXnqYdggGKmQTAjFMwPZqBOMP7EH4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hXFTpabwnp5ulqk+AvrJ2r0N92Y9U8G2jffCTHhtZ75UWknMAYgmUdXNb3cAfBVlp
	 hoSNTry50YtC9UqGi5kjH2Yoxgh6l5LFcF61+lwKlrMZX80qPAJrBhAOqzQPNqeDF9
	 a6ZslQ5kLSj4HNuvswLY3j9CbgSDIYTaJNbw1sdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68911F8027C;
	Wed,  9 Jun 2021 10:01:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18D16F802A0; Wed,  9 Jun 2021 10:01:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA546F800F4
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 10:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA546F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="tP29ijPh"
Received: by mail-wr1-x435.google.com with SMTP id m18so24400919wrv.2
 for <alsa-devel@alsa-project.org>; Wed, 09 Jun 2021 01:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LMs7Yy0q9szMs473kW5Dr9pdXQ8OgBWvW7DSmQbHAkI=;
 b=tP29ijPhCAMTLBDh5b493Wf6iLrFZ8oVShO2ksWN1+Qjb7pFMBENvXd4EE7J6DHgcz
 6lDjdW/HjczVIrGi20H9XDahtpwpejG3HcL7PUJO2u/y4uEgVNrBVG9+MlMAx939XpuS
 5aBXrmviF008S3kakssOGQ4BWASHrlpjJ6A8klgFJLALph8AhIrPn/aag0xqOSWPJjJG
 poUt5KhMvpke33gY0JHS2PmbZw9x/ekWB/vxohfZjJ81kSTNmqbffi4tDFTOi77fsBAc
 xwB6iu2R4TdGeAJI3bt8w8/dT5I4jWMyagkxrcfbnifqgYHA2hCpt9jSadQSI08LQ2gi
 MVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LMs7Yy0q9szMs473kW5Dr9pdXQ8OgBWvW7DSmQbHAkI=;
 b=apAjFKKPmuPTa5Ez0guU5w26y7cdmpx/iDXkIJOHe7gIQcf3PxqRZbTdFb0DtDyTMR
 xw1widhH6E+mfF4jAi522hFs9wvh+cG2ayVAZhR7SDcfSiYFF5weY4mkE++PkJnmfQSU
 lMo90Qm3Zn4geuatgMaOusP+F+CHi4lGgIcdCR2Z6m+mknixdJ8c+wCfiKL88JBthfkg
 Sj8ghlN8CiC3UAYklELUget6kVDLkDxRkEuHPl/OcG8hAdySJVSv9x+RcHC3RgxTBtkt
 jAYxag9u2XwSt60y7UzKvfnwbA8xYzmbRf1qT0gr3YKLtNxg6FWyMPqrOHnLAsvwxIiE
 FpqQ==
X-Gm-Message-State: AOAM533wFFuc/fqFIVMXX30xECaIi13XzfSi0eYkIynpR/SiwugYqmI3
 Hb2ZIOoB+6+fIJfsquxe3dEo/g==
X-Google-Smtp-Source: ABdhPJwUjsG5H19gMUYalje04t2uk2PMYjCmA2vZoKVxFpeEOZwmP3Wvr4FF9CIIGPsaRj2ZVmckOQ==
X-Received: by 2002:adf:b648:: with SMTP id i8mr20557139wre.425.1623225661663; 
 Wed, 09 Jun 2021 01:01:01 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id g17sm17851200wrp.61.2021.06.09.01.01.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Jun 2021 01:01:01 -0700 (PDT)
Subject: Re: [PATCH -next] ASoC: codecs: wcd: Remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>, lgirdwood@gmail.com
References: <1623221171-105359-1-git-send-email-yang.lee@linux.alibaba.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8ae5c164-0915-1440-54f3-bd490cd3edfa@linaro.org>
Date: Wed, 9 Jun 2021 09:01:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1623221171-105359-1-git-send-email-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com
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



On 09/06/2021 07:46, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./sound/soc/codecs/wcd-mbhc-v2.c:990:2-3: Unneeded semicolon.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/codecs/wcd-mbhc-v2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
> index dee9410..405128c 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -987,7 +987,7 @@ static void wcd_mbhc_adc_update_fsm_source(struct wcd_mbhc *mbhc,
>   		wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 0);
>   		break;
>   
> -	};
> +	}
>   }
>   
>   static void wcd_mbhc_bcs_enable(struct wcd_mbhc *mbhc, int plug_type, bool enable)
> 
