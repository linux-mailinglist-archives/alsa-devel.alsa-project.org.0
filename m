Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D4E6FE342
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:29:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E1ADF04;
	Wed, 10 May 2023 19:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E1ADF04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683739757;
	bh=uExzRvXty8X32kjiW9cfioyNlEGt0aEPrlKtPh7CHl8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QeFrG6asl+YloLBxCe+wM+ZVx2blFqC4LZt2/ccrjsO+P/DYLrqzrm1che6k2kjon
	 K47ih11n/Wz8TMdGGTewzTiSSwGbTqAc3Dc4T9y6XE9avdwqjOoLhVlRL/Xpcs9kD0
	 W/p/oMo1AC4SEftLZ+modjvPpLO1jRj8EjjUGwBk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB86DF8055B;
	Wed, 10 May 2023 19:27:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6D82F8032D; Wed, 10 May 2023 11:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 194E8F802E8
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 11:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 194E8F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=aGm4T2Im
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50a20bfe366so1798690a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 02:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683710282; x=1686302282;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+jevaS7XjYmubGxCabqB2SEiMi0tGSHztXxg0wz/p34=;
        b=aGm4T2ImeDl3HjLxeWJMDW3qjdYp5oX4KjuQT3omAd9HqwymdXoVAOkA/zlJqo2y9r
         a+g/FhkDKXE/hrqKlThAQjXEnj79UA3u4n683UNYF2ARpjRlNeteot0WZJj1d1xM1NnU
         e+8Gf/afKFiLPxcsyi4hOwFx0S6xU800dzIeUAqAajU8TKHcgh9IBXtbJS+1liinjO74
         qQ7Cz2z8BNIKGXe1Zjnxmk2GIkXCx79JrJDhv20qtDvHL99Nzk3hqhoEocTodcLYnkTb
         hdVa7ciWOLHHHOBQXWHW04532l2RiFsHLh5+QGmrBsOta3BpFm8p1/i/eZpimV2Ha3m5
         BkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683710282; x=1686302282;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jevaS7XjYmubGxCabqB2SEiMi0tGSHztXxg0wz/p34=;
        b=japkg1XcuN+ZfEetm0+PMmmGc6BLfMvP+dkNhiN+Wrm/7RM3z1Wp6dovhq/+Ngvr33
         JwToHrIds8bDXSln6KhQilU+WEDp4FMI2TO9wmn9bw5205NBG8edG9AQMrq6HMKOAZtb
         8q/OUBwOstswsiWsvRMNi5jVYB6ZhUFk1LI9ylSJRo9mwKbKD55yDDsU4YaV3eRdj6vC
         JIVqZ9BHbWRuvuYdKIXcAp6bCrgqITrMXIZG/6sM1JgN+vYVdZC1Xm5e/6hiG0tvuYiS
         MsA95KEtmrNPmNUaBFypG2X0TJ2KZiCP47G9AIquUf8raisvhcgkKbX7WBSawMPsv9lb
         VfbA==
X-Gm-Message-State: AC+VfDzWslDvFMDU4QOE1XVta4Zz8cvqrMiJhCGx0nwmLiMaCcNYY7AD
	MhIViKgRtv8wC8Qi+AUID/Q=
X-Google-Smtp-Source: 
 ACHHUZ6kfTMCVyOH550c2jp3dI6n6OyH0zYXAmIdy28wl6JY97gMQHsMTiRNxw/4pjrcSq6Coyc+fg==
X-Received: by 2002:a05:6402:3482:b0:506:97f2:1a44 with SMTP id
 v2-20020a056402348200b0050697f21a44mr15235342edc.3.1683710282395;
        Wed, 10 May 2023 02:18:02 -0700 (PDT)
Received: from [192.168.10.10] ([37.252.94.55])
        by smtp.gmail.com with ESMTPSA id
 u15-20020aa7db8f000000b0050bc863d32asm1669580edt.27.2023.05.10.02.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 02:18:02 -0700 (PDT)
Message-ID: <414e52c8-d1b8-e445-c896-0f19effc6708@gmail.com>
Date: Wed, 10 May 2023 13:17:59 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] ALSA: PCM: Fix codestyle issues in pcm_native.c
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, perex@perex.cz, tiwai@suse.com,
 axboe@kernel.dk, 42.hyeyoo@gmail.com, surenb@google.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
 <2023051052-recoil-headache-1594@gregkh>
 <f1a912ea-884b-fdcd-1c05-87089f1e97b7@gmail.com>
 <87a5yc626f.wl-tiwai@suse.de> <ZFtT9J0DQI9uSd1x@ugly>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <ZFtT9J0DQI9uSd1x@ugly>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XAQWQUYIT3R3IENIJK7HJYCZC2LJ4PWX
X-Message-ID-Hash: XAQWQUYIT3R3IENIJK7HJYCZC2LJ4PWX
X-Mailman-Approved-At: Wed, 10 May 2023 17:27:05 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XAQWQUYIT3R3IENIJK7HJYCZC2LJ4PWX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10.05.2023 12:21, Oswald Buddenhagen wrote:
> On Wed, May 10, 2023 at 10:06:16AM +0200, Takashi Iwai wrote:
>> Also, if it's only about white space fix or some indent level issues,
>> that could be rather more noise and disturbs the git change history,
>> e.g. it makes difficult to find out the real code changes via git
>> blame, especially it touches a huge amount of lines like this.
>>
>> That said, I'm not going to take such "coding style cleanup" patch
>> blindly.  If it's associated with other real fix or enhancement, I'll
>> happily take it.  Otherwise, I'd rather leave it.
>>
> a maybe less confusing way to put it would be "do whitespace cleanups 
> only on the lines that contain "real" changes, and maybe in their 
> immediate proximity for consistency". that means that whitespace-only 
> patches are by definition not acceptable.
> 
> regards

Oswald, Takashi, thank you for the explanation! I got it. The acceptance 
of codestyle cleanup patches vary from one Kernel area to another. I'm 
curious about the sound subsystem, and decided to fix some obvious 
things before going to more significant enhancements I probably would 
able to make.

Kind regards,
Ivan Orlov.
