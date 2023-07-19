Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99055758DC1
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 08:26:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D84C0200;
	Wed, 19 Jul 2023 08:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D84C0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689747962;
	bh=K1AOcBsxzaW7FIM6Rwid3kVFunpcZnvCPv0vTyhGTxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p8eI7F4pazbcHTZ15Qg+mIoUA/kOvrIi1zn8NqxyK2tLoKeMixQWNuVJXjq7SX5GF
	 rAPPcVGIrqvf8mLzAnGFhnwASm8ssl7uyK2xtU5kpcH1EpE/HbCGRqFU7SwP8WoH5X
	 HhIrbnqsrbIMB0B5MTEggMOwPzUFQ3mC3/tqdK9E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83A30F8053B; Wed, 19 Jul 2023 08:24:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3071CF8032D;
	Wed, 19 Jul 2023 08:24:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F4C9F8047D; Wed, 19 Jul 2023 08:24:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F54AF80153
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 08:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F54AF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ve4angk7
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-52164adea19so7158843a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jul 2023 23:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689747882; x=1692339882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ccyKM4c4UEqeSLzEinIny4sZDE5dNDTL0N9N17eCxtE=;
        b=ve4angk7F91LhVNlCl1qkrEK7LFpZTU/+7owB4XDF2ZVdh+Lc+uK2tw1TEUV70KrSX
         wF7Q7BQOc0UTlYil0POfFquiw0pzfSTKHpUdGRAaVcz3NKxzaCllxGlgE9rjde76/FIe
         kam3I+BV4TaI4YJ9zvkkx1wGBJWCX+A4vD0WKhv/oPuQ6u3E+AKw6cgPpLrA+VekMP9o
         WVmLc2mm+N6o1Xw8zGdh4h/nlBpyALWjXQPJy64ysqExD6nFZrHzXBqLKg2KYCO5LRUO
         IWagxcOGY+6Gn3GwjcKFTCZp3Qaohzce1zdo48rkOZe5q8KP1Aey6V1URTGEJvj05O0J
         MItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689747882; x=1692339882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccyKM4c4UEqeSLzEinIny4sZDE5dNDTL0N9N17eCxtE=;
        b=NhFeVCgd6M+CoRd8f/HfG6TPx8RUSzNlYHgy0g7i19RqWk7nnRz0i1iOJkkQtnH8zB
         ph7kZIivtbEu9zgT3GqcFB2Z6VE7UZjIu15bkz8ijPjZEsdwBpkV9NiWsQ4JOcb2tY+M
         VwJkEFd9hc9McIHw9XHI1/IAGivAG32lUfRkEqcE6jFSJBzAae4CibWz6Xswq15uOceM
         13YRmbmeZdOQwT5EM+LGNUFsnXxoxnlolXXcBYjrS9YWD9pDcdFbGw0c/YvSwZFJ04Y+
         D852U13RBpatoU6F+fRry9QNtrqaWV6YP54IZgwxTeGR7HIwcNghJshQ/qgg8ijSHGAg
         23nw==
X-Gm-Message-State: ABy/qLZwUXqv1NJsiFdo2e9X3NalO1SCaKzs/Ylz7CHkrGKlAR+LIwM9
	tCZ8N6ywaNOYRgBMzxfptkjtdg==
X-Google-Smtp-Source: 
 APBJJlG0SJESoICmsz810RgoxjW57d1zLBusGoGAMt4TEGBP2HcOV3sxDWwzLWhu8xl61MKTC25u6g==
X-Received: by 2002:aa7:c944:0:b0:51d:f3b2:87b8 with SMTP id
 h4-20020aa7c944000000b0051df3b287b8mr1450218edt.0.1689747882319;
        Tue, 18 Jul 2023 23:24:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 g21-20020a056402115500b0051de52f8adesm2288656edw.32.2023.07.18.23.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 23:24:41 -0700 (PDT)
Message-ID: <4096c968-aa77-5638-7f67-2a478d41ded3@linaro.org>
Date: Wed, 19 Jul 2023 08:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V1 2/5] ASoC: codecs: aw88261 function for ALSA Audio
 Driver
Content-Language: en-US
To: wangweidong.a@awinic.com
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, colin.i.king@gmail.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, doug@schmorgal.com, fido_max@inbox.ru,
 flatmax@flatmax.com, herve.codina@bootlin.com, kiseok.jo@irondevice.com,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, liweilei@awinic.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, rf@opensource.cirrus.com,
 robh+dt@kernel.org, shumingf@realtek.com, tiwai@suse.com, trix@redhat.com,
 yijiangtao@awinic.com, zhangjianming@awinic.com
References: <4ef0d83e-b0c9-1f6e-c1a4-24d650630fe4@linaro.org>
 <20230719030955.41489-1-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719030955.41489-1-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SGFOGU4V5W42FYO27GWNRMNESNZZAPNQ
X-Message-ID-Hash: SGFOGU4V5W42FYO27GWNRMNESNZZAPNQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SGFOGU4V5W42FYO27GWNRMNESNZZAPNQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19/07/2023 05:09, wangweidong.a@awinic.com wrote:
> Hi, Krzysztof,
> Thank you very much for your advice, 
>  but I have a few questions I'd like to discuss with you
> 
> On 18/07/2023 16:58, krzysztof.kozlowski@linaro.org wrote:
>> On 17/07/2023 13:58, wangweidong.a@awinic.com wrote:
>>> From: Weidong Wang <wangweidong.a@awinic.com>
>>>
>>> The AW88261 is an I2S/TDM input, high efficiency
>>> digital Smart K audio amplifier with an integrated 10.25V
>>> smart boost convert
> 
>> It's the same as in patch before. This does not help and does not
>> justify having one driver split into two.
> 
> I will modify the commit information and differentiate the commit 
>  information for each file
> 
>>>
> 
> ...
> 
>>> +
>>> +static void aw_dev_i2s_tx_enable(struct aw_device *aw_dev, bool flag)
>>> +{
>>> +	int ret;
>>> +
>>> +	if (flag) {
>>> +		ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCFG1_REG,
>>> +			~AW88261_I2STXEN_MASK, AW88261_I2STXEN_ENABLE_VALUE);
>>> +	} else {
>>> +		ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCFG1_REG,
>>> +			~AW88261_I2STXEN_MASK, AW88261_I2STXEN_DISABLE_VALUE);
>>> +	}
> 
>> You should not need {} here and in multiple other places.
> 
> I will delete {} as suggested
> 
>>> +	if (ret)
>>> +		dev_dbg(aw_dev->dev, "%s failed", __func__);
> 
>> Why you are not handling the errors properly?
> 
> Do you need to use dev_err instead?

No, return err and handle it somehow (if it is reasonable).

..

>>> +	} else {
>>> +		if (aw_dev->prof_cur != aw_dev->prof_index) {
>>> +			ret = aw88261_dev_fw_update(aw_dev);
>>> +			if (ret < 0)
>>> +				return ret;
>>> +		}
>>> +	}
>>> +
>>> +	aw_dev->prof_cur = aw_dev->prof_index;
>>> +
>>> +	return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(aw88261_dev_reg_update);
> 
>> Same question. And in all other places as well.
> 
> This function will be called in aw88261.c, can I keep it?

Not really. Being used in other unit does not mean you need export.

Best regards,
Krzysztof

