Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 925984FE7C0
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 20:17:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E0518A8;
	Tue, 12 Apr 2022 20:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E0518A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649787431;
	bh=Z+vyaP6A2mSvC//XBPMaDHjI+2Rlpwre5h1sE96rL6w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gjRvvWVet8w92ABoveMNCGPBG1Q/mKRcxeGiIGYOPgZUUvBI1cXLG04ZI5ZIIjJMe
	 b8i+wdQm7ihq2FeSmLOVaqe0t+j1pYb+/n6vbkvBQSfboShbxntBUBDI6uZTkknUsx
	 pucW9AJl3/z6ouV7gUhbCAMrpFkvA3oxR25IG2t8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9042FF80245;
	Tue, 12 Apr 2022 20:16:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E016F80154; Tue, 12 Apr 2022 20:16:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65D7FF8011C
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 20:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65D7FF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YV53AwGd"
Received: by mail-lj1-x236.google.com with SMTP id o16so19235747ljp.3
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 11:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bv3Ii30g4zGcWcAjSR2RS9vcLFQi9OzgY4tPm0Xq2DI=;
 b=YV53AwGdEEVgzCL5YdoQZETViwrr4M+mhHCyloRPNiBVNtmcBfdVBhj5spAJHCr839
 kZtSOC9W7a/ByewNrfCcTZb7cPQIY4MJfbZqA5HJn3kBbDTTg/ZfPvxSEV5MRUpzWrWA
 y460MIcw0ZJMLrcZCMLG5DAnSXUEz/rE/CWFYntEAPmZv4pbd2mkdDNMAUEC7GZACJM7
 8A+SE4CUvYdisEKXHNlUiH3gLBBuHLaDkca47ws/UwwDDwpAzluzQmqP90fO7oUmzewL
 KAF4erB55K5h/Xk2lqIpgdfvfrkrVcmyJPREZMksN5fmHJK8BqlxOU45xTyb/7IXdemY
 Lspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bv3Ii30g4zGcWcAjSR2RS9vcLFQi9OzgY4tPm0Xq2DI=;
 b=Rp5qXiIzs9bucNZRtn4mjChsQwOx0+dDN7ENuEJz4qL3/srWxhzp36RnctX9ThRREi
 0wIsGvAIdPC8CPczRSQDEwkdXr/X+4a5gTipeLBogeIi7wCevQYSLlRwg2vYsBw55BoH
 TkiwwKa1hzDtrk8YuWXJC8+7bnw28SS1BjIPbI3M6fBG/zvC4a1xumWr7YtidLY7668U
 tIdUC0t71EBpTvoXUImNIVlcXh/X3eGO20E09rTaanPex5FBEb75cIG0pLaBvYpstIkA
 frHCHVRytBOxHn6qpwYNycLhPtYHlx1Zud4zqVq0tLuoMSJPHu6dTR0jTEG9hGPoJKKN
 FHeg==
X-Gm-Message-State: AOAM532PrJEursW1WlCY/v2jJqD43M41hW/hGgL2IKs0mswODoThTrtD
 GUfep7NXvVmrt1vrFpjwpmU=
X-Google-Smtp-Source: ABdhPJyCwli3exPbuxaDOZra0Qqr/PAYhgR3s7Rs82OLpmiFF+a50aDqmTJPoBEdwbdy6CyNR84AvQ==
X-Received: by 2002:a2e:a4c8:0:b0:249:7f70:50ad with SMTP id
 p8-20020a2ea4c8000000b002497f7050admr23420518ljm.171.1649787345883; 
 Tue, 12 Apr 2022 11:15:45 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 f17-20020a2e1f11000000b00247f8eb86a7sm3358565ljf.108.2022.04.12.11.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 11:15:45 -0700 (PDT)
Message-ID: <cfae1549-560d-7ac6-bafd-2e55a3ae5c5e@gmail.com>
Date: Tue, 12 Apr 2022 21:16:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] ASoC: ti: osk5912: Make it CCF clk API compatible
Content-Language: en-US
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20220402120106.131118-1-jmkrzyszt@gmail.com>
 <20220407191202.46206-1-jmkrzyszt@gmail.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220407191202.46206-1-jmkrzyszt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>
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



On 07/04/2022 22:12, Janusz Krzysztofik wrote:
> The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
> supported by OMAP1 custom implementation of clock API.  However, non-CCF
> stubs of those functions exist for use on such platforms until converted
> to CCF.
> 
> Update the driver to be compatible with CCF implementation of clock API.
> 
> v2: use clk_prepare_enable/clk_disable_unprepare() (Peter)

Does the changelogn needs to be in the commit message?

I almost missed the V2 as it came as a reply to a thread ;)

Other than the nitpick with the changlog placement:

Looks good but I can not test it,
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
>  sound/soc/ti/osk5912.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
> index 40e29dda7e7a..2790c8915f55 100644
> --- a/sound/soc/ti/osk5912.c
> +++ b/sound/soc/ti/osk5912.c
> @@ -27,12 +27,12 @@ static struct clk *tlv320aic23_mclk;
>  
>  static int osk_startup(struct snd_pcm_substream *substream)
>  {
> -	return clk_enable(tlv320aic23_mclk);
> +	return clk_prepare_enable(tlv320aic23_mclk);
>  }
>  
>  static void osk_shutdown(struct snd_pcm_substream *substream)
>  {
> -	clk_disable(tlv320aic23_mclk);
> +	clk_disable_unprepare(tlv320aic23_mclk);
>  }
>  
>  static int osk_hw_params(struct snd_pcm_substream *substream,

-- 
Péter
