Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599D791701
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:19:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBC9D846;
	Mon,  4 Sep 2023 14:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBC9D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693829955;
	bh=HIQiMbVxUhmoogmmJke6tKa0dwSwQf6iFh52W0N/z2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LWN8pI3YtHBzIQZtufqa1ULp049rC9I2Zltb2hvQ+FnynnjmJ7Ez+bitcmTp+OEwy
	 oC2BunK5f51Zn9/jRwZnnBZRyWizCi4vGeCjxce9qmL7pcywVxE7QdfXeEzWac5uKH
	 7gnEzZmlxbpnkzsDCBrJ9f2zRVj1DdiiXDwstTWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4C58F80236; Mon,  4 Sep 2023 14:17:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39F80F80431;
	Mon,  4 Sep 2023 14:17:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FA06F8047D; Mon,  4 Sep 2023 14:17:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 664A3F80141
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 14:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 664A3F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YxPHmiiv
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so217415266b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Sep 2023 05:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693829865; x=1694434665;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gko8S92UwKDakAjbzjQZ/sNmZx2tljlr3QwwqTw8dTw=;
        b=YxPHmiivwVsEKOSZ81zXVcu7f2Uc5fJZn/biuRuaJ9g7Yc++WfHV4lu86VB6I+P0aO
         HjZnBaD6LIv/5sgsUonPJy8bIrf/HbQay7NuAIRbtLwn/pD1inH6XGAE6CkMMYQolCMs
         iklf093Ks9BqaTKOBsgNzEdTQX9lvnf4EAMX95T+oOjjLYYlYoLGyCYKOxN1mlVsilOO
         gCh2c7RQHMFnGuEtcOuA3AjyNFkZ7i+7u/wKr75hzEank0wyzKzDXVV/49C2NnNseBij
         45oV4PM7XMtNtPmVPeT6QuOui00UZE9Z7c9NBG4ZQEgJl47Uruike/pgFqTYva1yRuxj
         hnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693829865; x=1694434665;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gko8S92UwKDakAjbzjQZ/sNmZx2tljlr3QwwqTw8dTw=;
        b=YcLqN8RGCkvRj7fZLJ46AN5FnYX6vayvXojWBBgqAeL8WENwlXYjX9w5fQk7kyv7QP
         3H2km5xNL7zdIBPVT0V/w7y6yIEgbE9ZyXM1v9tydsR1NerM70Fy7sMe6y2EXEcOS9cq
         T1bn23x+wugp9TAceJtmwmzS1TDVKBDART6dyxaWtp/1UXexGBMA8cwi5ZpYLNAxuPn3
         Q/EIz23x5695sD0kfeo45IP+7mYWAjycqpgqruDepr4najFIzOYUP+ceJ74w9DCWdAyu
         VDtMnDxvap/BMkQKJxlCXGGEzpBVEatE7fqK0VzpMBhH8oKl0zyabCHDO9zlb2/td3/+
         dBrw==
X-Gm-Message-State: AOJu0YxzKy0pP2E6C0cdXa5OuuLHB6w6WS1eTj/Y+4Y1RLzBjnsqIDG1
	EJnMvrSHPIdzRjDbbGZRNBgQTQ==
X-Google-Smtp-Source: 
 AGHT+IEmnk0VrCde/RpXcTnJqLWkg8HN3gX0oQSn7T9cZd+70d9xlLecPSPO4/immxGbAA26YFLECg==
X-Received: by 2002:a17:906:1011:b0:9a5:a44a:86f3 with SMTP id
 17-20020a170906101100b009a5a44a86f3mr8193805ejm.25.1693829865436;
        Mon, 04 Sep 2023 05:17:45 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id
 oz13-20020a170906cd0d00b00992f309cfe8sm6117340ejb.178.2023.09.04.05.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 05:17:45 -0700 (PDT)
Message-ID: <5ea76d3f-c9dd-10f5-4f9a-7b32b535ab5c@linaro.org>
Date: Mon, 4 Sep 2023 14:17:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V1 3/3] ASoC: codecs: Add aw87390 amplifier driver
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.com,
 herve.codina@bootlin.com, shumingf@realtek.com, rdunlap@infradead.org,
 13916275206@139.com, ryans.lee@analog.com, linus.walleij@linaro.org,
 ckeepax@opensource.cirrus.com, yijiangtao@awinic.com, liweilei@awinic.com,
 colin.i.king@gmail.com, trix@redhat.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: zhangjianming@awinic.com
