Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C111E9169DE
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 16:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15E5885D;
	Tue, 25 Jun 2024 16:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15E5885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719324542;
	bh=X3Iggen6O1cM2G21L94wXloIh4QAzGgxW3l06iUP3Ok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h84xBhnslrLR5/FkaWCbrqMYbPRFIulf764k0BZnLNurVoGDQlt/xZuVKcwmXnBKG
	 M2p5UG9/pKRCDxZZmA1+Cv4NpY72QbXAe+gosoQl7SZ1xBlZqoFSydNDp/D/9vVIGW
	 yCcwXedtWkyYE8EZtzrS3/NFZysI9SOe4vR65cmQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 965A1F805A0; Tue, 25 Jun 2024 16:08:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 747F3F805AF;
	Tue, 25 Jun 2024 16:08:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE7C1F80495; Tue, 25 Jun 2024 16:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF4A6F80154
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 16:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF4A6F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aTQ/A3KT
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-6bce380eb9bso3356386a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 07:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719324095; x=1719928895;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X3Iggen6O1cM2G21L94wXloIh4QAzGgxW3l06iUP3Ok=;
        b=aTQ/A3KTDc0nJyj6tNY9EAqshCAWZZCVPJpbQA3Ps/iZrOjNSeXct5nc6FD3So/Y11
         EBSk+lxlhYF62R4UoEuNKnynkv+iRMZ6N0h4fQYiZsu+61sAnVV8hiSahq0VB5qFhG7Y
         A9libng8mRGjcSFGEQiUuFSdJx+JnUDP8itfGwpyAqZ+zofH3g3JXlaMwPAgKBQf96d5
         QKhw3aTeRLb9QADJB4CeX7WDrKVNqQ8ZFz69bdVwLFHl2gK0LajTwImRqquuqequCPCD
         eGd0xRgcBfIMTkFLPuoc9xdHn4J64d499cuUeLLKMw1ywEgI2ELqcbWI5YUjFmCPhfUP
         94oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719324095; x=1719928895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3Iggen6O1cM2G21L94wXloIh4QAzGgxW3l06iUP3Ok=;
        b=i6cSgeSde+I6lPs0/mbtwVAocQoun+huzWqrHrq215cyxLiRd8mte/wyDDavrt8Oqk
         wtyVkDnBCc5PybyBFRKjaDCK2KcVtqnWny3HWsXeVkxUWO+grvzj8jDS8tNAr5/QihSq
         9BZPspcXRxpss+82wVrlCIoLJNpOASjPi3QMxDGBVRDoUFkBa7JisZi4YGP0mzXtYFNK
         QKEv2kY/6gk/42htroNaNI7hBb3dVxMCxChj/OHVUaqmrRXJgJBvqD9w1gLD7KYcDmya
         VRbrNdt5YXn4SsKJiJE8MnSWaMx/ikISbVPY/8mQg0NsJHQgl3qaSBFpKH9rj8wYxePc
         //xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4JWxJsebegWx3pbdss0uCLmlNnqYpflUxbZap0CbYfr5mkTrnJmfGWIRPabfd+7u5J0pjYPSiOWTMafqgsgyIO9pNo+oY2IWIrMM=
X-Gm-Message-State: AOJu0Ywh0rXa+i2YX0a+MIkvJ09lfj6EdqzLjqtdgxDDQU3XBBjAg+K3
	RIO+c959mSzAgS806CRYOFF7rHRiJbYtFQWx62kyoBEELNuVXacqPGldaMj8v2trS4t4GBLNOm5
	J1sKEOZk7s/i/maQ6TFnIjaAX3Lg=
X-Google-Smtp-Source: 
 AGHT+IEd+EBC/NWsf+VOsO01Za2baDweXjbJ43MpcDB03jH0q2mwqFAep7ly9pDQAeDiOXTil5t1xngphUxrU/41kEQ=
X-Received: by 2002:a17:90a:7444:b0:2c8:84b:580e with SMTP id
 98e67ed59e1d1-2c85829734amr7015577a91.41.1719324094452; Tue, 25 Jun 2024
 07:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240615125457.167844-1-rauty@altlinux.org>
 <2c9ba341bc95d4b9010bf5f8794c0d14b1c57dc9.camel@irl.hu>
 <CAGpJQTHoBAixmxta2WuZfjHjiK9GXF=hkfPyV7PBD5rt9Z_0WA@mail.gmail.com>
 <CAGpJQTGqxEkfp003QLsp-syUgzDFCmHSmNaoOaem0ZMVf7_=bg@mail.gmail.com>
 <c0a9e15e7926e098bdea97a7d31c32427e0910c9.camel@irl.hu>
 <871q4lm9dp.wl-tiwai@suse.de>
In-Reply-To: <871q4lm9dp.wl-tiwai@suse.de>
From: Rauty <rautyrauty@gmail.com>
Date: Tue, 25 Jun 2024 17:00:57 +0300
Message-ID: 
 <CAGpJQTFF=gKN2h105dGhBOEhN0Q1Tpj5hJWpSdQ_-nCoUTzj5A@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable headset mic on IdeaPad
 330-17IKB 81DM
To: Takashi Iwai <tiwai@suse.de>, Gergo Koteles <soyer@irl.hu>,
 alsa-devel@alsa-project.org
Cc: tiwai@suse.com, perex@perex.cz, kailang@realtek.com,
	sbinding@opensource.cirrus.com, luke@ljones.dev, shenghao-ding@ti.com,
	simont@opensource.cirrus.com, foss@athaariq.my.id, rf@opensource.cirrus.com,
	wzhd@ustc.edu, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: EKSIOIKW4AQAHZ4JN6VXLLCCKUP4J3KP
X-Message-ID-Hash: EKSIOIKW4AQAHZ4JN6VXLLCCKUP4J3KP
X-MailFrom: rautyrauty@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EKSIOIKW4AQAHZ4JN6VXLLCCKUP4J3KP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jun 2024 at 16:32, Gergo Koteles <soyer@irl.hu> wrote:
> I still think this breaks Duet 7 sound, because snd_hda_pick_fixup
> function picks the PCI SSIDs before Codec SSIDs.

a piece of lspci from Lenovo IdeaPad 330-17IKB 81DM:
00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-LP HD
Audio [8086:9d71] (rev 21)
Subsystem: Lenovo Device [17aa:3837]
Kernel driver in use: snd_hda_intel

Since PCI SSIDs are in priority, I will specify it (0x3837).
Then this patch will not break the sound in the laptop and the change
will be minimal.
