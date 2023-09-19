Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0B07A94A6
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:22:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1247FAEA;
	Thu, 21 Sep 2023 15:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1247FAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302575;
	bh=V3TEuGO8A5bJZdcLxzWsSD2TZvSnWT5TqxgdEq6WQoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RFijicdWxceoH7jBB5i8kABGrkku5oaZgvGyOCAfeaFblo8LeIZ6oBKINserPfNNz
	 J0Dv3HhnWU+ioEvsX7CnUcOwkJhVTmmGwup8A9cllsIFtZeyCMjv0PwhMHPuSo6agT
	 gh6Ht7zuFIfOh9w60q2Cg590MUmXK6dsLNwA9hbM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA609F8057B; Thu, 21 Sep 2023 15:21:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65746F8055B;
	Thu, 21 Sep 2023 15:21:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F10AEF801F5; Tue, 19 Sep 2023 10:46:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C7E2F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 10:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C7E2F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lS2F6LUC
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31f7c87353eso1056417f8f.0
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Sep 2023 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695113197; x=1695717997;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zzteqkqa4qRFqipdP6HdXUn0HQqodaqc3bF5fGulmPA=;
        b=lS2F6LUCFSakgLNIIBLf+glRXMbyo4qf/MWDhtu4oOzgxF0MKj6yPGIq7vE9QIKW+0
         GkflSEXft27UJYtUI1Wk7WQJt8RX/41IIb5ApxdDqM6q6YGR5j5AgMhrDKhxneJypheT
         h4dQJq9l6nisuUJ0qUSTwK/PBM1q1/dgQpeXh9RgM4LHcRvjbKZ3BqSLFXVf6UeOQ24Z
         ZsQp/zkzdnZ+SKexxS3olU3TMtnLruir1EW01Ri78JXa61wWWpYC8yBNBQYnumd/OHH/
         NDQmhzCYxWa8gOwyCDTNcUnLSn2DzO83YWUMyXT2XNtGvQxYv4jfTq9QVQQCWjTaTwcS
         mOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695113197; x=1695717997;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zzteqkqa4qRFqipdP6HdXUn0HQqodaqc3bF5fGulmPA=;
        b=QPxDLCaLZ29+a5H+cfJsyNZE90UklPpq/HlEYrbbuuQTC17aA90S/yhwMevUjT8pmJ
         /gE5+cHxZGb9cRWHis6a/4yGNVS2UJFQ3CW8eODhA29cH0VzdZiKLUmpx4+DYVy8Zpch
         zWeM876e4K/v2aYgK+e8AUrfMuE6Fed20/eg4ef0UV+B/eGvDa+Ia8o5lUdRSlR/TI8b
         9STeg/bbo3suNN6/WVvXTMRFukGIwnUCoDNBNiaaQyu+LVPtfmYbTt+lFSOlu0zlfnZ4
         hzNqL+Chw6Dc76thBCr0Q9ByL+c4SqmTB7kb75eFmhyWHx9bUKjn8W7VZwgDrMcb7B0q
         laSA==
X-Gm-Message-State: AOJu0YwrZ9pJRg04+uOQHKayA94XR/TzRCOYL88yZKdS+/4JsmNiSaSP
	z1G7DDfSBbi8G1YQpCxRgiw=
X-Google-Smtp-Source: 
 AGHT+IFIKDOYPocedZf6pvscWOVgRgUAwxIGcvYDGsECE+EevzoLqm4VZTuqzIU+9u+tx2uHYwN1Yg==
X-Received: by 2002:adf:ec4f:0:b0:31f:a717:f1cc with SMTP id
 w15-20020adfec4f000000b0031fa717f1ccmr8868755wrn.5.1695113196885;
        Tue, 19 Sep 2023 01:46:36 -0700 (PDT)
Received: from [10.0.0.26] ([178.160.241.68])
        by smtp.gmail.com with ESMTPSA id
 o12-20020adfeacc000000b003176c6e87b1sm6083775wrn.81.2023.09.19.01.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 01:46:36 -0700 (PDT)
Message-ID: <56a4a085-6b1d-19c6-4160-4513c8c41e57@gmail.com>
Date: Tue, 19 Sep 2023 12:46:34 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] ALSA: Add new driver for Marian M2 sound card
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: perex@perex.cz, tiwai@suse.com, corbet@lwn.net,
 alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230918181044.7257-1-ivan.orlov0322@gmail.com>
 <20230918181044.7257-2-ivan.orlov0322@gmail.com>
 <2023091955-dried-popsicle-f3d8@gregkh>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <2023091955-dried-popsicle-f3d8@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UY7CA4ME6E7SEAY5ST5336DMI46NQ3P4
X-Message-ID-Hash: UY7CA4ME6E7SEAY5ST5336DMI46NQ3P4
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:21:15 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UY7CA4ME6E7SEAY5ST5336DMI46NQ3P4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/19/23 12:04, Greg KH wrote:
> On Mon, Sep 18, 2023 at 10:10:44PM +0400, Ivan Orlov wrote:
>> +
>> +#define DEBUG
> 
> Do you mean to have DEBUG enabled at all times?  Shouldn't this be a
> runtime issue with the normal dynamic debug infrastructure?
> 
> thanks,
> 
> greg k-h

Hi Greg,

Yeah, I was experimenting with dynamic debugging and I've just forgotten 
to remove it... I'll be more attentive next time :(

By the way, is there any way to detect such issues automatically? I've 
seen that the kernel test robot detects a lot of similar stuff, perhaps 
there is any tools/linters which can be set up locally?

--
Kind regards,
Ivan Orlov
