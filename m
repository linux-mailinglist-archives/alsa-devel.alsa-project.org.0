Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BCC69E872
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 20:40:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ACAEEA7;
	Tue, 21 Feb 2023 20:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ACAEEA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677008408;
	bh=3NvczRnTBGe3ceFA3Jzh4iM1n76InmvI0KFbUwNGzUw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LqZBm0Y/mmQEbFpJP51HtwQZhTcOI6H5X1O0fi7nkO4HGL2h94/kltl4djqZqvfMS
	 EdUQ42aXn40KoCY03s4eD8wiNUSz1i9V+GY26NG9hy5VPtDLb9gDsuNLcpoA29UQgG
	 x/RxhFJ+JPC2ktIn45QCTWQ6F3SQ2cjNUqfqNZaQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0B3AF8025A;
	Tue, 21 Feb 2023 20:39:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C1D1F80266; Tue, 21 Feb 2023 20:39:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB9F0F800B6
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 20:39:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB9F0F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RhuORwFU
Received: by mail-wr1-x42b.google.com with SMTP id l1so5363910wry.10
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 11:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gEmwPFIQot2qDs+RW9A8Pn7ziBUNXIBkfPkKLs2AKrw=;
        b=RhuORwFULuibFKIvtWAFtiCYPBFD7lkDjRV999aQCFlmIM94QG8QVEieuK6HziL36m
         TQLQYBGcPa4Q4/S1njKGzn8tk6hKPUmVKiPGx1E0j2twTrFkl7gh7vq4VjTdCrX4otqu
         CJSbD2KFGEug9/L9wWqdnA3uatgVVhWOnylkm9XWiA2hpELeVTtdudz9IkYzvubuyWCm
         cG3rscLhzPTnRFKuznVCRMzq/3L5HEFellEl6EdwkuH3tdnKJ6TQvwMuXZEYpl3j1XBZ
         hTLxvFu+4lxQfT8d6jamtmg4ZIJY/jA9Kmgqqsca7UvvLsuWa31/iG+BeTd+AyJ3AQ1R
         mYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEmwPFIQot2qDs+RW9A8Pn7ziBUNXIBkfPkKLs2AKrw=;
        b=pKXIsS4d4IHguTbwwnS3ytbnFQkDyp5ge5hAjKo5baidZex92dXLZVT0dPEwE2Y9IW
         uw1KgvaLUG1SQn7MCCBtW4qTBeqHCSIPxjdK3nKwNGIqMemw6EucO6t2nOxReiCeRvkN
         HmGSGhH1Cf8V1L9Y9bnmKZReY7uU0ciqaZGkZDDjR2XAFro0Xan0b1t6yL+7YESU/T8m
         aR04isozSZojNDQ3AZJ8GBKyZ74vYkNqLR9QElB1w/pVDRF1N/ec2VXRorCefR4JWxlW
         dpBSV3ds5GMPMMADt8cllhBWLZlpOvBT87WIo2irt4llkpqC20gLc+SZZkaQTxiSHs72
         Bvcw==
X-Gm-Message-State: AO0yUKX40+NfqPV3kt/LOm0N7gJYxr3ena8jDIyINDkkSr8vdtArK6ME
	wtd35l1LnR2b1bXL0LAlgPY=
X-Google-Smtp-Source: 
 AK7set8MZVhmD5Hw1W2pxlgQWVAPYLn8N3NynNc7gUQSaxrmYg20IYsUAtutcCUJe9O8ov6SlNJbUA==
X-Received: by 2002:a5d:4208:0:b0:2c3:db4f:f336 with SMTP id
 n8-20020a5d4208000000b002c3db4ff336mr5482843wrq.39.1677008345700;
        Tue, 21 Feb 2023 11:39:05 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 d18-20020a5d6452000000b002c54f4d0f71sm6688939wrw.38.2023.02.21.11.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:39:05 -0800 (PST)
