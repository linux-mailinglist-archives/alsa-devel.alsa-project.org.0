Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E54897C2AC
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 03:45:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8536B65;
	Thu, 19 Sep 2024 03:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8536B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726710322;
	bh=gOX2Efoo6f2Mn2ISU9WRaKt7vI3dsEcG5PIE8Whds9c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eW8gOwMV3gRAUj92IPxbShU4pddFMzuFUNypA+B4XYIX8o60ngRkHoIkcnZQtHOmM
	 jL8p5ItYX07p7OHDgzXFzM7tAagGlsdpQHRxw46HF/SuKVfw0d6cemTYoLb/XPRtiB
	 moBYuHdHqN+YffY9AsUUoupFoEvXtqoNTgcaUp0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F968F805B3; Thu, 19 Sep 2024 03:44:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66899F805B0;
	Thu, 19 Sep 2024 03:44:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88369F8020D; Thu, 19 Sep 2024 03:44:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ECA8F800D0
	for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2024 03:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ECA8F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mXbZjcwq
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a0979cc639so1536225ab.2
        for <alsa-devel@alsa-project.org>;
 Wed, 18 Sep 2024 18:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726710282; x=1727315082;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DX8B0AVGc1Jcf/sZuX/Lm5rKGNOWSa7SVLWhBKf+5LU=;
        b=mXbZjcwqYYAYE5XV+1pw1cHy2dsyT96mlBGBcdMsIQxKfa7GcRRut9lPbbDMDezUih
         TkTGHgsIZEiZoJiinW8pVsE4CrZM/dgYHvBA5xy5+vp0KjBwR1FnJg4dX5RVib4B9Ep1
         4c/iD6wuDw3wuiP4V34TbDkCRbM4tqnknB7/UGLts7PHPGFcgPpOXlRVMjsK0M1MMC3G
         WR0+Oony7ZLP2mqtljl0dQAIVzl1rdonGmHBPjxWEsG13k6t0lyzSTlagNZpL9PRNRpc
         qTMLaoHOZjfqOxW4/Eod2/pN8u6upLJSjf/L94B6v0Y/gAk/N7Ri9hCbkifC0dWJWTr4
         LcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726710282; x=1727315082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DX8B0AVGc1Jcf/sZuX/Lm5rKGNOWSa7SVLWhBKf+5LU=;
        b=F6xSZzy/q0CXzAqeZQkgc0Kw6p95xRG0rI5r0iN7VyoCHP0KED7Iz2UGFFF+HpK4dj
         mmD07nfNzHGTYD3UKRoX8H+NCKumSXZvQr2PQNcugMFPDCII8L7sE2RZLXwvKA9b03Yr
         oUB/rLMqKA2SFm1nGMrxJbrnALWVeZvDcUvUGGqpW6WTVI1b57bIcBxcLS/mqb7Fbnsj
         mRK/kupDNVH1rNvgKT0od6F0oQ9dg6Vc7cPyXjKZCj1LzQXw8S/8/LpWJX9T8eBX7otJ
         R9ueAuLqHs+quIiE+Y9yz2WWDzN4BoyTDMPi458sLU0ZfA3yUluJ7YNTwSps1W/EDuf0
         QI3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVyYGHnxk+UANi8Fow5/xnYITSphT/ys6uaZkrIbeI7BQMs8HXpSf4ZtVk+nFw+OCMd0snx7nFPCu/@alsa-project.org
X-Gm-Message-State: AOJu0YxYL8uy1kFirxpAjuBMw0h5WAWB9ytnPiNhfdbasbkpPJ/qndYk
	OdZqs7W56Ywg4mmj2Xog7ItDN6lEqau4gDYi3VEe6BGa55k6e8BPRIocNq3InYeSL4pQ8tXO85z
	QY+L4CDqHGEkxSxgUqFZecY5X7Iw=
