Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEC9749A4F
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 13:11:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF52E3E7;
	Thu,  6 Jul 2023 13:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF52E3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688641911;
	bh=K+weYi91HbGNvk3xMY3+kNA2BubtjK5st3Sr7TcGV6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fsebVnbAJ9vjG+YgH9NVTYuiF68THOIsPq1ZkaXvVtTgYBFriydh/a//rOtMewg3j
	 ojV1/ZybRggCYt1q5in/N0k6XiDoW5MO/1v4iEIAAaKh+VoQMWA1+lHsaVC7ETsYwR
	 pElgjuXsojnUvUuUnBPG6hCXhg7SZHoWT2H1GSOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5C51F805A1; Thu,  6 Jul 2023 13:09:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9196BF8058C;
	Thu,  6 Jul 2023 13:09:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53516F805A1; Thu,  6 Jul 2023 13:09:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D3A8F8057B
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 13:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D3A8F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wCQyNj8k
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fbbfaacfc1so735880e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 04:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688641789; x=1691233789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRiuKcFF4D+Ma/+WP7HwqWtEf6Dd+kBdcV9nMz+Xal8=;
        b=wCQyNj8kDh/OsyddAN39TNa2jnM2R2His5q/FBgPX+0PzMpAkseWY4CyUHa2Jj5QJ+
         m2BQ3dZamSYppisNMU1d0hbm7bc1ddRHVRiH1XGod9MWd4AmceZfDWO7BxpVYPvV0SIP
         iFDUok5hM3iHd/fSo5yflzUdEkyJNKi+BAk+K9/p6qrQPtSh5rAcjQYpZ8rhE/r7traN
         Jse3mJXIdUVWx1j0IXkDwN0sEjOIyikCHwjYZDHxh9B7749PS66Nfq6f/W0pPSXENgqX
         A1LOSY9WZyRv8wlCMGJ09lMkNry9HWhS5JMV0ceppDabZTWiJ2lh+hRYEqDxREgrwh5y
         W7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688641789; x=1691233789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRiuKcFF4D+Ma/+WP7HwqWtEf6Dd+kBdcV9nMz+Xal8=;
        b=ev8p9BiKJXsJsMr50CFyWHmgXpLm+YV/NmF1Hv6iGwsJ6iDDYy+2uxQuMxPirQ72mp
         7GLUGfu9iyovVxwC94aGFm/2rmfQlQ1kn3dWoQIGr8ddcf7ASAlkxFr+i3PVWvF3xt5P
         LnGirmh2LGRE2KTiLl712tx3dxPyqYe5aCrEcS/23O3MNEkLWY90Fd9kyou4mJh6HPuh
         4MQRwv5Ftj2VNONixJhczI56XKK+NJ9Te7dLa9bnJpQT3KPiFiPZwzzdXg4Hdkbp7Gu4
         PavGQbdaR3bJemZCZGGrF37AjLjpUdK/xmhXX6wzL3kgSxO8a3KhINSwy510MQlwAUcE
         ZAHg==
X-Gm-Message-State: ABy/qLYzlbW5DeJeXSk05Gff6q74nkGnybIerTfU++0Fe+HGZdgIoeIU
	t6Ezi0V+z2pR57/SANybvqV6vA==
X-Google-Smtp-Source: 
 APBJJlFr0goL3O6OGKwREZsKNTnsILJbcu1yBKhHSIpf/ySaPhU/h5xY6c9b0kLkZyP65pD6yUsZTg==
X-Received: by 2002:ac2:4438:0:b0:4f8:7568:e94b with SMTP id
 w24-20020ac24438000000b004f87568e94bmr1128208lfl.56.1688641788898;
        Thu, 06 Jul 2023 04:09:48 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 o18-20020a05600c379200b003fbe561f6a3sm4763165wmr.37.2023.07.06.04.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 04:09:48 -0700 (PDT)
Message-ID: <31bcbd57-1087-e8a4-6061-0fb89a82aec5@linaro.org>
Date: Thu, 6 Jul 2023 12:09:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/8] ASoC: codecs: wcd-mbhc-v2: fix resource leaks on
 component remove
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20230705123018.30903-1-johan+linaro@kernel.org>
 <20230705123018.30903-7-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230705123018.30903-7-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KELGR5QE6HXQRBL26NAFGNXZ2IG6NCW5
