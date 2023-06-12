Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 680FD72B89A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 09:26:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 305D4FA;
	Mon, 12 Jun 2023 09:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 305D4FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686554811;
	bh=DehgOXrmxPhLCT6MPGhQXEW0uCAmzMWXSNyhYcCdOeM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vIWp2C/Uf0AWhH/9HB4W+ydTAijQc1waBklaV/NLVZ6hPFxlNISfsjWtM5uJlKdqY
	 m+EVVDmxh7WkM+xvMj3qO9KnckZ17fAyvhAFkfTtOFgtCydwaiINXI5skVf0KP+QUF
	 +KfnLn8QqHCysIcYE0PG10h74tOEdK7HKlJh3IKs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93E09F80155; Mon, 12 Jun 2023 09:26:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46FB6F80132;
	Mon, 12 Jun 2023 09:26:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BF50F80149; Mon, 12 Jun 2023 09:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B3C5F800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 09:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B3C5F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HORF2dBL
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5147dce372eso5966475a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686554747; x=1689146747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q1/iA2KTeym2owa+RBl7xQJdLjQ/0GLTI4ghL8o+6f4=;
        b=HORF2dBLtSKw23+7IKfmwT72FpRjhdP/sRDS2qdMHv9HwboMtNhQHHif1e/y7JiHMF
         1o1R9eWjIY7ADnceuRfmUwHsETW0rJh+xzSwbdEpmVeYfuF7RKJbCnho3bKTpbrfjKVQ
         N2WCjvs/YjKgOHplZJL88A4AzgJh/GD+oIxkacw95SBW4bSZlceB1e5u4rFJ2oZsYWOq
         K3Y/7O8iKHqlUFA4ykCM+myjY99DwrfrKs/LalGJevq9dHTssU1QlcXU2KrzmeQIbVQ8
         DUUxIikg90yjd7/3LgmRVmZX1zzbRggJvVo+giXl5Sz0BwPUvOWqh9gW1eHF2Dy4vzcA
         A3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686554747; x=1689146747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1/iA2KTeym2owa+RBl7xQJdLjQ/0GLTI4ghL8o+6f4=;
        b=GTQo090RlJt/qO15JB21yRl6XZjNouoM6Q+nZtRaVoJhGFqW8NuwW2mbJp7DN6BSme
         jEhvGB5WJwSEAOlwGVdMwwAAAxStR49rhDD0QsxqTBy1E3rtDjLQma7kNzOKfHEFOU4H
         1LHIlABKCtHm1qy3i20LTpP5ft/BeZ/fOBOfQXgK7w4H1jCLDnG2Fr14+y2+BnxqOsof
         K4GsD0QmOMVw2i6Wh2iJksQOWvVlTx5FLQJMZ75jcVmnjJNjyFdTZ3D729RlV2e9lnzS
         T9TBygPCvr2tYHEIl785h9dCrKOazoTnshvRlmpuRyC0ecQSlXja7V8lfM+foNl5fUgm
         9WQA==
X-Gm-Message-State: AC+VfDyX36Ymt5aSzOhcJOYD0bGAH11Ey9/5XOCUxibwUh8Usi67LURQ
	YIKiQ5s6693BAQqWMcycHm4whw==
X-Google-Smtp-Source: 
 ACHHUZ7DpcJxKlnnA6faPmN7jkMDpIN8+d1Ug1h4AEiqeOaJqh5Aerat92skVsX2xye2L3p+Xe35/Q==
X-Received: by 2002:aa7:d785:0:b0:514:9c77:50b7 with SMTP id
 s5-20020aa7d785000000b005149c7750b7mr4791408edq.25.1686554747114;
        Mon, 12 Jun 2023 00:25:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 v26-20020aa7dbda000000b0050cc4461fc5sm4649433edt.92.2023.06.12.00.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 00:25:46 -0700 (PDT)
Message-ID: <421ddd6d-3938-027c-2099-57248a111831@linaro.org>
Date: Mon, 12 Jun 2023 09:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/2] ASoC: codecs: wsa884x: Add WSA884x family of
 speakers
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Patrick Lai <quic_plai@quicinc.com>
References: <20230611102657.74714-1-krzysztof.kozlowski@linaro.org>
 <20230611102657.74714-2-krzysztof.kozlowski@linaro.org>
 <191859d3-42e3-4ef2-87ff-dd56864103f9@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <191859d3-42e3-4ef2-87ff-dd56864103f9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VEFHFNX77RDDYSZXCJPKTDNHBRNC3EGM
