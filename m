Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8086E9AC0
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 19:28:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70011EAC;
	Thu, 20 Apr 2023 19:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70011EAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682011724;
	bh=v44yxa1eEzkJAnDFniDn3bIqqJuGRa9zK4RIIig8/NQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FsbmIWWMr1jUh6EXc0Gj5Q5fVCOiIECAMRbsUbX3cBnk+dLMNkbxLV/odYYg/F8qM
	 7TlxW2oxgSOBfCESBCJYyqrTGYMW/J3g84uO4vxfVFBICrFpe+sOJNPnKMexToUJzV
	 DsJnPlJ8Pdzek69HfxK2IkFGl9qPRjsimGzREd2M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A6A9F80149;
	Thu, 20 Apr 2023 19:27:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E7B2F80155; Thu, 20 Apr 2023 19:27:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34226F800AC
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 19:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34226F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LQ92EKM0
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5052caa1e32so1164831a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682011666; x=1684603666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qs3hS1zEcbd6LvW4gA839iJscm7oDwTflWd6VJTMIkA=;
        b=LQ92EKM0FhI2a7WhS8KC2S2HlkKIfkw4TWDVyq4861pzjOA3488Sb2Jm9+FJFTSDfd
         vO4WIDkoHElxe4j9hWc4dgkfd0wocJjCUoH8KLEZdL64v+BAxCo6SQZURV4Xx1STy7Wz
         VkOYdPU54A0vrdCRPzGP6/ZVCVc4VV4O2dRhOxe46kd3JLC8Io5w1UcqgRUhOpA9JHJD
         tYDLXvpnCCtEuJK/kz935CIr6N+r90q2bO0DG1oDrHYhffo53xdtbHHAp4f/tXgZlFnn
         QxqA3UFM1nVZf2abwDMejQ/G0xeSA95ZRG6N9NpcvziK/H9r9EJzR9MUZylimVb5X5SV
         C9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682011666; x=1684603666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qs3hS1zEcbd6LvW4gA839iJscm7oDwTflWd6VJTMIkA=;
        b=R+KfjrBfAFT0wsgVcceZvOh1/4K6KuEPqaxEBBLIqbMFsw0S7uc7VmYc9tQ06cmvwf
         8jFJkVRZKW2aibOvgtL90mgr65kgA1GZUt9oQ2mob1bpQbmtfZx5h+yPlAXYgQrb7ZoL
         PtgxCLyU6lDhjcifObIvpTEflaFxmqmN+3L1wP1FKV2uyn9gW9C0+2j53YRl0hidr/1Q
         6xgdQumobUloPL4KWDuAJTl27bcla3k6EXJujle+ElT6zmhLHSsPjsO3GDNPrNQ1cysG
         iRHomGEHNk6JsohaGvyMCahhvNQ/z4mj52VNpKWJCDkQ1fBEyPiejVv8Huw1PVfmrRH7
         ABHQ==
X-Gm-Message-State: AAQBX9dC6FgiuGa/lutysPqq7f5CIGPgPuri96qQohwEf0RE6PPabRfM
	Qe87V+YXbT+ghcNvZvfmCL5RVw==
X-Google-Smtp-Source: 
 AKy350YOpwmLNpt73flS8U2L5sl5fGklkf6iG6tZDTuKotTJFGawChDefw8Dm8dZ67D8xoCc5A+Ozw==
X-Received: by 2002:a50:fa89:0:b0:4fa:b302:84d4 with SMTP id
 w9-20020a50fa89000000b004fab30284d4mr2418861edr.13.1682011666275;
        Thu, 20 Apr 2023 10:27:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771?
 ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id
 y10-20020aa7d50a000000b00506a5606343sm963515edq.14.2023.04.20.10.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 10:27:45 -0700 (PDT)
Message-ID: <beaec77b-9a61-6afd-59fa-fa726cae7a54@linaro.org>
Date: Thu, 20 Apr 2023 19:27:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/6] soudnwire: master: protect concurrecnt check for
 bus->md
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-6-krzysztof.kozlowski@linaro.org>
 <7ee41bcb-8656-49ec-40b6-15072c080d08@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7ee41bcb-8656-49ec-40b6-15072c080d08@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MHTATPHW6A7VVMARINZDPK3UPJNHHNQO
X-Message-ID-Hash: MHTATPHW6A7VVMARINZDPK3UPJNHHNQO
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MHTATPHW6A7VVMARINZDPK3UPJNHHNQO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/04/2023 18:42, Pierre-Louis Bossart wrote:
> typos in commit title...
> 
> On 4/20/23 05:16, Krzysztof Kozlowski wrote:
>> The Soundwire master controllers might want to check for bus->md
> 
> Apologies for being pedantic but 'manager' and 'controller' are
> different concepts in SoundWire, see DisCo spec.
> It's not a 1:1 mapping, a controller can rely on M managers

I wrote master, not manager. For the Qualcomm case one controller is one
master, but in general I try to avoid the master/slave terminology.

> 
>> initialization to avoid race between early interrupt and finish of
>> sdw_bus_master_add()/sdw_master_device_add().  Such early interrupt can
>> happen if Soundwire devices are not powered off during their probe.
>>
>> Add a store release barrier, so the Soundwire controllers can safely
>> check it in concurrent (e.g. in interrupt) way.
> 
> Can you elaborate on the race condition? I am not following what breaks,
> and what entity generates the 'early interrupt'.

The condition is explained in next patch. If you think it's better, I
can squash it with next.

If the condition is still not clear, drop a note in next patch, so I
will elaborate there.

> 
> I am specifically concerned about adding this in common code without any
> matching smp_load_acquire() - which is only added in the following patch
> for the Qualcomm manager only, but not added for Intel/AMD managers. Is
> this not a problem?

Shouldn't be. The barrier just won't be effective for these drivers, but
that should not be a problem, because I also did not add to these
checking bus->md in a concurrent path.

Basically the barrier here is necessary because I want to check bus->md
in Qualcomm master interrupt handler.

Best regards,
Krzysztof

