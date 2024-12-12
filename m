Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 533459EDD58
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2024 03:08:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E09DA3C1;
	Thu, 12 Dec 2024 03:08:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7715F805B1; Thu, 12 Dec 2024 03:07:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0F5DF805C0;
	Thu, 12 Dec 2024 03:07:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5DBBF802BE; Thu, 12 Dec 2024 03:07:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A011BF80254
	for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2024 03:07:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A011BF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QVyrQvId
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a78b39034dso439595ab.3
        for <alsa-devel@alsa-project.org>;
 Wed, 11 Dec 2024 18:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733969237; x=1734574037;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsEQWcKkwE2tUR4EtqQ/7dt4QrY1pJqjE2F4WHaD4wk=;
        b=QVyrQvIdHCMRkq2GlEpaw/GSWwHhXGqpRf3RS2spTrhPVb9K3de5xeoagsotr/qFzt
         MDjcRt6tVYD8um0gqBdOSvK9oH3lzFzGop3fiD/IQv/dpXXokUTwGVtBCQxlyI1rCaNl
         vdhyx8Li8M88SGQz1u0JrsOjj/S7zpZfdEwG7YChinU4VNuuFJAuLmaCRRVuz3PxxD2Z
         QoKBIugPlWmQZSdNF8AsCxvFmad4vFkw+eaEYGCT9pWw9pANWmDWNpr+y0YBTBqDMbli
         ejEKAFZEswHFqrYIbywY95M+/RcFOfE/QfKqLU0pKi7Rk6U5nd+vQr9S2QGVUX4lQ06a
         b/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733969237; x=1734574037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsEQWcKkwE2tUR4EtqQ/7dt4QrY1pJqjE2F4WHaD4wk=;
        b=uJae+HRe3/m0aoy7RbxV3o7MYLNBur23Y0GJThWClZuwcKh97uIfCe9juvSJdWUvFt
         XqMzzMpSgM5S3cQH8k+NfJXIsN81tcZ/3zCVtAvvLR/FY8V3BCnI+mE3/gWCr6I4JM3A
         0B4N5hwChi6O6LTR49z1+YFCfwwoiXceDgyzzydkKhH0q/f1ifFM25YXcC9vAuRQyH/N
         TQTB50qjrzQ96pbYux1IZnfNKi6oiM3NrzlmmtcFKzNwkw/K0xedBfs2ZkndhB9A/DkR
         X8HRfViPsK2X/PKRnNEKRx1B5JCDABf50zbsji0n2r9+3w5sMuN0JTOwAaGmaf9wrPFH
         4kkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzJYpuZy6r5tGnu/Y3HaSGggoHDzyiNPvNF8CBJpqp2ixqcxb4OaBgduEBJCenEuywCUybRkvnP6UT@alsa-project.org
X-Gm-Message-State: AOJu0YxIhWCiyYnA67MTKDf+MB2xagQ/lCjSI97xfgQeVnEMXwrYiC6k
	+aEW7ysXT2YAh5R5+6lotHXo4TnFQ5ApSotN9rkWt795lhbrDDwQ2rIW96kPDYsmFpCigPUiiGq
	qEkwukGe5V0m553ApVPHLybxc8vU=
X-Gm-Gg: ASbGnctuDexBoV5snyeyvgWLUg9WJfEcAahbouII9T8TmPQfLL1kFZH7W1+fOAxR0wB
	e3LVkEnmVL8eRZl3BHB+9qdhBaPGV4ChtZjcflQ==
X-Google-Smtp-Source: 
 AGHT+IFgbF3rpxFbC9uUWYHJ8NsiDEgvcpbD8m2ahheY6thhWrFNrML3gGOs0Uohbe0DWv40CeetB1K5Pc+PD5GSQGg=
X-Received: by 2002:a05:6e02:1b05:b0:3a7:fe47:6228 with SMTP id
 e9e14a558f8ab-3ac483ff34emr18454135ab.6.1733969237518; Wed, 11 Dec 2024
 18:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
 <20241211030849.1834450-5-shengjiu.wang@nxp.com>
 <dc52c945-b292-4cd8-97ae-369a45f5a4ad@sirena.org.uk>
In-Reply-To: <dc52c945-b292-4cd8-97ae-369a45f5a4ad@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Dec 2024 10:07:04 +0800
Message-ID: 
 <CAA+D8ANG6enRKp7msjBs3Hxn8QozjT2tEvAmHDZjO7xtQYB4Jw@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz,
 tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: RVWPHDHFRQJECW3Y5FMZR2YEHUTISWII
X-Message-ID-Hash: RVWPHDHFRQJECW3Y5FMZR2YEHUTISWII
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVWPHDHFRQJECW3Y5FMZR2YEHUTISWII/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Dec 11, 2024 at 11:28=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Dec 11, 2024 at 11:08:47AM +0800, Shengjiu Wang wrote:
> > Implement the ASRC memory to memory function using
> > the compress framework, user can use this function with
> > compress ioctl interface.
> >
> > This feature can be shared by ASRC and EASRC drivers
>
> This breaks an imx_v6_v7_defconfig build:
>
> arm-linux-gnueabihf-ld: sound/soc/fsl/fsl_asrc_m2m.o: in function `fsl_as=
rc_m2m_
> init':
> fsl_asrc_m2m.c:(.text+0x7ac): undefined reference to `snd_compress_new'
>
> Looks like we're missing some select statements.

Thanks for noticing this issue.
Sorry about that, I will fix it.

Best regards
Shengjiu Wang
