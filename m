Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9943F909E13
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jun 2024 17:07:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA6E9836;
	Sun, 16 Jun 2024 17:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA6E9836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718550420;
	bh=MeP63kUoIGOhp+KS92FhAfCnit5QJFnb0n3OM4QPJPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XQxGNOpobY0qF8mhWhTcQuv1xCSzF1eJOcnxqTXWVbKAiFYqlG6sAzRdw7Ox+HIkQ
	 6PmzV7o0TdRNKdbxouMEra3k1cniEGPFHwFax87jybQ7LCQZ1KYwhLM8eHJddvaBq7
	 DhUd+c6U4biH66MVmyn+DvUhUXhQpOuTuaGZVaNU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A012AF8059F; Sun, 16 Jun 2024 17:06:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CB4AF8023A;
	Sun, 16 Jun 2024 17:06:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28F67F8023A; Sun, 16 Jun 2024 17:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr
 [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5896F80154
	for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2024 17:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5896F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=pqUJPRmq
Received: from [192.168.1.37] ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id IrSUsCOuW4rg1IrSUs1Sr1; Sun, 16 Jun 2024 17:06:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718550380;
	bh=ujR6qI66k3vQEhgvlbkTIaG+4S4k/x11/VEOuKw3pkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=pqUJPRmqiowTw3TYYioi9HHW3BS2VQuywKo8nfRiglMFqshCwso3qbgpqRg+INspt
	 ALq25NbbSfAQJIP9Sc8h2IDHuWDfgS+/KJMbKT1z9UIXjD+nKg73j7FuTyxoolcvk7
	 DzshJdyXTgWzb2sbbl/G+kxzLxSznuo1saqXxs61oVL0u3MVjbei4unCtfm5syQ5NW
	 fHw/Al0dJur2vgVgeYjRKq5b7XQoPYlU3hHVE7qoF1G4GYMk24o73VRKSe28NV5ri6
	 ZdeF/n9TEcdn+MXSQ1pf1QuYbxaz1GVMqywT4geO1np/NopaF3vk7xHFa7O9ZpbGfk
	 srXGgwjer0yPw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Jun 2024 17:06:20 +0200
X-ME-IP: 86.243.222.230
Message-ID: <834d31cc-f4bc-4db7-a25b-f9869e550eb6@wanadoo.fr>
Date: Sun, 16 Jun 2024 17:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver -
 another comment
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
Message-ID-Hash: USRQS7UGJF2BARQCHDRRK4Y5LCJ7HWL5
X-Message-ID-Hash: USRQS7UGJF2BARQCHDRRK4Y5LCJ7HWL5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/USRQS7UGJF2BARQCHDRRK4Y5LCJ7HWL5/>
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

this patch has reached -next, but I have a question.

If I'm correct, I can send a patch, but if the fix can be folded 
somewhere, this is also fine for me.

...

> +static int wcd937x_probe(struct platform_device *pdev)
> +{
> +	struct component_match *match = NULL;
> +	struct device *dev = &pdev->dev;
> +	struct wcd937x_priv *wcd937x;
> +	struct wcd_mbhc_config *cfg;
> +	int ret;
> +
> +	wcd937x = devm_kzalloc(dev, sizeof(*wcd937x), GFP_KERNEL);
> +	if (!wcd937x)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, wcd937x);
> +	mutex_init(&wcd937x->micb_lock);
> +
> +	wcd937x->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(wcd937x->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(wcd937x->reset_gpio),
> +				     "failed to reset wcd gpio\n");
> +
> +	wcd937x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
> +	if (IS_ERR(wcd937x->us_euro_gpio))
> +		return dev_err_probe(dev, PTR_ERR(wcd937x->us_euro_gpio),
> +				"us-euro swap Control GPIO not found\n");
> +
> +	cfg = &wcd937x->mbhc_cfg;
> +	cfg->swap_gnd_mic = wcd937x_swap_gnd_mic;
> +
> +	wcd937x->supplies[0].supply = "vdd-rxtx";
> +	wcd937x->supplies[1].supply = "vdd-px";
> +	wcd937x->supplies[2].supply = "vdd-mic-bias";
> +
> +	ret = devm_regulator_bulk_get(dev, WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get supplies\n");
> +
> +	ret = regulator_bulk_enable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
> +
> +	/* Get the buck separately, as it needs special handling */
> +	wcd937x->buck_supply = devm_regulator_get(dev, "vdd-buck");
> +	if (IS_ERR(wcd937x->buck_supply))

regulator_bulk_disable() is missing here...

> +		return dev_err_probe(dev, PTR_ERR(wcd937x->buck_supply),
> +				     "Failed to get buck supply\n");
> +
> +	ret = regulator_enable(wcd937x->buck_supply);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable buck supply\n");

... and here...

Also, should 'buck_supply' be disabled in the error handling path of the 
probe and in the remove function? (and maybe even somewhere else related 
to wcd937x_codec_enable_vdd_buck())

> +
> +	wcd937x_dt_parse_micbias_info(dev, wcd937x);
> +
> +	cfg->mbhc_micbias = MIC_BIAS_2;
> +	cfg->anc_micbias = MIC_BIAS_2;
> +	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
> +	cfg->num_btn = WCD937X_MBHC_MAX_BUTTONS;
> +	cfg->micb_mv = wcd937x->micb2_mv;
> +	cfg->linein_th = 5000;
> +	cfg->hs_thr = 1700;
> +	cfg->hph_thr = 50;
> +
> +	wcd_dt_parse_mbhc_data(dev, &wcd937x->mbhc_cfg);
> +
> +	ret = wcd937x_add_slave_components(wcd937x, dev, &match);
> +	if (ret)
> +		return ret;

... and here...

> +
> +	wcd937x_reset(wcd937x);
> +
> +	ret = component_master_add_with_match(dev, &wcd937x_comp_ops, match);
> +	if (ret)
> +		return ret;

... and here.

Maybe a devm_add_action_ior_reset() could help?

> +
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	return ret;
> +}
> +
> +static void wcd937x_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct wcd937x_priv *wcd937x = dev_get_drvdata(dev);
> +
> +	component_master_del(&pdev->dev, &wcd937x_comp_ops);
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +
> +	regulator_bulk_disable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
> +	regulator_bulk_free(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);

This has been allocated with devm_regulator_bulk_get(), so this call 
looks redundant (but harmless).

> +}

...