X-Google-Smtp-Source: 
 AGHT+IFvWrciDr6mTn/0jLlxcfQLFJaLJCVtLl6E6HMysiz+7fvxdv5D3t/y67xbPvsZHZCxSp+6BBa6yDCK4/1bo5U=
X-Received: by 2002:a05:6e02:13a2:b0:39f:6180:afca with SMTP id
 e9e14a558f8ab-3a08491196bmr275534325ab.13.1726710282105; Wed, 18 Sep 2024
 18:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <1725615837-24872-1-git-send-email-shengjiu.wang@nxp.com>
 <CAA+D8AOkQOanya6RViXfk_=CmNmCWx-N3cb-0SjMhSy0AA7LeA@mail.gmail.com>
In-Reply-To: 
 <CAA+D8AOkQOanya6RViXfk_=CmNmCWx-N3cb-0SjMhSy0AA7LeA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 19 Sep 2024 09:44:31 +0800
Message-ID: 
 <CAA+D8ANFn6yD=gV+uMYXyQ_7TmOoBnmJtMZ70qPOS_dHn8OkPA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] ASoC: fsl: add memory to memory function for
 ASRC
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NJ6XJXP7HLMCL25WAI4TCBZBS2NDMQLC
X-Message-ID-Hash: NJ6XJXP7HLMCL25WAI4TCBZBS2NDMQLC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJ6XJXP7HLMCL25WAI4TCBZBS2NDMQLC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jaroslav

On Fri, Sep 13, 2024 at 10:29=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail=
.com> wrote:
>
> On Fri, Sep 6, 2024 at 6:05=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
> >
> > This function is base on the accelerator implementation
> > for compress API:
> > https://patchwork.kernel.org/project/alsa-devel/patch/20240731083843.59=
911-1-perex@perex.cz/
>
> Hi Jaroslav
>
>     Shall I add this patch to my patch set next time? Last time I
> reported an issue
> about "list_for_each_entry_safe_reverse", I can help to add it.  or
> will you send
> another version by yourself?

A gentle reminder, look forward to your reply.
Thanks.

Best regards
Shengjiu Wang

>
> Best regards
> Shengjiu Wang
>
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
> >
> > changes in v3:
> > - use Jaroslav's suggestion for header file compress_params.h (PATCH 01=
)
> > - remove the ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE definition
> > - remove ASRC_RATIO_MOD in this version because it uses .set_metadata()
> >   Will wait Jaroslav's update or other better method in the future.
> > - Address some comments from Pierre.
> >
> > changes in v2:
> > - Remove the changes in compress API
> > - drop the SNDRV_COMPRESS_SRC_RATIO_MOD
> > - drop the SND_AUDIOCODEC_SRC and struct snd_dec_src
> > - define private metadata key value
> >   ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE/ASRC_RATIO_MOD
> >
> > Shengjiu Wang (6):
> >   ALSA: compress: Add output rate and output format support
> >   ASoC: fsl_asrc: define functions for memory to memory usage
> >   ASoC: fsl_easrc: define functions for memory to memory usage
> >   ASoC: fsl_asrc_m2m: Add memory to memory function
> >   ASoC: fsl_asrc: register m2m platform device
> >   ASoC: fsl_easrc: register m2m platform device
> >
> >  include/uapi/sound/compress_params.h |  23 +-
> >  sound/soc/fsl/Kconfig                |   1 +
> >  sound/soc/fsl/Makefile               |   2 +-
> >  sound/soc/fsl/fsl_asrc.c             | 179 ++++++-
> >  sound/soc/fsl/fsl_asrc.h             |   2 +
> >  sound/soc/fsl/fsl_asrc_common.h      |  70 +++
> >  sound/soc/fsl/fsl_asrc_m2m.c         | 727 +++++++++++++++++++++++++++
> >  sound/soc/fsl/fsl_easrc.c            | 261 +++++++++-
> >  sound/soc/fsl/fsl_easrc.h            |   4 +
> >  9 files changed, 1260 insertions(+), 9 deletions(-)
> >  create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c
> >
> > --
> > 2.34.1
> >
