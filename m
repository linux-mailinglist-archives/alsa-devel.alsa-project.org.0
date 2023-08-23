Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D608A785AC6
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 16:35:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA9147F1;
	Wed, 23 Aug 2023 16:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA9147F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692801312;
	bh=Wf4lKeBs7njp9QgtCROLYU1ahH+n9VvYOdl0p9jNWeg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IBCirOPiKcA7ts4VuIq6i7de8n2MUp6uXUyUL+bzs/TBQh7DaL67eUZe9GZTfc+sZ
	 A3dMKYFXzA4sTN4W7IqUSQQcdt/K0ADTSjXzSmeTlHb6UKO7vOnrXZIF5z0K62uXjc
	 jVu2QiNesnjLG4EvD8oXTkXfwfTDIVsQ6zh0eBoA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5D35F80022; Wed, 23 Aug 2023 16:34:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DECA8F800F5;
	Wed, 23 Aug 2023 16:34:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89A47F80158; Wed, 23 Aug 2023 16:33:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1AADF80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 16:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1AADF80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=FijKnNAw
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bc83a96067so34918675ad.0
        for <alsa-devel@alsa-project.org>;
 Wed, 23 Aug 2023 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692801212; x=1693406012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opEDXWUEt7EKF4zm4tFGmxwp6/VFKRX/hggL0pC3hFg=;
        b=FijKnNAwLdTa7eGWURoxdF1nj/sGLuLtnmMlbyhRcxeoDkFHXhUTnwMA62YfGIxkjt
         bPYVQfSOW9rYd1Fu6WMGsUSFWtqLCHchp0ibuGpgQnflPYmbOmow1mP/mpplcIXQXJAm
         nq+YBh9dvj+9Df3kjqL+VfAzjfsu62PU9//B7ns5C1iTsPcM82Kb+GnoGKMU0lSD8a8D
         h2MFHeXmffWoQK5X7zt5c7PN+Nkd4ZDAyTSvcd4PtbIwqj7Hyn/wsos+ajVUun9cBDz5
         xB/rdFfEzmQvOYN7Si8wByaSttuhqFs8Oo1HkgSb5xt7kA9+/1mS4+lEhZrm6Vw3P6AR
         s52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801212; x=1693406012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opEDXWUEt7EKF4zm4tFGmxwp6/VFKRX/hggL0pC3hFg=;
        b=jZLIwkSiNWii/O7Jw1JlX8CQzFx0mmRFFscZo03By2Y/P6a7FdmG95vfMQ/PY/3KDx
         AIPUwbXF/9v6r7fZPqjomvNT/pLCqtrRg5Patoes/oJM5HYZmFpC9b51vEXw+NygCgvT
         uyfogH7QaiNG6wIDjwfvE4aM04PQrHo+JED92XAyAV+XzMGbdYP2Oa/r3NJNeE/Y5yCH
         POMdKSQ15ITtI7/6NcVinjss3fiEUqdp8QfcdA6SjdQVQ0p4NG8qSY5wGx2wSg4I1KQT
         mD5vMcrCIvizFmR/0gHWC8A2U7ZDhwqdaFBDIJjwzG8G5D4eETLRe+s15I1o2g+dgeBR
         hAQA==
X-Gm-Message-State: AOJu0YxDAK7StYJUwkeNs46DwGLWjpinyglMMUA1eYkwvqo+2/ncb8zX
	2KO7NKP1Scxzq+PmoLgBuAwOZnHgC5R/ubR3uHA=
X-Google-Smtp-Source: 
 AGHT+IEYVLJxkNQ+r5jQ6CuGxcPrrROsrxTFPOgHY9VnYAB28C8do6b0cl9JPpTo2JeKUnzxrulPL7MFHljcVXMW9mg=
X-Received: by 2002:a17:90b:124f:b0:26c:f6d2:2694 with SMTP id
 gx15-20020a17090b124f00b0026cf6d22694mr9303778pjb.12.1692801211024; Wed, 23
 Aug 2023 07:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <87il9xoddo.wl-tiwai@suse.de>
 <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
 <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk>
 <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
 <CAA+D8AMriHO60SD2OqQSDMmi7wm=0MkoW6faR5nyve-j2Q5AEQ@mail.gmail.com>
In-Reply-To: 
 <CAA+D8AMriHO60SD2OqQSDMmi7wm=0MkoW6faR5nyve-j2Q5AEQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 23 Aug 2023 22:33:19 +0800
Message-ID: 
 <CAA+D8AN34-NVrgksRAG014PuHGUssTm0p-KR-HYGe+Pt8Yejxg@mail.gmail.com>
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
Message-ID-Hash: 2ORGK73J6AAJMOXJGRSLTIMCA5JBBDCL
X-Message-ID-Hash: 2ORGK73J6AAJMOXJGRSLTIMCA5JBBDCL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ORGK73J6AAJMOXJGRSLTIMCA5JBBDCL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 11, 2023 at 7:05=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> Hi Mark, Takashi
>
> On Thu, Aug 3, 2023 at 9:11=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail=
.com> wrote:
> >
> > On Thu, Aug 3, 2023 at 1:28=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:
> > >
> > > On Wed, Aug 02, 2023 at 10:41:43PM +0800, Shengjiu Wang wrote:
> > >
> > > > Currently the ASRC in ALSA is to connect to another I2S device as
> > > > a sound card.  But we'd like to the ASRC can be used by user space =
directly
> > > > that user space application can get the output after conversion fro=
m ASRC.
> > >
> > > That sort of use case would be handled via DPCM at the minute, though
> > > persuading it to connect two front ends together might be fun (which =
is
> > > the sort of reason why we want to push digital information down into
> > > DAPM and make everything a component).
> >
> > Thanks.
> >
> > ASRC M2M case needs to run as fast as possible, no sync clock control.
> > If use sound card to handle ASRC M2M case,  the user application
> > should be aplay/arecord, then we need to consider xrun issue, buffer
> > may timeout, sync between aplay and arecord,  these should't be
> > considered by pure memory to memory operation.
> >
> > DPCM may achitect all the audio things in components and sound
> > card,  it is good. but for the M2M case, it is complcated. not sure
> > it is doable.
> >
>
> Beside the concern in previous mail,
>
> DPCM needs to separate ASRC to be two substreams (playback and capture).
>
> But the ASRC needs the sample rate & format of input and output first
> then start conversion.
>
> If the playback controls the rate & format of input,  capture substream
> controls the rate & format of output,  as a result
> one substream needs to get information(dma buffer address, size...
> rate, format) from another substream, then start both substreams in the
> last substream. How to synchronize these two substreams is a problem.
> One stream can be released but another stream doesn't know .
>
> So I don't think it is a good idea to use DPCM for pure M2M case.
>
> So can I persuade you to consider the V4L2 solution?
>

Just a summary:

Basic M2M conversion can work with DPCM, I have tried with some
workaround to make it work.

But there are several issues:
1. Need to create sound cards.  ASRC module support multi instances, then
need to create multi sound cards for each instance.

2. The ASRC is an entirety but with DPCM we need to separate input port and
output port to playback substream and capture stream. Synchronous between
playback substream and capture substream is a problem.
How to start them and stop them at the same time.

3. How to handle the xrun issue. pause or resume. which are brought by ALSA=
.

So shall we make the decision that we can go to the V4L2 solution?

Best regards
Wang Shengjiu
