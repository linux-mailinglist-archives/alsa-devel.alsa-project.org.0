Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F644BE51
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 11:14:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E529165D;
	Wed, 10 Nov 2021 11:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E529165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636539242;
	bh=nUnQCiypE+7R2dDwFQUb8M9APQJgl17zkRbRsLKjt60=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YaqwNvq8wc1qVZhKlPkC6YDkyU4NdoQ/K9xwnyTuDOHQ5QR24eznH3VhJWkHEhhTr
	 sDWjwSxHlznMiWiMLsLlItOYoao0gQr1OnVoYo/rALlum7AUOwe5rSgNY2Iku0K7DY
	 GmO/rlun5qZwo9UVffeCjup51ytC8HQPYz3fVeQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F905F804B1;
	Wed, 10 Nov 2021 11:12:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7953CF8049E; Wed, 10 Nov 2021 11:12:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04973F800C9
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 11:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04973F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uP3euyDD"
Received: by mail-ed1-x52c.google.com with SMTP id m14so8642637edd.0
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 02:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iwrQkGdUPhk+QMSVvZiSAulM37+6icUvxRn7kPKP+hw=;
 b=uP3euyDDsU9oS9V9jaeqz+9kbCdTk2b/bFUScZCBdkhwnGVOlDfYzb9X/NVGZbY5Wl
 dzsUhlwUCbR0xRdiDe5bVaBSGfoOxxxYmuZgoMofeTGxL8EkJWBqm/Y6ZgyZ4y0xzrWQ
 aYoBHmP0/93iceTpdPCoh04IMRytqrdWYPkLs5T/5pPvyCuTAxF3Um+SuZd9l6c8NdBb
 kA4xuXl3TnWRmCEnL9IcJZssNfTE0uACotqi4UmIe0/vkjDwxs9QnLMGRFNssKy+2t8A
 Z8X33Y5Wlam0kkD7Q9H8rHYgCxy5imrrxEbBI5rwbH/8QNA3JIHG8ne0wDSj8igRMWLp
 al1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iwrQkGdUPhk+QMSVvZiSAulM37+6icUvxRn7kPKP+hw=;
 b=qgu8LFkUtrwfXDxk0Lh87lWW/UYW2XrKriRKeicCfAkm2B9mw9qEe/9L8bb5snILZa
 VOIk/klLy0ddMZpcFneUieI7zOunVh8jUiNetimeyXSurbARQo4iulnASxootsmL5MYO
 d0ZcamrnuVD0QTYbH5aPiO91l5WM51sj6TMUZTMyIQGXPaY4g5jPvtfdiVxGkc4+yjJC
 5dIF2GVKOIT4v2Y1ROo4oMUVjuavIJ0jHQ709O6p+a3ToI224nB3FeJU0ptlMfm5XqyR
 PMP40s1pzVbZq0m/6AMXT9kDZPFcza52qWre27mmAaaWu/mpFn/RG1OJF5iWHtbW5xLE
 DgwA==
X-Gm-Message-State: AOAM533NJx+QfGR+watzkWVjcd/uuHUe8CZ5Q1vHh/ZbQHWfHh33hkYt
 fmXCd7gHYD23ZHgSlG2kgwUxwg==
X-Google-Smtp-Source: ABdhPJyFMAADT0iNvQneqnoq3jXcfQ9exfItDCCBzjODGF6El21zfS6VYYeAkF3SXF3XSP6ZcoJNwg==
X-Received: by 2002:a05:6402:42c8:: with SMTP id
 i8mr20478536edc.60.1636539152289; 
 Wed, 10 Nov 2021 02:12:32 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id r19sm12287575edt.54.2021.11.10.02.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 02:12:31 -0800 (PST)
Subject: Re: [PATCH] ASoC: codecs: MBHC: Add support for special headset
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1635938324-17763-1-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8422a82f-5aa7-2458-8080-87f330fa63ea@linaro.org>
Date: Wed, 10 Nov 2021 10:12:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635938324-17763-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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

Thanks for adding this support.

few minor nits,

