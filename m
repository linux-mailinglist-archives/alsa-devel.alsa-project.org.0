Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA86909DFE
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jun 2024 16:57:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86718B6A;
	Sun, 16 Jun 2024 16:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86718B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718549849;
	bh=O/z/vjCG75DIyxaHpKuZpK8HKPbP/ZzO9wdI9VnFK6g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SuVN04p3cztkb+IPjdxcVt5htW7673MTs0rxcUbmqbuK+2PKVylXDqOFdbHcak9iQ
	 wPxJc702MdZoyBbZuctvqU6sjaol8z0uQXnSdVJmh2cN661oOgPDNAlI9YPlpCZEbp
	 SdSCyXFDnHV78lECvev6BidepJKXWTS5O0j/1JSA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65BB7F805BD; Sun, 16 Jun 2024 16:56:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6B80F805AE;
	Sun, 16 Jun 2024 16:56:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3318F8023A; Sun, 16 Jun 2024 16:55:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr
 [80.12.242.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5177F800FA
	for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2024 16:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5177F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=LgQ5zGo4
Received: from [192.168.1.37] ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id IrHWsSO0wuRA3IrHXsfkBD; Sun, 16 Jun 2024 16:55:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718549701;
	bh=OAMsrwU7Q/Q7uwAy9o856/VzFrQmnQenr1H3/1+8Kos=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=LgQ5zGo44dK1XzAx6t987fvlNEHvrWLkZCD71N2kHh41BoEaNCQ/RF8uZVnNXqx0Q
	 tOMHoLsVMCETSBt50K8b4dlgtQpAKKgmKk5BHrXuT0emLD5LkKOw/cjMGyZtDRmAB9
	 oFl1gwQZp58BcoeNruu7JUXLy1zqxMNqmONO5MelfMHVVpq3q/pRv49feBNDqmQjGW
	 fk5QZGCRsBul/9vKSerElZL+zvVflkFJY0hXgXyUW4M6N1Dy0PkM0GXXQFoY5r/RHm
	 KckU7bgYY1+5/5/qz3JqbHRfYE/PK25Bndo1zV6tyoBkqZ5izV4RuliXandilo7Asc
	 fmNADNXO8D7OA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Jun 2024 16:55:01 +0200
X-ME-IP: 86.243.222.230
Message-ID: <2b92c0f9-2595-4b73-8015-1abb825a61a1@wanadoo.fr>
Date: Sun, 16 Jun 2024 16:54:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 quic_pkumpatl@quicinc.com, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240611074557.604250-1-quic_mohs@quicinc.com>
 <20240611074557.604250-4-quic_mohs@quicinc.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240611074557.604250-4-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O5TZBVHLGTY2OVTKOUBTFQ2ZYHADITQE
X-Message-ID-Hash: O5TZBVHLGTY2OVTKOUBTFQ2ZYHADITQE
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O5TZBVHLGTY2OVTKOUBTFQ2ZYHADITQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 11/06/2024 à 09:45, Mohammad Rafi Shaik a écrit :
> From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> 
> This patch adds basic SoundWire codec driver to support for
> WCD9370/WCD9375 TX and RX devices.
> 
> The WCD9370/WCD9375 has Multi Button Headset Control hardware to
> support Headset insertion, type detection, 8 headset buttons detection,
> Over Current detection and Impedence measurements.
> This patch adds support for this using wcd-mbhc apis.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---

Hi,

this pathc has reached -next, but I have a question.

If I'm correct, I can send a patch, but if the fix can be folded 
somewhere, this is also fine for me.

...

> +static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
> +{

...

> +	wcd937x->hphr_pdm_wd_int = regmap_irq_get_virq(wcd937x->irq_chip,
> +						       WCD937X_IRQ_HPHR_PDM_WD_INT);
> +	wcd937x->hphl_pdm_wd_int = regmap_irq_get_virq(wcd937x->irq_chip,
> +						       WCD937X_IRQ_HPHL_PDM_WD_INT);
> +	wcd937x->aux_pdm_wd_int = regmap_irq_get_virq(wcd937x->irq_chip,
> +						      WCD937X_IRQ_AUX_PDM_WD_INT);
> +
> +	/* Request for watchdog interrupt */
> +	ret = devm_request_threaded_irq(dev, wcd937x->hphr_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
> +					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> +					"HPHR PDM WDOG INT", wcd937x);
> +	if (ret)
> +		dev_err(dev, "Failed to request HPHR watchdog interrupt (%d)\n", ret);
> +
> +	ret = devm_request_threaded_irq(dev, wcd937x->hphl_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
> +					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> +					"HPHL PDM WDOG INT", wcd937x);
> +	if (ret)
> +		dev_err(dev, "Failed to request HPHL watchdog interrupt (%d)\n", ret);
> +
> +	ret = devm_request_threaded_irq(dev, wcd937x->aux_pdm_wd_int, NULL, wcd937x_wd_handle_irq,
> +					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> +					"AUX PDM WDOG INT", wcd937x);
> +	if (ret)
> +		dev_err(dev, "Failed to request Aux watchdog interrupt (%d)\n", ret);
> +
> +	/* Disable watchdog interrupt for HPH and AUX */
> +	disable_irq_nosync(wcd937x->hphr_pdm_wd_int);
> +	disable_irq_nosync(wcd937x->hphl_pdm_wd_int);
> +	disable_irq_nosync(wcd937x->aux_pdm_wd_int);
> +
> +	ret = wcd937x_mbhc_init(component);
> +	if (ret)
> +		dev_err(component->dev, "mbhc initialization failed\n");
> +
> +	return ret;
> +}
> +
> +static void wcd937x_soc_codec_remove(struct snd_soc_component *component)
> +{
> +	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
> +
> +	wcd937x_mbhc_deinit(component);
> +	free_irq(wcd937x->aux_pdm_wd_int, wcd937x);
> +	free_irq(wcd937x->hphl_pdm_wd_int, wcd937x);
> +	free_irq(wcd937x->hphr_pdm_wd_int, wcd937x);

These irq have been requested wth devm_request_threaded_irq(), so either 
this free_irq should be removed, or devm_free_irq() should be used if 
the order is important.

CJ

> +
> +	wcd_clsh_ctrl_free(wcd937x->clsh_info);
> +}



