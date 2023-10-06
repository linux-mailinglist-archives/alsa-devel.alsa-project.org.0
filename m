Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 010D67BC5BC
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Oct 2023 09:47:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F24091F6;
	Sat,  7 Oct 2023 09:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F24091F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696664824;
	bh=LdrtZ43DSAsZ59IN4KiUVAR5cs3WbC45n622Kd5imJY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kbKIjj5s5fSclrCWG1dGxJo6tlmLSwlnHaNWez+imk2691cPK1BST8vgYilTqMxgA
	 /kUjSPk7lQE3o9xPnKfhkaE8x4UTz+S7aolmkF50WPcn0hgFtuaDr3WZfFzeeT6Pph
	 JeWrlCWM7zmTuHlGSzJWrt0tWs/qwVJtp3k/sUZ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82ECCF80310; Sat,  7 Oct 2023 09:46:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F35FF80310;
	Sat,  7 Oct 2023 09:46:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5999F8047D; Fri,  6 Oct 2023 20:03:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69D70F80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 20:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69D70F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QcOhZYM9
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3175e1bb38cso376313f8f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Oct 2023 11:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696615379; x=1697220179;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DW5DjcAJlISg3sn4dnbscxpT4hEh5MjXjjwSsYat0ec=;
        b=QcOhZYM9bkFvN6qDRAHIUaWkjqJ0UWE8+Vsf/cJnRrQH9k0fR8Nxm7EClNcwac+p7u
         JWz84vl0aKwb1G6482BGAeMF4q+Lo0sPxoxz+fOc58Pa6VaXEyq9JDMerQPt5LFp3x0j
         SX79UVp2RqP9RVGcTsVkZXyULuYoeav9zilR6a8XvbIT6IENu4wIXLKdsfp57nmyL8ey
         zH1yAemmssamJ5LN/pyQmvjip1Qz6X+jovKvtGoF6JmMytn1DS8mVeJNmCM4MOsa4qLC
         n5inIiEM1O/YnjgTZ3A+F961GsBfM9U31SPtoXXLtkdg7SWax8yItyTz4+Z4OxaiNd1X
         z5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696615379; x=1697220179;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DW5DjcAJlISg3sn4dnbscxpT4hEh5MjXjjwSsYat0ec=;
        b=BYvYBMmlfYRsqGiwG40EERWXPf2voEvohpy9++FXzXT5MSVjrTfFvTYONdnXAQYZTm
         ERx70xMwAFTE+FoEUwfBbe01PVXFn6euXHnAHe1E98HeCUJxyLjJnGuBYO55lxlXsqzZ
         6SAT84TPj7njhLG0x01kcwDiRs4T6S893JDZymhI+/DzNvI2kAs544u3qKEf4guJhuTF
         9dtUz7g+d1ljYH5TxmECjxNXIfnjGukiOFYfJSUaOksoUOG+FCo+tiOHCKsu6by3eXK3
         VtX1hRJ06F8KaG3xGQ/f1iGyHyAopTTn83Z7L0c3SRBqdlOuSrN0ollQ0voXZIWJXuKX
         yAMA==
X-Gm-Message-State: AOJu0YxUuYD9itoHR0rblXumeXlO95BiOcsSioo/QtRcfceN7qDCMbFW
	ihqNdRJILeiX97bKTX7/cY4=
X-Google-Smtp-Source: 
 AGHT+IE3rPgMYpXgMKooXH0DQLexRyaKcUcmKebwZM6Kl3hFNlUUhmaaSDA2KHIsA8aGt7JMQzno8A==
X-Received: by 2002:a5d:5687:0:b0:317:73e3:cf41 with SMTP id
 f7-20020a5d5687000000b0031773e3cf41mr7453777wrv.1.1696615378930;
        Fri, 06 Oct 2023 11:02:58 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:e405:da00:cf04:a7d5:e45d:73bf?
 ([2a01:4b00:e405:da00:cf04:a7d5:e45d:73bf])
        by smtp.gmail.com with ESMTPSA id
 v11-20020a5d6b0b000000b00324853fc8adsm2129192wrw.104.2023.10.06.11.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 11:02:58 -0700 (PDT)
Message-ID: <2fa1f433-326a-8eb6-b01e-e34ff82a2dd9@gmail.com>
Date: Fri, 6 Oct 2023 19:02:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] ALSA: aloop: Add support for the non-interleaved
 access mode
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230927113555.14877-1-ivan.orlov0322@gmail.com>
 <b9b2ea05-9d10-d263-f08a-5e3cf1f33a9d@perex.cz>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <b9b2ea05-9d10-d263-f08a-5e3cf1f33a9d@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TLOASCUSBU2QRXNUNRU6WHHD7IANM7GW
X-Message-ID-Hash: TLOASCUSBU2QRXNUNRU6WHHD7IANM7GW
X-Mailman-Approved-At: Sat, 07 Oct 2023 07:46:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLOASCUSBU2QRXNUNRU6WHHD7IANM7GW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/5/23 08:23, Jaroslav Kysela wrote:
> On 27. 09. 23 13:35, Ivan Orlov wrote:
>> The current version of the loopback driver supports interleaved access
>> mode only. This patch introduces support for the non-interleaved
>> access mode.
>>
>> When in the interleaved mode, the 'copy_play_buf' function copies data
>> from the playback to the capture buffer using one memcpy call. This call
>> copies samples for multiple, interleaved channels.
>>
>> In the non-interleaved mode we have multiple channel buffers, so we have
>> to perform multiple memcpy calls to copy samples channel after channel.
>>
>> Add new function called 'copy_play_buf_part_n', which copies a part of
>> each channel buffer from playback to capture. Modify the 'copy_play_buf'
>> to use the corresponding memory copy function(just memcpy /
>> copy_play_buf_part_n) depending on the access mode.
>>
>> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> 
> Nice extension. Thank you.
> 
>> +static void copy_play_buf_part_n(struct loopback_pcm *play, struct 
>> loopback_pcm *capt,
>> +                 unsigned int size, unsigned int src_off, unsigned 
>> int dst_off)
> 
> I would probably prefer to have dst,src,size arguments to follow memcpy, 
> but it's really nitpicking.
> 
> Reviewed-by: Jaroslav Kysela <perex@perex.cz>
> 
>                      Jaroslav
> 

Hi Jaroslav,

Thank you for the review!

I agree that parameters similar to the memcpy would look better than 
that, I'll keep it in mind when I send the next patch :)

--
Kind regards,
Ivan Orlov
