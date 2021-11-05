Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C7D446130
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 10:12:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACC54167D;
	Fri,  5 Nov 2021 10:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACC54167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636103555;
	bh=XQl5Kag5B/4SW4O7aXBfQcleTPE75MAR5DjHuFprj1s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=clFESCV9sti4d8epp4GFp7k3NxcBVtx24CNmZ8p/O+5WsKDBEiFxfL4U/PPk4Junz
	 DZreSoTRpLRzawbTo/nqDnGAUgubq0esWjciYrj8aOOHy29tjBG89Wrvh4pNa/DqkI
	 h82BvAJRRBJIfQS1+RcV1/JIqVxCpJKZHajurJ6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24EA4F8012A;
	Fri,  5 Nov 2021 10:11:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F22AF8026A; Fri,  5 Nov 2021 10:11:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1A00F80148
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 10:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1A00F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Q3qRdL+n"
Received: by mail-wr1-x435.google.com with SMTP id u18so12630264wrg.5
 for <alsa-devel@alsa-project.org>; Fri, 05 Nov 2021 02:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VNkeQU62dCY789Bl5jyei5Z7Cvsl7VpmBZtGziLEC0s=;
 b=Q3qRdL+n62BjXpnmDLkiDZ6ExmGaaoAu9AdFx7tycXYPMng6WgsX5DM/61K/wPYQ+f
 I1UmfOonFAFtlVtRvAA9NSspGMTJVCmJ4dcVgdYvwU3KOGLMlzi7u0CRVFzYpD70TvW7
 R5MrBpYCnrzxRhNY35icnH2wXWmnrLzG/kajOA1m+NNypJPejlFS6EGiyK2Pf9wR9HUi
 n5QWSDWThuDTlDDyGctQcsuwYuNAkASjrjKFdIKCxKeF6cgFMlSzmiRXNRBZkhe0ZPZ2
 ZRmwIVlhj4kcsMuwmZ4NIs29aHvxGOyefvmy5UwrBb7BqjVQx98oWI5sJ0tQqnevbtRH
 3SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VNkeQU62dCY789Bl5jyei5Z7Cvsl7VpmBZtGziLEC0s=;
 b=Qq2AXKm7HyMjSu4VCYyGFx8zF4OVj73zYL69E4kIjvhMUAgRTgrBViWrDYuS7Drncq
 UWt3mr3s+uLJWDf76RIC9ZMvlvWViw5VOhKqsmy62DCzk+kpdDamxpkMJWnByM/yBsvY
 AKvrjDi/6q7ZosdM6+ghT5gCQPnuz3faTL/+p2CD5oGCuyXPjOrTOWrexqXER5zwnLem
 XJcmSEZqFfQ2+fdmXkl+ZPYR3/mzGoJ75VeV5ZBvVy35rc/z+nrGPxKAqBrsftdk1b4Z
 aDtlcwWox9hGI4BWuRJa81hbOLMz64vgtpgSjboX3zfXL4rUCgatMcP7OjqlLLaSiUXU
 yK/A==
X-Gm-Message-State: AOAM5331s8UlgE1/x8pAkh2fckuv7hxLkJmEFw4MAnu+fB1tJa5i8k26
 ve85Ey9tvBY9FiToOO/dpZ1HVg==
X-Google-Smtp-Source: ABdhPJwovJHtZyhpRSHPfG/+AmGNjDXxw16eSDl9PENlmHdNrJgryJIAMC2FF7g6ta2P2X/quWi9IQ==
X-Received: by 2002:a05:6000:2a2:: with SMTP id
 l2mr38164801wry.110.1636103462587; 
 Fri, 05 Nov 2021 02:11:02 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id f3sm10566819wmb.12.2021.11.05.02.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 02:11:02 -0700 (PDT)
Subject: Re: [PATCH] ASoC: codecs: Axe some dead code in
 'wcd_mbhc_adc_hs_rem_irq()'
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 yang.lee@linux.alibaba.com
References: <57a89cc31eb2312addd3c77896d7df8206aef138.1635967035.git.christophe.jaillet@wanadoo.fr>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <837b3278-ca6d-b013-03f2-e6a681886578@linaro.org>
Date: Fri, 5 Nov 2021 09:11:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <57a89cc31eb2312addd3c77896d7df8206aef138.1635967035.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
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



On 03/11/2021 19:19, Christophe JAILLET wrote:
> 'hphpa_on' is know to be false, so this is just dead code that should be
> removed.
> 
> Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks for the patch,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini


> ---
> This patch is a follow-up of:
> https://lore.kernel.org/kernel-janitors/988948f7f266aa00698704687537335b7e6a67b2.1634455711.git.christophe.jaillet@wanadoo.fr/
> ---
>   sound/soc/codecs/wcd-mbhc-v2.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
> index 405128ccb4b0..b905eb8f3c67 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -1176,7 +1176,6 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
>   	struct wcd_mbhc *mbhc = data;
>   	unsigned long timeout;
>   	int adc_threshold, output_mv, retry = 0;
> -	bool hphpa_on = false;
>   
>   	mutex_lock(&mbhc->lock);
>   	timeout = jiffies + msecs_to_jiffies(WCD_FAKE_REMOVAL_MIN_PERIOD_MS);
> @@ -1210,10 +1209,6 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
>   	wcd_mbhc_elec_hs_report_unplug(mbhc);
>   	wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 0);
>   
> -	if (hphpa_on) {
> -		hphpa_on = false;
> -		wcd_mbhc_write_field(mbhc, WCD_MBHC_HPH_PA_EN, 3);
> -	}
>   exit:
>   	mutex_unlock(&mbhc->lock);
>   	return IRQ_HANDLED;
> 
