Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B878A057
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:03:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F1E8DEC;
	Sun, 27 Aug 2023 19:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F1E8DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693155834;
	bh=qZX9ZEXWSiOCvJp9CFzqaquNBXaibHiG0dOL3pBL8NU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g5o2pMoMLleuP1E9x921uG6ev3SufCraXKNfSo6dMHB9YEBJPBzCiBpdQe4LzJbYz
	 KzxkclLc6tTB4qdLSmy/J6pyq71ElIIhRX3Nz6hkwKP5DAEr6cScu6hWmBydqpPh/S
	 ylsy4SFIG7FEF1SJvVzl5RUohPZZ4v0W81/uxJs4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCF8CF80587; Sun, 27 Aug 2023 19:01:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 158B9F8057A;
	Sun, 27 Aug 2023 19:01:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 034CEF80158; Thu, 24 Aug 2023 19:38:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C25D5F800AE
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 19:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C25D5F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=JvA5CGXp
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-686be3cbea0so853780b3a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 24 Aug 2023 10:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692898673; x=1693503473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZX9ZEXWSiOCvJp9CFzqaquNBXaibHiG0dOL3pBL8NU=;
        b=JvA5CGXp+uTaxLRysTcu+2kc4PlKUbDvleVAikSv2cPKAulLMqwu676lH6n+oYrmpc
         z90tCuKD0sQgAGr+U0/sEzDhQDe1ioKhBpxVfMYqeL+PTWw1dLn2VOMNCRAQcFRwq4wC
         WVdK2566XCEI50XN+Yh/Q7IP5TN3IP2Mnhg6xGrwZP3PcCaDmF+liW+Kk/W/i47R1dZV
         2+XfI2IYrY4qCFl8doeeC0j41WrGbG2PcjHrnR7TMBaERDa+QMd/IB4ibcI8H4V7R8rC
         /EtXsuEllJJKZd3egu3r+2Kx0BdU4lyx9EWfeJ3dDMGZZYX8PJ/8XfzrQFC+KZMfPLby
         C+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692898673; x=1693503473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZX9ZEXWSiOCvJp9CFzqaquNBXaibHiG0dOL3pBL8NU=;
        b=jEnzKy0n9rca1BBZDQn6Bs6ubOrqFiheVAbhipsYLwYI+E7k9ejWnQevFZzOY8NWIh
         yRoChcRdZxPsGSwhZeumfvTFcXVJf6FvsEybpuQK7seqeveE+BIPlisVJx3bK0PV9irr
         abluIRg3iX2ymSDL5nUkyogL1ZXANIAkVX3CM2fTzs7gqRn8glJyxTxjS3Pa9+jyyGXa
         y6tjhYAxF02eGtoZaLI2cTtHnaGgNlSbKqCpiPd4IW8sUJcjF9KM1VbvlPBzB+GoUIAn
         2ZQlk3mIhsAltzV+5pfT3c7ene/kFsbV20/vWUG+sNAGChB+4xcLn2Y+uCmTmG28ocC7
         3IOg==
X-Gm-Message-State: AOJu0Yz4vhe//br7SK9VhjKOulfa3aGpQp+8WJH9k61oGyQ+KLLd2aiV
	DQCDbBww1LVaZ9oC6SSnHqs=
X-Google-Smtp-Source: 
 AGHT+IE2S3owUZ8hfhM8ym+39zpLUlWI0vP9zliq1J0ii6d4atS7e7AgsxdU2xhH4u4B7jRnu4sBrQ==
X-Received: by 2002:a05:6a00:2d83:b0:68b:e8b8:b9ee with SMTP id
 fb3-20020a056a002d8300b0068be8b8b9eemr5614968pfb.11.1692898672788;
        Thu, 24 Aug 2023 10:37:52 -0700 (PDT)
Received: from localhost.localdomain ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id
 j12-20020aa7800c000000b00687dde8ae5dsm11774pfi.154.2023.08.24.10.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 10:37:52 -0700 (PDT)
From: SungHwan Jung <onenowy@gmail.com>
To: fabian@ritter-vogt.de
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	onenowy@gmail.com,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for mute LEDs on HP ENVY
 x360 15-eu0xxx
Date: Fri, 25 Aug 2023 02:37:18 +0900
Message-ID: <20230824173718.7992-1-onenowy@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <4504056.LvFx2qVVIh@fabians-envy>
References: <4504056.LvFx2qVVIh@fabians-envy>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: onenowy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: J6DCMEIA725HQCXBX7YUHMJOCO3AM4N3
X-Message-ID-Hash: J6DCMEIA725HQCXBX7YUHMJOCO3AM4N3
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:01:44 +0000
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

On Fri, Aug 25, 2023 at 12:57 AM Fabian Vogt <fabian@ritter-vogt.de> wrote:
> I see that SungHwan Jung (CC'd) recently submitted the same fixup for
> a rather similar but different model as
> "ALSA: hda/realtek: Add quirk for HP Victus 16-d1xxx to enable mute LED"
> Does your HP Victus also need the ALC245_FIXUP_HP_GPIO_LED? Then we could
> combine the quirks.

These victus laptops don't need ALC245_FIXUP_HP_GPIO_LED, but we can make
alc245_fixup_hp_x360_mute_led and alc245_fixup_hp_mute_led_coefbit into
one function.
