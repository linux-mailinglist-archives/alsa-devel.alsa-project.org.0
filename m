Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDC065BF91
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 13:04:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD58BD8F1;
	Tue,  3 Jan 2023 13:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD58BD8F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672747476;
	bh=f6jo3zRQ4YqE9xK0YE8fx1mhfA8qEZ7IOkwiujgUTsY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oVvDJM6iY3rqnIJV2zsMOlwdl/TFrPJFBQIEsoPrPFCQdsasnJjsIQesUBBNZfAHg
	 6X4R8UF1Yxo07+TsQ/HL+mjtFTfc4NOMT2j5rjVmMDYz05XtbeD2arQPTZ04ltERkV
	 SHvxQbFObAhp/SjjhazrHPWhNV6BxVOuBv/YRUYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88E99F804AA;
	Tue,  3 Jan 2023 13:03:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DD87F804AA; Tue,  3 Jan 2023 13:03:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B275AF800C0
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 13:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B275AF800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=N0wtRI5A
Received: by mail-lj1-x232.google.com with SMTP id u12so27882744ljj.11
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 04:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9rT7p/vx+MXGNP4uFxVvfXIdM9LVnEjrbHlhST8QvhU=;
 b=N0wtRI5Af5ePJfvRaOrcvvyHACrD4YZ6FvGAj8BuwC4id3dynTiTiI5xwV3j/S2mwu
 ehTCrfe/PsNhzwTwcfiggOhAe9+bfgWBbTGWkPn63pYQPnHU0GivxYQYt3H22uJHhlp0
 2JtxmsKpO+5egl8bF4oj7Oqg72MwxmYW4RqD7gpcILEopkmWHoHlUA9UlPrCklqqv7LW
 jJgJTYstYpvBdZJVnDClMySH2f4HDhJThSqScDRC3zPcXrvS3BLRua1KWRhe5BDKxJRe
 vt2uDUWgJwKvX1BFFnv308GDP8htr0vX4GDSR2DkBWe0WH10MhFuXCJR1sWttksPABqZ
 3aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9rT7p/vx+MXGNP4uFxVvfXIdM9LVnEjrbHlhST8QvhU=;
 b=H02UZacDFq27nGd/iv9tDdki5Bb5L8omb3pV2xeVz2oLPUNQty65a6tQou4dEBzNep
 yoZSU5GGGriuWMd25fnvWU0B8DzYLPYX6OwXcKen1VeTQftEyKBryUQGN2OVj0uzOzWS
 6BLcSk5vFJJRjERz9U2K3G16sDI69RqgjIRwd5TNHgjqI/shC9BgEO1MshLZ19SPUUV2
 qh3cyef/hLqW1kM5bcNBcKOvhUizdByCplQm8jbEHueXKicCj0yvccGYY/cTeyf/WxhF
 xBSP+XCeveIVGI80GyBagXvZRyVzRxGiBuFB649PPYNxIV7oryjfpT3IB6aouli8Rpm/
 96eQ==
X-Gm-Message-State: AFqh2kpHvxqFvbJcuYmFF6Q+OG9H+tC+RuHgTrM+UZUWip+xWyRsRk81
 1MWbzcTypHBho8BgqsgOp8gCeg==
X-Google-Smtp-Source: AMrXdXvpRXhCDQG9SS+pfrdZSp+RSL+QX1mijkuFUF7kNQnHYnUKDBWnrTvxl0eqe1twf/9gjkOngA==
X-Received: by 2002:a2e:80d7:0:b0:27f:d11c:3c78 with SMTP id
 r23-20020a2e80d7000000b0027fd11c3c78mr5538873ljg.36.1672747417478; 
 Tue, 03 Jan 2023 04:03:37 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a2eb98a000000b0027fecbaf044sm575294ljp.84.2023.01.03.04.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 04:03:37 -0800 (PST)
Message-ID: <abfddd5f-1491-0696-548d-2faec4568302@linaro.org>
Date: Tue, 3 Jan 2023 13:03:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V8 5/5] ASoC: dt-bindings: Add schema for "awinic, aw883xx"
Content-Language: en-US
To: wangweidong.a@awinic.com
References: <aa0de3c8-d783-f8cc-42a9-7988acd6ab87@linaro.org>
 <20230103112703.382153-1-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103112703.382153-1-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, steve@sk2.org, tanureal@opensource.cirrus.com,
 cezary.rojewski@intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 zhuning0077@gmail.com, liweilei@awinic.com,
 pierre-louis.bossart@linux.intel.com, povik+lin@cutebit.org,
 flatmax@flatmax.com, devicetree@vger.kernel.org, ckeepax@opensource.cirrus.com,
 stephan@gerhold.net, zhaolei@awinic.com, james.schulman@cirrus.com,
 rf@opensource.cirrus.com, robh+dt@kernel.org, shumingf@realtek.com,
 tiwai@suse.com, duanyibo@awinic.com, lgirdwood@gmail.com,
 yijiangtao@awinic.com, broonie@kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 03/01/2023 12:27, wangweidong.a@awinic.com wrote:
> Hi Krzysztof
> 
> On 30/12/2022 10:34, wangweidong.a@awinic.com wrote:
>>> From: Weidong Wang <wangweidong.a@awinic.com>
>>>
>>> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
>>> controlled using I2C.
>>>
>>> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
>>> ---
>>>  .../bindings/sound/awinic,aw883xx.yaml        | 49 +++++++++++++++++++
>>>  1 file changed, 49 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>>> new file mode 100644
>>> index 000000000000..b677427ebcd1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>>> @@ -0,0 +1,49 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/sound/awinic,aw883xx.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Awinic AW883xx Smart Audio Amplifier
>>> +
>>> +maintainers:
>>> +  - Stephan Weidong Wang <wangweidong.a@awinic.com>
>>> +
>>> +description:
>>> +  The Awinic AW883XX is an I2S/TDM input, high efficiency
>>> +  digital Smart K audio amplifier with an integrated 10.25V
>>> +  smart boost convert.
>>> +
>>> +allOf:
>>> +  - $ref: dai-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: awinic,aw883xx
> 
>> Now the question what does "xx" stand for? I cannot find such product on
>> awinic website:
>> https://www.awinic.com/En/Index/queryAll/wd/aw883xx.html
> 
> xx represents our company's aw88394 and aw88395 chips,Aw88395 chips can be found on 
> https://www.awinic.com/cn/detail/index/catid/229/id/48/title/AW88395CSR.html
> The aw88394 chip will be available on the website in the near future.

OK, then it has to be changed. Wildcards are not allowed in compatibles,
so please use a specific compatible (oneOf for a case specific
compatible alone and for a case of two compatibles with fallback;
assuming the fallback is applicable to others).


Best regards,
Krzysztof

