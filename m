Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4187F914A36
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:35:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D807D84C;
	Mon, 24 Jun 2024 14:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D807D84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719232547;
	bh=rZnyITRnxDG6Nk4huYfxna9K9Qbnrk3RLW9XoXc0NcI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VW462U+0yBL1K03UiDYPzQPWYZRbaJltKsjxnczhIWhcVWOSBLZsLxlqBd/g/+WHg
	 DdpijgbnP6YFlocRhlty/596jblcx+wmxOwHPbPjMexVt13Ov7Cr7RUes2akp43WSI
	 nbiY1810UuSsNgvoIMD5v0kuYHq+Ii7Et2lHXRqM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80E47F804D6; Mon, 24 Jun 2024 14:35:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 840F1F80589;
	Mon, 24 Jun 2024 14:35:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC4AFF80495; Mon, 24 Jun 2024 14:35:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F339BF800E4
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F339BF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wyvDXFGT
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-424798859dfso35681885e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 24 Jun 2024 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719232507; x=1719837307;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQUUsxjRwH4QDpNTDMmqo2rmvQGvXKLqsN4S6BTa2C4=;
        b=wyvDXFGTthd2cIOe1LHnoQCmmQoHFl7OoFQEsCn10lGLLtHtK3CXlOOUXMkrg7+lad
         +u9iDOIFZIIEXIpPvk1qCYiiOEYH1Hnk9YHAKSVT88sdzlSiB43gpUes6mVxrokniPPp
         JudBI3H2eaxuu+XrJhMt1b48+Od2RKPmyV2dkDdv2SLzcaK9kYO2nwXZ4hANjsOGx3dk
         l4gXGAEcsqLaaKTkYdQ/K1z8bk3+4xiBqxK+odSMNevJUjRCfDP0vJ/v5l17GtGeBVNC
         gU/EYQVz/s0zdsKM40pHo26D1BTQyi55FzESSuuj2PvvEQZ/yxohX6x56MT85dcd7jeg
         HLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719232507; x=1719837307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQUUsxjRwH4QDpNTDMmqo2rmvQGvXKLqsN4S6BTa2C4=;
        b=Z16Dvl5ViivdJL1HwHrLv5tvHzMgAA6Xu3WroGzCa5Ak2yphBWAJ//2edyvL/c4aFe
         0BSQGDcflNBgQHGC05LaK9JrkCkY4ydyjETP+aNAd95LZyVHzjfuQ4QaZ315LowmwMBB
         hfwNWvdqVxHi4AxmIux4q9fTnJJ8wPFqfa3fQDuzeIDtUxaFTYfJ96t7n6NJDCrOi8Th
         RZ5EQsUaqdZFZru+R5MHKKsjZCnGSuwlHcDViwZbkf0c8I6/BRXUahQSkLnS8+8Jt792
         y7qmTNeExY6dgcNIgnOjI1vIk1+U8UHhOl67Ap3lMCJz5OiQ3ZV3Fh46WwFe5SyJT1We
         Bogg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuC2NAWjB8QLgWQqpnVny+BtvbEy5Zv7njR/Wn4B7zGCzgf/vEb/MuS7ctc3DRzkmfzL5+8ibOpMyqJYsJFB7LKUhBOF1+j7p+xYM=
X-Gm-Message-State: AOJu0YwciXuascx3RXWr0rl9G6eGJtbhI67fPUnru9Ij5AtPtQ/YHwK2
	dnvVjQZjNHTcAZK4t/BJ/B/AoOqTvDYK6jcGa9ay0pyGaxorLjfgfOF8hvPEqjY=
X-Google-Smtp-Source: 
 AGHT+IF7U0TSjuU2VtHCgQSadIQvNwhYOOe7AZZqFDBcNxrvKuelGClpZLjx79kGC+fjpLQNkiUjVQ==
X-Received: by 2002:a7b:cc89:0:b0:421:7f4d:525f with SMTP id
 5b1f17b1804b1-4248cc35da7mr30272805e9.24.1719232506864;
        Mon, 24 Jun 2024 05:35:06 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4248179d506sm131135415e9.6.2024.06.24.05.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 05:35:06 -0700 (PDT)
Message-ID: <fe75671f-c292-44b7-9024-15e0825c55c2@linaro.org>
Date: Mon, 24 Jun 2024 13:35:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of
 enabling vi channels
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manikantan R <quic_manrav@quicinc.com>
References: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
 <20240619-lpass-wsa-vi-v2-2-7aff3f97a490@linaro.org>
 <hz5eqta4ttzsnwttqzqrec4vcwvyleoow7thoiym3g3wjsfqk4@tx23nktde3gh>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <hz5eqta4ttzsnwttqzqrec4vcwvyleoow7thoiym3g3wjsfqk4@tx23nktde3gh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UFBEDVLDEO2LT5R5BSY3HLIJTILBAFOM
X-Message-ID-Hash: UFBEDVLDEO2LT5R5BSY3HLIJTILBAFOM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UFBEDVLDEO2LT5R5BSY3HLIJTILBAFOM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 20/06/2024 21:28, Dmitry Baryshkov wrote:
> On Wed, Jun 19, 2024 at 02:42:01PM GMT, Srinivas Kandagatla wrote:
>> Existing code only configures one of WSA_MACRO_TX0 or WSA_MACRO_TX1
>> paths eventhough we enable both of them. Fix this bug by adding proper
>> checks and rearranging some of the common code to able to allow setting
>> both TX0 and TX1 paths
> 
> Same question. What is the observed issue? Corrupted audio? Cracking?
> Under/overruns?

two Issues with existing code which are addressed by these two patches.

-> only one channels gets enabled on VI feedback path instead of 2 
channels. resulting in 1 channel recording instead of 2.
-> rate is not set correctly for the VI record path.


--srini


> 
>>
>> Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
>> Co-developed-by: Manikantan R <quic_manrav@quicinc.com>
>> Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/lpass-wsa-macro.c | 112 ++++++++++++++++++++++---------------
>>   1 file changed, 68 insertions(+), 44 deletions(-)
>>
> 
