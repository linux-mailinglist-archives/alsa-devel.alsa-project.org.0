Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B35451AC0
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 00:40:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 619BB16BD;
	Tue, 16 Nov 2021 00:39:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 619BB16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637019623;
	bh=v1mlWfFHiRA+3iZSckSdPUOhM+AI7Uoc6/CyxUe5EKk=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M4QYm4P3zeettWC0cOC4Kt7X0M+ZRTX2Bx021TecyCMPUWTkGgKgFrnBw1qCn8UaT
	 vxCSyg686ZJAveoff5tWw0XePbjREQ3Js1Asiekmm1xOofvfxi7QcArNd/pNYXMxCv
	 yHWuy99rWHuRhgFRaosYsMmxt7GAlvZzwyMAUlsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32CD1F80537;
	Tue, 16 Nov 2021 00:36:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46013F8028B; Tue, 16 Nov 2021 00:36:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E01CF8027D
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 00:36:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E01CF8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Ld8WMJc6"
Received: by mail-oi1-x22e.google.com with SMTP id m6so38293689oim.2
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 15:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=dWC8K8ncLeoNS//sQPeLcxjUFBd9YRjPbYe+Yaf2cCA=;
 b=Ld8WMJc61fY24i8/fosv3XDha5eYvH4ZtJgZ7Ip/4po3hvifMffK6YpDS4U+K9shX/
 Ye1Fz9V/tCRC8KXDEZBzkYbX/7zV94nOhQtuitRH+0q5aAeldmVgMQDSRhUP/SpssTta
 pPO3Y/bbyq2a6HvAkVdyKc/apDvM2hOQHfGW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=dWC8K8ncLeoNS//sQPeLcxjUFBd9YRjPbYe+Yaf2cCA=;
 b=o0W59omEGHQbJXJaJu7NJM3iAJ5+ClVFEzhmKtwteuL7e2NlGHJnmKZppoqmvXaGC5
 0boYapKr3PBHNrvulKYqyFnUsrzVrCWsUccqz75cDYChQ7J3UVIB8lt8uVTCXtWT5iZf
 wHCVctyBUSDNSD30jgajj8CbDl7dTHMJZwK5ea4loVJXuv8Vt2hQEGsCzlwG84jUgQfl
 +1z3f2tnujTaQlE3tkHpvDIPoXnElYtAkUlquOEHfbdUFCMxMKswJF+tNjsOR+Ir00Am
 mYjnWuetBIgXGBnHwsrvK7UN6zJkWOCTM+/XlRlz0wXkHa42Ra4gwpa0dLOe2U+UE/pG
 TjAw==
X-Gm-Message-State: AOAM5317XXiKsXu5MPHcwIrP9puKi1JXRmk5wL+9iG6XBgwLE2XILEKr
 Dr6EM8XPpPqGFfj9Umm75jFHTn2gP0RfzKl/CirsGg==
X-Google-Smtp-Source: ABdhPJxtAo45rLZbDwdWOiRCk+PyKniWJlEnVa2OYhWCNTMvbYmZhhrueYbKLk8uaACFucgFyIQwJ7Fq+eYCbJsj4Hk=
X-Received: by 2002:aca:2319:: with SMTP id e25mr48820032oie.164.1637019369080; 
 Mon, 15 Nov 2021 15:36:09 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Nov 2021 15:36:08 -0800
MIME-Version: 1.0
In-Reply-To: <1636960288-27537-1-git-send-email-srivasam@codeaurora.org>
References: <1636960288-27537-1-git-send-email-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 15 Nov 2021 15:36:08 -0800
Message-ID: <CAE-0n52n7nscLfqt8-7+UmXdEh2suDNC-ywPRUZL8FdPONbhZQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: codecs: MBHC: Add support for special headset
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
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

