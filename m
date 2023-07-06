Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BC4749A4B
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 13:11:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25B3A845;
	Thu,  6 Jul 2023 13:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25B3A845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688641871;
	bh=ntcvhvxzrdJ06Ldxm3/nWf+I3kPRAR/h/KLI/B4NeFU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tZYnNZvUU4k1Py8wzy15JKLLwfm+W72n0NySW0fNi+XaRIwmFCXlX7AOQtZ7sD/dH
	 CRTF34bBS1rz5HmDfK/D3lsWROH2p8GQjVJug1ZjkaTyprktMM69YX9weRVpcOLEPS
	 uhFiNEvOb7uvTjqeRQts0HVw4J+Ku2+LwBCVoWXk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A21BFF8056F; Thu,  6 Jul 2023 13:09:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EE37F8055C;
	Thu,  6 Jul 2023 13:09:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FFD2F80563; Thu,  6 Jul 2023 13:09:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7EBCF80125
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 13:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7EBCF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lxONzCc9
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fbef8ad9bbso6129775e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 04:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688641765; x=1691233765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SIj2+V/VP+rgVGq4LUz1e1rdLRL5BqfXPBlJe4PqQsE=;
        b=lxONzCc9GC2outRmWa/EOhxdck5SL78H2jfexfxWjCqrm2QLmknOD5DhCcyMWw6wUD
         I1FlH1MVrEHDXop3j1JN7FY+8aInmf6LKyKXZquDCsf/c7VxrTWKpiwBBBfs6dLriV24
         RJ9h5m480xzKKl5mFj5mNEATU2iAuhY2I6ta0p/lw+izTgBdjhSeBn5s9Lbj4ZoW+3R8
         FLgE6t0QjiwpML+oIckfIipPp2VhZkASCL6lkrO5Z9kMXQ12UXt600YTcGSQ+klrY1vD
         GQVsRVY3eyr4YinuOeR9w3S8kwXfuvHFo7lhUepMq21nJaIS0QTJlWVm0oXxVyaaqKZV
         rx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688641765; x=1691233765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SIj2+V/VP+rgVGq4LUz1e1rdLRL5BqfXPBlJe4PqQsE=;
        b=d43FmBjSCltgQfCLQBdslXAgl3Ne3FsFXFOYU1CXJLBB0zDTWyiEXaX/k95LxfKkGb
         XCTb8LtbGed9w4/Z32KEBlmgfsuv+grppIkuCs7ZrZQr7MeHXcSnG/1OjuVZUB8t5Daf
         SsUmrl6B+Ij7jZ9Pm/MmBOSWnozJ9iU/xA0bEpfzMDNmKNyVJFTwbU7btoucVJfYXSXp
         hqBrEMh40Zo40TL4jGqda3JVOyjMehVoEPsZQmUJNG2v+22VgBZkbLM1s7aQwTkP3EeJ
         YktfRXG2f028F+xPbSFjyy2gBF3+0/KoUaCEJCMexER8dLIZNw+A7zxuUypIL8BaFfWp
         pMAA==
X-Gm-Message-State: ABy/qLbDpzo1HBZPbnhStBmVJ+fLlHSR1paEugLDvICOFcCvmPH8GNwG
	Dgo1fLY4arDPk4Bvo4DvLSG/Pg==
X-Google-Smtp-Source: 
 APBJJlFSGX0LHufU9KQEKqywttxIC7qHfy+cWCgwrlBohKCOWuJl+aRWReGGpm/SpGwpGySf6Sv8bQ==
X-Received: by 2002:a05:600c:2901:b0:3fb:d194:8332 with SMTP id
 i1-20020a05600c290100b003fbd1948332mr1115891wmd.30.1688641765441;
        Thu, 06 Jul 2023 04:09:25 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 l25-20020a7bc459000000b003fbe0da2a06sm1780017wmi.28.2023.07.06.04.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 04:09:24 -0700 (PDT)
Message-ID: <691cdd52-4265-da42-04c1-8a5b533e2f2a@linaro.org>
Date: Thu, 6 Jul 2023 12:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/8] ASoC: codecs: wcd938x: fix resource leaks on
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
 <20230705123018.30903-5-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230705123018.30903-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZAESCM272RJWIB27YCSQEJAHOQUJTLJ6
X-Message-ID-Hash: ZAESCM272RJWIB27YCSQEJAHOQUJTLJ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZAESCM272RJWIB27YCSQEJAHOQUJTLJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 05/07/2023 13:30, Johan Hovold wrote:
> Make sure to release allocated resources on component probe failure and
> on remove.
> 
> This is specifically needed to allow probe deferrals of the sound card
> which otherwise fails when reprobing the codec component:
> 
>      snd-sc8280xp sound: ASoC: failed to instantiate card -517
>      genirq: Flags mismatch irq 289. 00002001 (HPHR PDM WD INT) vs. 00002001 (HPHR PDM WD INT)
>      wcd938x_codec audio-codec: Failed to request HPHR WD interrupt (-16)
>      genirq: Flags mismatch irq 290. 00002001 (HPHL PDM WD INT) vs. 00002001 (HPHL PDM WD INT)
>      wcd938x_codec audio-codec: Failed to request HPHL WD interrupt (-16)
>      genirq: Flags mismatch irq 291. 00002001 (AUX PDM WD INT) vs. 00002001 (AUX PDM WD INT)
>      wcd938x_codec audio-codec: Failed to request Aux WD interrupt (-16)
>      genirq: Flags mismatch irq 292. 00002001 (mbhc sw intr) vs. 00002001 (mbhc sw intr)
>      wcd938x_codec audio-codec: Failed to request mbhc interrupts -16
> 
> Fixes: 8d78602aa87a ("ASoC: codecs: wcd938x: add basic driver")
> Cc: stable@vger.kernel.org	# 5.14
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


