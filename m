Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C86068FE03
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 04:33:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27B9982C;
	Thu,  9 Feb 2023 04:33:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27B9982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675913630;
	bh=8xHaIkS5UU2j30evv+cANeFKPTep+WlxZ/aGuNUZ4z0=;
	h=Date:To:References:From:Subject:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=avpXTN56Y7+tx0HvBbK2FBUIRhLvpFzb/fw3+j3C6/GdIhlnH45u1b5MAqu/kKykX
	 WPwVYlPxxijBrMMjOqZie350qoS40zJQ1AMmpHMDhjTBu7F077coB7ShlD2/nSW2UW
	 wHC/F8f6Xa5lOn+pLvSWSVDmH381IztnZUJNuOTU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67163F800B8;
	Thu,  9 Feb 2023 04:32:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BD4CF800E4; Thu,  9 Feb 2023 04:32:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFB0CF80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 04:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFB0CF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MNuqZhCz
Received: by mail-ot1-x32f.google.com with SMTP id
 g15-20020a9d6b0f000000b0068db1940216so199630otp.5
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 19:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TEMvm09s+MOEcBQkV2cdEGc/RPpF+hLAWgtl56PMZfY=;
        b=MNuqZhCzwo6TK5asR86HYwtAubo+fRNYZUvjLEW1y7AmpEmAVocQv+xO1AeSCdDcyx
         Dwq+lGVefbiDJPYXr0kIzhwDJ7RHjeJSwf0QeXuAEXIZwCuL3xBm+PDYo/MfIxirhHr8
         sOhdbjF163IO36DvlRqA+08hPMOW0IL6Ipw42YbsYsm9F0xO5m3C7Tp60k3Fe/AaH4Xm
         Lbh0uGzV+MGnMgMWX1rBvaM806DQpCyPme2hOZcHSqiQvjW+CkfRNaeL7L0LneBkgjkG
         pfjnJLZE49vv5a8D+9hjlRzqdLGYJrdcGxYbDxvd5sCENhW+uKm7kb12mzpesFVUm2bh
         fYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEMvm09s+MOEcBQkV2cdEGc/RPpF+hLAWgtl56PMZfY=;
        b=lAY530nmP7ijBodifqZclyEUGrjDO8aDy6LV0r87InF78cCetb91v/tXZNNtnK7lzh
         YoitcWwkKUWsqK1bJkSjcH26lQAMDVSkuUHYPfMu/NtZjpMCKwo+oDI2FD1Pgm0pyiM6
         0dpMH/xBGQBw1LchVOhkABrTqI3dw06sLmlIw4EB1wGZ/C7RB4PkpEfXM9jpR9dmv5c7
         AVsEJJDee6aIVrRJXMkU2LTYIcmqD3pNYg7VwsZGjGZ/fLBVjPPYZ+doV4W1Ycg95S9F
         4JwbZ34TzTRxgioo35fF9T25ktGa5/u1r19G0nV6CJcAQzc7Q+GpcxuPMe6TBLQPArUv
         abgA==
X-Gm-Message-State: AO0yUKWroVVB1aGt5LcrTBQgR/PluvTTHCjFuXZwL9YGFag2h40VldvD
	1j5OrrqMUz5GP+a1AwMrJc8=
X-Google-Smtp-Source: 
 AK7set+2sExWWTyk6BP778EyeeD4E0YKNPgOkKENnPoL2OI0BetCpeAqUF+WleKKxYsJOZqQv2033g==
X-Received: by 2002:a9d:7cc6:0:b0:68d:4568:e83c with SMTP id
 r6-20020a9d7cc6000000b0068d4568e83cmr4943576otn.19.1675913553387;
        Wed, 08 Feb 2023 19:32:33 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 w3-20020a056830144300b0068d4292f4c0sm112545otp.35.2023.02.08.19.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 19:32:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b9e68694-1358-dc96-c31d-7237dc20ab5d@roeck-us.net>
