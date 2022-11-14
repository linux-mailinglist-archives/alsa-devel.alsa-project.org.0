Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 327A9627D00
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 12:51:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B19A41654;
	Mon, 14 Nov 2022 12:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B19A41654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668426682;
	bh=JrEN8rQcj1mO4AmpUUld30vemewob0i+Cm1qbi3jcP0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eSHeVdmQfBGqRXfadOiC4qx2UiB+rprIE0ICuSznZVji/eiIYnGHbd04DuoREMTX7
	 mznuZqYBUpSRNfpp3RDMjIAJQCeNkc0L+KtuHPORg+fNITZKODhLY8gf5dVAHzqCsn
	 EWZlZdhzdrn1TECe3P7ShkVrLhu1KiHMt8Emmni4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46779F80448;
	Mon, 14 Nov 2022 12:50:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B37F4F800AA; Mon, 14 Nov 2022 12:50:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0085F800AA
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 12:50:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0085F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jp5LIGFy"
Received: by mail-wr1-x42e.google.com with SMTP id d9so13048425wrm.13
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 03:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xq2tLSCLZkgPzxgMCTyBgdDINhDq1LxipubitB9NtGc=;
 b=jp5LIGFyzgk18hF30BUu0NW++CriKjixjmz09zSAaf+g7nwjzDof+dXGKg6RhtzK3B
 vWzHHt82Av++1rTsXceQ0OgBcf+nrBHDKS7ZZakYiZP5LEP4PSp5lGeo6zXWZdjCZSGy
 uVCQpaR/YYBwADrGEdpTEvFgl44KhnkYC2qbSL7nGNY/C8PHlVmuWGLVq3wvjzlRmBVq
 l6D52DiE8OySgVb5fHw7yeAsNdx7u6ANS/KGSLWfALg9ccfhigNYytzy1CzCqpu6JPtJ
 OoluBvWlyFEGwRPUyR6NpzC7XvNTNbaCUalAp8bXsdu0EObbhpNNmdBJNLXJaOJPIVph
 lJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xq2tLSCLZkgPzxgMCTyBgdDINhDq1LxipubitB9NtGc=;
 b=qHJtU/EHUx/M4kZx6zdF0IW9180ePrYOfOP3U23aGCcuOU0Ewp6F4CnttXQppuDcpp
 zzW+fcblXXg5luH4XVGvwZRiUZhTxvR6TURSjuG/rWNs+mANM+S1VGFeu6CBG+3bXvQ/
 E0IywPl/VuQx7iYQiGEQoPAA+568nmhJY95BU2W34ofu9Im4+CY28CxzIvpnFbjEsy45
 gQgTOqPikRifvjjk3MtLCf05TEiyJxiqV4NbXRKjIv6xFLoMY5f6MbY0M2w23Ha+cBzV
 Rp6Qyx7gAUzuAUEU6RV4ADctJZiPOCGbxUDCsZLovV6GyVABcszuhfesa2zd4fndttj0
 v+sg==
X-Gm-Message-State: ANoB5pmKNAp5cmFDNWS7ZFSAlokmh0ZPIfYyPuysNyy4mtcpghHXjSIw
 lMBp6XfhUhSi6mwOE6+TV0xpRw==
X-Google-Smtp-Source: AA0mqf4rMQ5IoaeqZxSBWClknQ8RJO+tiaua1Mop1YSfULd72iGpshuFtqP45IWvYkcMSG9XheN5cQ==
X-Received: by 2002:a5d:6e55:0:b0:23a:239b:7e73 with SMTP id
 j21-20020a5d6e55000000b0023a239b7e73mr7200305wrz.233.1668426620997; 
 Mon, 14 Nov 2022 03:50:20 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 x11-20020a5d54cb000000b002415dd45320sm9329910wrv.112.2022.11.14.03.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 03:50:20 -0800 (PST)
Message-ID: <48883bd6-217d-f513-316c-2b5caf486e5e@linaro.org>
Date: Mon, 14 Nov 2022 11:50:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/10] ASoC: dt-bindings: Rework Qualcomm APR/GPR Sound
 nodes for SM8450
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
 <06da072c-8cf0-8181-3c32-4592fe41f9c2@linaro.org>
 <0ee5db9e-d80c-947d-73d6-6214e9299b23@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <0ee5db9e-d80c-947d-73d6-6214e9299b23@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Patrick Lai <plai@qti.qualcomm.com>,
 Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 14/11/2022 07:48, Krzysztof Kozlowski wrote:
> On 11/11/2022 17:15, Srinivas Kandagatla wrote:
>>
>>
>> On 11/11/2022 11:35, Krzysztof Kozlowski wrote:
>>> Adding sound support for Qualcomm SM8450 SoC (and later for SC8280XP) brought
>>> some changes to APR/GPR services bindings.  These bindings are part of
>>> qcom,apr.yaml:
>>>
>>>     apr-or-gpr-device-node <- qcom,apr.yaml
>>>       apr-gpr-service@[0-9] <- qcom,apr.yaml
>>>         service-specific-components <- /schemas/sound/qcom,q6*.yaml
>>>
>>> The schema for services (apr-gpr-service@[0-9]) already grows considerably and
>>> is still quite not specific.  It allows several incorrect combinations, like
>>> adding a clock-controller to a APM device.  Restricting it would complicate the
>>> schema even more.  Bringing new support for sound on Qualcomm SM8450 and
>>> SC8280XP SoC would grow it as well.
>>
>> Why would this grow? All the dsp services are static and they will not
>> change per SoC unless there is a total firmware change in DSP.
> 
> They grow now with SM8450 which requires changes there. Otherwise DTS
> does not pass with current bindings. The bindings before my fixing in
> 2022 were really incomplete. Now they are complete, but:
> 1. Not for SM8450 - this will bring new things,
> 2. Very unspecific as they allow multiple invalid configurations.
> 
Okay, I looked at all the patches, they are fine as it is, the confusion 
part is the subject and comments which are misleading and trying to say 
that these are specific to SM8450 or SC8280XP. Infact this is not true, 
none of these changes are specific to any SoC, they are part of AudioReach.

--srini
>>
>>>
>>> Refactor the bindings before extending them for Qualcomm SM8450 SoC.
>>
>> I dont understand this bit, what is SoC audio support to do with DSP
>> bindings. DSP bindings should be totally independent of this.
> 
> APR/GPR bindings are for SoC audio, so while adding SoC audio the first
> are affected. If you went through the commits here, you would notice the
> changes.
> 
> Best regards,
> Krzysztof
> 
