Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C591A9ADB54
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2024 07:18:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0030DE67;
	Thu, 24 Oct 2024 07:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0030DE67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729747091;
	bh=sfyjJTBmSWUuZLLjvEHRHWjJuJqURZIA/bbiyxiMLBQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZMKNOr6QcX2bLaF8hk4cw6VQLuke+uJp4W9zbCBpzW1daWLANuCmMQdvg87OoI9ws
	 Gs11tFrEbnFygephu0U2PT7XgF/ik9wqv00j5HdDS+CmGJ2Fk7JOD+A3j+Xyn8p0aQ
	 diqQVboc6nhsdcZOtdzneArWLcAW6pIsGbfFxCi8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 677D7F805B3; Thu, 24 Oct 2024 07:17:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63A67F805AD;
	Thu, 24 Oct 2024 07:17:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6E62F8016C; Thu, 24 Oct 2024 07:17:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE5FEF80149
	for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2024 07:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE5FEF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=efyNRhZu
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-83aacecc8efso53578239f.0
        for <alsa-devel@alsa-project.org>;
 Wed, 23 Oct 2024 22:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729747051; x=1730351851;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ea5E0CUqTApv+zwvwXAvyODO1+mnbcCQh2rAZz+WNMM=;
        b=efyNRhZu38yiKW9kQlpnvkCMAAwxPFw1zbQ/UQpV4g0hp1fNdpmw5hCTS6txlWN/fo
         lk7ihLxQb/QzNhBknUa9olZ267hk8bLkFLulGlrG9qMCOACGVLqzOa+Dgc/dagCJntDH
         X9GbuYUFzG1zx9WtGq/zTEJyEX5ZMR0cCBdsHcjHk2yB+7trt+UOnZVphpG0fxUwK5jY
         n/EOlT+9UX/iZtQ0Qq6cztVrINBUiXfxInCSVyv5P4YZC3kqykQ9r3Z424cHcxtkYxb6
         0cclvzsbhZ4aboIpNAyJLQfoB79jw5RhFtE80zzJWtO/hVSpDwNx1pB1m1iR2e3NLjeR
         pjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729747051; x=1730351851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ea5E0CUqTApv+zwvwXAvyODO1+mnbcCQh2rAZz+WNMM=;
        b=FAniR8nVohzjeA5H6D4DQD+YDhTJ/tEPDJZY3zK8DC3rQF9RDEuQb39VK040+INWW/
         b/dpYXDviCuk2pOkLcHBmAy8iwj8dM0ttFi21ZwkWfnZ4V1TzaHsXR53p8QZ/d8rAhbm
         0V+/cTKK5CuddwDIRb9Gz1dfpB7hPMrWBV4IetlGmSbGk3CjIz8bJkkMN0qil5jJPV2j
         T+T2xykE1LqqS9cWeEfBqzC/gFtwTbj42KAhrCCxO1Mvw3INJXvTcP+xAdS1EKTTBjDJ
         7nGa2SGKFmd9Gh9v5OGjx2pPh2xpwDNty4djWs6PFoV7C0ZX/6j5cPr+2hnWyqLQXGTz
         sQKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVianFnFI/iBYV5+KodU/r/SYgTKUdqsa8Qek61g8pNvQ+xqc7oTRosHmYDGF59/tL6Z0o7UJ1NuE8r@alsa-project.org
X-Gm-Message-State: AOJu0YxvGZYcFxjuI700xh7rKA56m4ltn/WZP7tFc/5ckUgNzwvEPPVS
	N3BUHOjK7RwOtcgJGDnzHsZoUEHbwYnJ1P05VoEZguFgEqxgfPb1LzZnLO96SkQoJjNzkiLF8xx
	qsdJT0Gi0xX7PeB5E9C8JU15+Yc8=
X-Google-Smtp-Source: 
 AGHT+IEDNxSK8qOUKRknMFAvP1j4nHhQxGJuBuCD0rhR+4p1pIEFITHngRl61dN3J8puKbloY/+3j3q7ZwSl+ywaA+A=
X-Received: by 2002:a05:6e02:5aa:b0:39f:325f:78e6 with SMTP id
 e9e14a558f8ab-3a4de685e50mr5077685ab.0.1729747050765; Wed, 23 Oct 2024
 22:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com>
 <ZxiKdpeuIhe/DiV4@vaman>
In-Reply-To: <ZxiKdpeuIhe/DiV4@vaman>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 24 Oct 2024 13:17:16 +0800
Message-ID: 
 <CAA+D8AO7f3z4oetm=2wseSAwN=eFnNePK8VnC31mNw-owZF-ig@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] ASoC: fsl: add memory to memory function for ASRC
To: Vinod Koul <vkoul@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: L6TYKXQVYGLDQAB5TA524PPWUE2T5BLO
X-Message-ID-Hash: L6TYKXQVYGLDQAB5TA524PPWUE2T5BLO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6TYKXQVYGLDQAB5TA524PPWUE2T5BLO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 23, 2024 at 1:32=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 25-09-24, 14:55, Shengjiu Wang wrote:
> > This function is base on the accelerator implementation
> > for compress API:
> > https://patchwork.kernel.org/project/alsa-devel/patch/20240731083843.59=
911-1-perex@perex.cz/
> > Add it to this patch set.
> >
> > Audio signal processing also has the requirement for memory to
> > memory similar as Video.
> >
> > This asrc memory to memory (memory ->asrc->memory) case is a non
> > real time use case.
> >
> > User fills the input buffer to the asrc module, after conversion, then =
asrc
> > sends back the output buffer to user. So it is not a traditional ALSA p=
layback
> > and capture case.
> >
> > Because we had implemented the "memory -> asrc ->i2s device-> codec"
> > use case in ALSA.  Now the "memory->asrc->memory" needs
> > to reuse the code in asrc driver, so the patch 1 and patch 2 is for ref=
ining
> > the code to make it can be shared by the "memory->asrc->memory"
> > driver.
> >
> > Other change is to add memory to memory support for two kinds of i.MX A=
SRC
> > modules.
>
> Are there any patches for tinycompress to use the new IOCTLs here, I
> would like to see those changes as well

Yes, just create a pull request here:
https://github.com/alsa-project/tinycompress/pull/26

Best regards
Shengjiu Wang

>
> --
> ~Vinod