On 03/11/2021 11:18, Srinivasa Rao Mandadapu wrote:
> Update MBHC driver to support special headset such as apple
> and huwawei headsets.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>   sound/soc/codecs/wcd-mbhc-v2.c | 78 +++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 74 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
> index 405128c..3b4cd39 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -1022,6 +1022,57 @@ static int wcd_mbhc_get_plug_from_adc(struct wcd_mbhc *mbhc, int adc_result)
>   	return plug_type;
>   }
>   
> +static int wcd_mbhc_get_spl_hs_thres(struct wcd_mbhc *mbhc)
> +{
> +	int hs_threshold, micbias_mv;
> +
> +	micbias_mv = wcd_mbhc_get_micbias(mbhc);
> +	if (mbhc->cfg->hs_thr && mbhc->cfg->micb_mv != WCD_MBHC_ADC_MICBIAS_MV) {
> +		if (mbhc->cfg->micb_mv == micbias_mv)
> +			hs_threshold = mbhc->cfg->hs_thr;
> +		else
> +			hs_threshold = (mbhc->cfg->hs_thr * micbias_mv) /
> +								mbhc->cfg->micb_mv;

You should consider using 100 chars per line, so that reading is much easy.

> +	} else {
> +		hs_threshold = ((WCD_MBHC_ADC_HS_THRESHOLD_MV * micbias_mv) /
> +							WCD_MBHC_ADC_MICBIAS_MV);
> +	}
> +	return hs_threshold;
> +}
> +
> +static bool wcd_mbhc_check_for_spl_headset(struct wcd_mbhc *mbhc)
> +{
> +	bool is_spl_hs = false;
> +	int output_mv, hs_threshold, hph_threshold;
> +
> +	if (!mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic)
> +		return false;
> +
> +	/* Bump up MIC_BIAS2 to 2.7V */
> +	mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic(mbhc->component, MIC_BIAS_2, true);
> +	usleep_range(10000, 10100);
> +
> +	output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
> +	hs_threshold = wcd_mbhc_get_spl_hs_thres(mbhc);
> +	hph_threshold = wcd_mbhc_adc_get_hph_thres(mbhc);
> +
> +	if (output_mv > hs_threshold || output_mv < hph_threshold) {
> +		if (mbhc->force_linein == true)
> +			is_spl_hs = false;
> +	} else {
> +		is_spl_hs = true;
> +	}
> +
> +	/* Back MIC_BIAS2 to 1.8v if the type is not special headset */
> +	if (!is_spl_hs) {
> +		mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic(mbhc->component, MIC_BIAS_2, false);
> +		/* Add 10ms delay for micbias to settle */
> +		usleep_range(10000, 10100);
> +	}
> +
> +	return is_spl_hs;
> +}
> +
>   static void wcd_correct_swch_plug(struct work_struct *work)
>   {
>   	struct wcd_mbhc *mbhc;
> @@ -1029,12 +1080,14 @@ static void wcd_correct_swch_plug(struct work_struct *work)
>   	enum wcd_mbhc_plug_type plug_type = MBHC_PLUG_TYPE_INVALID;
>   	unsigned long timeout;
>   	int pt_gnd_mic_swap_cnt = 0;
> -	int output_mv, cross_conn, hs_threshold, try = 0;
> +	int output_mv, cross_conn, hs_threshold, try = 0, micbias_mv;
> +	bool is_spl_hs = false;
>   	bool is_pa_on;
>   
>   	mbhc = container_of(work, struct wcd_mbhc, correct_plug_swch);
>   	component = mbhc->component;
>   
> +	micbias_mv = wcd_mbhc_get_micbias(mbhc);
>   	hs_threshold = wcd_mbhc_adc_get_hs_thres(mbhc);
>   
>   	/* Mask ADC COMPLETE interrupt */
> @@ -1097,6 +1150,18 @@ static void wcd_correct_swch_plug(struct work_struct *work)
>   		plug_type = wcd_mbhc_get_plug_from_adc(mbhc, output_mv);
>   		is_pa_on = wcd_mbhc_read_field(mbhc, WCD_MBHC_HPH_PA_EN);
>   
> +
unnecessary extra new line here.

> +		if ((output_mv > hs_threshold) &&
> +		    (!is_spl_hs)) {
wrap to 100 chars and unneccessary brackets around the conditions.

With those fixed


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

> +			is_spl_hs = wcd_mbhc_check_for_spl_headset(mbhc);
> +			output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
> +
> +			if (is_spl_hs) {
> +				hs_threshold = (hs_threshold * wcd_mbhc_get_micbias(mbhc)) /
> +									micbias_mv; > +			}
> +		}
> +
>   		if ((output_mv <= hs_threshold) && !is_pa_on) {
>   			/* Check for cross connection*/
>   			cross_conn = wcd_check_cross_conn(mbhc);
> @@ -1122,14 +1187,19 @@ static void wcd_correct_swch_plug(struct work_struct *work)
>   			}
>   		}
>   
> -		if (output_mv > hs_threshold) /* cable is extension cable */
> +		/* cable is extension cable */
> +		if (output_mv > hs_threshold || mbhc->force_linein == true)
>   			plug_type = MBHC_PLUG_TYPE_HIGH_HPH;
>   	}
>   
>   	wcd_mbhc_bcs_enable(mbhc, plug_type, true);
>   
> -	if (plug_type == MBHC_PLUG_TYPE_HIGH_HPH)
> -		wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 1);
> +	if (plug_type == MBHC_PLUG_TYPE_HIGH_HPH) {
> +		if (is_spl_hs)
> +			plug_type = MBHC_PLUG_TYPE_HEADSET;
> +		else
> +			wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 1);
> +	}
>   
>   	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_MODE, 0);
>   	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 0);
> 