>   sound/soc/codecs/wcd938x.c | 55 +++++++++++++++++++++++++++++++++-----
>   1 file changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index 2e342398d027..be38cad5f354 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -2636,6 +2636,14 @@ static int wcd938x_mbhc_init(struct snd_soc_component *component)
>   
>   	return 0;
>   }
> +
> +static void wcd938x_mbhc_deinit(struct snd_soc_component *component)
> +{
> +	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
> +
> +	wcd_mbhc_deinit(wcd938x->wcd_mbhc);
> +}
> +
>   /* END MBHC */
>   
>   static const struct snd_kcontrol_new wcd938x_snd_controls[] = {
> @@ -3131,20 +3139,26 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>   	ret = request_threaded_irq(wcd938x->hphr_pdm_wd_int, NULL, wcd938x_wd_handle_irq,
>   				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>   				   "HPHR PDM WD INT", wcd938x);
> -	if (ret)
> +	if (ret) {
>   		dev_err(dev, "Failed to request HPHR WD interrupt (%d)\n", ret);
> +		goto err_free_clsh_ctrl;
> +	}
>   
>   	ret = request_threaded_irq(wcd938x->hphl_pdm_wd_int, NULL, wcd938x_wd_handle_irq,
>   				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>   				   "HPHL PDM WD INT", wcd938x);
> -	if (ret)
> +	if (ret) {
>   		dev_err(dev, "Failed to request HPHL WD interrupt (%d)\n", ret);
> +		goto err_free_hphr_pdm_wd_int;
> +	}
>   
>   	ret = request_threaded_irq(wcd938x->aux_pdm_wd_int, NULL, wcd938x_wd_handle_irq,
>   				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
>   				   "AUX PDM WD INT", wcd938x);
> -	if (ret)
> +	if (ret) {
>   		dev_err(dev, "Failed to request Aux WD interrupt (%d)\n", ret);
> +		goto err_free_hphl_pdm_wd_int;
> +	}
>   
>   	/* Disable watchdog interrupt for HPH and AUX */
>   	disable_irq_nosync(wcd938x->hphr_pdm_wd_int);
> @@ -3159,7 +3173,7 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>   			dev_err(component->dev,
>   				"%s: Failed to add snd ctrls for variant: %d\n",
>   				__func__, wcd938x->variant);
> -			goto err;
> +			goto err_free_aux_pdm_wd_int;
>   		}
>   		break;
>   	case WCD9385:
> @@ -3169,7 +3183,7 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>   			dev_err(component->dev,
>   				"%s: Failed to add snd ctrls for variant: %d\n",
>   				__func__, wcd938x->variant);
> -			goto err;
> +			goto err_free_aux_pdm_wd_int;
>   		}
>   		break;
>   	default:
> @@ -3177,12 +3191,38 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>   	}
>   
>   	ret = wcd938x_mbhc_init(component);
> -	if (ret)
> +	if (ret) {
>   		dev_err(component->dev,  "mbhc initialization failed\n");
> -err:
> +		goto err_free_aux_pdm_wd_int;
> +	}
> +
> +	return 0;
> +
> +err_free_aux_pdm_wd_int:
> +	free_irq(wcd938x->aux_pdm_wd_int, wcd938x);
> +err_free_hphl_pdm_wd_int:
> +	free_irq(wcd938x->hphl_pdm_wd_int, wcd938x);
> +err_free_hphr_pdm_wd_int:
> +	free_irq(wcd938x->hphr_pdm_wd_int, wcd938x);
> +err_free_clsh_ctrl:
> +	wcd_clsh_ctrl_free(wcd938x->clsh_info);
> +
>   	return ret;
>   }
>   
> +static void wcd938x_soc_codec_remove(struct snd_soc_component *component)
> +{
> +	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
> +
> +	wcd938x_mbhc_deinit(component);
> +
> +	free_irq(wcd938x->aux_pdm_wd_int, wcd938x);
> +	free_irq(wcd938x->hphl_pdm_wd_int, wcd938x);
> +	free_irq(wcd938x->hphr_pdm_wd_int, wcd938x);
> +
> +	wcd_clsh_ctrl_free(wcd938x->clsh_info);
> +}
> +
>   static int wcd938x_codec_set_jack(struct snd_soc_component *comp,
>   				  struct snd_soc_jack *jack, void *data)
>   {
> @@ -3199,6 +3239,7 @@ static int wcd938x_codec_set_jack(struct snd_soc_component *comp,
>   static const struct snd_soc_component_driver soc_codec_dev_wcd938x = {
>   	.name = "wcd938x_codec",
>   	.probe = wcd938x_soc_codec_probe,
> +	.remove = wcd938x_soc_codec_remove,
>   	.controls = wcd938x_snd_controls,
>   	.num_controls = ARRAY_SIZE(wcd938x_snd_controls),
>   	.dapm_widgets = wcd938x_dapm_widgets,
