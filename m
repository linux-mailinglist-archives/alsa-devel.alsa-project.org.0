Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BE36FE33F
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:28:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4112D1016;
	Wed, 10 May 2023 19:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4112D1016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683739730;
	bh=AMZo5IqVS5tbE4FpnoECgdG0PDkBvs82bdhf+V6NVRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eMHBGyK77GsLeeZ0kBfsZ4X1Gd5U18EMNwLZrd5NdO/+HirJirOb0OyYJ7BYWmPJE
	 V0svtnl7sSyRF1wG1qvonN+bwytx3/+Kk0O+o+BzVXjTHCu5IR79LJXKdzCiPvhR/k
	 ybevsXzurszSAESSQRk9w21qOkTgiJ8pR/9J2PW0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA87CF8053D;
	Wed, 10 May 2023 19:27:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D0FCF8032D; Wed, 10 May 2023 09:55:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE307F8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 09:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE307F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=a3T9bDod
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-504d149839bso1717422a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 00:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683705321; x=1686297321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GIJKyRBEjdyUl/MVV9x2JqKCqHZQzxhquAJ+JI/f5XA=;
        b=a3T9bDodW1/k5HN5DT6PH4X9lv2Dbf5kR59lnt3ABrgC+Kle9jBuRgvo8pYQuSXECQ
         npw2L4nGfhgTq/XJKcDxDMFFwxE6PmiTf4k34cjdmZgiYC8ola/kc4pTRb8NuxGYht58
         qSclKzvYvMKJ8da54yy5Jhn3LL0ITzet4+nykowvYW6vW0OtqD/KbezsfgO/zlonoIGn
         HjQpf3m2oHdydnewz5Ofg3xmhwForC/o69EppfOEMvMRoZqaa91REZHoBVV6eNiZEXA9
         DX1OWn9Lpc7fKvsMPh7dG4M8CTWtv16zMcTBYN3ssm2XxJQAxD3qHwmiO4zvLB/iK01X
         KMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683705321; x=1686297321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIJKyRBEjdyUl/MVV9x2JqKCqHZQzxhquAJ+JI/f5XA=;
        b=k7tqteBBrIM1i7kePuBvpkbuij69LLKUOD86P1nAs1DiCJxeyRoQb/KiBfXx3oJNTO
         Fh41TkAMuyWSnnoarzglfbHGhwiGnsCuVU8zhkNL9CrjWvD1QJsEV7ggY+czUjTpGICp
         +bG3e8ggSUZnwXISNyHjrrBLYMpyDu6+4OfL5gNi203J/9ZmdPkoNd8wokcVq6XWupen
         /0S6V1q/YyQlc6838BxqdbDEFD6KTvJ6wDT5dkwVJMnLYVTmbe9uW6E+iPlsBfdu1tGv
         jfvx3WRMFM6zFfmuWciR/GJ7ooYUk3QS7RZ8g8gw+S2AedOwyQOHdj9m5Ds8y1QM/Fnk
         eLyg==
X-Gm-Message-State: AC+VfDyvuHb/BePeicU1pMQpqeb3/fP1wYJ0cCyy0i1PgZl6SUE/nvqk
	ynz97HVQJsoJJc2qfC72Ixk=
X-Google-Smtp-Source: 
 ACHHUZ4Etamrv/XEITbdotEx2ui0eic7/8Gzjz6mioeFp38Zuvsrbto00bt1j4JEIfAzxCT4KgGXCQ==
X-Received: by 2002:a17:906:7794:b0:965:9db5:3823 with SMTP id
 s20-20020a170906779400b009659db53823mr13650720ejm.3.1683705320717;
        Wed, 10 May 2023 00:55:20 -0700 (PDT)
Received: from [192.168.10.10] ([37.252.94.55])
        by smtp.gmail.com with ESMTPSA id
 tk13-20020a170907c28d00b0094f185d82dcsm2313239ejc.21.2023.05.10.00.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:55:20 -0700 (PDT)
Message-ID: <f1a912ea-884b-fdcd-1c05-87089f1e97b7@gmail.com>
Date: Wed, 10 May 2023 11:55:18 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ALSA: PCM: Fix codestyle issues in pcm_native.c
Content-Language: en-US
To: ivan.orlov0322@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, oswald.buddenhagen@gmx.de,
 axboe@kernel.dk, 42.hyeyoo@gmail.com, surenb@google.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
 <2023051052-recoil-headache-1594@gregkh>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <2023051052-recoil-headache-1594@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XAEBYLYAQ5P36N4PLPLJQ2EI5SCSPOTM
X-Message-ID-Hash: XAEBYLYAQ5P36N4PLPLJQ2EI5SCSPOTM
X-Mailman-Approved-At: Wed, 10 May 2023 17:27:05 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/10/23 11:48, Greg KH wrote:
> - Your patch did many different things all at once, making it difficult
>    to review.  All Linux kernel patches need to only do one thing at a
>    time.  If you need to do multiple things (such as clean up all coding
>    style issues in a file/driver), do it in a sequence of patches, each
>    one doing only one thing.  This will make it easier to review the
>    patches to ensure that they are correct, and to help alleviate any
>    merge issues that larger patches can cause.
> 
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
> 
> thanks,
> 
> greg k-h's patch email bot

Greg's Bot is right, it will be better as a sequence of patches. Sorry 
for bothering!

Kind regards,
Ivan Orlov.
