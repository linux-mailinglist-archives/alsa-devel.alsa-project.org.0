Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC13596006
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 18:21:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92DF9823;
	Tue, 16 Aug 2022 18:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92DF9823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660666878;
	bh=/8UKe6xcd6f6NV4oKHehJI995AyE99GMzAmsIs1ug+k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rdJNovaYqbNA6qXj6p0uorz19Kx8TfiO0VJiMPIHwAM/KKa1L7BUAQ5+BkKvS8Eti
	 s/C5k7M6tCG/WmTh/nYGG3AkI0JcVCwSYK13mKKmV844ITXV3gXl1A0nTmby8UqUJo
	 8OH2upqTWXX3FkE2AYyPM+OrOjejiHcCROj+V6lo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B747F80238;
	Tue, 16 Aug 2022 18:20:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFAFEF8032D; Tue, 16 Aug 2022 18:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAB66F80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 18:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAB66F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FQhw3XH/"
Received: by mail-wr1-x42d.google.com with SMTP id bs25so13256815wrb.2
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 09:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=gbXM1KkO+JMEsO7PjJQIrzd+QplUC3zIBpc+Ma15QMM=;
 b=FQhw3XH/CDY6jjr6rWG3012JTMajCR+3Yo8AnO/BjqHPOYe8BkQ+snTJ4fDEKSHxmZ
 SabPrGyz0isuQoFQ6Y7PgxXnNu+54C6vbIKhwQazq91oxyPqvZHrPmwuBl/KBHeYJMzd
 NzvCMdYuOSDV4YPPln1w3tIkOOEGQlb4M3e7N8ZFg+CLHqXqGTjd0DbNsIzZyXiG6Pkz
 j8aaLypvLt68etblBoOto1A/vPHLF/R6HBEx0yrDlZExpUZV96t9XNejUi8JD1UMwm3C
 9nH2U6FbCA1DOuKbxM904Ka91byTMPHvB3gRxc7hivVZa5WP4I2B4MJUpUo+H1Tweu/h
 B31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=gbXM1KkO+JMEsO7PjJQIrzd+QplUC3zIBpc+Ma15QMM=;
 b=ij9R3WyiZbzvuwJ3Q4mI3ykxVIDWEn/7WuZVLGo64Oym3ZSH+VRGVMXY8KDjlcmRsr
 1Gckti1mJMKn3tw5WQb1SNnF7MYYWLDHbJBHNFsFDyAfXf2vCb13rey2JFvQlfDz5kQ/
 vY3ZYCf+JrJVs4tbQy7FoXHfIA6LOgj0GZKfM3GQr8SKmB6PhnZCW2WfvM7oK0L+QfWZ
 haPnh9NCQxFziFZeMZOvu/a607sPhXmstsKaDT3LvLuDiQr6Avntp3pDQ29k9Qr3BHcp
 gYzvDPwgXQ4B1BU4s0Y47wT/eXMBYVms6mwSa+jpYg1A6NQMefJUXHv4YJbpLCXEx6Pi
 k/rg==
X-Gm-Message-State: ACgBeo0QtXUL9xNjxzJe4C9k2uF0FGlREXDjd3ZjAYWIJfoVjlgSAJ6Z
 oHUuZPLMaWnl61XhI3VUmeSnbDVQXRoIcw==
X-Google-Smtp-Source: AA6agR6nOnwbR1jBtTT1ppkOGJDAMCUSphgOmKa4gNqt4e13XCB6mwMliBKKpuD8aFvRhyERXFcuUQ==
X-Received: by 2002:adf:d1c7:0:b0:220:744f:a13f with SMTP id
 b7-20020adfd1c7000000b00220744fa13fmr11543879wrd.569.1660666813699; 
 Tue, 16 Aug 2022 09:20:13 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 bx5-20020a5d5b05000000b00223678fe95asm13578998wrb.18.2022.08.16.09.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 09:20:13 -0700 (PDT)
Message-ID: <14f04003-7300-7d49-be51-e8341f699cda@linaro.org>
Date: Tue, 16 Aug 2022 17:20:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: ASoC: snd_soc_info_volsw and platfrom_max
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <b5c31f8e-9401-6ec1-cfbf-3b0977df6fc2@linaro.org>
 <YvuXeJ+/TnB0kojz@sirena.org.uk>
 <dac14248-39d5-d629-dd4a-92e9c22ea096@linaro.org>
 <Yvu+JiGg+1dLemo8@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Yvu+JiGg+1dLemo8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel <alsa-devel@alsa-project.org>
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



On 16/08/2022 16:56, Mark Brown wrote:
> On Tue, Aug 16, 2022 at 02:44:47PM +0100, Srinivas Kandagatla wrote:
>> On 16/08/2022 14:11, Mark Brown wrote:
>>> On Mon, Aug 15, 2022 at 10:22:37AM +0100, Srinivas Kandagatla wrote:
> 
>>> The issue is that it's not clear if the platform_max value should be a
>>> value for the register or a value for the control.  For some reason
>>> (which frankly is the source of a lot of the problems here) the controls
>>> adjust the user visible range to be zero based even though the ABI would
>>> be totally fine with any range.  There were out of tree patches that
>>> changed things for some of the control types too.
> 
>> Only Instances where platform_max is set are via kcontrol builder macros,
>> which then always sets this to xmax.
> 
> Those macros just shouldn't be setting platform_max at all, the whole > goal with platform_max is that it overrides what the driver is doing for
> platform specific reasons.  This is supposed to be overridable by the

Ah,

Do you think we should remove setting platform_max from these macros.

Am hoping that this should also fix the issues that am seeing.

--srini

> machine integration, but looking now it looks like it's got lost in the
> shuffle, I can't see any mechanism to configure it via DT or machine
> drivers right now though I think there might be some out of tree drivers
> that do it or perhaps I'm doing the wrong greps.
> 
>> And none of these macros have provision to pass platform_max these are
>> always assumed to be xmax. Which am not sure is always correct.
> 
> That's entirely correct in that if it's not been overridden by the
> platform then we should just use whatever the driver provided.
> 
>> -	max = uinfo->value.integer.max = mc->max - mc->min;
>> +	max = uinfo->value.integer.max = mc->max;
> 
> Don't do double assignments like this, they're confusing.
