Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FA27D0928
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 09:04:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0950850;
	Fri, 20 Oct 2023 09:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0950850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697785440;
	bh=v/PWIrwK7yjVyTLCrAnW4DXLe2PtvDZ2eghjerodrKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KBYLVfy3vyjwPbM3GuboOoygCSL8PyoVE0lX7F4IMOzRJ2iGwtY6F4D/eeqMAxFAb
	 bwT+cMtyF5G9oqsNdpVLIKOd32vApJG5cJk6r34PB2UeE01vgt/HNJ3EhUrHZK51VN
	 UXGEflbm5WQUyQcOAZbAjiMsO4MnzPBQDve33V9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 959C3F80552; Fri, 20 Oct 2023 09:03:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24126F8025F;
	Fri, 20 Oct 2023 09:03:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2831CF8025F; Thu, 19 Oct 2023 18:43:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ABC3F80166
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 18:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ABC3F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=n9eqEmZw
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5a82f176860so79046637b3.1
        for <alsa-devel@alsa-project.org>;
 Thu, 19 Oct 2023 09:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697733820; x=1698338620;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v/PWIrwK7yjVyTLCrAnW4DXLe2PtvDZ2eghjerodrKw=;
        b=n9eqEmZwpUTKG6ZN+F5ANWJRSsrXiBLUUVuX9srzJTHpgVwFyYtSPLlw9tksIFEpik
         gS1xCBbsV5JFbDCUmnDYvUOEojQpQ5GPfGQAR3m7OMcBoI7s9sA7GiqeczXDqx2t8JMI
         nQNpzg/mKZQgPwdjys/IEOzF0rvCn1qGhqzj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697733820; x=1698338620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/PWIrwK7yjVyTLCrAnW4DXLe2PtvDZ2eghjerodrKw=;
        b=Q+OU6xHScHIGT9itES2C80EHncB4qqcxrIcShUq1DygCogdx9z/JOVp0Vi753gZdub
         JkqXLQK6mmBAHDeXVxF47TzAlZV8nQ4vTnXvculZqiKHT5T7mO0Sw1Nosf5RYT0sI/BQ
         EvbQy2FwxN1J6RbJWPlfUUVL2IuWMi70oJKHLLLDrER40oZIeZxmbXrRudxrpUYdMI/O
         NR4Gxysoe5WpBNglSHB0loFc4n0VsheYIBP0AlYC2jTQUyXdeOLGLb3Stp0FU0fldizt
         HZbCkkb27ZfnF2/XuzqTioof+JfmMMzIDsE6Cze1n6NccCru4XBJ2IM3IZIhKAKuBmKO
         pdvg==
X-Gm-Message-State: AOJu0YzATyAC2uZfHnIOSAhq/sRNr5hsTDuQNnwDq67U4/ZmXs44fddi
	I35Y8R818eWyPbBNFfihMJEJ3gN8Us54mRaCDz+jIg==
X-Google-Smtp-Source: 
 AGHT+IFd62ic0pQJCqoncPJxXabGcZf4KKud86nThgMjLPEjjH97+UYqiqAisRJM3jhW+CQVFLq1IPqoZ7FHOmR54B0=
X-Received: by 2002:a0d:d789:0:b0:595:8e80:30ef with SMTP id
 z131-20020a0dd789000000b005958e8030efmr2679766ywd.51.1697733820608; Thu, 19
 Oct 2023 09:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231018235944.1860717-1-markhas@chromium.org>
 <7b08520e-8f36-45a1-9b7a-316a33c8e8c4@linux.intel.com>
In-Reply-To: <7b08520e-8f36-45a1-9b7a-316a33c8e8c4@linux.intel.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Thu, 19 Oct 2023 10:43:29 -0600
Message-ID: 
 <CANg-bXDvZ00ZHEgbUf1NwDrOKfDF4vpBOxZ4hGEp-ohs6-pZpw@mail.gmail.com>
Subject: Re: [PATCH v1] ALSA: hda: intel-dsp-config: Fix JSL Chromebook quirk
 detection
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, stable@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brady Norander <bradynorander@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: markhas@chromium.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZKKL3AWTC72IHBYLW6L4NTQJWFUVFO2H
X-Message-ID-Hash: ZKKL3AWTC72IHBYLW6L4NTQJWFUVFO2H
X-Mailman-Approved-At: Fri, 20 Oct 2023 07:03:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKKL3AWTC72IHBYLW6L4NTQJWFUVFO2H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> I would assume that platform that has DMI_SYS_VENDOR set to "Google",
> also has DMI_BIOS_VERSION set to "Google", so perhaps just replace
> DMI_SYS_VENDOR match with DMI_BIOS_VERSION, to keep table small? Or is
> that not a case?

That is the case. But I'm inclined to keep it for two reasons:
1. There is precedent in the kernel to use DMI_SYS_VENDOR=="Google"
for Chromebook detection.
2. If the coreboot version schema for Chromebooks were to change, this
check would fail for all JSL Chromebooks instead of just a few models.