Date: Tue, 21 Feb 2023 22:39:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
Message-ID: <Y/Ud1bn+LExxLb/Q@kadam>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-10-clamor95@gmail.com>
Message-ID-Hash: GMEN6ZEIVAU4VDFZACDLXXSH5QGN35QY
X-Message-ID-Hash: GMEN6ZEIVAU4VDFZACDLXXSH5QGN35QY
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMEN6ZEIVAU4VDFZACDLXXSH5QGN35QY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> +static int fm34ne_dsp_set_config(struct fm34ne_dsp_data *fm34, int state)
> +{
> +	struct device *dev = &fm34->client->dev;
> +
> +	const u8 *enable_ns_parameter = fm34->data->enable_noise_suppression;
> +	int enable_ns_length = fm34->data->enable_ns_length;
> +
> +	const u8 *disable_ns_parameter = fm34->data->disable_noise_suppression;
> +	int disable_ns_length = fm34->data->disable_ns_length;
> +
> +	int ret;
> +
> +	gpiod_set_value_cansleep(fm34->bypass_gpio, 1);
> +	msleep(20);
> +
> +	switch (state) {
> +	case FM34NE_NS_ENABLE:
> +		ret = fm34ne_dsp_write_config(fm34->client, enable_parameter,
> +					      sizeof(enable_parameter));
> +		if (ret < 0) {
> +			dev_err(dev, "failed to set DSP enable with %d\n", ret);
> +			goto exit;
> +		}
> +
> +		ret = fm34ne_dsp_write_config(fm34->client, enable_ns_parameter,
> +					      enable_ns_length);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to enable DSP noise suppression with %d\n", ret);
> +			goto exit;
> +		}
> +
> +		dev_info(dev, "noise suppression enable DSP parameter written\n");

Delete this type of debug code.

> +		break;
> +
> +	case FM34NE_NS_DISABLE:
> +		ret = fm34ne_dsp_write_config(fm34->client, enable_parameter,
> +					      sizeof(enable_parameter));
> +		if (ret < 0) {
> +			dev_err(dev, "failed to set DSP enable with %d\n", ret);
> +			goto exit;
> +		}
> +
> +		ret = fm34ne_dsp_write_config(fm34->client, disable_ns_parameter,
> +					      disable_ns_length);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to disable DSP noise suppression with %d\n", ret);
> +			goto exit;
> +		}
> +
> +		dev_info(dev, "noise suppression disable DSP parameter written\n");

Same etc.

> +		break;
> +
> +	case FM34NE_BYPASS:
> +	default:
> +		ret = fm34ne_dsp_write_config(fm34->client, bypass_parameter,
> +					      sizeof(bypass_parameter));
> +		if (ret < 0) {
> +			dev_err(dev, "failed to set DSP bypass with %d\n", ret);
> +			goto exit;
> +		}
> +
> +		dev_info(dev, "bypass DSP parameter written\n");
> +		break;
> +	}
> +
> +exit:
> +	gpiod_set_value_cansleep(fm34->bypass_gpio, 0);
> +
> +	return ret;
> +}
> +
> +static int fm34ne_dsp_set_hw(struct fm34ne_dsp_data *fm34)
> +{
> +	struct device *dev = &fm34->client->dev;
> +	int ret;
> +
> +	ret = clk_prepare_enable(fm34->dap_mclk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable the DSP MCLK: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_enable(fm34->vdd_supply);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable vdd power supply\n");

clk_disable_unprepare(fm34->dap_mclk);

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void fm34ne_dsp_reset(struct fm34ne_dsp_data *fm34)
> +{
> +	gpiod_set_value_cansleep(fm34->reset_gpio, 1);
> +	msleep(20);
> +
> +	gpiod_set_value_cansleep(fm34->reset_gpio, 0);
> +	msleep(100);
> +}
> +
> +static int fm34ne_dsp_init_chip(struct fm34ne_dsp_data *fm34)
> +{
> +	const u8 *input_parameter = fm34->data->input_parameter;
> +	int input_parameter_length = fm34->data->input_parameter_length;
> +	int ret;
> +
> +	ret = fm34ne_dsp_set_hw(fm34);
> +	if (ret)
> +		return ret;
> +
> +	fm34ne_dsp_reset(fm34);
> +
> +	gpiod_set_value_cansleep(fm34->bypass_gpio, 1);
> +	msleep(20);
> +
> +	ret = i2c_smbus_write_byte(fm34->client, FM34NE_I2C_CHECK);
> +	if (ret < 0) {
> +		dev_info(&fm34->client->dev, "initial write failed\n");

dev_warn()?

> +		msleep(50);
> +
> +		fm34ne_dsp_reset(fm34);
> +		gpiod_set_value_cansleep(fm34->bypass_gpio, 0);
> +
> +		return ret;
> +	}
> +
> +	ret = fm34ne_dsp_write_config(fm34->client, input_parameter,
> +				      input_parameter_length);
> +	if (ret < 0)
> +		return -EINVAL;

Why not propagate the error code from fm34ne_dsp_write_config()?

> +
> +	msleep(100);
> +	gpiod_set_value_cansleep(fm34->bypass_gpio, 0);
> +
> +	dev_info(&fm34->client->dev, "%s detected\n", fm34->data->model);
> +
> +	/* Constantly set DSP to bypass mode for now */
> +	ret = fm34ne_dsp_set_config(fm34, FM34NE_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

regards,
dan carpenter
