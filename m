Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7332D7A94A5
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:22:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 763DBDF8;
	Thu, 21 Sep 2023 15:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 763DBDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302575;
	bh=dyfkuaW96JUbGCPSI7cEv/R52zW97QQ7VVGfIi+QnLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L5LveALM5lqJPRd5SyI6qikB+TdvPqE75ZLnEdtcvnLuT2XJCbIfmf6yGvow+q6CB
	 pN1vby943uUzSrsY6rTV8OAE7a2CVFQQkWlPnzFeTR50ITDtXbKgzjm1Obb1zELB3k
	 hnE62bF3gYvOm6W67HAFL7c6Nxv1kfhsv59niXK4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE572F8057A; Thu, 21 Sep 2023 15:21:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECC96F80571;
	Thu, 21 Sep 2023 15:21:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79446F800F4; Tue, 19 Sep 2023 10:49:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 911A2F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 10:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 911A2F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jQIESUDz
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-404724ec0dcso14178065e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Sep 2023 01:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695113392; x=1695718192;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exiMKXlmKqEZjAmWh24CVE5oMgfZfVOUNfwCFRqqxrU=;
        b=jQIESUDzk5pb/1NMkkeI5yNQWNRM+ysi86LQTOdRDSYTiA0e2XqikqguhwvcQ6UGWx
         xfRijGV9QOhnmKtIDquhQYGm7lyrZ+ujV3eg5PNH6nCbkfaTA9ILkTRCKgRWrw4lXVH1
         9tQ8eFpja6FoaaWd5UUsiKE4rLlXim++1pW++lIb5W/ZNlCwMXu3Oa4FZi2q4zawEU6f
         DSxpctPAgMuKSu72ZEXPIMI2u4dqj7sslqJWOXrLG9UXmaJuv/fD3bkMzjAl25EEC7Tj
         TKSsUc1rl6FuIrALTXr4hMVjOPVmLz7Hj357CMtaKzIWrDL+hk7R+FuY9uzO7jf1Nxij
         3P9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695113392; x=1695718192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exiMKXlmKqEZjAmWh24CVE5oMgfZfVOUNfwCFRqqxrU=;
        b=VAoerkOqfcEBt8KbrbNFibcs00K+dQ/nr1om7w3W9cmNv7RXx5AwsB7o4WG15zmDsS
         89pvlX1cOH6wXZPrOqahujZCrVC5tUhsCag2c8S/w0AQTUvcZMJJdtqZyh/OTCO+fxnn
         tZgM3AJOp/WD+PlSIdHPwT8kA5iMvMQyKcbnTjfN/6FovRKco71UjVKUFQEoHmnr3NA/
         8wi5Kkc4+uvTLoBwE3E9p6YNGoFzP87IiUV7e90uqERc7bkUup6A5iSG5dpI8YRiqoq8
         GfCQ6x6GfqjUNkOHx3wPNkF8wd6UPWpAOUNQYaqtxq9yswr6gJphuT/V/IAUd7NHGCAg
         3VEQ==
X-Gm-Message-State: AOJu0YwJGn1nOpA4Mdn1pXT4yZVQulX6+RGQrX1duSnXmSqFXGbBx2fV
	yzQI6Q1LtYrGamBomOQgLWw=
X-Google-Smtp-Source: 
 AGHT+IFSaZXdS6lNtcobsxSr4Tq131VXS6gtxOTc+ltT4kbOMLdLQVVah9+36WNOCjKJUKpGxTTu/Q==
X-Received: by 2002:a05:600c:3ba3:b0:3fe:dd78:8fbc with SMTP id
 n35-20020a05600c3ba300b003fedd788fbcmr10297405wms.3.1695113392326;
        Tue, 19 Sep 2023 01:49:52 -0700 (PDT)
