Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B5792090
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 08:34:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8C0986F;
	Tue,  5 Sep 2023 08:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8C0986F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693895670;
	bh=ViSUjc3iED6BVTtFVlikH4AMyHIR6m7L/eaoR63nSyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sb2kUkmlhItwbpbmjE+HlADPRgcIP8aifhNWZJ5NQRc8rj6ycJpdSeddfyJSgAgkE
	 SEUBomyAS0X1BCoN6r8wzfTaYvHoAR111L7hzSrq1lUPfVwY62ifKlH/0JhStNvJIc
	 aEwIJyKdytmDqOSh8aCJdjyeE2yH0MaEvAUhUFfE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABEBFF80552; Tue,  5 Sep 2023 08:33:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08DE0F80494;
	Tue,  5 Sep 2023 08:33:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 261A3F80431; Tue,  5 Sep 2023 08:33:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 931BDF804F3
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 08:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 931BDF804F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Gp7qJIFV
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99c4923195dso317550966b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Sep 2023 23:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693895612; x=1694500412;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jWFX6+i8IQvGh2J8fHr7nL2f/+MfWw9G8OUDH7h5OUM=;
        b=Gp7qJIFVhYYBIm7fhY32B5ob7o9ZXowiNbWTFnvvTQG3aqj+hIsqb0fRrFeTw/JpBQ
         vRC1wOA/9CzhMw5mGZVhtw315KXQzJSHpkcXue7o5INJKx8qmaDCkhQRLOENu2yeo82L
         fB3gBus3nTuuYuQZ5J05NQqRxEH2KujY2HwS596jE2QvnKproBjuq2crXC4KWPAfM1w6
         eBXk0qwzpkCExUczHzNrYLxBT1WbMjRDrNrfHIqR1ezjJlCFQqgZJbjA8l2A5zvsW9ia
         ZUeh3tR2pvRnFQQtDQudIrjHGMci0G7fZwfjXWUq+eEMz+ldp6OEHEYOV351ZPOBApZ/
         XkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693895612; x=1694500412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jWFX6+i8IQvGh2J8fHr7nL2f/+MfWw9G8OUDH7h5OUM=;
        b=TjDBpLLwzJ4jksXnHojBqhzrQLOsWqEj9DXfG4cDmU+xG7QtASbgAxQI0/qqRpD0C+
         MIFzNw6I8+iR4hJFp5PxWbDiEQ7fydJqfkFPJZ0ANK/HhXu5hpj3NStv87MaCLYNCRAG
         aFhtkuGBe519iV3uNv3zIQe+i8SLJgm59HVvqiTmuJVIStZeoWrhPdn4AhfZdSy8zX0o
         jQCII6/s7mrC998gK44VBUttkZQMq94/hqT7M3SG1/J+XWV4NysjwbT8Nt0ykt+QeDxr
         dGNl6SQl2gmnj9WNgzbsO7jqV04ehJW3R8rxZHD5wKJ61cFpk5CES1aj4Uvkkpfbiuk3
         XwEw==
X-Gm-Message-State: AOJu0YzZqbTjP9GTIIwlp3EY3zE3nX69a4AN/Tu07KEjjs1pYbtBdUT6
	XRM52tMXaqK7ol1hD7NJje3DBg==
X-Google-Smtp-Source: 
 AGHT+IGpBIPJMYYgXkLtFpRdZgcZHZssyisZiGMuIXFfCeQFxHixJsdk/LohVRdBDI9Q4C92cDtevg==
X-Received: by 2002:a17:906:3152:b0:99d:ff60:6ff4 with SMTP id
 e18-20020a170906315200b0099dff606ff4mr10228026eje.70.1693895612575;
        Mon, 04 Sep 2023 23:33:32 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id
 ds11-20020a170907724b00b0099bcf9c2ec6sm7163324ejc.75.2023.09.04.23.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 23:33:32 -0700 (PDT)
Message-ID: <2b6e5216-4718-7bba-ff0d-3b0e01291cdd@linaro.org>
Date: Tue, 5 Sep 2023 08:33:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V1 1/3] ASoC: dt-bindings: Add schema for "awinic,aw87390"
Content-Language: en-US
To: wangweidong.a@awinic.com
Cc: 13916275206@139.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, colin.i.king@gmail.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, herve.codina@bootlin.com,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, liweilei@awinic.com,
 perex@perex.cz, rdunlap@infradead.org, rf@opensource.cirrus.com,
 robh+dt@kernel.org, ryans.lee@analog.com, shumingf@realtek.com,
 tiwai@suse.com, trix@redhat.com, yijiangtao@awinic.com,
 zhangjianming@awinic.com
References: <a3ada071-4c8e-f65d-ad75-655370ba2c55@linaro.org>
 <20230905033103.15343-1-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230905033103.15343-1-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3H4H5QU4BLXCFYEAZYRDCBRGTMPSFTCD
X-Message-ID-Hash: 3H4H5QU4BLXCFYEAZYRDCBRGTMPSFTCD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3H4H5QU4BLXCFYEAZYRDCBRGTMPSFTCD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/09/2023 05:31, wangweidong.a@awinic.com wrote:
>>> +examples:
>>> +  - |
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        audio-codec@58 {
>>> +            compatible = "awinic,aw87390";
>>> +            reg = <0x58>;
> 
>> Please add sound-dai-cells for the example to be complete.
> 
> Thank you very much, I will modify it in patch v2

I expect in example all properties your device can use. Not only some
subset you want to add just to satisfy my comment above.

Best regards,
Krzysztof

