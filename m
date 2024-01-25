Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E7A83CC01
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 20:16:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F404984A;
	Thu, 25 Jan 2024 20:16:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F404984A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706210172;
	bh=YP+ZACbPdPDNPp0wqbLMwoK7ybKxr6Ai3T/jgg7xKN4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qTIG2LzYiiDl7IjHMtDgMIYRLpd1hVCp9idQCKzi4NP3NppCMxH0hYbMOHBQ0TNQn
	 QUFk2KQrwdbUUlt08oyU3M43DNzvTvWdnoTC/NygiTWK8xr/WbvpcfmYuD1ziEeOAJ
	 OuoxabS63dFZM1KlmOd1jHz6ZXc2Ix3W7obZBE+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C8E6F8057B; Thu, 25 Jan 2024 20:15:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10241F8057E;
	Thu, 25 Jan 2024 20:15:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D99A8F8028D; Thu, 25 Jan 2024 20:13:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A80C7F80149
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 20:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A80C7F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dQkzUwKc
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so803736866b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jan 2024 11:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706210023; x=1706814823;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YP+ZACbPdPDNPp0wqbLMwoK7ybKxr6Ai3T/jgg7xKN4=;
        b=dQkzUwKctq0xXIP3GFhSfB98NNlcRTMKCoJASZyXss6Z7gMhdLM9zd/lD8mDWAxWjO
         CV5HWE2iocUHT84FQ48H4ebqT47iaHTXzhudVBxDYCrX0SGrwJhy/tZBYF8uDfgeArDT
         PxNmyZjXvHclpuhVScjNgt32+5hvYphJNKZi+Ggz92uAfH/iVOGZX5sbWlK/QS/Is0FM
         ozrXGGjKsOJNXWVH5OySlx/M5IOLFeLgslXRI58jSPUgVDIeuJIjnrrYMGj+Dz3MuPk2
         Cl4dix7dAIo2XAPtDOj5kH89mKhs67AR1iZL10Y6AmQAoIc0a20rTzg/Sp9z4anghohO
         V2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706210023; x=1706814823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YP+ZACbPdPDNPp0wqbLMwoK7ybKxr6Ai3T/jgg7xKN4=;
        b=paI3JuzFn2LtMg5S/2hEmi6yzZmToZitqjB/hoB5sZotm+anEDsmpDUEmgQEpbHIFQ
         Yvuxhx6X1Ay1Sk3mSOOz6hOwJYmr/QGQGgj4FEIT4tUAMDKXX4KBre3sWI22I+rM63l1
         rU2j96E5c0lwNmKp2bWmFcg0/pJIWvbv/xOJGfq45hYN+oPwllpB5nC4Bm04UC79sc0N
         rLSj8yTHbnPnBojATTKm3TUcs4yGn+DSG3d+Sl8rnEzubsjSFwqNjXo20KjiYSLhh7U5
         xW94+R8Xc4Ie+u2PpJ67A73DjDBQLpT/AufphR6bbQyvFH+Se7JR4nX7xPxHZ0oY2eXO
         6cJw==
X-Gm-Message-State: AOJu0Yzu4OOTAgMFa8pj0+5IdEl//QEJ0xFnDJACF81dFSwAaC6TlymP
	yry9H4NMxzyyQ3+1YZOfqSnpQOPCr1lfUFGAkQDwH53fZm3e/qXvGsg4eYLNgsdg9LN9VPTZWM0
	Jvdeu5Fl5MzeBLxn0/oAg7Tefux9zh5kTIEQ=
X-Google-Smtp-Source: 
 AGHT+IGfkSRCBrrvKqqMEq4ctCl5dmSmQpuhXdTB9wouHDjmCH/Ept/X7A8N+L60v5X4vx0N7tei2nyHpa4fgsdLG1M=
X-Received: by 2002:a17:906:3e46:b0:a28:e6d8:dd15 with SMTP id
 t6-20020a1709063e4600b00a28e6d8dd15mr24850eji.33.1706210023157; Thu, 25 Jan
 2024 11:13:43 -0800 (PST)
MIME-Version: 1.0
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 21:13:07 +0200
Message-ID: 
 <CAHp75VfASF6RB0eyAEs342=i32YMG1=nzdmOYE7tKKUkRpUZKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] ASoC: cs42l43: Tidy up header includes
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: PAJCHPEVFP5KH2IQR7A632QS5LDMDIF7
X-Message-ID-Hash: PAJCHPEVFP5KH2IQR7A632QS5LDMDIF7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PAJCHPEVFP5KH2IQR7A632QS5LDMDIF7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jan 25, 2024 at 12:31=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Use more forward declarations, move header guards to cover other
> includes, and rely less on including headers through other headers.

For patches 1-5,7

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
