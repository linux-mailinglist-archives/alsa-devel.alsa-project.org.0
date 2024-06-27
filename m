Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C76E591A94A
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:35:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFC9A1947;
	Thu, 27 Jun 2024 16:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFC9A1947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719498911;
	bh=ghjiOzeJJ4xUTV3c9CgXH0R3rvayw7UkOWVIgVtMIPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ud4lDdLrgaEu5JAO8Dmd2U0HG0R0cWYmFeiugFOp1fXAuU4Eu0a9Ai/hzVXsy9Cq2
	 /8xcTtXFl/pIlIrNFNwOY4wnxqRiOgH19wEvgBZZdUlpjdBjf1yW4vPT/JGW4rfwkB
	 0+VfB1glLeon2LoYaTG1idKGq2UX8KuV0KBJ+CBU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 927E0F805AF; Thu, 27 Jun 2024 16:34:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFB27F805A1;
	Thu, 27 Jun 2024 16:34:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48175F80423; Thu, 27 Jun 2024 16:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9816CF800E4
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9816CF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MiGFf1gA
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so95184861fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 07:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719498861; x=1720103661;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6WlQhzaEQCr3M9aJ4AKzbvoi4K+rnc7BXOCfJ1sz2M=;
        b=MiGFf1gAqep/IWWH61Pr2b5akxyCo4UnCQ67qABYXBeUwAGpLvts7zvpfIYoZ8UVmb
         u9FN0qenO0MzGgMv/5+If0VSZyrgeyq7DhuNwT2VYOZx7LPfE1BOUA7fPebFvks3OHP1
         XiyLLyeYMlWf0ITVyhG1uWz9+d1kW377775FTo6aHzdIin3HspZSSxXK99HCSKX7Llav
         SqnvthNyKWuDzg/TuYbzCxZXj1lImilKuU2wFOXTRuvpU0oEEnoeuQ0u1AGKlRujllma
         uA5yiWkODVR6Sc1pxhfs28JrQq6Zs3HrKVwMvsON1Svq58e7fPi0XrVq6mkyGgN6Zi3N
         HucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719498861; x=1720103661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6WlQhzaEQCr3M9aJ4AKzbvoi4K+rnc7BXOCfJ1sz2M=;
        b=ddkTkNJbOKlh8dUHdgV/xsvAm6MuKH0CjbDAe4tRy9+s46RlwkrL9ksUFn+iddXxsp
         BAw/BA4nKXxaflCExcEx0W5OElQ6ccwufV7M04WexbiMAlkoQRY2GP7qihcV9oRhjtKw
         8ghscXOCLiOblEMkvtP6mVW8C3rvsuhYnpJJFAhILBQJ7DHehyN4GMppxh5BAmNuaYX5
         Bc0mxHWjIuY7mY1B3nR0ZNx43qGCYLAAb7BAl/PA7ab5cjoGOvzZlmHp/Y6iiWlMBgtV
         GrFBA/Hn2tss4CTY/DCh2KnNNBKFAPUn3q6uHRn8pE9rCijAd2NzsuYs0bczCZBzXs/X
         BEBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx6BCCeIlh18RHcwZH8Zk3w30M8QPO7HOcdAMTb2n/GuWWVqslfxQsyYZpeQ9L8VcCu1/FY6elV3cHxufxVqnZL3gz1MMl0rEu9OU=
X-Gm-Message-State: AOJu0YxvC+QJg+DOVOdk6g1MyFIdPHyfa655gE3t8pGwdlO6JttMfJNf
	ofXrpTGoeYEhSx/NiytH1sbqPTpYf9eDLT7b3p5c3CDlBFUSjnIn0XClgIfZFKs=
X-Google-Smtp-Source: 
 AGHT+IFxKe4Cm33uzN1eEWdat5RzDVQ5k0Z6h4cYZ9qjbu7vikAxnG0ORLLkLC8mWQsd1fnj31WW1g==
X-Received: by 2002:a2e:7a0a:0:b0:2ec:5277:e5b3 with SMTP id
 38308e7fff4ca-2ec5b38840dmr90808491fa.36.1719498861291;
        Thu, 27 Jun 2024 07:34:21 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-425692761a1sm3161575e9.10.2024.06.27.07.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 07:34:20 -0700 (PDT)
Message-ID: <da3e3b46-d8fd-4938-baa3-a7f95ec19d95@linaro.org>
Date: Thu, 27 Jun 2024 15:34:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ASoC: codecs: wsa884x: parse port-mapping information
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
 <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
 <tlaykv4bx6uizimz3jnprevwbuvygitvacbbdixzrwq4llaz6e@6qpswvidl4iq>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <tlaykv4bx6uizimz3jnprevwbuvygitvacbbdixzrwq4llaz6e@6qpswvidl4iq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FRR4D5SZX2Q6SZUBAET56NWCS64NLXFV
X-Message-ID-Hash: FRR4D5SZX2Q6SZUBAET56NWCS64NLXFV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FRR4D5SZX2Q6SZUBAET56NWCS64NLXFV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 27/06/2024 14:38, Dmitry Baryshkov wrote:
> On Thu, Jun 27, 2024 at 12:55:20PM GMT, Srinivas Kandagatla wrote:
>> Add support to parse static master port map information from device tree.
>> This is required for correct port mapping between soundwire device and
>> master ports.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/wsa884x.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
>> index a9767ef0e39d..72ff71bfb827 100644
>> --- a/sound/soc/codecs/wsa884x.c
>> +++ b/sound/soc/codecs/wsa884x.c
>> @@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
>>   	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
>>   	wsa884x->sconfig.type = SDW_STREAM_PDM;
>>   
>> +	/**
>> +	 * Port map index starts with 0, however the data port for this codec
>> +	 * are from index 1
>> +	 */
>> +	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
>> +					WSA884X_MAX_SWR_PORTS))
>> +		dev_info(dev, "Static Port mapping not specified\n");
> 
> Same comment. Either dev_warn (if it's something to warn about) or
> dev_info.
> 
> Or, as your commit message mentions that it is required, it should be an
> error if the port mapping is not specified.

This is an optional property for older SoCs which have 1:1 port map 
between device and master.


--srini
> 
>> +
>>   	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
>>   	pdev->prop.simple_clk_stop_capable = true;
>>   	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
>>
>> -- 
>> 2.25.1
>>
> 
