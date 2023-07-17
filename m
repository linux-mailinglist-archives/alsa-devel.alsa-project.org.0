Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E98756E77
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 22:40:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45E76AE9;
	Mon, 17 Jul 2023 22:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45E76AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689626410;
	bh=9r8nmW7FvrBM2RO/chcgcitOjNrs6P8qcWr79prgTfQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jwWI6nhkzNqJVrsTas5gDV5UhFQVZqKm1d1sUSWlhU6PHHDv9yAX6pydJ6jHkItXB
	 07IC1CfPsim6FljVHtGtiHarH3JN6z18P2hE3wRnbp3GIleDymB2EOvI2iZyshEk0H
	 CdyNkhn2w6zBzt3y7e63kxeeXtJWPeIGOwQI6Hbw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B7AFF8032D; Mon, 17 Jul 2023 22:39:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FBEEF8032D;
	Mon, 17 Jul 2023 22:39:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3834EF8047D; Mon, 17 Jul 2023 22:39:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7AB5F8027B
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 22:39:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7AB5F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Qe2A4+Qe
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-991f956fb5aso616554066b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jul 2023 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689626350; x=1692218350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gmNkfDah6O+uPw4Ib3W9slf1ycVoQFYR0H5sgdKTjwI=;
        b=Qe2A4+QegpFejdVnrN5POOEeWtjx8ab8C0UDC1TZ/2ISJ+fKzl8uf1A9x+LeQK3WR7
         s/LjpJUWuYe4u0IITKRiqrf8gojjrfn4ES9GmnFqrQtmWFG0wggg5aHuzV6QqfkMT4UY
         NrAaN3avPkOXX7iPde8eJkKI+W0QxIhj5v3TjH0/73Qkd0dS+jeZ9IKg5zgCjcOAcTfz
         Ht6HEmCWTU4eFRRxZOT4zXYUR8TRa6JBECdQ6JfDA2phRot1PQ4L411I+IlIkUnC7NXh
         qAl+CxwurmcfYZJskg2VFhtnJTWhpIqOOxXoDtG5SjbIySfI5fp3ZOihTFhpKXk7pbWg
         ylKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689626350; x=1692218350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmNkfDah6O+uPw4Ib3W9slf1ycVoQFYR0H5sgdKTjwI=;
        b=jLL/0rsvwG0pri3nr84jQjrm3lzar1w68bXg3ehjZnCHNVIMDqU6pulA5y0iqq/e0G
         aJayVaE2n/eN8hRVd6mJ1YdJCTvOVsrh8qOk/08ieqJgZixBqKEEA4WjPyoqSIn4eYob
         D4ZgWPU+aY+QO3mlBKOBnoSQLYVABk21GWShc58l9RimhbMxCVZvMTZBbBG0xAIrrAYm
         cnftiIR1K9FiU8raueC2TfCfFZFu8HiiwSDI/3wJfWig71kIbFd3gGcQE/O5wEuglY1K
         fjcAPWoNlJ0s4ZGFPQUTUB+1uDw/vqUchvdjbo8Pp3l0cGLVtH0rDrRbKu/ouhauAJoF
         qUcQ==
X-Gm-Message-State: ABy/qLbCBAkeaY/Ef/Vz0w424P4r3hvTDrhXBCR03+XyDuyRjwkmr9O1
	2ijinOPoI6jEtKRtiK/An7merw==
X-Google-Smtp-Source: 
 APBJJlEcyhWZAO0MBPswLPa/ZIbl8mavuG7TjjlAudVH8Oks+LQPu3vA+mJ81Wq/x+wex65JIo+xbQ==
X-Received: by 2002:a17:907:b0a:b0:993:6382:6e34 with SMTP id
 h10-20020a1709070b0a00b0099363826e34mr9815665ejl.72.1689626350230;
        Mon, 17 Jul 2023 13:39:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 s1-20020a1709067b8100b009875a6d28b0sm141129ejo.51.2023.07.17.13.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 13:39:09 -0700 (PDT)
