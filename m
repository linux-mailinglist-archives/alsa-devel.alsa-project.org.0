Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6ED39566B
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 09:42:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5691E850;
	Mon, 31 May 2021 09:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5691E850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622446960;
	bh=9sx//Wk0zn1HFbQ+Qm56hFdkym5uh4zl3zovMtojPa4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BH5T7Y6nsVs6HsUHssfOhmTiTtcEalvkso7Io5oCpnIEdK5geB+IMzhpl2ad/V5R2
	 Aap+jc9DcefDz5hLduF0y57ni5xSoNfAiee/R8+M3VVAEk/NjrOaOLdXmMLFVYssIC
	 QUQwqw1b1imDFQKWcYCtp+OtOuoVCpNbE69tSqPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C34AFF80088;
	Mon, 31 May 2021 09:41:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECFF1F80253; Mon, 31 May 2021 09:41:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48D4EF80088
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 09:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48D4EF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EhOYxsis"
Received: by mail-lj1-x22d.google.com with SMTP id o8so13889522ljp.0
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 00:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MARe7ohTXlyio6CLGTaQ2C9DZzSxmfhJlawgXJ1NVHk=;
 b=EhOYxsis2O4mcY62S1NLPyMyc3fapU5jmz5OKjRiUst/kn8lVxmBSPjPW1CzmB+zVZ
 m5Qc/jQPUmRh89CDk5FHKhByWJ0GaVdIKPuM/UM7Fy5VWvTNpKd5kZ/ME2uvY4ikV5Yc
 ebyYcFpDuP/8ujqm4RE9dNkMiBGjlBrR9cP8oZmsq7ZCk/Q3teGbJ47gdJI+lCS5tuZE
 TXd3dbbi6F1i1dDYsv/A+0agl6sKjtiU/yMOnX3LuxYK9tZh4I2XAeiFFc9OCFUM8uXu
 eURTqgruGU991X3YeQXU0HvrjLusRDX/DFF2Ot+bAnX4jPep7TQozniljbGoBybL6T2Y
 RmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MARe7ohTXlyio6CLGTaQ2C9DZzSxmfhJlawgXJ1NVHk=;
 b=b6qBTxwQ5uqzQk1CuNasTMlY/1Yu1te7xEvAEYiA5AYuSUMerUp8mvHF7wMFV7xZK5
 DLUc9SMY191mjWsIoX/Mk1Hant7KuVKlSSXK8QnWMjZ2BKXOmsIaqux+5g8+onBFeQdi
 Ajtpp5vBlf3a/0NU4+4wPJ4XjWwH/1zJ0i31xJ3u6Iwj7tJ88pnAfvkMvxOp/sK9EUxD
 penmcG5GJTQuEf6kEICqWqMpyj5sgyg8DzgEiHFHGlToWSaCGkp/tc06J2h9HBHABPZW
 lbgf2d7Un3+ue8W4mSX91Y0S/tX2dizUWqI/T68Dzv+toR9h/qslcgDWWACXCbcW67Hm
 +X9w==
X-Gm-Message-State: AOAM530MAOMJOfUvYRNaLH/qF9gg3IpShlpQ4d6jrHHvpnjC754G5U33
 umYpS1Ca7Y2y4k7T6jhusX0=
X-Google-Smtp-Source: ABdhPJyo6dPuLMB4LP2n+t1loZCMvzzb6S7YlfpD5yTo1kZT5K6Nj9zV079+PrJKQxoBfbfeKbGDrA==
X-Received: by 2002:a2e:b890:: with SMTP id r16mr15575399ljp.300.1622446865620; 
 Mon, 31 May 2021 00:41:05 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id s9sm542211ljp.62.2021.05.31.00.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 00:41:05 -0700 (PDT)
Subject: Re: [PATCH -next] ASoC: ti: omap-mcbsp: use DEVICE_ATTR_RW macro
To: YueHaibing <yuehaibing@huawei.com>, jarkko.nikula@bitmer.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
References: <20210528063033.19904-1-yuehaibing@huawei.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <144f1781-1c06-8a00-25dc-6f32e1f348be@gmail.com>
Date: Mon, 31 May 2021 10:41:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210528063033.19904-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
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



On 28/05/2021 09:30, YueHaibing wrote:
> Use DEVICE_ATTR_RW() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  sound/soc/ti/omap-mcbsp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index db47981768c5..4479d74f0a45 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -539,7 +539,7 @@ static ssize_t prop##_store(struct device *dev,				\
>  	return size;							\
>  }									\
>  									\
> -static DEVICE_ATTR(prop, 0644, prop##_show, prop##_store)
> +static DEVICE_ATTR_RW(prop)
>  
>  THRESHOLD_PROP_BUILDER(max_tx_thres);
>  THRESHOLD_PROP_BUILDER(max_rx_thres);
> 

-- 
Péter
