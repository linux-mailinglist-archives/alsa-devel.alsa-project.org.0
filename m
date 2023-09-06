Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A37944E7
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 23:01:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC581741;
	Wed,  6 Sep 2023 23:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC581741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694034073;
	bh=oEU63DwSQF7qL/FrW5xYg05uSKQFZwlInHrSzAcUDFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ARvaWKtkSKEgI4aLhLRIKNXIUH3tS8nvkr5souAJqWEWwQUnqJ9GmTcQYXyNyRW1g
	 +nR7ro4FUVJphrUWyxmV5EywNMEpFDTJIFQ+kCKi8Zs7fiZ2XofsgOYf0wsIuY+HDB
	 CWJXSzQ4uBEp8KQLFBvJ1BLi1shQR7rj5Dhx5naQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 364E5F804F3; Wed,  6 Sep 2023 23:00:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E848BF8047D;
	Wed,  6 Sep 2023 23:00:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14F9BF80494; Wed,  6 Sep 2023 23:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7FE1F80431
	for <alsa-devel@alsa-project.org>; Wed,  6 Sep 2023 23:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7FE1F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Wu9UtaTp
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6bcade59b24so245863a34.0
        for <alsa-devel@alsa-project.org>;
 Wed, 06 Sep 2023 14:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694034011; x=1694638811;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2/pwierm3geTwmDbGyOTegsvARs4VbCErTu9xnGSGKQ=;
        b=Wu9UtaTp7iaaR2ixghvOoecCCSdbJdZalNZ6WPTreZR/oen4BrpxuzocpaWaaDJ4/b
         8X5a4TM4yAwltI/sE+F+KSoUVG20zK0OEgCFVEvvE6pBq+crdcXJhsJRYjsWdwYYwDFm
         j8LNOfj8yp/+7BKrelkR0rLAKlcwWpB1XHeNw6yoopmDL4RHZQZ1/sm5uRVFLNeubJCB
         0TnS2UKEpM5yyLySmRgBxf1QL4mVS3u5evxhLdCoKDKanmKTe26IDqPrCOkwf1nXBMHN
         mT0l87ctGO24z6I/Rk2du8kWRkh8vRQYG0luA+I/lgyDZbRzdpvZMHvwh1GtT8OjMCpu
         E60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694034011; x=1694638811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/pwierm3geTwmDbGyOTegsvARs4VbCErTu9xnGSGKQ=;
        b=aoQHY1Wl9cbC5syhyrI0C/bzv8uXOSHBhxsTx2daPZ1p2si6tNF38TCguEknDDqDlG
         T1t37MME3HrkUgYuaEQdYl76gaELNfMh1wLhUw47lXJ7L159GdXhXqOl0RLGTPck374Q
         04KMAbjgOykPR2WP0zFUsCwsemsDytyhn8pObLwItvIbU+t/UAfHsLpPSOu17Va9Csie
         J6SYOtiEZYBTLmdULCUlRLXTXhc9V2lMuRFx7m6uAaLIesaweomeim5QIvcsBrJ8fzNb
         aB7ko1HXG0ec1BBYV83rXIModWZbfDidJaMCvPgIjJdAGmTzN2gzkz5oyTTXJKHWtksK
         zI/Q==
X-Gm-Message-State: AOJu0Yy9DoioHIAsANAFzgy6wqJ4B+3gTWc9x+EJON+ArDUiy2tU8Aey
	PY+1ZWpl/X3Fyj6o6kGq/4A=
X-Google-Smtp-Source: 
 AGHT+IFv3dLk3FZQ+S5ys+7ZRzdMcKUQN5Bg35xrtWeiheQLbsG+0wYE4xxTuwUCncv2z03QyLIE/Q==
X-Received: by 2002:a05:6870:e6c5:b0:1be:d49b:a3c5 with SMTP id
 s5-20020a056870e6c500b001bed49ba3c5mr22284941oak.29.1694034011323;
        Wed, 06 Sep 2023 14:00:11 -0700 (PDT)
Received: from geday ([2804:7f2:8006:99ef:50e4:98e3:42a7:1619])
        by smtp.gmail.com with ESMTPSA id
 c21-20020a05687093d500b001d0d4c3f758sm8131032oal.9.2023.09.06.14.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 14:00:10 -0700 (PDT)
Date: Wed, 6 Sep 2023 18:00:10 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Antonio Terceiro <antonio.terceiro@linaro.org>,
	Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: snd-cmipci oops during probe on arm64 (current mainline,
 pre-6.6-rc1)
Message-ID: <ZPjoWr17SNFHLDPD@geday>
References: <ZPelHaX/Lt++kkOm@linaro.org>
 <877cp3esse.wl-tiwai@suse.de>
 <4f335dd2-8043-c60e-cf84-c2b01c4fee12@arm.com>
 <ZPjGuCdmPgqznc5t@linaro.org>
 <ZPjM7op/B/CGCF/N@geday>
 <9e48fb7c-72a5-241a-004a-5f6791a81475@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e48fb7c-72a5-241a-004a-5f6791a81475@arm.com>
Message-ID-Hash: O6G54755Z4W5QAGKRWQ63CXHJHNCGKCU
X-Message-ID-Hash: O6G54755Z4W5QAGKRWQ63CXHJHNCGKCU
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6G54755Z4W5QAGKRWQ63CXHJHNCGKCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 06, 2023 at 09:37:18PM +0100, Robin Murphy wrote:
> 
> Bit bigger than a Pi... ;)
>

Ohh, that's impressive indeed!

But looking around with Google, it turns out the Altra Ampere PCIe is
definitely quirky, see:

https://lore.kernel.org/linux-acpi/20200806225525.GA706347@bjorn-Precision-5520/T/
https://github.com/Tencent/TencentOS-kernel/commit/f454797b673c06c0eb1b77be20d8a475ad2fbf6f

The first quirk should probably be activated on Antonio's kernel but the
second one being a downstream Tencent patch, isn't. Alas, the second
quirk comes with a performance hit, see:

https://gitlab.freedesktop.org/drm/amd/-/issues/2078

Thanks,
Geraldo Nascimento