Message-ID: <4ef0d83e-b0c9-1f6e-c1a4-24d650630fe4@linaro.org>
Date: Mon, 17 Jul 2023 22:39:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V1 2/5] ASoC: codecs: aw88261 function for ALSA Audio
 Driver
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.co,
 shumingf@realtek.com, herve.codina@bootlin.com, flatmax@flatmax.com,
 ckeepax@opensource.cirrus.com, doug@schmorgal.com, fido_max@inbox.ru,
 pierre-louis.bossart@linux.intel.com, kiseok.jo@irondevice.com,
 liweilei@awinic.com, colin.i.king@gmail.com, trix@redhat.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: yijiangtao@awinic.com, zhangjianming@awinic.com
References: <20230717115845.297991-1-wangweidong.a@awinic.com>
 <20230717115845.297991-3-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717115845.297991-3-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LWBFONEYROVGF27VELOKLQ4QOH7QCERN
X-Message-ID-Hash: LWBFONEYROVGF27VELOKLQ4QOH7QCERN
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWBFONEYROVGF27VELOKLQ4QOH7QCERN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/07/2023 13:58, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> The AW88261 is an I2S/TDM input, high efficiency
> digital Smart K audio amplifier with an integrated 10.25V
> smart boost convert

It's the same as in patch before. This does not help and does not
justify having one driver split into two.

> 

...

> +
> +static void aw_dev_i2s_tx_enable(struct aw_device *aw_dev, bool flag)
> +{
> +	int ret;
> +
> +	if (flag) {
> +		ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCFG1_REG,
> +			~AW88261_I2STXEN_MASK, AW88261_I2STXEN_ENABLE_VALUE);
> +	} else {
> +		ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCFG1_REG,
> +			~AW88261_I2STXEN_MASK, AW88261_I2STXEN_DISABLE_VALUE);
> +	}

You should not need {} here and in multiple other places.

> +	if (ret)
> +		dev_dbg(aw_dev->dev, "%s failed", __func__);

Why you are not handling the errors properly?

> +}
> +
> +static void aw_dev_pwd(struct aw_device *aw_dev, bool pwd)
> +{
> +	int ret;
> +
> +	if (pwd) {
> +		ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
> +				~AW88261_PWDN_MASK,	AW88261_PWDN_POWER_DOWN_VALUE);
> +	} else {
> +		ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
> +				~AW88261_PWDN_MASK,	AW88261_PWDN_WORKING_VALUE);
> +	}
> +	if (ret)
> +		dev_dbg(aw_dev->dev, "%s failed", __func__);
> +}
> +

...

> +
> +int aw88261_dev_fw_update(struct aw_device *aw_dev)
> +{
> +	struct aw_prof_desc *prof_index_desc;
> +	struct aw_sec_data_desc *sec_desc;
> +	char *prof_name;
> +	int ret;
> +
> +	prof_name = aw88261_dev_get_prof_name(aw_dev, aw_dev->prof_index);
> +	if (!prof_name) {
> +		dev_err(aw_dev->dev, "get prof name failed");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(aw_dev->dev, "start update %s", prof_name);
> +
> +	ret = aw88261_dev_get_prof_data(aw_dev, aw_dev->prof_index, &prof_index_desc);
> +	if (ret)
> +		return ret;
> +
> +	/* update reg */
> +	sec_desc = prof_index_desc->sec_desc;
> +	ret = aw_dev_reg_update(aw_dev, sec_desc[AW88261_DATA_TYPE_REG].data,
> +					sec_desc[AW88261_DATA_TYPE_REG].len);
> +	if (ret) {
> +		dev_err(aw_dev->dev, "update reg failed");
> +		return ret;
> +	}
> +
> +	aw_dev->prof_cur = aw_dev->prof_index;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(aw88261_dev_fw_update);

Why do you need to export this? Where is the user?

> +
> +int aw88261_dev_reg_update(struct aw_device *aw_dev, bool force)
> +{
> +	int ret;
> +
> +	if (force) {
> +		aw88261_dev_soft_reset(aw_dev);
> +		ret = aw88261_dev_fw_update(aw_dev);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		if (aw_dev->prof_cur != aw_dev->prof_index) {
> +			ret = aw88261_dev_fw_update(aw_dev);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
> +
> +	aw_dev->prof_cur = aw_dev->prof_index;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(aw88261_dev_reg_update);

Same question. And in all other places as well.


Best regards,
Krzysztof

