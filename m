Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B3B7A4DC7
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 17:59:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0DB8DF5;
	Mon, 18 Sep 2023 17:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0DB8DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695052779;
	bh=dRVISjAOYHnrw85GOqhhsbh0BXt4wtheOWhS6EUrfJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OSDYE1/bylWNlRYx87ZXAdHwcPqXx+2GQedUOByOe5fsJ8BpOsNE8poO3o78D9fdV
	 ADPuDY42p/yn55sqP/khqorroWL1+5V8Dr3WxnFxtcPo9jJwOJHKOpt9z5MeXCY42X
	 RWw0VfO6aqFQ3hVfsJoS7XsPEbEtbyKY/i+x9QGM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A96EEF80552; Mon, 18 Sep 2023 17:57:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B1D3F8057A;
	Mon, 18 Sep 2023 17:57:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 931D4F80425; Sat, 16 Sep 2023 20:25:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E3E7F80212
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 20:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E3E7F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LtxGHMaU
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31ff7535aa6so1430069f8f.0
        for <alsa-devel@alsa-project.org>;
 Sat, 16 Sep 2023 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694888731; x=1695493531;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ckuQZ1CawEUL97pJvhzualqoX+UXSrLJZVGT08Xyrcg=;
        b=LtxGHMaUfP06uL8rHxBcdAAu+9fMJIVF3c51e81jtA37AORE5fTNB0ysJ3Qtob+Aah
         dc5m18CfzmlZ77AM5AQi9VCAB0bOTnrcRuwjeEwHGPmh8LJlTFAP+QpeXhIO7vV3S+0A
         AfEqnFeLbbAVL8Ip1nfda9GsHtnbwqMBrE6JYuGkg1f5cjsAbVnkLpdr9T/23RhflAfb
         WvnRUC4Bn9ORdHSVhuxNKCYmW7jkjGJWv2maOhry2JELsMFXMKCaaEliw78n1pfel6ws
         yGmDbLI6f3PgEYToxzJdNqk/5BxM1CxqCoG46uv077CldwJWzFwholJbxQyC/2c248AT
         uGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694888731; x=1695493531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ckuQZ1CawEUL97pJvhzualqoX+UXSrLJZVGT08Xyrcg=;
        b=ZNktrVgLZlWJubs+sjneubg0u1jJzX3+jj3QPqIxFmhcYPVq1q9R21zR0ynuUEc/3y
         hDQqG5JTz3MXpIH6/qPfl8aKhP/9GvAjKswR8E6CmVb9PD00sv17BcWYBwccfvkjJYaS
         HpCVR2w8EYcKnQT6a6mxhjAqgjA9+AZb2rUi5lVK0kADfFppB4kErNNJjbkZvNYlpak7
         LZ9DtXPF5WucWIebPcYdyq1+VopWfQFp187LYD2SnuZwQp48cx6YpbuANEPUS9sd0lzT
         jMCkHNFPJywDtw7BltgvtTndI3v65I9kRjmy3XlX2ylskeWcB9oOLlQ2Ry9LeGfA4IIy
         SirA==
X-Gm-Message-State: AOJu0YwrPjFpV+2qJY01GkQEqwcpM18N1oy198Jgcw8j82aNLRwByUlo
	swOgri6Le3X61ppPpBDnEdA=
X-Google-Smtp-Source: 
 AGHT+IGVa+XIIFY8QmJ67pNTWSWASvWz2SosTfH23zEiYYZcAQR/VAmKZuHIVUDpULlmkx9mYLv2Ow==
X-Received: by 2002:adf:dccc:0:b0:31a:ea86:cbb8 with SMTP id
 x12-20020adfdccc000000b0031aea86cbb8mr3704433wrm.2.1694888730582;
        Sat, 16 Sep 2023 11:25:30 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41b4:ce80:33dd:a87e:3888:429c?
 (2a02-8389-41b4-ce80-33dd-a87e-3888-429c.cable.dynamic.v6.surfer.at.
 [2a02:8389:41b4:ce80:33dd:a87e:3888:429c])
        by smtp.gmail.com with ESMTPSA id
 v16-20020aa7d9d0000000b0052f3471ccf6sm3791715eds.6.2023.09.16.11.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 11:25:29 -0700 (PDT)
Message-ID: <128d057c-0d60-418d-7129-093ea59b8870@gmail.com>
Date: Sat, 16 Sep 2023 20:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] selftests: ALSA: fix warnings in 'test-pcmtest-driver'
To: Ivan Orlov <ivan.orlov0322@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230916-topic-pcmtest_warnings-v1-1-2422091212f5@gmail.com>
 <96ed6e41-65ca-7410-e2d9-78bd18bdf844@gmail.com>
Content-Language: en-US
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <96ed6e41-65ca-7410-e2d9-78bd18bdf844@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DIYXVVV3A7XIM3UT747GVZ36Y6LDFZIF
X-Message-ID-Hash: DIYXVVV3A7XIM3UT747GVZ36Y6LDFZIF
X-Mailman-Approved-At: Mon, 18 Sep 2023 15:57:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DIYXVVV3A7XIM3UT747GVZ36Y6LDFZIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Ivan,

On 16.09.23 20:05, Ivan Orlov wrote:
> On 9/16/23 19:22, Javier Carrasco wrote:
>> Defining the 'len' variable inside the 'patten_buf' as unsigned
>> makes it more consistent with its actual meaning and the rest of the
>> size variables in the test. Moreover, this removes an implicit
>> conversion in the fscanf function call.
>>
> 
> Considering the fact that the pattern buffer length can't be negative or
> larger that 4096, I really don't think that it is a necessary change.
> 

>> Additionally, remove the unused variable 'it' from the reset_ioctl test.
>>
> 
> Your patches should always contain only one logical change. If you, for
> instance, remove redundant blank lines, combining it with something else
> is fine, but otherwise you should split the changes up.
>
Removing an unused variable is actually removing a blank line from a
logical point of view. Is an extra patch not overkill considering that
it cannot affect the code behavior?
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>> Defining the 'len' variable inside the 'patten_buf' as unsigned
>> makes it more consistent with its actual meaning and the rest of the
>> size variables in the test. Moreover, this removes an implicit
>> conversion in the fscanf function call.
>>
>> Additionally, remove the unused variable 'it' from the reset_ioctl test.
> 
> You don't need this text here. Usually it is the place for changelog
> between patch versions if we have more than one version of the patch.
> For instance, if you send a patch V2, it could look like this:
> 
Sorry, this got merged from the cover letter by b4. I will be more
careful next time, thanks!
> Signed-off-by: ...
> ---
> V1 -> V2:
> - Improve something
> - Add something
> 
> So, don't repeat the commit message here :)
> 
> Anyway, great job! I believe this test could be enhanced in lots of
> ways, so I look forward to seeing new patches related to it from you :)
> 
> -- 
> Kind regards,
> Ivan Orlov
Thanks for your feedback and best regards,
Javier Carrasco
