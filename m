Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ED7702CB1
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 14:28:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37E601EF;
	Mon, 15 May 2023 14:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37E601EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684153731;
	bh=042Lt8nDXTd3YUPGfj73s+umodYVRCzgv9THadrJ40U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iqnK9eUs1fiTtaKztwxbcjf/Kb0obvCpCID8BNogc4ZQMEPyLq3Itg0/DrHJVQsIj
	 EVNECprK9vGHXJplW0CbhiEFjMJc7xoRM16/1aJ92ZShCWjP6rkMSRHJo3MSJgc+2+
	 wenC6y5ikBBYQ0Kaf+HgFEvvPI1I9F0W+OZQvXpI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1CD9F805C9; Mon, 15 May 2023 14:26:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C175F805C6;
	Mon, 15 May 2023 14:26:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB0C9F80272; Mon, 15 May 2023 07:58:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8518DF8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 07:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8518DF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=VK/SJmfF
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94a342f4c8eso311236666b.0
        for <alsa-devel@alsa-project.org>;
 Sun, 14 May 2023 22:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684130300; x=1686722300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPQtZOXsXDtCauwTHNXvzScss6wN7/6B+b24lKETaGY=;
        b=VK/SJmfFZupbAd5/+2FwqSOo5GZXg1tMePpH0B9ihJg7i9s70UKRXN7pjr/rJ+Ccti
         vDMxqrkXkt2ev2XIK4l2mpLHAHjNmU9K7T/uZxBGLj3v5x2XFtIGmbNf7p8ROYWbB70E
         7bHRbQmqKhYQAAILyh20N/DkDwZBvCBmPJHG2xYwKzFmZEkrVWZm1jy8VlCvRafH6wEA
         UUqUCKsFqg7uO5fHNlVnznb9KkCr54n0Yijsf0i+1SiIzMzy4Vmh/jl67rkwWBQLpiYk
         Xu3s9GH1cMXUwp6himyLZGzdYFCgJ4839KyyRUI4p81baVKpY8KqzejeZkN+wCbhkKrx
         AC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684130300; x=1686722300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPQtZOXsXDtCauwTHNXvzScss6wN7/6B+b24lKETaGY=;
        b=Xai8l7HQjwUiR8gkuYnovwOaWEdNOAq/aE8rNHo5Ybz8UheAr/PRLFAb//5pmGnn0d
         sNx4zSlvdmUPm/CdAgIDK+9N1iA/ysIC8UQ3yMCXO9BlOH48ZxTjICh7f4UQxFUqZSbk
         mUbOTORmwtrSG0KhFeWV8iUO92n+WczWtEiMzJ/TRNlRQ8uBO/ob+ogA+ata5QQ8up9N
         ud1UHrV2OAwbcKcWWvGovurrPXgcKvkeWATal3T+UXIqFDdFPDrEamBrkGtscI08Z5Fb
         FRljoH3W17WnlHkaosJ/LC33N9E83nL0zsgdd5EXYBas2SHwfpli+iOyUTGAN1x+YhCL
         Y3jA==
X-Gm-Message-State: AC+VfDws7HDRAVUE1PP5+gKU+cbufeyr3n6u9Qac82UAexJJN7EQFRXs
	av0Clp2wIK0VVqCHLgEwB7I=
X-Google-Smtp-Source: 
 ACHHUZ6nMW9a0P1Ql/uFkqv12DRTC4hSCe3KL6gtMdm1+0pa5miAPoRV2RKERnYzaZnI/EEomTYr/g==
X-Received: by 2002:a17:906:1051:b0:966:1f60:fd32 with SMTP id
 j17-20020a170906105100b009661f60fd32mr5945505ejj.6.1684130300277;
        Sun, 14 May 2023 22:58:20 -0700 (PDT)
Received: from [192.168.10.10] ([37.252.94.55])
        by smtp.gmail.com with ESMTPSA id
 de47-20020a1709069bef00b0096b20c968afsm1464579ejc.124.2023.05.14.22.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 22:58:20 -0700 (PDT)
Message-ID: <9a76e550-fd1e-851c-e322-4bf51ab11e97@gmail.com>
Date: Mon, 15 May 2023 09:58:18 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] selftests: ALSA: Add test for the 'valsa' driver
To: Mark Brown <broonie@kernel.org>
Cc: corbet@lwn.net, akpm@linux-foundation.org, perex@perex.cz,
 tiwai@suse.com, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org,
 himadrispandya@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
 <20230513202037.158777-3-ivan.orlov0322@gmail.com>
 <ZGGKwA10shGGUr87@finisterre.sirena.org.uk>
Content-Language: en-US
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <ZGGKwA10shGGUr87@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UW5RU2YEOV72HQ6R27SOIPYNU3VZWS3Z
X-Message-ID-Hash: UW5RU2YEOV72HQ6R27SOIPYNU3VZWS3Z
X-Mailman-Approved-At: Mon, 15 May 2023 12:26:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UW5RU2YEOV72HQ6R27SOIPYNU3VZWS3Z/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/15/23 05:28, Mark Brown wrote:
> On Sun, May 14, 2023 at 12:20:37AM +0400, Ivan Orlov wrote:
> 
>> +uid=$(id -u)
>> +if [ $uid -ne 0 ]; then
>> +	echo "$0: Must be run as root"
>> +	exit 1
>> +fi
> 
> It is not an error to run the selftest as a non-root user, the test
> should be skipped.

Alright, thanks!
>> +modprobe snd-valsa
> 
> We don't check if the module was already loaded.
> 
>> +if [ ! -e /sys/kernel/debug/valsa/pc_test ]; then
>> +	mount -t debugfs none /sys/kernel/debug
>> +
>> +	if [ ! -e /sys/kernel/debug/valsa/pc_test ]; then
>> +		echo "$0: Error mounting debugfs"
>> +		exit 4
>> +	fi
>> +fi
> 
> This will unconditionally attempt to mount debugfs in a standard
> location and won't clean up after itself, if the system didn't have
> debugfs mounted for some reason then this will leave it sitting there.

Yes, I agree... I'll remove this in the future versions, I think the 
approach with skipping in case of missing debugfs would be better.

By the way, I used the 'fpa' test as an example, and it looks like it 
should be fixed as well...

> Would it not be better to have a C program that actually calls the ioctl
> rather than a custom debugfs thing that may or may not be wired up to do
> the same thing as an ioctl would?  It seems like other than whatever
> this ioctl test actually does this is all just a simplified version of
> the existing pcm-test.

Well, the idea was to test the playback buffer consistency - the driver 
has the functionality of testing the playback buffer for containing the 
looped pattern (and if the buffer doesn't contain the looped pattern the 
test fails). So, firstly we get the capture buffer with this pattern 
(via arecord), and then send it to the driver for the test (via aplay).

The pcm-test (as I understand) performs only time checks, not the checks 
of the data played/captured, and I think it is pointless to test the 
time again. But I agree, that C test implementation would be better - 
using this approach I can perform additional buffer checks and cover 
more functionality of the driver.

Thank you very much for the review!

Kind regards,
Ivan Orlov.