X-Message-ID-Hash: VEFHFNX77RDDYSZXCJPKTDNHBRNC3EGM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VEFHFNX77RDDYSZXCJPKTDNHBRNC3EGM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/06/2023 13:57, Mark Brown wrote:
> On Sun, Jun 11, 2023 at 12:26:57PM +0200, Krzysztof Kozlowski wrote:
> 
>> +static struct reg_default wsa884x_defaults[] = {
> 
>> +	{ WSA884X_CHIP_ID0,			0x00 },
>> +	{ WSA884X_CHIP_ID1,			0x00 },
>> +	{ WSA884X_CHIP_ID2,			0x04 },
>> +	{ WSA884X_CHIP_ID3,			0x02 },
>> +	{ WSA884X_BUS_ID,			0x00 },
> 
> It is generally bad practice to provide defaults for ID registers since
> it rather defeats the point of having them.
> 
>> +	{ WSA884X_INTR_STATUS0,			0x00 },
>> +	{ WSA884X_INTR_STATUS1,			0x00 },
> 
> Interrupt status registers will be volatile and therefore should not
> have defaults.

Sure, makes sense, I'll drop all of the above.

> 
>> +	{ WSA884X_OTP_REG_0,			0x05 },
>> +	{ WSA884X_OTP_REG_1,			0x49 },
>> +	{ WSA884X_OTP_REG_2,			0x80 },
>> +	{ WSA884X_OTP_REG_3,			0xc9 },
>> +	{ WSA884X_OTP_REG_4,			0x40 },
>> +	{ WSA884X_OTP_REG_5,			0xff },
>> +	{ WSA884X_OTP_REG_6,			0xff },
>> +	{ WSA884X_OTP_REG_7,			0xff },
>> +	{ WSA884X_OTP_REG_8,			0xff },
>> +	{ WSA884X_OTP_REG_9,			0xff },
>> +	{ WSA884X_OTP_REG_10,			0xff },
>> +	{ WSA884X_OTP_REG_11,			0xff },
>> +	{ WSA884X_OTP_REG_12,			0xff },
>> +	{ WSA884X_OTP_REG_13,			0xff },
>> +	{ WSA884X_OTP_REG_14,			0xff },
>> +	{ WSA884X_OTP_REG_15,			0xff },
>> +	{ WSA884X_OTP_REG_16,			0xff },
>> +	{ WSA884X_OTP_REG_17,			0xff },
>> +	{ WSA884X_OTP_REG_18,			0xff },
>> +	{ WSA884X_OTP_REG_19,			0xff },
>> +	{ WSA884X_OTP_REG_20,			0xff },
>> +	{ WSA884X_OTP_REG_21,			0xff },
>> +	{ WSA884X_OTP_REG_22,			0xff },
>> +	{ WSA884X_OTP_REG_23,			0xff },
>> +	{ WSA884X_OTP_REG_24,			0x00 },
>> +	{ WSA884X_OTP_REG_25,			0x22 },
>> +	{ WSA884X_OTP_REG_26,			0x03 },
>> +	{ WSA884X_OTP_REG_27,			0x00 },
>> +	{ WSA884X_OTP_REG_28,			0x00 },
>> +	{ WSA884X_OTP_REG_29,			0x00 },
>> +	{ WSA884X_OTP_REG_30,			0x00 },
>> +	{ WSA884X_OTP_REG_31,			0x8f },
>> +	{ WSA884X_OTP_REG_32,			0x00 },
>> +	{ WSA884X_OTP_REG_33,			0xff },
>> +	{ WSA884X_OTP_REG_34,			0x0f },
>> +	{ WSA884X_OTP_REG_35,			0x12 },
>> +	{ WSA884X_OTP_REG_36,			0x08 },
>> +	{ WSA884X_OTP_REG_37,			0x1f },
>> +	{ WSA884X_OTP_REG_38,			0x0b },
>> +	{ WSA884X_OTP_REG_39,			0x00 },
>> +	{ WSA884X_OTP_REG_40,			0x00 },
>> +	{ WSA884X_OTP_REG_41,			0x00 },
>> +	{ WSA884X_OTP_REG_63,			0x40 },
> 
> These appear to be OTP data which suggests that they shouldn't have
> defaults either since they can be programmed.

Just to be clear - I don't have access to datasheet so I don't know what
are these. The downstream driver actually initializes (writes to) two
OTP registers - 38 and 40.

> 
>> +static bool wsa884x_readonly_register(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
> 
> In general the read only registers probably shouldn't have defaults...

For the case when regmap is being read before device enumerates (thus
synced)?

> 
>> +static bool wsa884x_volatile_register(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
>> +	case WSA884X_ANA_WO_CTL_0:
>> +	case WSA884X_ANA_WO_CTL_1:
>> +		return true;
>> +	}
>> +	return wsa884x_readonly_register(dev, reg);
>> +}
> 
> ...and the volatile regiseters definitely not, the default values will
> never be used and just waste space.

Right.

> 
>> +static struct regmap_config wsa884x_regmap_config = {
>> +	.reg_bits = 32,
>> +	.val_bits = 8,
>> +	.cache_type = REGCACHE_RBTREE,
> 
> Please use REGCACHE_MAPLE for new devices.

Ack

> 
>> +	/* Speaker mode by default */
>> +	{ WSA884X_DRE_CTL_0, 0x7 << WSA884X_DRE_CTL_0_PROG_DELAY_SHIFT },
>> +	{ WSA884X_CLSH_CTL_0, (0x37 & ~WSA884X_CLSH_CTL_0_DLY_CODE_MASK) |
>> +			      (0x6 << WSA884X_CLSH_CTL_0_DLY_CODE_SHIFT) },
>> +	{ WSA884X_CLSH_SOFT_MAX, 0xff },
> 
> Why not just leave as the chip default?

Sincerely, I don't know. Without any documentation, I am relying
entirely on downstream driver which has some code like this. I don't
know whether some parts here make sense only for downstream case or
shall be applicable also for upstream.

Best regards,
Krzysztof