Date: Wed, 8 Feb 2023 19:32:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: David Rau <david.rau.zg@renesas.com>
References: <38f09c4d-70d1-f65f-6e9b-4ad84eda4059@roeck-us.net>
 <Y9kE1cSUg2CQM5vq@sirena.org.uk> <20230202155101.GB1373010@roeck-us.net>
 <Y9vtIISfmpICi+9u@sirena.org.uk>
 <8f89eeac-b3ef-4137-80df-6cf044873b05@roeck-us.net>
 <Y9wQygzbFyOWl54r@sirena.org.uk> <20230204154222.GA877819@roeck-us.net>
 <OS3PR01MB6641CA1DB8524BCA0F9867D9CDDA9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
 <1ba5cedb-0f0f-69a9-96f0-d93ba060745e@roeck-us.net>
 <OS3PR01MB6641BD5C3B3BA89F82245627CDDB9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
 <20230208180406.GB3065515@roeck-us.net>
 <OS3PR01MB66413DBF9B68A28A14B5F40ECDD99@OS3PR01MB6641.jpnprd01.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP
 headsets when playing music
In-Reply-To: 
 <OS3PR01MB66413DBF9B68A28A14B5F40ECDD99@OS3PR01MB6641.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WVT46TGV2QRIQWOADMBC4K445E2HJAJ5
X-Message-ID-Hash: WVT46TGV2QRIQWOADMBC4K445E2HJAJ5
X-MailFrom: groeck7@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVT46TGV2QRIQWOADMBC4K445E2HJAJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/8/23 19:05, David Rau wrote:
> 
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Thursday, February 9, 2023 02:04
> To: David Rau <david.rau.zg@renesas.com>
> Cc: Mark Brown <broonie@kernel.org>; perex@perex.cz; lgirdwood@gmail.com; tiwai@suse.com; support.opensource@diasemi.com; alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP headsets when playing music
> 
> On Tue, Feb 07, 2023 at 02:42:14AM +0000, David Rau wrote:
>>>
>>>> You mean just keep the above two patches and revert 969357ec94e6 ?
>>>> Sure, I can do that, but feedback from the field would take some
>>>> 2-3 months. Is that what you recommend to do for now ?
>>>
>>>> Thanks,
>>>> Guenter
>>>
>>> Thanks for the feedback.
>>> What I mean is just do rollback to remove the "sleep" patch I did in your repository.
>>>
>>> After the rollback, could you please let me know the average number of crashes per affected system with the same test conditions?
>>> Will it still take some 2-3 months?
>>>
>> The msleep() patch has been reverted in R111 and dev releases of ChromeOS. I did not get permission to land the revert in R110, meaning we'll continue to see the crashes there.
>> R111 is expected to go to Beta shortly, so we should get _some_ feedback in the next few weeks.
>> Still, it would be great to get a more permanent fix for the underlying problem. Also, the msleep() patch is still upstream, so a solution is still needed there.
>> I can try to get and play with one of the affected Chromebooks, but I don't think that would help much since we still don't know what the undocumented ground switch is supposed to do.
> Enable the GND switch earlier is needed to ensure the stable and smooth Jack detection.
> 

"earlier" doesn't explain the changes, nor what "earlier" actually means.
The original code enabled the ground switch in the probe function,
only it never re-enabled it after the first insertion/removal sequence.
I don't know the potential impact on power consumption, but an easier
and more straightforward fix might be to (re-)enable the ground switch
on jack removal and to keep it enabled while nothing is inserted
(assuming that helps with detection).

The new (current) code enables the ground switch with each interrupt,
even if that interrupt is a button interrupt. That is really difficult
to understand and doesn't seem to make sense.

A diagram such as the one in Figure 20, describing exactly when the
ground switch is supposed to be enabled, would help a lot. It would
be even better if that diagram provided information about any extra
delays needed after e_jack_detect_complete is raised and before the
detection code actually runs.

>> Thanks,
>> Guenter
> 
> Thanks for the kind explanation and feedback.
> I am verifying another method which do the msleep() in the individual schedule work to avoid such crash issue.
> 
> Would you please let me know how to reproduce this crash phenomenon?
> Then I can ensure the new solution is stronger and solve this problem as well.
> 

Sorry, I can't, because the crash reports are from customers and automated.
We don't know what they are doing, only that whatever they are doing
causes the hang and thus crash.

Thanks,
Guenter

