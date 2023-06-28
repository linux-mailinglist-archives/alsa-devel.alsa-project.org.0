Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFC974167C
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 18:31:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95FAF7F1;
	Wed, 28 Jun 2023 18:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95FAF7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687969885;
	bh=rWv9nmm6q4AI49oCAd6K1U0vlA29mpJYFBcj4moLQV0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QCWtXguRWw9FtsqEIoE0lWvdeSHWpMZfdiuHfY+K6TvY7pW9AspLAFCkvmmfknv+Y
	 ZnCKM4HckP9j6eMaFxnhQAB6M7c3UR75ebMerWxRxoTOn31FJO8jTS80vk0ET1VTfe
	 7sOpq/bHWqwqeYDABue4iPpZGN3SuV9d/Lie6T+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 501A3F80544; Wed, 28 Jun 2023 18:30:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC215F80212;
	Wed, 28 Jun 2023 18:30:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C5A2F80246; Wed, 28 Jun 2023 18:30:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D2C8F80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 18:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D2C8F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ba0XBSFD
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-312826ffedbso7358f8f.0
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 09:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687969817; x=1690561817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GMrDQpzoZwdfVDUBjNtjm8VWm39L3gvHFkqK/8Oz7Fg=;
        b=Ba0XBSFDaUbS4aKjdlM+C4FCmPkBthmSTdfBs6mHnlYMS0NobRCZScMWgsulr6FThL
         pnVyYRHvQCjtkncraECzLAvQ+7UaaOUOeoLC/FrbqnFzQeidWUji5UyY2HQhg/pYcVVH
         ZDpPPOqOCvqYv2GZ5sfeTCDWOIDqe8SLoK35Yxpc300QsmkzeAxQVkFdOfKS944KxFT8
         SRO7PcD+XNpalbwTg9/mxwiBqFQfoph45g5itQdglK1IfaxhxXXwZznxJF/Ocww5oFpO
         9/ExtBr7Oq+j0Ob4taYU+NANwdLBzhD+eJcM7mxFBFjNHNmbpZL6QPC5Q5HQsxo87IWt
         jI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687969817; x=1690561817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMrDQpzoZwdfVDUBjNtjm8VWm39L3gvHFkqK/8Oz7Fg=;
        b=gkyL2/RUcTbPdq1dWdDbVqk55IfRWTDR61ktz82Nu1IvMcVMl/lOVwXlHmCfIWKNI7
         yEBh+ty5dUBZ2HC1JkLD83Pdb9bd3n5/89zZjBLd1iu9D9PIOik16U2R5HN/DVXFykGx
         vVSaBTGfy4YeOZw6vyahPt28JS3gEYswLQX6SIbU44Tv+FSPutOH8ml3RscmVtXmqNsH
         OSpZN8auH420PhWWorLmPWxHuQAIoOUc9X7iKQn/I7hdCCs6pfdSGqM+EgQOFnnTTMQs
         i8wJHNbWv8LugiCJ5tNrsVXPutthzYiojxHcY7Vjdd3AatEqjazjr1OLJOkKHqCFJfkK
         xqUw==
X-Gm-Message-State: AC+VfDzl4vJzCdd+VcWG4eodmYegjoW6I4gGLC8XUIBsI0eV1q4tdkWt
	dCIGx8hVtyWTtsK0BSf8HFnsWg==
X-Google-Smtp-Source: 
 ACHHUZ5ixMGvBpAM+0EN2kJ24buliqjZdgG6MhG+EaLDx0AocAWUzViTOhuZS9BEglKFygOinlA7EA==
X-Received: by 2002:a05:6000:1a4f:b0:314:415:cbf5 with SMTP id
 t15-20020a0560001a4f00b003140415cbf5mr3635839wry.51.1687969816968;
        Wed, 28 Jun 2023 09:30:16 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 q14-20020adfdfce000000b003113ccbf388sm3953201wrn.13.2023.06.28.09.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 09:30:16 -0700 (PDT)
Message-ID: <b2aef484-71c9-5655-c1f8-ddde57687491@linaro.org>
Date: Wed, 28 Jun 2023 17:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] ASoC: qcom: q6apm: add support for reading firmware
 name from DT
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
 <20230628102621.15016-3-srinivas.kandagatla@linaro.org>
 <f71c8d2b-d5f4-42bb-932f-5b9ec6117ffc@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <f71c8d2b-d5f4-42bb-932f-5b9ec6117ffc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2MTQGRLC7I6XM6PFOJ3G4OOQ4RKHMGH3
X-Message-ID-Hash: 2MTQGRLC7I6XM6PFOJ3G4OOQ4RKHMGH3
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MTQGRLC7I6XM6PFOJ3G4OOQ4RKHMGH3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 28/06/2023 12:53, Mark Brown wrote:
> On Wed, Jun 28, 2023 at 11:26:20AM +0100, Srinivas Kandagatla wrote:
>> Currently firmware file name is autogenerated based on card name and model number,
>> however this imposed a restriction of finding firmware in a single firmware path.
>> Platform specific firmwares are normally located in sub folders of the SoC.
>>
>> Provide more flexibity by reading firmware-name from DT.
> 
> Why not try a series of firmware names/locations generated using the
> identifying information for the card/system?  That way we don't have to
There is no consistent way with the current state of what is available 
in linux-firmware and what drivers can generate from DMI, atleast with 
Qualcomm SoCs.

Example for x13s has all the firmwares are under 
qcom/sc8280xp/LENOVO/21BX for two models 21BX, 21BY.

However none of the DMI properties match exactly to 21BX or 21BY.

These have to be either derived from product name 21BYZ9SNUS or some 
other dmi properties.

This logic is not going to be very reliable, can differ across platforms.

All of the qcom platforms use firmware-name from DT to get the full 
firmware path with name.

I know this has scaling issues, but with the current state of things, 
its the only option I see.

> put a filename in the ABI which has fun scaling issues.


thanks,
srini
