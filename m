Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA5D712904
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 17:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAFA81F7;
	Fri, 26 May 2023 16:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAFA81F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685113216;
	bh=cHXQsRBB4P+jMA86kR8YTWRhF2qenOQye1YWW0o++mM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kSQVCs9f+ihG+M0IbWRD8xb0VyUMQCRDUW/ffRb2DOIt25twI9tTDgu6bzfYxf0mP
	 gL7Sv4+yAErwG1X6FZEsKzHHe5A21MkkkQRVCE1k/qe7XOOwRP3G83lUX6JnUn17rE
	 Hi3PW3q9HwCd9pG8xE9yef7RgJEWZDA9q/FRDTr0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 476ABF80086; Fri, 26 May 2023 16:59:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11499F8016A;
	Fri, 26 May 2023 16:59:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88F5DF80249; Fri, 26 May 2023 16:59:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07DBAF80086
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 16:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07DBAF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=dbKW0dWs
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5563fe88b09so582273eaf.0
        for <alsa-devel@alsa-project.org>;
 Fri, 26 May 2023 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685113155; x=1687705155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHXQsRBB4P+jMA86kR8YTWRhF2qenOQye1YWW0o++mM=;
        b=dbKW0dWsBI6hTbayeVlK1pBhSWE/+CpLxm6jRPmZ2lcfyZlXVGR/VQl8cChhHsTMXg
         /maVUeIS8DO4pw5R2mgmRPbrZ1ieflOB3n5yoXek81ZnoRaFdBJVgrTmtQ0TfKsBZUzV
         Fo+tYcCrteK5XAFNeiKAD4ZUW8iy/2Ylywn0h/Z9nfnIrPsEtag9PFsLNCJKm6xa6rxq
         FcXSEFQTSDpRrY+N7Ywr5+OqIt3etH6oFYIJ8f1Xw1mlUnTv3gULBUFoepNktm3Yjfu+
         8/e7Pd3sMDR/eb7JVMxmKBBzvjJbwoBPjVvkNfDBW9KRS1+vI+SNGbHwy9vikp+ZaQH7
         HrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685113155; x=1687705155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHXQsRBB4P+jMA86kR8YTWRhF2qenOQye1YWW0o++mM=;
        b=XHjaCnx1B0GVGHDb/HqtebfSq+Kw/Y0tkmsACsWTYxLwwFoWsiRthWWyLMjm5rgeWy
         6JpgoPWGD8c2kw7dvobcgYjX/Zr/5Fsg/up1c7zA6Cc7SideLHfHqBcnLA5iwS/BVdSc
         1RTNQfB5xZn9lXJk7CfJI1vVtevxF9ueEwSZCUbsNMMZ+zW6syrgDOkKQQNyfwJp+ogo
         45Nl+7eXeKjNvxuUcZr9RuhivJyqVTthvXUbSZ1ILoolLTw1gGZNA2FSC0UyOE3s/yHk
         2IghrUeCBI0oOki9QAE3iBMZBzbFTT47pf/JOtlKoUkMAtASHwHG+zef6xpsgOvoYIZw
         dXXg==
X-Gm-Message-State: AC+VfDxzCpqzBZSNZtlSV8NZTA35BSrzzLS5f6OB2NlJn+GEria+Wig5
	KPbMR3y0yOkIlq4aBRydU6tKDgMz+lFTVk9zqGY=
X-Google-Smtp-Source: 
 ACHHUZ5hFkRx+eYlzH26Y1mYbn6oJmGbtPXs318ZiuHvNg5sS1pgRLxzLBtfQHuHu0K2dUxPIvOpcZnOHWPbsVqr7GU=
X-Received: by 2002:a05:6808:1151:b0:398:7db6:7ee3 with SMTP id
 u17-20020a056808115100b003987db67ee3mr1523416oiu.19.1685113154864; Fri, 26
 May 2023 07:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me>
 <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de>
 <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
 <874jodlnmi.wl-tiwai@suse.de> <415d4bc84aa74c74af913048f28b42a9@realtek.com>
 <87fs7mdofi.wl-tiwai@suse.de> <7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
 <87353kd8b9.wl-tiwai@suse.de> <1170325957764b4cbd7cd3639575f285@realtek.com>
In-Reply-To: <1170325957764b4cbd7cd3639575f285@realtek.com>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Fri, 26 May 2023 10:58:58 -0400
Message-ID: 
 <CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Kailang <kailang@realtek.com>
Cc: Takashi Iwai <tiwai@suse.de>, Bagas Sanjaya <bagasdotme@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 6JZE2GFZHSNVVF2UUZ4TDALLXMQXNNGX
X-Message-ID-Hash: 6JZE2GFZHSNVVF2UUZ4TDALLXMQXNNGX
X-MailFrom: josephcsible@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6JZE2GFZHSNVVF2UUZ4TDALLXMQXNNGX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 26, 2023 at 4:09=E2=80=AFAM Kailang <kailang@realtek.com> wrote=
:
> Hi Joseph,
>
> Could you test it with below model name?
> =3D=3D> alc-chrome-book

Yes, manually overriding the model name to "alc-chrome-book" makes it
work properly even on an unmodified 6.3.4 kernel.

Thanks,

Joseph C. Sible
