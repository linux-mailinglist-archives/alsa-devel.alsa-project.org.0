Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 743726E606A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 13:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DAFFE71;
	Tue, 18 Apr 2023 13:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DAFFE71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681818742;
	bh=Qk/xs5vEW/xS7uNeeoqopsXpy0ZvzKliIV30QGdKTL0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JGkPGmmhQ+ppjED8laiF7qM0jquTg787xL+UMpSeJnU1zXqP1wmBWg1d4DnST3ez6
	 kqyBEOHU3M/ioJNr1u5Oy1WKITJ2tR3O/TXUDqm3hDYkdaRZmj3tR8Qz92BCjAkf4H
	 SsloDeqKXYh95FQVfEf2DISeAK8dlbZ/wN95XMMw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55B04F80149;
	Tue, 18 Apr 2023 13:51:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F5A2F8032B; Sat, 15 Apr 2023 11:51:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 771E3F80100
	for <alsa-devel@alsa-project.org>; Sat, 15 Apr 2023 11:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 771E3F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=D10Ide1Q
Received: by mail-ej1-x62e.google.com with SMTP id gc14so6566698ejc.5
        for <alsa-devel@alsa-project.org>;
 Sat, 15 Apr 2023 02:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681552305; x=1684144305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HWQ55XCgxMzVrYbC4f0gRBhCKgR8TSk192DndIkYVbU=;
        b=D10Ide1QWyGQiItP6shdmRzVzxuiDNMeNaZhIi8tgc+Xf0lJm5xo71AgHGFGMhqnHF
         MdesI/Oh24NeXwgb0HNK7zq7dwz6sKXXIUWXyTLj5r1+G0lxGHQ9B03SvECb4vcEyTPw
         dPXzcXYY/Fn7wJiKFlljVscbPuGPevY/qV09k7cXEBqvnDoo8RAw+CEwHkilfQPn6AT7
         iHCNs76q3cY4mIyMJHeRZVyl+wX7NzcTwo1CDGufBL3Og1B4P5LrdNgfRIe+2QOJYgG5
         RCYBY9tSpd3FKtK1/olJikqbVt4CDUaJnvRQjS+E6QqTOLaPUZ1Q3CKt6KcRWcjjoEsm
         JJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681552305; x=1684144305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWQ55XCgxMzVrYbC4f0gRBhCKgR8TSk192DndIkYVbU=;
        b=gF1Oun3S5bJDxDoH6R5bxVI9zb0NTqqjMTQWeNFMRvtH4bUkcEt7EzHEj6KX8fCOBn
         kkL4LZwQUq+3Wi2eUb8uZbyJQIu5qYQvJcHXdZ6jKCGbXfazSt7SejDmDhvHXgbnvG8B
         fOgoSSwc1WS1ev3bitYfPRAX/dH4oGuMswxterSQpKKGsmRf3xm7XeupKvijgmUaugkt
         udnpPOJBETGIW2Wcdp5tjUaGl2R2j3xcz3Ipa6DF8IKz365/rVA+Un7MWP7d5N8kvWzb
         jvQ3ReMRViWMiWVbY5L53OxJXBGaXIXXJrpDeiP0nXeKNfUMlOHaIfwFlOFekacDKuyc
         t9ew==
X-Gm-Message-State: AAQBX9fI94tie/BKhAjuXkFyDtndCCjJ6+oTCIHPQl8z4w7JiVNqvpG1
	4C1Rdwlt9gvIaFyoda0oEqY=
X-Google-Smtp-Source: 
 AKy350b1QR7MHj04ykvekWmpeGKoJxXk7uY+wdSd5IPW8aUUCxYmmf/ktNoJ8B2uWa0q+vqJAO8nZA==
X-Received: by 2002:a17:906:264a:b0:94f:2d5f:6949 with SMTP id
 i10-20020a170906264a00b0094f2d5f6949mr363481ejc.42.1681552305288;
        Sat, 15 Apr 2023 02:51:45 -0700 (PDT)
Received: from kernelhacking.kernelhacking.example.com
 (dslb-088-067-245-126.088.067.pools.vodafone-ip.de. [88.67.245.126])
        by smtp.gmail.com with ESMTPSA id
 bl8-20020a170906c24800b00949691d3183sm3554040ejb.36.2023.04.15.02.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 02:51:44 -0700 (PDT)
Date: Sat, 15 Apr 2023 11:51:43 +0200
From: Luke Koch <lu.ale.koch@gmail.com>
To: Muni Sekhar <munisekharrms@gmail.com>
Subject: Re: ALSA: arecord : silennce recorded as 0x80
Message-ID: <ZDpzr8VOD5w5UhsR@kernelhacking.kernelhacking.example.com>
References: 
 <CAHhAz+haVH-4Hgsz0PpTgUSW1pX4XxwxXwEd7nLVb0sFFwQwCg@mail.gmail.com>
 <CAPDUAqPVDi4TgAja92tMqMp6rGAyC-eabS_6+W0zThKfsZAxGA@mail.gmail.com>
 <CAHhAz+g-Mtz3xhnU9hDHG9DzBuBM_e9_4n0BSRpALRJcyLF0LQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAHhAz+g-Mtz3xhnU9hDHG9DzBuBM_e9_4n0BSRpALRJcyLF0LQ@mail.gmail.com>
X-MailFrom: lu.ale.koch@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QYNO4UWXT5H2HUHQHZ2Q5JARKAAI5YI3
X-Message-ID-Hash: QYNO4UWXT5H2HUHQHZ2Q5JARKAAI5YI3
X-Mailman-Approved-At: Tue, 18 Apr 2023 11:51:27 +0000
CC: LKML <linux-kernel@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYNO4UWXT5H2HUHQHZ2Q5JARKAAI5YI3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> > This is what I found after Googling a bit:
> > Since you didn't specify a format, arecord defaults to 8 bit format (U8).
> > Being unsigned, a negative value for maximum negative amplitude is impossible. Therefore the value is given a bias of 128,
> > making 0 the maximum negative amplitude, 255 the maximum positive, and 128 the center point (or silence).
> Thanks for the clarification.
> So I tried passing signed 8-bit format (S8), and then the arecord died
> immediately, as mentioned below.
> 
> $ arecord -f S8 test.wav
> Recording WAVE 'test.wav' : Signed 8 bit, Rate 8000 Hz, Mono
> arecord: begin_wave:2481: Wave doesn't support S8 format...
> 
> For other format S16_LE, the arecord hangs for a few seconds and
> throws an I/O error.
> 
> $ arecord -f S16_LE test.wav
> Recording WAVE 'test.wav' : Signed 16 bit Little Endian, Rate 8000 Hz, Mono
> arecord: pcm_read:2032: read error: Input/output error
> 
> I am not sure why recording works only on the default format of U8.
> For other formats, the record either dies immediately or hangs for a
> timeout and then throws an I/O error. Any ideas about this behaviour?

The flag --dump-hw-params should show the formats arecord supports On
your installation. On top of that .wav does not support any big endian formats
as well as no signed formats below 9 bit. You could try testing with raw
file type instead.

The i/o error *might* relate to incorrect device selection.

I hope you can pinpoint your issue to something more specific - and
provide more information - so people with actual expertise in this driver can
help you, I just googled a bit to not leave your questions hovering around unanswered.
Maybe take a peek into the guide on how to ask good questions, linked on
the kernelnewbies site, to make your questions more concise and worth busy people's time.

Best regards,
Luke
