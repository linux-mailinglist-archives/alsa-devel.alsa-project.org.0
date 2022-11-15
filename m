Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F97062982F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:09:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC4116C6;
	Tue, 15 Nov 2022 13:08:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC4116C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668514155;
	bh=89ZLLA8ymh67/EjYa5Ge2hkIKzBt0OduF6Czam58yew=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U6Y6HCrCGKWPfL/rjoX2f/RapdserYGMDm0X2qyAFdwmmToPQT5MYAPlDZlCZUo/7
	 z+661nm2HwLTU/8YUAIjnV0ULugY1xNN5Fj9YLIEdtZ4VxOEiE8poV4uENjWPUJE+H
	 u9+hTz5lA8f2OKHoRL47iTxKP0Wh04CUETJtlfMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5516BF80538;
	Tue, 15 Nov 2022 13:08:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB109F804DA; Tue, 15 Nov 2022 13:08:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AD63F80171
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AD63F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DsZVqsEJ"
Received: by mail-lj1-x22b.google.com with SMTP id l8so17196150ljh.13
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q8PyRlStPYbAJWRM87qU7tA+FqO3HKkAnH1g3kIJaJk=;
 b=DsZVqsEJuLaKOnANywBtEw2nKvRSgNstBz8Cl8JaW+p5IHYPd6gRYjb/jsXu5cpHYz
 2tUknyItouXSOsSOqvBMbAQ8HZr+kvySJNpxPb0U92C39OluSP9uEf9P2wEKUgAxZZGm
 fSQW1sQFJGumswMpTh48P2++EsDWA17TOZOWuvBAnenX4122MWoot+bLbsR9+G7OMFaG
 9ocaZuYCXcn26OeY+Pa/VR2bEYJI+h+tI99SiA1DMBG7l6jMRpwF0HubpqMtL7SguaqU
 6nre2rLNkTfaDY5482HPH09DfXjsNFW8wpXxVSm8pq1DUwK6YyZCDfG8/7TzexD+bh5G
 bi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q8PyRlStPYbAJWRM87qU7tA+FqO3HKkAnH1g3kIJaJk=;
 b=S2By6dH5ZY9B878h8WUNKiQHE1FYMA6wv1joc86C6dDOX4R8Dtenb2NCPJMKsNOx8+
 SdGPa7O0lRbPR3BvedbNjJtEcKrtWRQN7DBXJilWlu5krP17dWoIU/ETsxKpspaqaTJW
 LFDFczvaht8Ia2l3kxsAq62kVFBtNWUq44Ha4bBueMcG6z0p8h3b7qqdaflUepZCbMJh
 GaIaHBZxK67q4VPhJV0IsDTK51TKm1AwhInfq6rA3AR/mbgjaJ+1OYs75f8YF726eYlf
 F+haCGGwhlsHKXxO8RRXeVJVeRdqmN3i3ksJzdPLPcjMGKffuU5Z6IqiRZR1vTBkn6oQ
 93/Q==
X-Gm-Message-State: ANoB5pkjLvaLfu3jp5Pngt+lDa0bwpOGDDu9gdLpWe2wCla0NPleoDVo
 l9UROApL2trinIT9zkULoK6zRA==
X-Google-Smtp-Source: AA0mqf6fSvU7PcnZ00D/QL91D6QVoL7V7qXZu/elf2E5OJILUd6PxxnHN7RtexFXSVWtf+mdDHj5GA==
X-Received: by 2002:a05:651c:1947:b0:26d:e863:2f71 with SMTP id
 bs7-20020a05651c194700b0026de8632f71mr5534448ljb.170.1668514090408; 
 Tue, 15 Nov 2022 04:08:10 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a2e84c9000000b0026dced9840dsm2413975ljh.61.2022.11.15.04.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 04:08:09 -0800 (PST)
Message-ID: <a58094da-cbec-2dc2-38ee-52c0cba6b90a@linaro.org>
Date: Tue, 15 Nov 2022 13:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Thanks to [PATCH V4 5/6] ASoC: dt-bindings: Add schema for
 "awinic,aw883xx"
Content-Language: en-US
To: wangweidong.a@awinic.com, broonie@kernel.org, perex@perex.cz,
 alsa-devel@alsa-project.org, tiwai@suse.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, quic_potturu@quicinc.com,
 pierre-louis.bossart@linux.intel.com, cy_huang@richtek.com
References: <000701d8f8e7$4e01bc20$ea053460$@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000701d8f8e7$4e01bc20$ea053460$@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: duanyibo@awinic.com, yijiangtao@awinic.com, zhangjianming@awinic.com,
 zhaolei@awinic.com, liweilei@awinic.com
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

On 15/11/2022 12:42, wangweidong.a@awinic.com wrote:
> Hi Krzysztof Kozlowski:
> 
> Thank you for your advice, I will change these questions

This is not a proper reply. Threading is broken.

(...)

> 
>> +    maxItems: 1
>> +
>> +  sound-channel:
>> +    description:
>> +      Number of sound channels of the aw883xx chip
> 
>> Your description does not explain me much. Number of supported sound channels is usually fixed in the hardware, thus coming from compatible.
>> Therefore this might mean something else... but anyway your driver does not use it really, so just drop it.
> 
> 
> I will delete this description in patch v5

No. Drop entire property.

Best regards,
Krzysztof

