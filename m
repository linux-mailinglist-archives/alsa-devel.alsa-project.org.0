Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5748977E37
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:11:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B8F6E9F;
	Fri, 13 Sep 2024 13:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B8F6E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726225870;
	bh=hh8rCURHlU1S0VzeEOr/qPRmG5pOjwvou/UUAN4mAIU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z8sWM/ykVokF3g4kenr0JYuxakz/cGOjREnzjcHOKbjUYfMk+T7I7K5Rsg6pNj5e5
	 O1j1sLQWWKRApWKHMudMVJGTrVksq9qJjsQ2ep3lQiZOMcBdEDJq0p87I4GGa0I01c
	 7+wRPR6JCYzaIg4pzizcujGP3cJbi7KBBXeNJLeg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 575B4F80655; Fri, 13 Sep 2024 13:09:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FD63F80651;
	Fri, 13 Sep 2024 13:09:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07F0FF8016C; Sat,  7 Sep 2024 12:38:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46121F800E9
	for <alsa-devel@alsa-project.org>; Sat,  7 Sep 2024 12:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46121F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256
 header.s=google header.b=Qm9CvuAG
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c3cdbe4728so2965395a12.2
        for <alsa-devel@alsa-project.org>;
 Sat, 07 Sep 2024 03:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725705533; x=1726310333;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2CwdNcIB9tXV/LLx26cXgF2y6u1PTSNCri52GY6FU6s=;
        b=Qm9CvuAGDCtFP+aFC+dPIEfS2O2JGkwjmwYyueDh2/IMOtP040I02JO5aqnbvfzU5U
         vJOKeuHUgQdJuTiE0fJQHh/9a8QWR+rcHr4Uj1EOWk2dvmfCcihqV1HxMPwQ+cftr+PF
         bzTZ62Ce/gLhh/JhL1XfnBJjxD9PSko2WHTEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725705533; x=1726310333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CwdNcIB9tXV/LLx26cXgF2y6u1PTSNCri52GY6FU6s=;
        b=KbWnGvffi6TLzSWqNJCfCShb6O8h5f5qg/THjFQUm0rlvrTZU5OSbcbWKM75gLjAgZ
         7c6LntXaooiORB4uG1/mDcc6tjId083xd4QUh5csox1DxRNHhaPgezc6+vuL+qUFi02J
         ZljEXyKinXZAyNkOLAP2n1wG6JeUeEuODZpHnHrdtDYD07SU4403TWU9p3n7sqfdeiT1
         5oiIWHXFcLB/5cI1L6x7JVCaPOhTNi+Hi2BCiRNbkl+7i5d3/kLHOhg3CFlB43dQiOSa
         t5aLrhXb2VzTLE7ozmQmi1+EiufJoGOJjBmhWrgJA5SNU3M/GX8hOWbBZ3uG3BXa1xaT
         qKgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJQNf16Qg79qwqPDcumxu5UBQTZ5S5kfNTRb7KQYoWP0lvQbgYEdAsngDaocUBsogx8I5xjqahq7SF@alsa-project.org
X-Gm-Message-State: AOJu0YzpIwA55xTLHDCY8M8091oNGe65B+nNW62FjHDdWE99B/Finhfh
	qAmEISmHTb/n2mSubwu53aYVPs8XBh4zn8UcqlNhm7o241klolQHzdB+JY914Lo=
X-Google-Smtp-Source: 
 AGHT+IFDe69CkyHE4Nq97ZTYjKfNF5v2aG9NzuqS3isvoJdEiUzylAQ02iPjot71qkSyE9nmFP7jHg==
X-Received: by 2002:a05:6402:5419:b0:5c2:54a3:6b3e with SMTP id
 4fb4d7f45d1cf-5c3eac064a2mr855308a12.16.1725705532223;
        Sat, 07 Sep 2024 03:38:52 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76fc4sm522094a12.78.2024.09.07.03.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2024 03:38:51 -0700 (PDT)
Message-ID: <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
Date: Sat, 7 Sep 2024 11:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
To: Takashi Iwai <tiwai@suse.de>, Ariadne Conill <ariadne@ariadne.space>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org,
 stable@vger.kernel.org, Christoph Hellwig <hch@infradead.org>
References: <20240906184209.25423-1-ariadne@ariadne.space>
 <877cbnewib.wl-tiwai@suse.de>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <877cbnewib.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: andrew.cooper@cloud.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: T23JMOBJJUJSJV55PEOZ5BUJ74ZIWFMY
X-Message-ID-Hash: T23JMOBJJUJSJV55PEOZ5BUJ74ZIWFMY
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:09:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T23JMOBJJUJSJV55PEOZ5BUJ74ZIWFMY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/09/2024 8:46 am, Takashi Iwai wrote:
> On Fri, 06 Sep 2024 20:42:09 +0200,
> Ariadne Conill wrote:
>> This patch attempted to work around a DMA issue involving Xen, but
>> causes subtle kernel memory corruption.
>>
>> When I brought up this patch in the XenDevel matrix channel, I was
>> told that it had been requested by the Qubes OS developers because
>> they were trying to fix an issue where the sound stack would fail
>> after a few hours of uptime.  They wound up disabling SG buffering
>> entirely instead as a workaround.
>>
>> Accordingly, I propose that we should revert this workaround patch,
>> since it causes kernel memory corruption and that the ALSA and Xen
>> communities should collaborate on fixing the underlying problem in
>> such a way that SG buffering works correctly under Xen.
>>
>> This reverts commit 53466ebdec614f915c691809b0861acecb941e30.
>>
>> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
>> Cc: stable@vger.kernel.org
>> Cc: xen-devel@lists.xenproject.org
>> Cc: alsa-devel@alsa-project.org
>> Cc: Takashi Iwai <tiwai@suse.de>
> The relevant code has been largely rewritten for 6.12, so please check
> the behavior with sound.git tree for-next branch.  I guess the same
> issue should happen as the Xen workaround was kept and applied there,
> too, but it has to be checked at first.
>
> If the issue is persistent with there, the fix for 6.12 code would be
> rather much simpler like the blow.
>
>
> thanks,
>
> Takashi
>
> --- a/sound/core/memalloc.c
> +++ b/sound/core/memalloc.c
> @@ -793,9 +793,6 @@ static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
>  	int type = dmab->dev.type;
>  	void *p;
>  
> -	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> -		return snd_dma_sg_fallback_alloc(dmab, size);
> -
>  	/* try the standard DMA API allocation at first */
>  	if (type == SNDRV_DMA_TYPE_DEV_WC_SG)
>  		dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC;
>
>

Individual subsystems ought not to know or care about XENPV; it's a
layering violation.

If the main APIs don't behave properly, then it probably means we've got
a bug at a lower level (e.g. Xen SWIOTLB is a constant source of fun)
which is probably affecting other subsystems too.

I think we need to re-analyse the original bug.  Right now, the
behaviour resulting from 53466ebde is worse than what it was trying to fix.

~Andrew
