Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 559B69519B2
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 13:13:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C6B52998;
	Wed, 14 Aug 2024 13:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C6B52998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723633997;
	bh=/jlXwub/VVgwOLNXo3NHY827Q79tOts0INn1SM8RMmk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gJW9ypJJ1OCjJGC+d2g00A0atOraC/CVsnHMbJN4KRr3ONBzmxWjRFVtGl/S5FYo3
	 RDJt6hB92HMApNyWzDkTeYirPezfBytNiOH1DDVxIHNddq5hSr7BTKWMbETeHuLgzu
	 e8wzNgcbEGw14EYfT+40qkbmxiVSTUB/sfj9A+4Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A1C4F805AE; Wed, 14 Aug 2024 13:12:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52B05F800B0;
	Wed, 14 Aug 2024 13:12:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A488AF80301; Wed, 14 Aug 2024 13:12:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0C88F800B0
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 13:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0C88F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OxoVTFlP
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-39b3ffc570bso29848605ab.3
        for <alsa-devel@alsa-project.org>;
 Wed, 14 Aug 2024 04:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723633947; x=1724238747;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wF+jCqkozllmCMkDBC4WnutIDupaU5S+6zMucrtIowA=;
        b=OxoVTFlPsY8sAfq9AK70g5DsxUKT1GTmp9RaVyI64M1EfUVMscNGU/fsU2tXr19ThZ
         H3oUgNTtI1c8sJjWsvdsQ9PZ8L9zdce3kNva6ewqqZ9MyYbBCca5Tk0eiUVddQ1JAA/K
         lpW0X8Dv3GqmKh2Z8m0l0O0WMCApx6CpoWw+S2sFksfyAx+BQSyQUjdLNfeX9k7LaT6R
         jzFavChm8RmFfv/bEZJWgVso/has1/eg8VEOKcOxXHcMiBCtlcmsSr5hIPCWT+EvN3S4
         8og4rr53Wo4qRGXOboCEDHi6BOlxX9mCyBwwJ1Fdno96Frk3Uy5LG14T8xRcBLcZyuGN
         DJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723633947; x=1724238747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wF+jCqkozllmCMkDBC4WnutIDupaU5S+6zMucrtIowA=;
        b=dviDJZA1dbyBI/USpqyIrIYMiJudd6LJT97MH8ZVWt2TLLDWwRG3oVrv9gaZmHLsy4
         iojNj+FVEvCrZ30nnkJ8h8h3/9J3nP6tH7vLmlJT5UKhK0ezu7vOfcrjfYU6dZA3ImeH
         FJpmsOttzyRszupoWjpe73kdGws7+FrBtXeaYlNl7YrMQ6l/Qa8U0uO+8NWlFPs9Sm02
         rjJOx2pCS2SJu6R7RT6W8KwF/nnnM5X4kfsRhN+Qayxj6W9/a6Uj/nyZa/A+eY/QEWka
         hmSI8Pl2S/Ds23tw2sdFcbno9WW2ZeudTzEmg+EBvXzKn6OJn/vRkIBAvPf+rJwRjKwQ
         GImQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB3euQwygllJKxhBa8ydm2wJ7oD5DErVGHFEU7Oe+LbTItcv+RMOEtj+HkOsdnnXArcJ0tbdUoNCTufeYewtSx7O5gmrZWVIUS8Sg=
X-Gm-Message-State: AOJu0Yx2qlVMAKbF5avEDJKNg6XCEAHV1ntaNcZBAwWy4xtk2TkLCb/l
	L9ys7/pQoY99KHkALTbrxvFm9PYMsbD43bOcf3uDhgwRLTjZ4nl5nUa8pEcjGSo/svvY5KoCmhI
	KXIXR8UPFvmaK6B3Vq/2dfRn++PI=
X-Google-Smtp-Source: 
 AGHT+IG23mxNg9sYomPIR65C+wkvcVf1Nh6cR3dMcXd5IewSmI8C/wXzw+Jopbl3+u3Bq8STYJPegmialAMApjmL47Q=
X-Received: by 2002:a05:6e02:20cf:b0:39b:3205:6b93 with SMTP id
 e9e14a558f8ab-39d12520b17mr29843795ab.28.1723633947217; Wed, 14 Aug 2024
 04:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
 <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com>
 <116041ee-7139-4b77-89be-3a68f699c01b@perex.cz>
 <930bb152-860a-4ec5-9ef0-1c96f554f365@linux.intel.com>
 <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
 <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com>
 <CAA+D8AMOh=G7W5-dYw_=Xx-s0PqEu2suKYorscoWku86Rn-=+A@mail.gmail.com>
 <542d47c5-7ce3-4c17-8c0a-3a2b2a9e6c6a@linux.intel.com>
 <c3b8f7b8-fc5e-4285-bee8-7edd448a405d@perex.cz>
 <CAA+D8ANg7C7vuxU44mAG8EnmcZjB_te5N_=4M4v_-Q9ZyPZ49g@mail.gmail.com>
 <2be4303e-58e1-4ad7-92cf-f06fa6fa0f08@perex.cz>
 <7dc039db-ecce-4650-8eb7-96d0cfde09a2@linux.intel.com>
 <CAA+D8AMv=tHV3b-Rfo9Pjqs0bX5SVschD=WD06qxjJOk5zQmiQ@mail.gmail.com>
 <3cdb2041-59d4-4d43-ac4d-39d7f9640cef@linux.intel.com>
In-Reply-To: <3cdb2041-59d4-4d43-ac4d-39d7f9640cef@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 14 Aug 2024 19:12:16 +0800
Message-ID: 
 <CAA+D8APSrH_pum6Cm0YxDzWMs4Roi=h1hkBjPMfXocXt7z4oVA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 vkoul@kernel.org,
	tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KQJYPW6XPLAD42FKK7S3WX3N3RA6OIGW
X-Message-ID-Hash: KQJYPW6XPLAD42FKK7S3WX3N3RA6OIGW
X-MailFrom: shengjiu.wang@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQJYPW6XPLAD42FKK7S3WX3N3RA6OIGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 14, 2024 at 5:40=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> > Yes, to go further, I think we can use SND_AUDIOCODEC_PCM, then
> > the SRC type will be dropped.
>
> sounds good.
>
> > But my understanding of the control means the .set_metadata() API, righ=
t?
> > As I said, the output rate, output format, and ratio modifier are appli=
ed to
> > the instances of ASRC,  which is the snd_compr_stream in driver.
> > so only the .set_metadata() API can be used for these purposes.
>
> Humm, this is more controversial.
>
> The term 'metadata' really referred to known information present in
> headers or additional ID3 tags and not in the compressed file itself.
> The .set_metadata was assumed to be called ONCE before decoding.
>
> But here you have a need to update the ratio modifier on a regular basis
> to compensate for the drift. This isn't what this specific callback was
> designed for. We could change and allow this callback to be used
> multiple times, but then this could create problems for existing
> implementations which cannot deal with modified metadata on the fly.

.set_metadata can be called multi times now, no need to change currently.

>
> And then there's the problem of defining a 'key' for the metadata. the
> definition of the key is a u32, so there's plenty of space for different
> implementations, but a collision is possible. We'd need an agreement on
> how to allocate keys to different solutions without changing the header
> file for every implementation.

Can we define a private space for each case?   For example the key larger
than 0x80000000 is private, each driver can define it by themself?

>
> It sounds like we'd need a 'runtime params' callback - unless there's a
> better trick to tie the control and compress layers?
>
