Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BA080D3E0
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 18:32:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44864843;
	Mon, 11 Dec 2023 18:32:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44864843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702315967;
	bh=iwJWvNkzs/Kr20H+vUb3XeOlFhYdW7k7wQYa5ZAdgb4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=akTKPnBTycQc/nkPBC9FGeh4QweE4vT24Rt1aXZnNORbP9wtLU4YTIWyH/mB4HkXF
	 AJixZquB/OVU8ou9r8i8FEdmgBQuqmV/8j7kN0u0SgeIM8CoLXzKN6XvSFZ7xD/oG/
	 5+QzcMtk1dEVdfK7LsZdJEWtADAXOuKS3fOF+cZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AD7BF80114; Mon, 11 Dec 2023 18:32:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8273F80571;
	Mon, 11 Dec 2023 18:32:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53867F80166; Mon, 11 Dec 2023 18:32:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B57EF80114
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 18:32:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B57EF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Q2NnbgMV
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a1e83adfe72so451784466b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Dec 2023 09:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702315922; x=1702920722;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s/UnhJJFhJv72Mo0GfEYdwGM1aW2h/5wD9gbIJDTJ8E=;
        b=Q2NnbgMVX7TbVNLKHGqqK1alDH8UUpgskWFrBhdhZpnQSWAwRoHJ7cTcyGfecW8r5g
         tRAFCMPYX3txBS19NHh18TxyxPph2mBQw6Md5k9eJE0XpHXOCdYPsMnOz0KsV1IgJeIs
         DAgidrD6aRUKBdhRScuXcOmWGV42wvMClg42KTztjwlHTVhe6mx073c4AM7a7UW9Q5Zx
         tsY2zPrku6ONTTaXD9wd7x61imcoH6MCJ0i5RHrWuQ7wdPzw8VJvrwGDMoZ60EbI5b+Y
         MAPO15NhoPDyMzvDR6dD/xwltxIX55rk7KhApHbVAAuoanQR9vBU6PoIpEk+4aDRTtye
         iD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702315922; x=1702920722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/UnhJJFhJv72Mo0GfEYdwGM1aW2h/5wD9gbIJDTJ8E=;
        b=IdJwU1DizyItPt8z+cTQg9MRGK14R2PQPnwVjaHjm127KdLCNZfjd7km+WENQbNf0D
         4L80YOBbH3dlJq3qEkxjfyF8gQdRmSVvLtBT23XUuLRZVoaM6jX/7wyy7+Qbp+GfddDZ
         22FRT2p6ugJsi0l1P4XftHgeQcY3Xd6liYMs4xQx+PMDUlKpuRJN2m5rVNy7exj/J/im
         +i3zkWSY19FRlPPzezU6QsAzqri5Lxgv5BDH2cITFIgfjucxKe5bgU2Hi7Ayrtw41myf
         5wHE2wQ78jc4B3yYFZFiNJaUkEvsGCBtlY7Wqw/eHFNPcQ59j/jl6ancuz+wSexcHND8
         DdNg==
X-Gm-Message-State: AOJu0YwaHoLmsJeKFXbfwTZ1dN1aTMSgpR+pAWsLGbIHu16B+hLdleX8
	PGNgBJYWdvxcetr+KXjqKaTqAQ==
X-Google-Smtp-Source: 
 AGHT+IHReIaY/WQ2l+1mkKbAFPvx2OncWPm7jOMW3JeO0fS+svIC6pbCoCqaSAGs6aNZU8LI3n1mXg==
X-Received: by 2002:a17:907:6d02:b0:a16:3da0:dd36 with SMTP id
 sa2-20020a1709076d0200b00a163da0dd36mr3238682ejc.48.1702315921972;
        Mon, 11 Dec 2023 09:32:01 -0800 (PST)
Received: from [192.168.36.128]
 (178235179179.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.179])
        by smtp.gmail.com with ESMTPSA id
 vu8-20020a170907a64800b00a1d5c52d628sm5087827ejc.3.2023.12.11.09.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 09:32:01 -0800 (PST)
Message-ID: <b7eafdba-5f10-45f1-bed8-55585fb61e94@linaro.org>
Date: Mon, 11 Dec 2023 18:31:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100
 LPASS RX
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
 <20231211-cardstock-elevator-3e19f9d41ac2@spud>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231211-cardstock-elevator-3e19f9d41ac2@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LRQNMJ4YZJH64V5JL6IJKM4G2KNQHKVA
X-Message-ID-Hash: LRQNMJ4YZJH64V5JL6IJKM4G2KNQHKVA
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LRQNMJ4YZJH64V5JL6IJKM4G2KNQHKVA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11.12.2023 18:29, Conor Dooley wrote:
> On Mon, Dec 11, 2023 at 01:31:01PM +0100, Krzysztof Kozlowski wrote:
>> Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
>> RX macro codec, which looks like compatible with earlier SM8550.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I wish you'd send cover letters when you send series of trivial patches
> like this that could be acked in one go.
(+1)

Konrad