X-Message-ID-Hash: KELGR5QE6HXQRBL26NAFGNXZ2IG6NCW5
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KELGR5QE6HXQRBL26NAFGNXZ2IG6NCW5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 05/07/2023 13:30, Johan Hovold wrote:
> The MBHC resources must be released on component probe failure and
> removal so can not be tied to the lifetime of the component device.
> 
> This is specifically needed to allow probe deferrals of the sound card
> which otherwise fails when reprobing the codec component:
> 
>      snd-sc8280xp sound: ASoC: failed to instantiate card -517
>      genirq: Flags mismatch irq 299. 00002001 (mbhc sw intr) vs. 00002001 (mbhc sw intr)
>      wcd938x_codec audio-codec: Failed to request mbhc interrupts -16
>      wcd938x_codec audio-codec: mbhc initialization failed
>      wcd938x_codec audio-codec: ASoC: error at snd_soc_component_probe on audio-codec: -16
>      snd-sc8280xp sound: ASoC: failed to instantiate card -16
> 
> Fixes: 0e5c9e7ff899 ("ASoC: codecs: wcd: add multi button Headset detection support")
> Cc: stable@vger.kernel.org      # 5.14
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
>   sound/soc/codecs/wcd-mbhc-v2.c | 57 ++++++++++++++++++++++++----------
>   1 file changed, 41 insertions(+), 16 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
> index 1911750f7445..5da1934527f3 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -1454,7 +1454,7 @@ struct wcd_mbhc *wcd_mbhc_init(struct snd_soc_component *component,
>   		return ERR_PTR(-EINVAL);
>   	}
>   
> -	mbhc = devm_kzalloc(dev, sizeof(*mbhc), GFP_KERNEL);
> +	mbhc = kzalloc(sizeof(*mbhc), GFP_KERNEL);
>   	if (!mbhc)
>   		return ERR_PTR(-ENOMEM);
>   
> @@ -1474,61 +1474,76 @@ struct wcd_mbhc *wcd_mbhc_init(struct snd_soc_component *component,
>   
>   	INIT_WORK(&mbhc->correct_plug_swch, wcd_correct_swch_plug);
>   
> -	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->mbhc_sw_intr, NULL,
> +	ret = request_threaded_irq(mbhc->intr_ids->mbhc_sw_intr, NULL,
>   					wcd_mbhc_mech_plug_detect_irq,
>   					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>   					"mbhc sw intr", mbhc);
>   	if (ret)
> -		goto err;
> +		goto err_free_mbhc;
>   
> -	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->mbhc_btn_press_intr, NULL,
> +	ret = request_threaded_irq(mbhc->intr_ids->mbhc_btn_press_intr, NULL,
>   					wcd_mbhc_btn_press_handler,
>   					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>   					"Button Press detect", mbhc);
>   	if (ret)
> -		goto err;
> +		goto err_free_sw_intr;
>   
> -	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->mbhc_btn_release_intr, NULL,
> +	ret = request_threaded_irq(mbhc->intr_ids->mbhc_btn_release_intr, NULL,
>   					wcd_mbhc_btn_release_handler,
>   					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>   					"Button Release detect", mbhc);
>   	if (ret)
> -		goto err;
> +		goto err_free_btn_press_intr;
>   
> -	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->mbhc_hs_ins_intr, NULL,
> +	ret = request_threaded_irq(mbhc->intr_ids->mbhc_hs_ins_intr, NULL,
>   					wcd_mbhc_adc_hs_ins_irq,
>   					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>   					"Elect Insert", mbhc);
>   	if (ret)
> -		goto err;
> +		goto err_free_btn_release_intr;
>   
>   	disable_irq_nosync(mbhc->intr_ids->mbhc_hs_ins_intr);
>   
> -	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->mbhc_hs_rem_intr, NULL,
> +	ret = request_threaded_irq(mbhc->intr_ids->mbhc_hs_rem_intr, NULL,
>   					wcd_mbhc_adc_hs_rem_irq,
>   					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>   					"Elect Remove", mbhc);
>   	if (ret)
> -		goto err;
> +		goto err_free_hs_ins_intr;
>   
>   	disable_irq_nosync(mbhc->intr_ids->mbhc_hs_rem_intr);
>   
> -	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->hph_left_ocp, NULL,
> +	ret = request_threaded_irq(mbhc->intr_ids->hph_left_ocp, NULL,
>   					wcd_mbhc_hphl_ocp_irq,
>   					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>   					"HPH_L OCP detect", mbhc);
>   	if (ret)
> -		goto err;
> +		goto err_free_hs_rem_intr;
>   
> -	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->hph_right_ocp, NULL,
> +	ret = request_threaded_irq(mbhc->intr_ids->hph_right_ocp, NULL,
>   					wcd_mbhc_hphr_ocp_irq,
>   					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>   					"HPH_R OCP detect", mbhc);
>   	if (ret)
> -		goto err;
> +		goto err_free_hph_left_ocp;
>   
>   	return mbhc;
> -err:
> +
> +err_free_hph_left_ocp:
> +	free_irq(mbhc->intr_ids->hph_left_ocp, mbhc);
> +err_free_hs_rem_intr:
> +	free_irq(mbhc->intr_ids->mbhc_hs_rem_intr, mbhc);
> +err_free_hs_ins_intr:
> +	free_irq(mbhc->intr_ids->mbhc_hs_ins_intr, mbhc);
> +err_free_btn_release_intr:
> +	free_irq(mbhc->intr_ids->mbhc_btn_release_intr, mbhc);
> +err_free_btn_press_intr:
> +	free_irq(mbhc->intr_ids->mbhc_btn_press_intr, mbhc);
> +err_free_sw_intr:
> +	free_irq(mbhc->intr_ids->mbhc_sw_intr, mbhc);
> +err_free_mbhc:
> +	kfree(mbhc);
> +
>   	dev_err(dev, "Failed to request mbhc interrupts %d\n", ret);
>   
>   	return ERR_PTR(ret);
> @@ -1537,9 +1552,19 @@ EXPORT_SYMBOL(wcd_mbhc_init);
>   
>   void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
>   {
> +	free_irq(mbhc->intr_ids->hph_right_ocp, mbhc);
> +	free_irq(mbhc->intr_ids->hph_left_ocp, mbhc);
> +	free_irq(mbhc->intr_ids->mbhc_hs_rem_intr, mbhc);
> +	free_irq(mbhc->intr_ids->mbhc_hs_ins_intr, mbhc);
> +	free_irq(mbhc->intr_ids->mbhc_btn_release_intr, mbhc);
> +	free_irq(mbhc->intr_ids->mbhc_btn_press_intr, mbhc);
> +	free_irq(mbhc->intr_ids->mbhc_sw_intr, mbhc);
> +
>   	mutex_lock(&mbhc->lock);
>   	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
>   	mutex_unlock(&mbhc->lock);
> +
> +	kfree(mbhc);
>   }
>   EXPORT_SYMBOL(wcd_mbhc_deinit);
>   