Received: from [10.0.0.26] ([178.160.241.68])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1c6a16000000b003fbe4cecc3bsm17296088wmc.16.2023.09.19.01.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 01:49:51 -0700 (PDT)
Message-ID: <cfd84f9f-a549-a90d-5a24-b4f36ab085df@gmail.com>
Date: Tue, 19 Sep 2023 12:49:49 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/2] ALSA: docs: Add Marian M2 driver documentation
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
References: <20230918181044.7257-1-ivan.orlov0322@gmail.com>
 <878r92bnnx.fsf@meer.lwn.net>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <878r92bnnx.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: P3P62INMAVNTTSR4MCO5DO6J2WNK2DY3
X-Message-ID-Hash: P3P62INMAVNTTSR4MCO5DO6J2WNK2DY3
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:21:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3P62INMAVNTTSR4MCO5DO6J2WNK2DY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/19/23 11:57, Jonathan Corbet wrote:
> Ivan Orlov <ivan.orlov0322@gmail.com> writes:
> 
>> Add documentation for the new MARIAN Seraph M2 sound card. It covers
>> current development status, available controls of the card and
>> information about the integrated loopback.
>>
>> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
>> ---
>> V1 -> V2:
>> - Remove redundant documentation fix from the next patch in the series
> 
> One quick comment below...
> 
>>   Documentation/sound/cards/index.rst     |   1 +
>>   Documentation/sound/cards/marian-m2.rst | 104 ++++++++++++++++++++++++
>>   2 files changed, 105 insertions(+)
>>   create mode 100644 Documentation/sound/cards/marian-m2.rst
>>
>> diff --git a/Documentation/sound/cards/index.rst b/Documentation/sound/cards/index.rst
>> index e68bbb13c384..e873592d8d00 100644
>> --- a/Documentation/sound/cards/index.rst
>> +++ b/Documentation/sound/cards/index.rst
>> @@ -19,3 +19,4 @@ Card-Specific Information
>>      serial-u16550
>>      img-spdif-in
>>      pcmtest
>> +   marian-m2
>> diff --git a/Documentation/sound/cards/marian-m2.rst b/Documentation/sound/cards/marian-m2.rst
>> new file mode 100644
>> index 000000000000..bf12445e20d7
>> --- /dev/null
>> +++ b/Documentation/sound/cards/marian-m2.rst
>> @@ -0,0 +1,104 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=======================
>> +MARIAN Seraph M2 Driver
>> +=======================
>> +
>> +Sep 18, 2023
>> +
>> +Ivan Orlov <ivan.orlov0322@gmail.com>
>> +
>> +STATE OF DEVELOPMENT
>> +====================
>> +
>> +This driver is based on the driver written by Florian Faber in 2012, which seemed to work fine.
>> +However, the initial code contained multiple issues, which had to be solved before sending the
>> +driver upstream.
> 
> Sticking to the 80-column limit is best for documentation, especially
> when there is no reason to go over it.
> 
>> +The vendor lost the full documentation, so what we have here was recovered from drafts and found
>> +after experiments with the card.
>> +
>> +What seems to be working fine:
>> +- Playback and capture for all supported rates
>> +- Integrated loopback (with some exceptions, see below)
>> +
>> +MEMORY MODEL
>> +============
>> +
>> +The hardware requires one huge contiguous DMA space to be allocated. After allocation, the bus address of
>> +this buffer should be written to the hardware register.
>> +
>> +We can split this space into two parts: the first one contains samples for capture, another one contains
>> +play samples:
>> +
>> +CAPTURE_CH_0, CAPTURE_CH_1, ..., CAPTURE_CH_127 | PLAY_CH_0, PLAY_CH_1, ..., PLAY_CH_127
> 
> You should really use literal blocks for this (and a lot that follows)
> or it won't render the way you want in HTML.  The simplest way to do
> that is to use a double colon ("...samples::") and to indent the literal
> text.
> 
> (OK, two comments, sorry about the off-by-one...:)
> 
> Thanks,
> 
> jon

Hi Jonathan,

Thank you for the review, I'll rewrite the documentation so it will 
follow the 80-column rule. Also, in the next version I will use the 
literal blocks.

Thanks again!

--
Kind regards,
Ivan Orlov