References: <20230904114621.4457-1-wangweidong.a@awinic.com>
 <20230904114621.4457-4-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904114621.4457-4-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5GUSMGK3Z4NCQW7RZ4D6JHSKQQXBKZU3
X-Message-ID-Hash: 5GUSMGK3Z4NCQW7RZ4D6JHSKQQXBKZU3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5GUSMGK3Z4NCQW7RZ4D6JHSKQQXBKZU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/09/2023 13:46, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 

...

> +static void aw87390_parse_channel_dt(struct aw87390 *aw87390)
> +{
> +	struct aw_device *aw_dev = aw87390->aw_pa;
> +	struct device_node *np = aw_dev->dev->of_node;
> +	u32 channel_value = AW87390_DEV_DEFAULT_CH;
> +
> +	of_property_read_u32(np, "sound-channel", &channel_value);

NAK, there is no such property. It seems you already sneaked in such for
other codecs. Please do not repeat such patterns of work.

That's also why I expect full DTS example, not some reduced pieces.

> +
> +	aw_dev->channel = channel_value;
> +}
> +
> +static int aw87390_init(struct aw87390 **aw87390, struct i2c_client *i2c, struct regmap *regmap)
> +{
> +	struct aw_device *aw_dev;
> +	unsigned int chip_id;
> +	int ret;
> +
> +	/* read chip id */
> +	ret = regmap_read(regmap, AW87390_ID_REG, &chip_id);
> +	if (ret) {
> +		dev_err(&i2c->dev, "%s read chipid error. ret = %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	if (chip_id != AW87390_CHIP_ID) {
> +		dev_err(&i2c->dev, "unsupported device\n");

Why? The compatible tells it cannot be anything else.

> +		return -ENXIO;
> +	}
> +
> +	dev_info(&i2c->dev, "chip id = 0x%x\n", chip_id);
> +
> +	aw_dev = devm_kzalloc(&i2c->dev, sizeof(*aw_dev), GFP_KERNEL);
> +	if (!aw_dev)
> +		return -ENOMEM;
> +
> +	(*aw87390)->aw_pa = aw_dev;
> +	aw_dev->i2c = i2c;
> +	aw_dev->regmap = regmap;
> +	aw_dev->dev = &i2c->dev;
> +	aw_dev->chip_id = AW87390_CHIP_ID;
> +	aw_dev->acf = NULL;
> +	aw_dev->prof_info.prof_desc = NULL;
> +	aw_dev->prof_info.count = 0;
> +	aw_dev->prof_info.prof_type = AW88395_DEV_NONE_TYPE_ID;
> +	aw_dev->channel = AW87390_DEV_DEFAULT_CH;
> +	aw_dev->fw_status = AW87390_DEV_FW_FAILED;
> +	aw_dev->prof_index = AW87390_INIT_PROFILE;
> +	aw_dev->status = AW87390_DEV_PW_OFF;
> +
> +	aw87390_parse_channel_dt(*aw87390);
> +
> +	return ret;
> +}
> +
> +static int aw87390_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct aw87390 *aw87390;
> +	int ret;
> +
> +	ret = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C);
> +	if (!ret)
> +		return dev_err_probe(&i2c->dev, -ENXIO, "check_functionality failed\n");
> +
> +	aw87390 = devm_kzalloc(&i2c->dev, sizeof(*aw87390), GFP_KERNEL);
> +	if (!aw87390)
> +		return -ENOMEM;
> +
> +	mutex_init(&aw87390->lock);
> +
> +	i2c_set_clientdata(i2c, aw87390);
> +
> +	aw87390->regmap = devm_regmap_init_i2c(i2c, &aw87390_remap_config);
> +	if (IS_ERR(aw87390->regmap)) {
> +		ret = PTR_ERR(aw87390->regmap);

ret is not needed here, so just:
return dev_err_probe()

> +		return dev_err_probe(&i2c->dev, ret, "failed to init regmap: %d\n", ret);
> +	}
> +
> +	/* aw pa init */
> +	ret = aw87390_init(&aw87390, i2c, aw87390->regmap);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(aw87390->regmap, AW87390_ID_REG, AW87390_SOFT_RESET_VALUE);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_snd_soc_register_component(&i2c->dev,
> +				&soc_codec_dev_aw87390, NULL, 0);
> +	if (ret)
> +		dev_err(&i2c->dev, "failed to register aw87390: %d\n", ret);
> +
> +	return ret;
> +}


Best regards,
Krzysztof

