Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FF582B008
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 14:56:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8351EEAB;
	Thu, 11 Jan 2024 14:56:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8351EEAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704981371;
	bh=NiXVI1YEcktKrLSLgX4vIx4N1a5CEKQTmsBeJK56IW8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JG9FF/MTB3u0vjXy+6DsMlfO+cc8l99iPIbnmxf4bORtt7qXTBR/rQlsKbuqDKM87
	 FGzAk0q8L4YQlTRhdtW+mfapiRmde9Lzr0KVxVapx6NXeR4FwSQPqcIqpQVTt5kdy9
	 M2yxzcJNx0pGc3eZ024cOANkvd/O28hlaVUdszQo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CBB6F80588; Thu, 11 Jan 2024 14:55:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85E68F804F1;
	Thu, 11 Jan 2024 14:55:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7FFBF80254; Thu, 11 Jan 2024 14:55:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C434AF8003A
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 14:55:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C434AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pwt3NDgG
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e5f746ac4so7272135e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Jan 2024 05:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704981326; x=1705586126;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0dIPsJGSMOF5s4ZOOWNHew/JfNIDHIN+6H9/lTo/to=;
        b=pwt3NDgG4WRDzR5YDhWUZLW8AreCUSDATJqvsByP+VYf3PDdj4zs4XW9QCEJ3Pd7rE
         gLfSG6t6cw6tSzJFUHk/85fk68rlBFcf/LpEwONoQNIi4eDOLTbUxpnVdro0fE+TvGxd
         QDo3RW4S42zHjUW7WDqaKnykqs3+uazswR1/x+klbmQktL1wvd5YPSNrAXcMorOY4mjZ
         Auc/RWCbhQRgygDRYTOaXul0VK2FZcGE3VuptNGcBL/3pZAY6J3zf4HFC1VqknOPiIMk
         IevBta1MQmTT0vvKxoneOeG5iFu3edzNyRgK3vfygVst504Sd+7R4+/X7/B8bhqmcse6
         D+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704981326; x=1705586126;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0dIPsJGSMOF5s4ZOOWNHew/JfNIDHIN+6H9/lTo/to=;
        b=kUo76Szt7JInJWvbnfBM5ZzFE7CkNUwfWcWILc4sPeOhpiWAvhOnElmtDU8O06cfxf
         lXMnVoED4JuTGApxOWvOLw/ZxmP2NGfj3boKKvD1I9QaCNsLXMbYYh6vc8BCxJmQSAgu
         7uuzZkF2vIvB5jSAmr8WIE7yczwC/E6zudQl5R5tGtoEil7cwXWtPFP9YjVyg7hd/faS
         /RnMEWSOD2lKnmIiquv1BLu/aUxb4l+t7U3GEppJwrUBpFDrQW7Ioa2bQKMm53K+Z9o2
         Seji3NR0z+ciddrM/nDDVtZBj+reKPlVhokgP4vRFMFSu37OUklY7OU0IBdshMbQdCuJ
         cMIw==
X-Gm-Message-State: AOJu0YzkhgHiAwbhJupw9mUbIFcpjw6mNJPDUIG5KKp8Qd4sLR25UUg1
	t0+GGsusrbzcTw/RsVMgaptEqIrILzKh7w==
X-Google-Smtp-Source: 
 AGHT+IGtF3QNalwefKPZvWwsQufdvQFpfDZHDVwKS22BIc21HKHHWst7x8VNdyXHzgwLSfb8v4hU0A==
X-Received: by 2002:a05:600c:444e:b0:40d:7505:a4ca with SMTP id
 v14-20020a05600c444e00b0040d7505a4camr460918wmn.37.1704981326427;
        Thu, 11 Jan 2024 05:55:26 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b0040e5951f199sm1971457wmq.34.2024.01.11.05.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 05:55:25 -0800 (PST)
Message-ID: <af970ab0-f325-4d6c-9547-750eaa785160@linaro.org>
Date: Thu, 11 Jan 2024 14:55:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,sai: Add compatible string for
 i.MX95 platform
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20240109075551.870001-1-chancel.liu@nxp.com>
 <20240109075551.870001-2-chancel.liu@nxp.com>
 <8ed559e8-1f97-45ee-acb9-c792752fd419@linaro.org>
 <DB9PR04MB9498C7C66BD45F2FBDD163D5E3682@DB9PR04MB9498.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: 
 <DB9PR04MB9498C7C66BD45F2FBDD163D5E3682@DB9PR04MB9498.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: E6DPUJXB3HLD6XHDNST5EZ4PQV57RUSS
X-Message-ID-Hash: E6DPUJXB3HLD6XHDNST5EZ4PQV57RUSS
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E6DPUJXB3HLD6XHDNST5EZ4PQV57RUSS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/01/2024 12:06, Chancel Liu wrote:
>>> Add compatible string "fsl,imx95-sai" for i.MX95 platform.
>>>
>>> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>>> ---
>>>  Documentation/devicetree/bindings/sound/fsl,sai.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
>> b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
>>> index 088c26b001cc..f3d910aa2dc6 100644
>>> --- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
>>> @@ -40,6 +40,7 @@ properties:
>>>                - fsl,imx8ulp-sai
>>>                - fsl,imx93-sai
>>>                - fsl,vf610-sai
>>> +              - fsl,imx95-sai
>>
>> Don't break the order, please.
>>
>> Best regards,
>> Krzysztof
> 
> Sorry but I don't understand what's the "order" refer to. Could you please
> explain it to me?

Items look alphabetically ordered.

Best regards,
Krzysztof