Quoting Srinivasa Rao Mandadapu (2021-11-14 23:11:28)
> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
> index 405128c..d6545e4 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -1022,6 +1022,56 @@ static int wcd_mbhc_get_plug_from_adc(struct wcd_mbhc *mbhc, int adc_result)
>         return plug_type;
>  }
>
> +static int wcd_mbhc_get_spl_hs_thres(struct wcd_mbhc *mbhc)
> +{
> +       int hs_threshold, micbias_mv;
> +
> +       micbias_mv = wcd_mbhc_get_micbias(mbhc);
> +       if (mbhc->cfg->hs_thr && mbhc->cfg->micb_mv != WCD_MBHC_ADC_MICBIAS_MV) {
> +               if (mbhc->cfg->micb_mv == micbias_mv)
> +                       hs_threshold = mbhc->cfg->hs_thr;
> +               else
> +                       hs_threshold = (mbhc->cfg->hs_thr * micbias_mv) / mbhc->cfg->micb_mv;
> +       } else {
> +               hs_threshold = ((WCD_MBHC_ADC_HS_THRESHOLD_MV * micbias_mv) /
> +                                                       WCD_MBHC_ADC_MICBIAS_MV);
> +       }
> +       return hs_threshold;
> +}
> +
> +static bool wcd_mbhc_check_for_spl_headset(struct wcd_mbhc *mbhc)
> +{
> +       bool is_spl_hs = false;
> +       int output_mv, hs_threshold, hph_threshold;
> +
> +       if (!mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic)
> +               return false;
> +
> +       /* Bump up MIC_BIAS2 to 2.7V */
> +       mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic(mbhc->component, MIC_BIAS_2, true);
> +       usleep_range(10000, 10100);
> +
> +       output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
> +       hs_threshold = wcd_mbhc_get_spl_hs_thres(mbhc);
> +       hph_threshold = wcd_mbhc_adc_get_hph_thres(mbhc);
> +
> +       if (output_mv > hs_threshold || output_mv < hph_threshold) {
> +               if (mbhc->force_linein == true)

Just 'if (mbhc->force_linein)'

Also, if this is false, then false is set above. So checking for
mbhc->force_linein is useless.

> +                       is_spl_hs = false;
> +       } else {
> +               is_spl_hs = true;
> +       }
> +
> +       /* Back MIC_BIAS2 to 1.8v if the type is not special headset */
> +       if (!is_spl_hs) {
> +               mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic(mbhc->component, MIC_BIAS_2, false);
> +               /* Add 10ms delay for micbias to settle */
> +               usleep_range(10000, 10100);
> +       }
> +
> +       return is_spl_hs;
> +}
> +
>  static void wcd_correct_swch_plug(struct work_struct *work)
>  {
>         struct wcd_mbhc *mbhc;
> @@ -1029,12 +1079,14 @@ static void wcd_correct_swch_plug(struct work_struct *work)
>         enum wcd_mbhc_plug_type plug_type = MBHC_PLUG_TYPE_INVALID;
>         unsigned long timeout;
>         int pt_gnd_mic_swap_cnt = 0;
> -       int output_mv, cross_conn, hs_threshold, try = 0;
> +       int output_mv, cross_conn, hs_threshold, try = 0, micbias_mv;
> +       bool is_spl_hs = false;
>         bool is_pa_on;
>
>         mbhc = container_of(work, struct wcd_mbhc, correct_plug_swch);
>         component = mbhc->component;
>
> +       micbias_mv = wcd_mbhc_get_micbias(mbhc);
>         hs_threshold = wcd_mbhc_adc_get_hs_thres(mbhc);
>
>         /* Mask ADC COMPLETE interrupt */
> @@ -1097,6 +1149,16 @@ static void wcd_correct_swch_plug(struct work_struct *work)
>                 plug_type = wcd_mbhc_get_plug_from_adc(mbhc, output_mv);
>                 is_pa_on = wcd_mbhc_read_field(mbhc, WCD_MBHC_HPH_PA_EN);
>
> +               if ((output_mv > hs_threshold) && (!is_spl_hs)) {

Please drop useless parenthesis

> +                       is_spl_hs = wcd_mbhc_check_for_spl_headset(mbhc);
> +                       output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
> +
> +                       if (is_spl_hs) {
> +                               hs_threshold = (hs_threshold * wcd_mbhc_get_micbias(mbhc)) /
> +                                                                       micbias_mv;

Same. It may be good to split it to two assignments to clarify
overflow/underflow.

> +                       }
> +               }
> +
>                 if ((output_mv <= hs_threshold) && !is_pa_on) {
>                         /* Check for cross connection*/
>                         cross_conn = wcd_check_cross_conn(mbhc);
> @@ -1122,14 +1184,19 @@ static void wcd_correct_swch_plug(struct work_struct *work)
>                         }
>                 }
>
> -               if (output_mv > hs_threshold) /* cable is extension cable */
> +               /* cable is extension cable */
> +               if (output_mv > hs_threshold || mbhc->force_linein == true)

Drop the == true please.

>                         plug_type = MBHC_PLUG_TYPE_HIGH_HPH;
>         }
>
>         wcd_mbhc_bcs_enable(mbhc, plug_type, true);
>
> -       if (plug_type == MBHC_PLUG_TYPE_HIGH_HPH)
> -               wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 1);
> +       if (plug_type == MBHC_PLUG_TYPE_HIGH_HPH) {
> +               if (is_spl_hs)
> +                       plug_type = MBHC_PLUG_TYPE_HEADSET;
> +               else
> +                       wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 1);
> +       }
>
>         wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_MODE, 0);
>         wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 0);
