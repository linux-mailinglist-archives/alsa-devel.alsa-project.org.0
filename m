Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C4E7F5D1E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 11:58:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3D26E8D;
	Thu, 23 Nov 2023 11:58:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3D26E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700737120;
	bh=QlEMx+TsFOPoBFeZNCrkKIWwlNxeYvuABO9DeJx76Ag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=drvObE57dcTk89ZMV1YoMB+ft6QEXOEXLWcip4VJTPcTIgqCIBqf3sJo3mq8g/NQN
	 x92KjlYkmIoCXUayyn9pqc4l93WEi6H99zl2oLZlDeuo1bgg3ZplhLHre4wMPEYOIW
	 cK9orW8CYcemH1/EZfL/E3DISdgSUnJofamaIfgs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2069F805A1; Thu, 23 Nov 2023 11:58:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E0B6F8057A;
	Thu, 23 Nov 2023 11:58:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 285E0F802E8; Thu, 23 Nov 2023 11:58:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1DD1F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 11:58:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1DD1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Cos0uwzL
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40839652b97so4399475e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Nov 2023 02:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700737101; x=1701341901;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tqBAdO1zKF8ljfRCPt++e5LSU5ewUNxfyiSB8BZlHv8=;
        b=Cos0uwzLvVj2xTHywo5LbDJthzjufD1lC87I53viz+Q0+yxiiYLVBmTKHFLsCfvd1g
         vSNdQdGbEGzCR6/UD+AfDpVughNHZ834PkWJVDIOeWGoJtQ0aCF4rmqWA+3rA372vaOo
         48olgEYyE+gEeavAwV2q7902N2WXXQPLlwl4imdu0FVYkSplM54vAIshIQuipYrHnPYl
         XZg2/5HYQpPVJ23O9CVej8IAX6qO+35teB5uRngl33uPyKCqL+WiCktjthQsqRi7Pj20
         2wIXiH8vG78z2WOoAXxfaDIt4g7IZw/rlmxORgCFcj7t9Q9rnSiz4DEB119IfOXKcq+k
         vdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700737101; x=1701341901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tqBAdO1zKF8ljfRCPt++e5LSU5ewUNxfyiSB8BZlHv8=;
        b=GrsaJBqCG8mfv9suhnYCRRZnOs60bzeShHhJclUMZsTUmg5AvTxK5izldmjvFea86F
         hTQLmDQV3zNdI4I0hJXlLZvd9rNoDsgp9n+JZ27r4CI528WuPBtvTkkW7HaY0C4ye277
         20f0bkvFmdggLiR3Waay5BXUiTH0uqRkHafDzwenoXps0zfHpS5aHaDQBOiWiKRLLrkg
         mk8jgybY1VkzTmXbXSDdv5Trnd/mxHARaGnKhzqtrKhkxIc/Mfp6Gi5wYw+52UVmW5f0
         Tev6sEqKNmovSCbFE57zWy/nKpvGVOKSRzW0cmZXHt8+Pum3AXghoxSYsUABtU6Xwtmh
         YZxg==
X-Gm-Message-State: AOJu0YwwEYmUusZTyLqKyKk1uH8GHm6c3TajhuVSkajd31sscY36FV1y
	KfcVO433ZMPJufn4u4wC1/9OxA==
X-Google-Smtp-Source: 
 AGHT+IELTh4W/0QfNa+Lv0THyhTcZGP5fMjTa/b5guLAwCq4ZLSHuz9cdQCs/FgTb+jDmOXapE1JAQ==
X-Received: by 2002:adf:ee8b:0:b0:331:3426:4c2c with SMTP id
 b11-20020adfee8b000000b0033134264c2cmr3627632wro.41.1700737101658;
        Thu, 23 Nov 2023 02:58:21 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4f0b000000b00332e67d6564sm185067wru.67.2023.11.23.02.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 02:58:21 -0800 (PST)
Message-ID: <479c16ce-da90-4571-bd08-b592d63f06cf@linaro.org>
Date: Thu, 23 Nov 2023 11:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] soundwire: fix initializing sysfs for same
 devices on different buses
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, srinivas.kandagatla@linaro.org
Cc: tiwai@suse.de, broonie@kernel.org, vkoul@kernel.org,
 gregkh@linuxfoundation.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Philippe Ombredanne
 <pombredanne@nexb.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
References: <20231017160933.12624-1-pierre-louis.bossart@linux.intel.com>
 <20231017160933.12624-3-pierre-louis.bossart@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231017160933.12624-3-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WDCDJ2JZZDZWWHEJCIHH5HU54DJRLTIG
X-Message-ID-Hash: WDCDJ2JZZDZWWHEJCIHH5HU54DJRLTIG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WDCDJ2JZZDZWWHEJCIHH5HU54DJRLTIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/10/2023 18:09, Pierre-Louis Bossart wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> If same devices with same device IDs are present on different soundwire
> buses, the probe fails due to conflicting device names and sysfs
> entries:
> 
>   sysfs: cannot create duplicate filename '/bus/soundwire/devices/sdw:0:0217:0204:00:0'
> 
> The link ID is 0 for both devices, so they should be differentiated by
> the controller ID. Add the controller ID so, the device names and sysfs entries look
> like:
> 
>   sdw:1:0:0217:0204:00:0 -> ../../../devices/platform/soc@0/6ab0000.soundwire-controller/sdw-master-1-0/sdw:1:0:0217:0204:00:0
>   sdw:3:0:0217:0204:00:0 -> ../../../devices/platform/soc@0/6b10000.soundwire-controller/sdw-master-3-0/sdw:3:0:0217:0204:00:0
> 
> [PLB changes: use bus->controller_id instead of bus->id]
> 
> Fixes: 7c3cd189b86d ("soundwire: Add Master registration")
> Cc: <stable@vger.kernel.org>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

The order of SoB is not correct. Author's goes before co-developed.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

