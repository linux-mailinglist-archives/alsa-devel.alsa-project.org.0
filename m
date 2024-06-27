Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25B91A950
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:35:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E78FD210E;
	Thu, 27 Jun 2024 16:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E78FD210E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719498932;
	bh=zguDLaxzEP5ll5x1PQ8QZ4iJg4eLozqPD1M8fbq03jI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eC4mmDaBfYsg1ii1uFxwHS8Fd4N8DRB9+YNwpQDll1C71pBzBujYupsRJNiMWR1BC
	 Mal/fnMW1Afnf+SZnRptoo4n5A2YjO96wnhnBotZCQuUR8jP/1yqqYSBQ151TJ2R8g
	 pIN5H8JXATObZLVBlPw+1J89RR8semGMtemR6m4c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5210BF805D3; Thu, 27 Jun 2024 16:35:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 726F6F805A8;
	Thu, 27 Jun 2024 16:35:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6184DF80495; Thu, 27 Jun 2024 16:35:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CBD5F800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CBD5F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SAgPIFLL
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52cdc4d221eso6683184e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 07:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719498896; x=1720103696;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jz1cCr8L4wELlDLV7TgHeFnSV7RSZaDycktjZG7y30g=;
        b=SAgPIFLLHdKZehA+okzRY0iOODcYsAkIhArd2KpI4A4tc0tnofH2hLD1yv8DmQJVIP
         xfO1m5w1aMdbqjt3ecdVOb5/rc4Je4bNpaqao6+MxOykFl/HRmXhIcIGA29x4I1Nmv2S
         u8WnqkSxZQaZYGuwMfGxOJytIsvox+Wyy4LyKh5AT+LxpaOtgf3eFWLWK2llNj0hx3qV
         qSFnairtvoN8m5ya3ZS8HcpTFc0du60WVvVQlHEKjOvDnYUVgeyNPfKUAHKtLH5JSwXC
         oYTYLA9OS0+iK0QtHLn4ZeJrLkPZcYan9oPucap0KLrC81C+dTWUOBrcs4c4Ubk0n8b1
         pZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719498896; x=1720103696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jz1cCr8L4wELlDLV7TgHeFnSV7RSZaDycktjZG7y30g=;
        b=q0GvfjKrBeueb14UDAik2IgxXjBeknED2NB92V0yjrn0vjoQVDfrL0wiu1cdUEdmsg
         0WjvLvcfuD6wgj83Z1OGVdr9yUFOAmwjTdlgV5cBq8ic1oqv4cKrJSEO98L4vc5xTaF1
         plcIzK3upRnLdAEsz2F6BHfA2C+gGnxB//Ly1KsopJu1ThBRYvMYwpg/mMwu+WMXTMi3
         PZQ9MnCXmPKTfkCEVfXqDiwnmpLoE6yWc48sVK50qEAyW6RgV4uzsfKYd90Xj/FtalKf
         bE33bAEJC7d6GUD43zwwoPnqJunISn8pOAH9ydZ1SFEThD31JBQxH1rPZrbqCY7CAwQz
         N1+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa16RF2OP9kPF5iPmP5BYSgy+F9lBMB3qp3UVBNkUukLpD/KwFV7fglzB4F9RmWyqC17JkIi5aJt3ul+3saCGXS2/Kl2sLpBHNsLY=
X-Gm-Message-State: AOJu0Yxuvst3BrcDoCkeUJHDJIzUk/kVQiH5ZGOjhiyVmIpM1XE7W8JY
	FlZZj7n8o5qaCQrDtLfq0EqcfduIwTJ/OtxWR0vkTz5QImxKbz3pOZuR3ys7Ql4=
X-Google-Smtp-Source: 
 AGHT+IHgZ1tGepEs1cMlh/0EwKv7vLqC2jcAsTAPu51Jor47f+778HanIWr3gvAKeMkBNwQX0VdDSw==
X-Received: by 2002:ac2:528c:0:b0:52c:df51:20bc with SMTP id
 2adb3069b0e04-52ce18350e0mr7717882e87.16.1719498894488;
        Thu, 27 Jun 2024 07:34:54 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4249b132fd1sm81927285e9.0.2024.06.27.07.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 07:34:53 -0700 (PDT)
Message-ID: <8bfa46a4-b18e-4d6f-856a-acbeca9398bf@linaro.org>
Date: Thu, 27 Jun 2024 15:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] ASoC: codecs: wsa883x: parse port-mapping information
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-2-bd8987d2b332@linaro.org>
 <z7wmi55kimskgfcon2difo6agc5nwkssehao72w3mtq3u2ig4f@msmv2on6mw62>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <z7wmi55kimskgfcon2difo6agc5nwkssehao72w3mtq3u2ig4f@msmv2on6mw62>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OYGPT6Q4WBCT3BUKH37WCXGDJ2MYBULE
X-Message-ID-Hash: OYGPT6Q4WBCT3BUKH37WCXGDJ2MYBULE
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYGPT6Q4WBCT3BUKH37WCXGDJ2MYBULE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 27/06/2024 14:36, Dmitry Baryshkov wrote:
> On Thu, Jun 27, 2024 at 12:55:18PM GMT, Srinivas Kandagatla wrote:
>> Add support to parse static master port map information from device tree.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/wsa883x.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
>> index a2e86ef7d18f..43156d39480f 100644
>> --- a/sound/soc/codecs/wsa883x.c
>> +++ b/sound/soc/codecs/wsa883x.c
>> @@ -1399,6 +1399,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>>   	wsa883x->sconfig.direction = SDW_DATA_DIR_RX;
>>   	wsa883x->sconfig.type = SDW_STREAM_PDM;
>>   
>> +	/**
>> +	 * Port map index starts with 0, however the data port for this codec
>> +	 * are from index 1
>> +	 */
>> +	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
>> +					WSA883X_MAX_SWR_PORTS))
>> +		dev_info(dev, "Static Port mapping not specified\n");
> 
> dev_info looks strange. It should be either dev_warn or dev_dbg.

dev_dbg should be good in this case!

--srini
> 
>> +
>>   	pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS, 0);
>>   	pdev->prop.simple_clk_stop_capable = true;
>>   	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
>>
>> -- 
>> 2.25.1
>>
> 
