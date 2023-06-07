Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C40C725AB4
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 11:37:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F809829;
	Wed,  7 Jun 2023 11:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F809829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686130667;
	bh=e5ZDWg65zcn6OAN6+N7FQofLIq54ybR4U3WZj1238r8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g4TEKyheebT27LpuHLI4vUz9ysdpzKi9TzC7i7p8uURYWlPIrMNyjdwGrneUcRMog
	 M7DUa5eDyxKPAHO8jRhBk1poGntwXOIV9H/D/MKV2w4Wgu/IiSwkFT1Lk1c0nbXTzy
	 COZzx1ppcgFypGEUrp679NVA4LxCQcM3trnCleHU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B42EEF800C8; Wed,  7 Jun 2023 11:36:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CD7EF8016C;
	Wed,  7 Jun 2023 11:36:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E26DBF80199; Wed,  7 Jun 2023 11:36:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB673F800C8
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 11:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB673F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yDyHzNuB
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30e53cacc10so811110f8f.0
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Jun 2023 02:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686130602; x=1688722602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uusdi9NyZqH+4XykGUPpTlNUQQewoUsasR8qvPU4tuE=;
        b=yDyHzNuBaw1TucGZ+SQX1GRqIUhxFfugr5lx4DYLakMuAZQIr4dsGh6XFN8lqUZEBV
         lDPGLCvJFyi5cZJkbu3Ji5PK3xVte+RAp5vlbbNOMEZLVHaBQkCcr9R3lbjTVRxvtsBM
         W+90Ve1RNJjxyo/vjIZtNY9XQrvkMSNuzXFS5sxn1fA9wmZwh4orWuIpyN4fvgAdFTY+
         ZbYrzDm/CK+mlQTaD2iOGI5bf6IAOxSRBYrNCoq7UlPhzcGlRyqEgTmz9c7YymxPL9/C
         Id5Tfy+THCUB1EghpzieWfNjDDAq0SbOkEeBjRP2LcS3b2bNKPTCu/L7ov6qC+/uohKc
         F+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686130602; x=1688722602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uusdi9NyZqH+4XykGUPpTlNUQQewoUsasR8qvPU4tuE=;
        b=I2CCGjUxoqiqTvjl3pesG4NZAwqKKc6cO7BNbeCPzMIqhstj+XUlRaI5eyX95UNIrC
         jXU9J6EGT0uBaxZT7P6/mayRTjtZv8oj+Zn2uI83s96nqef7QKez17PntbbBbm6gqaPj
         rRaoLpzM3+7VB/YArvB77T3+3GLdlAWSL5yjDyG6gUdQLznONMCUjAeSbRsuA4KGGrCe
         OaZqol44iD9GfVFyENB3dMFyHqKv01avBjf2baobMO1Nspb2rOlvgxmRMJz1qZks1gbC
         aaGLoKuU8KyqSupWNU4RlH8OIljo+tpEqd4qvJE7YecUopJb6rmIIz3I1u2ttl4kQsrW
         zTXw==
X-Gm-Message-State: AC+VfDwlupvIfs9Zr0qmTMAIe/oiWjdpPX1/CgUSoAEf1IGI5CYM9sv0
	LvHoo1xc3ng5AQmgI1D7ZpNKSg==
X-Google-Smtp-Source: 
 ACHHUZ6P6/DuMu8DxYUDW/YBCvycHYo0qaPj8RiltXuvqGHDvtUQHEwff2rgy4PsUKrAevxyaV0D9w==
X-Received: by 2002:a05:6000:d1:b0:30e:46c3:a179 with SMTP id
 q17-20020a05600000d100b0030e46c3a179mr3906921wrx.30.1686130601877;
        Wed, 07 Jun 2023 02:36:41 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 d8-20020adff848000000b0030ae849c70csm15019251wrq.37.2023.06.07.02.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 02:36:41 -0700 (PDT)
Message-ID: <5d6bcc6a-151e-ac21-2dd2-f72a91f562d5@linaro.org>
Date: Wed, 7 Jun 2023 10:36:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/4] soundwire: qcom: stablity fixes
To: Johan Hovold <johan@kernel.org>
Cc: vkoul@kernel.org, andersson@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230525133812.30841-1-srinivas.kandagatla@linaro.org>
 <ZH2l-UbMyLi5Uwph@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ZH2l-UbMyLi5Uwph@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5CQW5UTM4VYOLS3EPFJKRWMDOCEW4TDN
X-Message-ID-Hash: 5CQW5UTM4VYOLS3EPFJKRWMDOCEW4TDN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5CQW5UTM4VYOLS3EPFJKRWMDOCEW4TDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 05/06/2023 10:08, Johan Hovold wrote:
> On Thu, May 25, 2023 at 02:38:08PM +0100, Srinivas Kandagatla wrote:
>> During x13s audio testing we hit few corner cases due to issues
>> in codec drivers and some obvious code bugs.
>>
>> Here are the fixes for those issues, mostly the issues are around
>> devices loosing the sync in between runtime pm suspend resume path.
>>
>> With codec fixes along with these fixes, audio on x13s is pretty stable.
>>
>> Thanks,
>> Srini
>>
>> Changes since v1:
>> 	- dropped runtime pm changes patch as unable to reproduced it anymore
>> 	- fixed clk stop flag as suggested by Pierre
>> 	- rebased on top of linux-next
> 
> I tried to update to this series on my 6.4-rc5 branch for the X13s and
> the above changes appear to lead to breakages again.
> 
These patches are based on linux next, we can not cleanly apply them on 
rc5 i guess without the depended patches.

I have tried these patches with your rc4 branch along with other 
depended patches my branch is at: 
https://git.linaro.org/people/srinivas.kandagatla/linux.git/log/?h=wip/sc8280xp-v6.4-rc4

this works fine for me, not seeing any issues so far.
tested both speakers and headset.


> Specifically, with the updated clk stop flag (simple_clk_stop_capable) I
> see:
> 
> [   14.789533] wcd9380-codec sdw:0:0217:010d:00:3: Slave 1 state check1: UNATTACHED, status was 1
> [   14.789717] qcom-soundwire 3330000.soundwire-controller: qcom_swrm_irq_handler: SWR bus clsh detected
> [   14.796164] wcd9380-codec sdw:0:0217:010d:00:3: Slave 1 state check1: UNATTACHED, status was 1
> 

> and without the runtime pm patch that you dropped in v2 I get
> intermittent (e.g. twice in five boots):
> 
> [   11.527301] snd-sc8280xp sound: ASoC: adding FE link failed
> [   11.527409] snd-sc8280xp sound: ASoC: topology: could not load header: -517
Never seen this, looks like some corrupted tplg to me.. I might be wrong.

> [   11.527557] qcom-apm gprsvc:service:2:1: tplg component load failed-517
> [   11.527640] qcom-apm gprsvc:service:2:1: ASoC: error at snd_soc_component_probe on gprsvc:service:2:1: -22
> [   11.528079] snd-sc8280xp sound: ASoC: failed to instantiate card -22
> [   11.533388] snd-sc8280xp: probe of sound failed with error -22
> 
> Again, this was with 6.4-rc5, but these problems are likely still there
> also with linux-next.

Have you tried linux-next?


--srini
> 
> Johan
