Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3126F505C
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 08:52:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5517B1378;
	Wed,  3 May 2023 08:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5517B1378
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683096752;
	bh=F5xjbgPig3+9quVde73VWdF1w0w50g0pVea/U8VEAJ0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m/+5QjKRcuQJUqpCyxuDtutKFNInQELAAfUswXXFg2hKLlSs8gcnCEoa/dbyHR6ey
	 LjV4yFAYD5WxwqUXxlwgFiyBY1tEOtlNzrHjAGE/DOuCBwDIjCGDelVyzehvuvwnCC
	 r+E8CaK/EuIqtjESA8oWs+i7SRJYVAia1ypvo0uw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AD23F8032B;
	Wed,  3 May 2023 08:50:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F5DBF8049E; Mon,  1 May 2023 10:36:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B9B9F80114
	for <alsa-devel@alsa-project.org>; Mon,  1 May 2023 10:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B9B9F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=HRoN2uYP
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-94f59fbe2cbso67728066b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 01 May 2023 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682930166; x=1685522166;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mG7J8DpHJNcBFanVcgE+bAeO4Eu0nSCUsrbtaZaHAOs=;
        b=HRoN2uYPujs6+TSWeSZ8uKlweaENg7+KPp+yvmJ6Yl5Pqj11E2648uCPTgeeN7DYza
         nY5v+nPtM3ErWagFxB3VGjhqJ3cWfitvVNWDpCGn9GPlCF1sCoSjV3akbIa2vxwpyvV9
         wEBlS+J7Qg99oUUeBfbi7Lw2c1pQ8jxTtag97lbV73jWrLVu1ueCKPaUj2xJ9tUBXwV7
         91pJ2VyEguhWom5xBK+HPSqhMHeNoWaqvMZ87N6qMtX/rXTz2UPRtG9l6gX1R1PIDB9I
         ByP3ZCZ42ygBTzIFnfsn+vZfVLd5GOANBwTMvLfJKqbZyNIuk3qyq6ZmKJMp/e/RaNTb
         nwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682930166; x=1685522166;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mG7J8DpHJNcBFanVcgE+bAeO4Eu0nSCUsrbtaZaHAOs=;
        b=c08s+/rT/X8oHjz0iYkR2el8duuWSSSGXswxZw2FPooWN3C3HYJEK7AnnsPJVyxtBe
         +EIXNANz8cg7C8T6Oek2DZqz7H+JLChI/+AMlSRdfUAGuGrDiUIK1/b6jrFCEjCQjGPw
         CaElQLZojUDH6jwgYHo/+/oDNBk3gYuAki2o/5Wp6AfwAJclyMkiKFKEn/PdasTAvAs8
         v+Wil81D7rj4T/lKuUctUp4gLGA5bXnfEsjeBcMmnqp00zxYC2pZdds+qUeGtWSX37w8
         TBT8vOq0C/U111si1GTetGHMfWjzoEX0IycenH/KzEn7NdgQxI3X94ZFqAxX5ZG5zDme
         ejHw==
X-Gm-Message-State: AC+VfDy02dopcHxnHeF7qAwQ9nycMN3211Mt7PYlyBvU3nkALoaT4UZ2
	PSz29et6cVXnQxBuZDEqZpo=
X-Google-Smtp-Source: 
 ACHHUZ6yFd8PQjVAC5X6mzuP7D2VGIqUedzre6CZjqjsdK/XSCwvUhd6LB+IQh2xPRKaHXQaUwTTJw==
X-Received: by 2002:a17:906:64c2:b0:94f:4ec3:f0f5 with SMTP id
 p2-20020a17090664c200b0094f4ec3f0f5mr9001790ejn.4.1682930165949;
        Mon, 01 May 2023 01:36:05 -0700 (PDT)
Received: from [192.168.10.15] ([37.252.94.55])
        by smtp.gmail.com with ESMTPSA id
 jx17-20020a170907761100b0094f698073e0sm14488684ejc.123.2023.05.01.01.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 01:36:05 -0700 (PDT)
Message-ID: <98089e74-d729-2f45-8b94-8536b10022fc@gmail.com>
Date: Mon, 1 May 2023 12:36:04 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Question regarding ALSA modules parameters
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <26624923-3529-d161-ae62-7e5ece7b0e3f@gmail.com>
 <87mt2opm9z.wl-tiwai@suse.de>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <87mt2opm9z.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2IOT65H4VYUQA63G45KJIAU2AVVUL5HE
X-Message-ID-Hash: 2IOT65H4VYUQA63G45KJIAU2AVVUL5HE
X-Mailman-Approved-At: Wed, 03 May 2023 06:50:50 +0000
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IOT65H4VYUQA63G45KJIAU2AVVUL5HE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/1/23 11:02, Takashi Iwai wrote:
> It's for either specifying the order of instances or controlling
> enable/disable of each one when there are multiple devices bound with
> the same driver.  One of typical use cases would be the HD-audio
> driver; there are many machines that have two HD-audio controllers,
> one for HDMI/DP audio and another for onboard analog.  In most cases,
> the second one (onboard analog) is the primary usage, and people would
> like to assign this as the first appearing card.  Then you can pass
> the option like "index=1,0" to swap the assignment slot.
> 
> Nowadays with the sound backend like PA or PW that supports dynamic
> configuration, it's little use, but that was a help for static
> configuration in the past.
> 
> 
> HTH,
> 
> Takashi

Thank you for the response! Now it is clear.

Kind regards,
Ivan Orlov.
