Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F167A4DC5
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 17:59:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC25DED;
	Mon, 18 Sep 2023 17:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC25DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695052770;
	bh=1j4dBO4OPFSdtatDSP5rK91btm0PMiAhV7TpJsU4fmM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FfASo59T3F1+CdkpqCYT2T4B+Me0vrQ5yzcc24/Z7Cspri2LBIAbmUKorCixliYo+
	 0iU7JvXKe1KEOH3Z6rmfhJG3+ooe8T44HHExL7Rc1+2e6LWv0/piFdipCvgtIuT/Zl
	 mq4RI8oWv82WJ9sXjkbIkgblKsTvn7l6Bi+GGtvM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57BB1F8055A; Mon, 18 Sep 2023 17:57:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76A62F8055A;
	Mon, 18 Sep 2023 17:57:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96F4FF80425; Sat, 16 Sep 2023 20:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A831F80141
	for <alsa-devel@alsa-project.org>; Sat, 16 Sep 2023 20:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A831F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DbfMyWMG
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40471c054f9so8712975e9.0
        for <alsa-devel@alsa-project.org>;
 Sat, 16 Sep 2023 11:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694887532; x=1695492332;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DVbOZtDmbMexD/9gCiyvbGFst0WQ8c5NS6OBdsiTSoQ=;
        b=DbfMyWMGOfLsVcVFs+gWIGN9iV7eIaqodfKyGtVfIHgBbs4HK+wm8VSYg+Fn0b+n3E
         2RWtKpuSsHQ1lWa1WqduJRdnecixsuN9FTB+pJa0pcXumNiMI2pNp2SdsUB3sv+gIk6z
         dmz1l9GFSdfQg4CJvtT/HvLgy/TG+Dc46+rK5UdPhwzrthsME2Wxyb0uP/E363yDu6Bj
         DHtba2ULOBlRFcMpWGqkifYV0sJ0vS78d8Tevc0hbYsevXqi/l3xT86CS0zY2IVS/FJx
         PwiRvcvkQk2JycmbmuW3tcTo2vVtiidEzBDtsGNW5I6bBVEK6k1ID9jkdOGmSmWYndOS
         aseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694887532; x=1695492332;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DVbOZtDmbMexD/9gCiyvbGFst0WQ8c5NS6OBdsiTSoQ=;
        b=wX8LwlmRqOYHa4ZF6Cr5/dLpWz8g6AHXYYxVZW5fxyKe5WDj2t2Uo+/ypl9+qwwWlZ
         IFc3YLKde9HNZNpgeFtJvba+ZL3gdjh4SZXoHewZXnrB+Heu0omxtUwMP8FDq7wKiPT/
         fRNiWvNn2ehdPC+MQ6yw1Y2p9gDnMnxMAYFIHfSoD1371u8nhA09/qP9WreMXNzqvhDX
         d2geHdoCNCChiZ23+Wv9xImNn8iyTfBIx685eU5WbHCJ5dZvy+XHUiSDe2fh0PPfAgyn
         XHm6ZDOFvM2ZQ0NPI1JErYIt2iMyA48Qcmgp+QCzpKxAIGzygTMv9dg4QBXl2bobR9xn
         l/kA==
X-Gm-Message-State: AOJu0Yyla4fXo4BMYk3hjfj9QgMNmeEC8SG7/vrNbQDXeyZo0ZRMG73N
	Gq6bcPtGLla7HRxrGQNDfsk=
X-Google-Smtp-Source: 
 AGHT+IGyzH2yu/6hUHOmL8w1dZVsxgoKTJgQ/SNo/4Bvb7BjabOw8CQtwW8w8VFC81JIqrYXFuDoiQ==
X-Received: by 2002:a05:600c:500c:b0:401:b53e:6c3e with SMTP id
 n12-20020a05600c500c00b00401b53e6c3emr4671065wmr.1.1694887531817;
        Sat, 16 Sep 2023 11:05:31 -0700 (PDT)
Received: from [10.0.0.26] ([178.160.241.68])
        by smtp.gmail.com with ESMTPSA id
 u5-20020a7bc045000000b00402be2666bcsm10732150wmc.6.2023.09.16.11.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 11:05:31 -0700 (PDT)
Message-ID: <96ed6e41-65ca-7410-e2d9-78bd18bdf844@gmail.com>
Date: Sat, 16 Sep 2023 22:05:29 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] selftests: ALSA: fix warnings in 'test-pcmtest-driver'
Content-Language: en-US
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230916-topic-pcmtest_warnings-v1-1-2422091212f5@gmail.com>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20230916-topic-pcmtest_warnings-v1-1-2422091212f5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: J2UHSRAWOPEPJ3X23R7SSCATBSQE4XBC
X-Message-ID-Hash: J2UHSRAWOPEPJ3X23R7SSCATBSQE4XBC
X-Mailman-Approved-At: Mon, 18 Sep 2023 15:57:47 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2UHSRAWOPEPJ3X23R7SSCATBSQE4XBC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/16/23 19:22, Javier Carrasco wrote:
> Defining the 'len' variable inside the 'patten_buf' as unsigned
> makes it more consistent with its actual meaning and the rest of the
> size variables in the test. Moreover, this removes an implicit
> conversion in the fscanf function call.
>

Considering the fact that the pattern buffer length can't be negative or 
larger that 4096, I really don't think that it is a necessary change.

> Additionally, remove the unused variable 'it' from the reset_ioctl test.
> 

Your patches should always contain only one logical change. If you, for 
instance, remove redundant blank lines, combining it with something else 
is fine, but otherwise you should split the changes up.

> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Defining the 'len' variable inside the 'patten_buf' as unsigned
> makes it more consistent with its actual meaning and the rest of the
> size variables in the test. Moreover, this removes an implicit
> conversion in the fscanf function call.
> 
> Additionally, remove the unused variable 'it' from the reset_ioctl test.

You don't need this text here. Usually it is the place for changelog 
between patch versions if we have more than one version of the patch. 
For instance, if you send a patch V2, it could look like this:

Signed-off-by: ...
---
V1 -> V2:
- Improve something
- Add something

So, don't repeat the commit message here :)

Anyway, great job! I believe this test could be enhanced in lots of 
ways, so I look forward to seeing new patches related to it from you :)

--
Kind regards,
Ivan Orlov
