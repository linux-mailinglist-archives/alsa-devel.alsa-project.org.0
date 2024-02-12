Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2C7850D7A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 07:11:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0DB984D;
	Mon, 12 Feb 2024 07:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0DB984D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707718290;
	bh=oy3gkwXSjXKA2Ayx2dhISZ86EWgTqhsy2HxNCU3pqAA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OywNy5sN+DU8Li8zmFbwRB2YlTqTfmK75Gwy2Hz/621Ps5xFanZR2ZZy9fxBVRw/v
	 /KdDCsL5KgwGb0uiu+cULmmlvh+ZAmvtbLLAUn2frCvRBA3SPSzKwqQNSIFXGauQWG
	 0uNhIlRBJMPTKJQzIyYLh47kqnOFHH+p4vX0O5Ng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 577B8F805A1; Mon, 12 Feb 2024 07:10:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FF30F805A1;
	Mon, 12 Feb 2024 07:10:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B105AF80238; Mon, 12 Feb 2024 07:09:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEEDEF800BF
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 07:08:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEEDEF800BF
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-560e9c7a094so3642958a12.0
        for <alsa-devel@alsa-project.org>;
 Sun, 11 Feb 2024 22:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707718080; x=1708322880;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MILP1dtOJICOj8/NSquH6W/spYpMBc6qdWLltCUs/0Y=;
        b=ud3G638etqsTq1/4B/2iypUZKd2rgCGUAY+Z3UXPkRL/a2b6u44aiC0Ae7MqwotEs8
         dPDrhEYwiIAJ6exlEtw2J3yt73SIpxRS/OY6tGmrbUbjC9LMjs4a6xwpjYoXw8MruQWO
         UPGBkK6U6f7/HIO78itFkmfkwWfztyFkO9t6JJCgwoo/YjI5IT+N4VPo02LUhlNvmBv8
         XP/09PGV+BoABab/9v5JzC5Kl5zYWsp9BOY16RunG28q0KYJdZvAP7U+bTGsGDFUVW0p
         KE0yHy1mU9SbWpGBpWM5Zk+mtHu+RB/hENnWS39oSJQoJyldpcn/NU0T8pU2xAA4ckAx
         OCXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWio83c3l1Dq5jcxHLOjYn7cbill8X2kOzSzpxUB3xiE9+QaO39tU5J8bLxhBR/C60zqip+zdEdpGqeD6LV7haz8uwE0qg3KX9ABkM=
X-Gm-Message-State: AOJu0YzVwTgeZ3ob7bSRiv+Mfdy+J+/AC6mY4JgLqdxSCBjJZ6f2/pkU
	3XDP4Ob6nUMGfAXAvkmvFNoTnCV1pHvNMsrpA5uPsrb9FWuEZKro
X-Google-Smtp-Source: 
 AGHT+IFCForocFWEda5Hr23AV8M7LiMDlqi/+DPJ4IY7p6su2vjUujSLGXfj2IR9nOuPgJ/jwtwphQ==
X-Received: by 2002:a17:906:f28c:b0:a3c:943d:7363 with SMTP id
 gu12-20020a170906f28c00b00a3c943d7363mr1190337ejb.11.1707718080169;
        Sun, 11 Feb 2024 22:08:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXdiTMkqKb5RSCNsBha9XX9F00c48jVZDVEQe+5unQnhH1EryRoq9slb9SerfOsxiKmMcJRfvgRJ6/PVlN2gNwPyR9+zlr9E25ZzSM+efvCwoaJoOzqFikmIS1vbJKlgKjJshjrohiN8HgAX5CLZ3h5vZXnJu7Kou7Zr/CpdE7ZTmcrASTJ6waUnK2h49yy7kaWTmcTvHwLiN3MefeMxETciJeXYR2nElW6isGZ4sm1+uk7E8/g07wkSC2LrLybxaNKzvPrr9IX09/apB8A9IgOJD6bcSMQJbcGGfYoXwqTc7MGb6O3o70v+2+M1OUZinGhd43gnOJGx0rgdFqux+BGLOUIwNEIaPrEgwj2phAvxrNxUAvgW5f82XBFnP3HS9t2V3gVejcwtWeWOt/wiGi+tX/G
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id
 wt11-20020a170906ee8b00b00a389d911606sm3529612ejb.88.2024.02.11.22.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 22:07:59 -0800 (PST)
Message-ID: <360ef165-2ee3-4018-9b24-e77cd82f3417@kernel.org>
Date: Mon, 12 Feb 2024 07:07:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Subject: [PATCH] sound: drivers: fix typo 'reguest' to
 'request'
Content-Language: en-US
To: Yinchuan Guo <guoych37@mail2.sysu.edu.cn>, linux-kernel@vger.kernel.org
Cc: lee.jones@linaro.org, james.smart@broadcom.com,
 dick.kennedy@broadcom.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
References: <20240211182846.3608447-1-guoych37@mail2.sysu.edu.cn>
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20240211182846.3608447-1-guoych37@mail2.sysu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: L6VYF5CYSLGMIXJONEH5DLFPDEOOYMBC
X-Message-ID-Hash: L6VYF5CYSLGMIXJONEH5DLFPDEOOYMBC
X-MailFrom: jirislaby@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6VYF5CYSLGMIXJONEH5DLFPDEOOYMBC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

the subject is mangled.

On 11. 02. 24, 19:28, Yinchuan Guo wrote:
> This patch fixes a widespread spelling mistake of the word "request"
> (incorrectly spelled as "reguest") across multiple files.
> 
> Signed-off-by: Yinchuan Guo <guoych37@mail2.sysu.edu.cn>
> ---
>   drivers/mfd/da9063-irq.c      | 2 +-
>   drivers/scsi/lpfc/lpfc_sli.c  | 2 +-
>   drivers/tty/serial/max310x.c  | 2 +-
>   drivers/tty/serial/sccnxp.c   | 2 +-

These do not look like "sound". You should send/fix them separately.

>   sound/soc/codecs/rt274.c      | 2 +-
>   sound/soc/codecs/rt286.c      | 2 +-
>   sound/soc/codecs/rt298.c      | 2 +-
>   sound/soc/codecs/rt5514-spi.c | 2 +-
>   sound/soc/codecs/rt5640.c     | 2 +-
>   sound/soc/codecs/rt5645.c     | 2 +-
>   sound/soc/codecs/rt5651.c     | 2 +-
>   sound/soc/codecs/rt5659.c     | 2 +-
>   sound/soc/codecs/rt5663.c     | 2 +-
>   sound/soc/codecs/rt5665.c     | 2 +-
>   sound/soc/codecs/rt5668.c     | 2 +-
>   sound/soc/codecs/rt5682-i2c.c | 2 +-

thanks,
-- 
js
suse labs

