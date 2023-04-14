Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C886E25A6
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 16:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1280EE79;
	Fri, 14 Apr 2023 16:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1280EE79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681482413;
	bh=r62Bg7taKN8ueg/SOljV3ygfYWsD/yfJ63Sah7gnkPQ=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M+11JOk33dVW4h/SYpLVLZQ5WeupXFYeK1T+kyRHl1sPYZU2o/MFZ0GU4oREt6ev8
	 0RzuHsNuIkiupHMbkRme9Z/rcZ17WRYmLitn+Taf2XNd8EWhQMds2fIJ+W3JgG/EyA
	 Z6xxgpyRDXjpw39kAstdYOfkgj17Dv3tUJieV8Oc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BE0DF8025E;
	Fri, 14 Apr 2023 16:26:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 625A8F8032B; Fri, 14 Apr 2023 16:26:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6C93F80100
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 16:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6C93F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=NfzXTOro
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-54fa9da5e5bso147258047b3.1
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 07:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681482354; x=1684074354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r62Bg7taKN8ueg/SOljV3ygfYWsD/yfJ63Sah7gnkPQ=;
        b=NfzXTOron1qvqMumHJ8TbkBENXe0W8hViQyxOSbW5oiFrYwBM5Y1PvUiLuocP0FSju
         T/ZspDaJcRa4CmndQUDdbcsp5buNAYI3giOj7fxUJYss5yQdhJp7XUK5lev34FvbBYo/
         AP9pcycJDxMDEKZ5P/PBeXcVv8iIPLCYOVQQg/EmVescSCpbmzeV9oeKqjXnDMeUGrsM
         ny9JSyRL39rWp3133GJtLcfXE4q/AGC+1ZpSJcN4wkxk2FwOvGHxRgVwBK1MUxVWKmV3
         rz+7FkQvIzwWKlQ6vnSslruQgwY1wd+BgagHkS+H3rGhKCVxZgSZL7wTELmSJ8EAJkY0
         b9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681482354; x=1684074354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r62Bg7taKN8ueg/SOljV3ygfYWsD/yfJ63Sah7gnkPQ=;
        b=J3zCSlJ1QOj+SUDGg3MnBzH7wc49+42VSYl9+g9K3KmQgoaRRq9gmHHiy6s8lz2GST
         6dUidLyy01MDk37zpblOQrV0FeHBM2sE150/OE2lHoBLyx97Ajh9tv0jUD5NucblP+CP
         8+FX/tiRj+NK/7JcmE0uiI2WzAFlZYiwJP40eqdeczU/YiQdZSoVpWuwGTt0d/pS9HgM
         PixqCekyrMJPTmgLcG3FLBkrkDJBxp3gxznU3OHxEvsdBYDp37+zhlRaDbPd9ZSuIEdU
         Dxx+N5c6ScbMZw4fWSDQgFXZQGYmHuhqFbeZC5xrUtusBRbKQMx5CLN+hqkG8+Zgfokn
         rfbQ==
X-Gm-Message-State: AAQBX9cAZB3fJ+DukbRl7b4vokvjOBtSvhyxQ7FC1Nm3GYBITHQ+3or1
	fMYcRkUbby4GbLxObYtITBYXbQ0d95lg0Y1Ncsc=
X-Google-Smtp-Source: 
 AKy350bl4fFEJ+FQv7ax0cbWG0isQYHV1KwfJdd9yo2Es773geHkplzj7s0xPtYDYCmWURb4N/814xV6jEUFYsp4aHk=
X-Received: by 2002:a81:eb14:0:b0:54f:b986:9c60 with SMTP id
 n20-20020a81eb14000000b0054fb9869c60mr3688061ywm.7.1681482354504; Fri, 14 Apr
 2023 07:25:54 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAHhAz+haVH-4Hgsz0PpTgUSW1pX4XxwxXwEd7nLVb0sFFwQwCg@mail.gmail.com>
 <CAPDUAqPVDi4TgAja92tMqMp6rGAyC-eabS_6+W0zThKfsZAxGA@mail.gmail.com>
In-Reply-To: 
 <CAPDUAqPVDi4TgAja92tMqMp6rGAyC-eabS_6+W0zThKfsZAxGA@mail.gmail.com>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Fri, 14 Apr 2023 19:55:43 +0530
Message-ID: 
 <CAHhAz+g-Mtz3xhnU9hDHG9DzBuBM_e9_4n0BSRpALRJcyLF0LQ@mail.gmail.com>
Subject: Re: ALSA: arecord : silennce recorded as 0x80
To: Luke Koch <lu.ale.koch@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 3UJ73PTOLMFQPJXQY5TNQ63EFZ5LLQIM
X-Message-ID-Hash: 3UJ73PTOLMFQPJXQY5TNQ63EFZ5LLQIM
X-MailFrom: munisekharrms@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: LKML <linux-kernel@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UJ73PTOLMFQPJXQY5TNQ63EFZ5LLQIM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 14, 2023 at 3:45=E2=80=AFPM Luke Koch <lu.ale.koch@gmail.com> w=
rote:
>
>
> On Thu, Apr 13, 2023 at 3:50=E2=80=AFPM Muni Sekhar <munisekharrms@gmail.=
com> wrote:
> >
> > Hi all,
> >
> > I recorded the silence on the default audio card by running "arecord
> > -d 5 test.wav."
> >
> > Once it exited, I checked the contents by running "hexdump test.wav,"
> > and I see that silence is recorded as a sequence of 0x80 instead of
> > 0x00.
> >
> > 0000000 4952 4646 0024 8000 4157 4556 6d66 2074
> > 0000010 0010 0000 0001 0001 1f40 0000 1f40 0000
> > 0000020 0001 0008 6164 6174 0000 8000 8080 8080
> > 0000030 8080 8080 8080 8080 8080 8080 8080 8080
> > 0000040 8080 8080 8080 8080 8080 8080 8080 8080
> > ...
> >
> > What might be the reason for silence being recorded as 0x80 instead of =
0x0?
> >
> >
> > --
> > Thanks,
> > Sekhar
>
> This is what I found after Googling a bit:
> Since you didn't specify a format, arecord defaults to 8 bit format (U8).
> Being unsigned, a negative value for maximum negative amplitude is imposs=
ible. Therefore the value is given a bias of 128,
> making 0 the maximum negative amplitude, 255 the maximum positive, and 12=
8 the center point (or silence).
Thanks for the clarification.
So I tried passing signed 8-bit format (S8), and then the arecord died
immediately, as mentioned below.

$ arecord -f S8 test.wav
Recording WAVE 'test.wav' : Signed 8 bit, Rate 8000 Hz, Mono
arecord: begin_wave:2481: Wave doesn't support S8 format...

For other format S16_LE, the arecord hangs for a few seconds and
throws an I/O error.

$ arecord -f S16_LE test.wav
Recording WAVE 'test.wav' : Signed 16 bit Little Endian, Rate 8000 Hz, Mono
arecord: pcm_read:2032: read error: Input/output error

I am not sure why recording works only on the default format of U8.
For other formats, the record either dies immediately or hangs for a
timeout and then throws an I/O error. Any ideas about this behaviour?

>
> Best Regards,
> Luke
>
>
>


--=20
Thanks,
Sekhar
