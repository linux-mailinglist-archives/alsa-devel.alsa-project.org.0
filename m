Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FAD778D12
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 13:07:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A72763E7;
	Fri, 11 Aug 2023 13:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A72763E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691752020;
	bh=Gjyqu/P6Mi5fN4tkAVd+Z4PWm5bxh66lEs9YLUhIEeI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Syb0tsg9CKQUNQtvWN50VySc1QfLYbbsv4BUghXFqLB0qpRwhEpO3lgRXMod25Vyb
	 tYhJrdncMzz6iBkh+UsPSY7/1AIq68hy8uG1ulr72Qm0FFeMPle5zGv2kS0ReINqHZ
	 tbvsy81HbChfykya2VXcuEMVHBexTCCUX71p5ETA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0507AF80016; Fri, 11 Aug 2023 13:06:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8616EF80134;
	Fri, 11 Aug 2023 13:06:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F8FEF80166; Fri, 11 Aug 2023 13:06:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F707F800EE
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 13:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F707F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=e84JtWSP
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1bfafe8a425so1649017fac.3
        for <alsa-devel@alsa-project.org>;
 Fri, 11 Aug 2023 04:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691751955; x=1692356755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjQ64ZZGN8T91hWpEGceC0siZ3jwdNTZpdGZAQGJRUY=;
        b=e84JtWSPLLE8xUm4/YbusYDp8Qw2ketFjAVF3ddE+8kfIdnZ5s8aThtpsF6Q7BvgNM
         U+wNgXBuNao0FbknM/n6HfcA14pvgn3TY1CxpY1Qj0fN1ZYftiy12G6ihc+DvPFAPFvd
         cucy2tx+xucCIgmikT9YOZvJcl5Wt+8NMfQpgUVJPFxd3/rAtAPzDQ6hgCxjRdOTSL9X
         asGQFpsB0XiP/E//fDfpno6jFiuZGwGBNi92GsP1BVY4njp5RlUVPzfaDtMC3uJv0GFn
         RNnXKhS3I3sCiy20tXOHzJFbTb6NLPO5SKfunIrmfz3OpIC+7e3AFcFGtP8S40j5S1iV
         mV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691751955; x=1692356755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjQ64ZZGN8T91hWpEGceC0siZ3jwdNTZpdGZAQGJRUY=;
        b=NveFjhP9S+wW9WN2cX1xgpRUgHoWBFyaGJEQYldmjkt/nNJfECN6GUjDrGVFUvJKf3
         AKY1A2f0rJMvmaEANrMDAZd2wVeJ9UnIazy+Z6OBOZS7AlOoXwSLtMto56jd8wtviXxl
         PcPNj/gQqu6oTpZcci+BYkaO3rJClSglOCNzynGuzF0Bg52xBgM7yc8538cs6xczy/P5
         fWl0EHnIFxnpqxZ9EmkTHa9jqZHyIyx2zYXJ7GTX57eXmQpFE/yvalLROt0SlzXtqklK
         EgrUGLinxsCgm5Fj1ylrc1Jzx4T8FOxePqg7KCoJXhcN9bHCfvvXm38YZwtZJKd2A3Jj
         OqYQ==
X-Gm-Message-State: AOJu0YxVh7Zo9qLpZ65CMRnM0+H6GfX5zBqrlQGfDia4nfFDx9hstIXV
	iLxFtncBb4ftJIgOUxhJWwh0FzZECXSD9h3g8kY=
X-Google-Smtp-Source: 
 AGHT+IFpk41pz9ENDJNApolHi9hRFlr6B19DWPyJgpvXFEB+phtk7CHmvJj6RBn+wXmTBbnSP9W9WmfQXqmH5n8Tpdw=
X-Received: by 2002:a05:6870:c58e:b0:1b7:670e:ad7a with SMTP id
 ba14-20020a056870c58e00b001b7670ead7amr1728203oab.43.1691751955035; Fri, 11
 Aug 2023 04:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <87il9xoddo.wl-tiwai@suse.de>
 <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
 <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk>
 <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
In-Reply-To: 
 <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 11 Aug 2023 19:05:43 +0800
Message-ID: 
 <CAA+D8AMriHO60SD2OqQSDMmi7wm=0MkoW6faR5nyve-j2Q5AEQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Hans Verkuil <hverkuil@xs4all.nl>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WRGRXZRS77EQNRZZCYTWAFPMCYNPYD7E
X-Message-ID-Hash: WRGRXZRS77EQNRZZCYTWAFPMCYNPYD7E
X-MailFrom: shengjiu.wang@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WRGRXZRS77EQNRZZCYTWAFPMCYNPYD7E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark, Takashi

On Thu, Aug 3, 2023 at 9:11=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Thu, Aug 3, 2023 at 1:28=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
> >
> > On Wed, Aug 02, 2023 at 10:41:43PM +0800, Shengjiu Wang wrote:
> >
> > > Currently the ASRC in ALSA is to connect to another I2S device as
> > > a sound card.  But we'd like to the ASRC can be used by user space di=
rectly
> > > that user space application can get the output after conversion from =
ASRC.
> >
> > That sort of use case would be handled via DPCM at the minute, though
> > persuading it to connect two front ends together might be fun (which is
> > the sort of reason why we want to push digital information down into
> > DAPM and make everything a component).
>
> Thanks.
>
> ASRC M2M case needs to run as fast as possible, no sync clock control.
> If use sound card to handle ASRC M2M case,  the user application
> should be aplay/arecord, then we need to consider xrun issue, buffer
> may timeout, sync between aplay and arecord,  these should't be
> considered by pure memory to memory operation.
>
> DPCM may achitect all the audio things in components and sound
> card,  it is good. but for the M2M case, it is complcated. not sure
> it is doable.
>

Beside the concern in previous mail,

DPCM needs to separate ASRC to be two substreams (playback and capture).

But the ASRC needs the sample rate & format of input and output first
then start conversion.

If the playback controls the rate & format of input,  capture substream
controls the rate & format of output,  as a result
one substream needs to get information(dma buffer address, size...
rate, format) from another substream, then start both substreams in the
last substream. How to synchronize these two substreams is a problem.
One stream can be released but another stream doesn't know .

So I don't think it is a good idea to use DPCM for pure M2M case.

So can I persuade you to consider the V4L2 solution?

Best regards
Wang Shengjiu
