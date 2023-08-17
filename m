Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 246EB77F41F
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 12:12:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74F2984B;
	Thu, 17 Aug 2023 12:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74F2984B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692267128;
	bh=POhuQVE/27yEeBlmO2P3GusZikUCVp60wcwZH4YYg9s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WLXy3vMDADFD94YrURL2jZCb8HSWnoMQz3FfLi0NZCRSgAO8ymyb8699y7OWyzfWX
	 fibxIRet+5hpEVT5XfYbEgJ81REM2m4i1VEk8qqGq887S6qyRmAv45hWFFNizHMzAP
	 ocTi7bZC4Z3kJCOGl/bL2cdtGatFc9vubbVxAuXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 839F5F8056F; Thu, 17 Aug 2023 12:10:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1512F8055B;
	Thu, 17 Aug 2023 12:10:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C5D3F8016D; Thu, 17 Aug 2023 10:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D3C5F80074
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 10:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D3C5F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=kf40MaNc
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99e05e02821so8886566b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 01:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692261039; x=1692865839;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WX3EdZ+jgXNtYFK3jMd9I5Aq3BZqLyxMIsQcuelq5/k=;
        b=kf40MaNcQQ5hlZ5p1pE4orfKDkoTYy+CUI1S+1f2F/JcdIPWWDURIYJYXe7cd4+QQU
         g+0WRNmMBtlqEZn8rlVaDW2pch9n/I7HyvZ5WFTLoyp+2Qp7KYwTtzFwx07cON6MICdG
         M0IO1/mulqXRrR61s69BkR1QJoBtWtJn8rTWpT/Yl5SVTsAE7ia3n6JEjeT+otOyutc5
         Q2ceW1zbWcCWIYsZHJ5nz++TE5QqRYCUA2ll9i/XZY2SrDu0CY/fzYbB6Q9csUiB5WYz
         k00GmJDOwjp1u3lrbDIgRBUf/aPcLYsIAT8qqsZQt1zjst/ckdZQZxVoDKYqQhkmBGH7
         TXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692261039; x=1692865839;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WX3EdZ+jgXNtYFK3jMd9I5Aq3BZqLyxMIsQcuelq5/k=;
        b=hMcy04GiJZrR+YdoReRI9nV9VWwj7UiOuI+2S7szwh2SDyMNeHfvc+nL35Cwuha64w
         Cf0IxntIs4cA0QO+RPtMbsyrjkGswEUYZFRlK6YEombMeIV8+E30+w3t2XsEn+dPvVOR
         Sts8rycNFYFtMZlicndqHEXXu4gu605E5Ms2eCW2pOGTn8ki6xtKPx3DCIk7gNPeW/7E
         zrUQRJA6u8ixQ1FVmXdZHnmbIvOWWrr+4lAY6YOpaLV+K/ymRmPb1e+uBS1qyEGZ7DZj
         3GCntgnG2d3cEQyjYuBcka+KkYdXv39mIbYbbi3qRXPHAT9qWKZLIn+BLuUhNFfmZUB9
         q6dw==
X-Gm-Message-State: AOJu0YyNUiqsq5DMAPYtAx1C14962yrTdN3lxoBF31gTAvs3FqKbmvSc
	FrirKQXZ7iDawuk+JtbfPLeeObxzdtAiumW1
X-Google-Smtp-Source: 
 AGHT+IFaZgaKdeh2sy59YJ3OBF+DZ35Fk7Ur5131s6sIBLk9fQAjA72mNbaQu+ne8reVBi9xkYIi8Q==
X-Received: by 2002:a17:906:5191:b0:99c:5711:da5 with SMTP id
 y17-20020a170906519100b0099c57110da5mr2865857ejk.5.1692261038785;
        Thu, 17 Aug 2023 01:30:38 -0700 (PDT)
Received: from [10.10.19.120] ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id
 c8-20020a17090654c800b0099cf91fe297sm9962459ejp.13.2023.08.17.01.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 01:30:38 -0700 (PDT)
Message-ID: <1182f6ea-f303-04f3-e19a-b8cb041252e3@gmail.com>
Date: Thu, 17 Aug 2023 12:30:37 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH -next] ALSA: pcmtest: Drop unnecessary error check for
 debugfs_create_dir
Content-Language: en-US
To: Ruan Jinjie <ruanjinjie@huawei.com>, Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20230817063922.282746-1-ruanjinjie@huawei.com>
 <87bkf6w4go.wl-tiwai@suse.de>
 <021dc4f3-f544-237d-489f-2296c574ec62@huawei.com>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <021dc4f3-f544-237d-489f-2296c574ec62@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3MN543LCD6PK56YE52RGQKZZSSZBIUFU
X-Message-ID-Hash: 3MN543LCD6PK56YE52RGQKZZSSZBIUFU
X-Mailman-Approved-At: Thu, 17 Aug 2023 10:10:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MN543LCD6PK56YE52RGQKZZSSZBIUFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17.08.2023 11:03, Ruan Jinjie wrote:
> So the error check is necessary!

Yeah, it is. As Takashi already mentioned, debugfs in this case is the 
way how the driver communicates with userspace (forwards flags, receives 
filling patterns, etc.), so it is vital part of the driver.

> 
>>
>> Maybe we should add a dependency on CONFIG_DEBUG_FS in Kconfig?
> 
> I think it's ok!

It sounds like a great idea. Ruan, would you like to do this? If not, I 
will take it on.

--
Kind regards,
Ivan Orlov

