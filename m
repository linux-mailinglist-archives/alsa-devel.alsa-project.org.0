Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F27277DFBE
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 12:57:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2B9C857;
	Wed, 16 Aug 2023 12:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2B9C857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692183446;
	bh=ZItakeSqqZl1z9ICBcGFHSdXQEtxSpYom7b2IYa0/fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LO3ep+0TxMAwuUL+N2zWYERG5KkyJTmzje53tjPY3SpVRN+wRRwVBI2+vtgMMsbA6
	 hXP2DVkN9PO19cXrNstTDEZ2Qa5/8z9y2J4/UCOlLxMypTKT81sGfnps6ly8OMMfft
	 ybgUr0BTl0FejnmpPSbZEhj+v57EY35hYUwQ72gg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1180F801EB; Wed, 16 Aug 2023 12:56:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5F6AF801EB;
	Wed, 16 Aug 2023 12:56:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90103F80254; Tue, 15 Aug 2023 02:26:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 314ACF80074
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 02:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 314ACF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=IPL21NWe
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6472b8520d8so1443816d6.0
        for <alsa-devel@alsa-project.org>;
 Mon, 14 Aug 2023 17:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692059160; x=1692663960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2+3aCOSII7g5540H8pFfeLteaverXXQzbsKHRw/K+g0=;
        b=IPL21NWe5G9kXF2TvBETf5JX8msGVnTTmgq1pLw1h+RNVL4k25Bu8QjLIwVqhS3TfQ
         g6jgKd0cCaV4iGfG6OMMyKbpUalTYyK60aNr8Kve/xaXOCYVEszBCF1Iq+CVtEvKA0Xx
         eqj4/nvWl7fOLqPYLz4s3K9mZLfDAsw6xPsyAu4G3zAw4Y7k0b46S1oiX3LQamd580Xm
         Yzlt63ePGo0Sjz7gQp4n6/Ye1Hw3SNcodemaKI5cQOlQaLeQpI6fgm2LfPzbebVjcgQj
         b+YCo5cKqjkH40aDIoEHv+G1DwRqSXohNSa8t5gAKjDYTtIYejH2uiZnFiBfPVIUP7P/
         fePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692059160; x=1692663960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+3aCOSII7g5540H8pFfeLteaverXXQzbsKHRw/K+g0=;
        b=Ta0A3i6vcT/iIrJe5EAO6M/+fAmq+Kv8Zyqg4wp7x4uFZL6FLfae+cAYxlwJE/rjzI
         Alw5jQHzmwSDryBWzVxHwfcoqgsu5cZgNctZIVv3HPPE/UIUVwkDPOf0SMUzGW5dvvfP
         0c+xpBPVDeQvAAPF5XIBjmluXBzWTm/h3hLtaGFQlAF58MgHnO7zSJSrYXNvq1p3DcaX
         0vq2oxvWtUIr6q8GVaGA1FtbCPV4j5/0hiHIYOmPmJJXl2/prYPhNS89i+FELMjFr5dS
         aXhONQeu18B4Z90KrLM2jOPH+iXs+tvKtrbWJFr69gvU8mAcxnBlj/Eq9RseM+An/bbh
         CUPQ==
X-Gm-Message-State: AOJu0YznwMY/QcevOwTJ6SOE43dpgMKzAT99btKAhIIgFdDksa84WkmZ
	OYoK3fKggd8Y5wrluyyBs8w=
X-Google-Smtp-Source: 
 AGHT+IGC59y9MwRKOfq+dHKKpyPbX0XI0aaniKc8f3RJFBjBC1BpAu5TmqSfv42GkYbc8AhgdKuUrQ==
X-Received: by 2002:ad4:5c4c:0:b0:635:fa38:5216 with SMTP id
 a12-20020ad45c4c000000b00635fa385216mr16895504qva.0.1692059160387;
        Mon, 14 Aug 2023 17:26:00 -0700 (PDT)
Received: from arch (c-68-32-9-74.hsd1.mi.comcast.net. [68.32.9.74])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a0cab0d000000b0063d67548802sm3788311qvb.137.2023.08.14.17.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 17:25:59 -0700 (PDT)
Date: Mon, 14 Aug 2023 20:25:57 -0400
From: Brady Norander <bradynorander@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org
Cc: broonie@kernel.org, cezary.rojewski@intel.com,
	amadeuszx.slawinski@linux.intel.com, perex@perex.cz, tiwai@suse.de
Subject: Re: [PATCH] ALSA: hda: intel-dsp-cfg: Add Chromebook quirk to ADL/RPL
Message-ID: <ZNrGFfMegOWTuLkk@arch>
References: <20230814012637.487602-1-bradynorander@gmail.com>
 <b5fcf342-dd26-2cad-26dc-f6774f627668@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5fcf342-dd26-2cad-26dc-f6774f627668@linux.intel.com>
X-MailFrom: bradynorander@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZUVFX62BBW4JVYJQYE3SNA6BYG5G4BTK
X-Message-ID-Hash: ZUVFX62BBW4JVYJQYE3SNA6BYG5G4BTK
X-Mailman-Approved-At: Wed, 16 Aug 2023 10:55:59 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZUVFX62BBW4JVYJQYE3SNA6BYG5G4BTK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 14, 2023 at 06:54:06PM -0500, Pierre-Louis Bossart wrote:
> On 8/13/23 20:26, Brady Norander wrote:
> > AlderLake and RaptorLake Chromebooks currently use the HDA driver by
> > default. Add a quirk to use the SOF driver on these platforms, which is
> > needed for functional internal audio.
> 
> After checking, here's a list of known Chromebooks.
> 
> Do you mind sending an updated v2?
> 
> Thanks!

Not at all. Just one thing I'm confused about, if I send a v2 patch,
should it be a reply to my original thread or a new thread?
