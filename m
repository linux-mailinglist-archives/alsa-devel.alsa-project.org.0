Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0771583B317
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 21:32:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60E7283E;
	Wed, 24 Jan 2024 21:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60E7283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706128364;
	bh=8jgRx1Ebpfo3V8P6upG202YRHaUAoTVmSD8UvYQ4OPw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JHfJyyDDmcrj4ZwDkIju8b3SH9d/q6Y0WBhWmREBYFUTdR6N3Q8TXeHwKECUctDF5
	 +H1FRTa30m74dQQcGtcL753slVK9fgMEzlV2quTF6Pr1BDW55AKHuvTnFGTXimQgKh
	 /LDNsRpF3IQHBmAZHA+OQ/s44cZfV6KY4w1KqHZw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C40B3F8058C; Wed, 24 Jan 2024 21:32:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 079F2F80568;
	Wed, 24 Jan 2024 21:32:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 601BFF8028D; Wed, 24 Jan 2024 21:31:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD56BF8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 21:31:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD56BF8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EKE8rX/x
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5100e817640so2077903e87.2
        for <alsa-devel@alsa-project.org>;
 Wed, 24 Jan 2024 12:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706128306; x=1706733106;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jgRx1Ebpfo3V8P6upG202YRHaUAoTVmSD8UvYQ4OPw=;
        b=EKE8rX/xHz32jTowTtzFbprWjt9IVfVVWIQjeYqWtr6OZ3El1RRUso8oMvgdlyxPFM
         ePn70VoItqhNyRlF2/WgtUro3cK9hHue5Ml3EzFONKTvvpQqUhhzLRTBcq99q4ioMW2X
         pnIXwGpnvDvnRoo4bgzTIM2lwDAZBicqkkddnLsGEpCCwdp2VMEVY1MK/t4bBRP82Uj9
         s0MHVDGWaxwLkfWPpdD07mWoD1M9Xvs0KLp1CgQlx2P/Cfoij97SWgmvILJkKYOtsubk
         54tkSOnYVybpWCrV8eMopL8qOGnH1ibAY/r671LeRPc3f5zHRnsMTDkCLNGlA+xtWnl8
         Xixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706128306; x=1706733106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jgRx1Ebpfo3V8P6upG202YRHaUAoTVmSD8UvYQ4OPw=;
        b=Mq64dYpiECTPkYEJTAB3j4S6j2fIlUPWjcRFHuf8sxgxEK4Wqcmci8p1Y17rw7j7mm
         H195YRXxrf7dzhnnF8q7Syw9I3Xs2mW77E0y1fc6Us4BRUhVkhIpFIRPTBYWXjkJZqlN
         lT0tyrzXpCILWykG6O6PNQLfGgwZDIqx/okHeDRqJflc03Aw7B+/dLidH6VGcR11wgwi
         4S792aX8z+IgWP1tnXcPewdn4prMb0FliE+OEXci3QjRcAHfGWGhalAUuxP5q/ONgUEA
         IDE2GNNnyedy076QGqFoZeb2EimRzJrClVC6kIMCdiG6xo5kp79TMsEr0KppGzozOqDx
         ETNQ==
X-Gm-Message-State: AOJu0YwM1im4+aP9PEP09rMkdjvmXTM1MG2tpLYnLBNI3o23l+80cVIY
	kzidGFfjxip5ZrYG/FFd1AqeFJDhfg/7Z/5IszgYaYPEB/1DwVAKB2TxtxGmOy1cKFt3n9wY2vz
	6ou8SwlkzzqNxph1z7XPtVRYqzPY=
X-Google-Smtp-Source: 
 AGHT+IEvshG7K8I4wt3i9BmnCXK/Qng+RZGZX7HoIcZS4rZRpDxHgjOg+KutOqFsoKKEZMeTiY1lLHcxvLkKAYKIwH4=
X-Received: by 2002:a19:e016:0:b0:510:16f3:8087 with SMTP id
 x22-20020a19e016000000b0051016f38087mr326122lfg.32.1706128306118; Wed, 24 Jan
 2024 12:31:46 -0800 (PST)
MIME-Version: 1.0
References: <20240124151222.1448570-1-ckeepax@opensource.cirrus.com>
 <ZbEqpbwTOlWBHrL2@ediswmail9.ad.cirrus.com>
In-Reply-To: <ZbEqpbwTOlWBHrL2@ediswmail9.ad.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Jan 2024 22:31:09 +0200
Message-ID: 
 <CAHp75Ve=iuDBKVLFNr--zVUnfASXWDUMoYoOzoM_6tsf0YkX1g@mail.gmail.com>
Subject: Re: [PATCH 1/6] mfd: cs42l43: Tidy up header includes
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee@kernel.org, broonie@kernel.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4GHFOTMZPKS2JVLU2KHAAZAMD35OW2CI
X-Message-ID-Hash: 4GHFOTMZPKS2JVLU2KHAAZAMD35OW2CI
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GHFOTMZPKS2JVLU2KHAAZAMD35OW2CI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 24, 2024 at 5:20=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> On Wed, Jan 24, 2024 at 03:12:17PM +0000, Charles Keepax wrote:
> > Use more forward declarations, move header guards to cover other
> > includes, and rely less on including headers through other headers.

...

> Apologies Andy, I forgot to CC you on this series, hopefully you
> can pick up off the list, but let me know if you want me to
> resend.

Suggested-by automatically being converted to Cc, how do you send your seri=
es?

P.S> I saw that you sent a v2 already, am I right?

--=20
With Best Regards,
Andy Shevchenko
