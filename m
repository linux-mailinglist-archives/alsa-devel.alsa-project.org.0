Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8801076D055
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 16:43:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FABD3E7;
	Wed,  2 Aug 2023 16:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FABD3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690987387;
	bh=wdhPTNBKcOXuBJNktUQ0qZsu2xmwFBJgyGARGj8eGHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J5jp/DYtbA69th1lqvks1ZaAB11x8o5EtltH9AhFT9SWX35O7cLKhQW4zduz1dPzj
	 Hg9VQlM9NXUjUYCIiufLB8uG6b9hcSOK1TD5VASUmGowvY6X5Fm4Cn/rFmV2cBnNpF
	 hpODsf8EDJi8HZHmCpTzsujrg+A1jDXR1WQT9cDw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FFA5F80087; Wed,  2 Aug 2023 16:42:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85ADDF801D5;
	Wed,  2 Aug 2023 16:42:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 799D8F8025A; Wed,  2 Aug 2023 16:42:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9055AF80087
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 16:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9055AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=mGgnebdB
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-267fc19280bso721364a91.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 07:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690987315; x=1691592115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIjRCuFSh10TgeuSUQ8r4PrErxnjVCdj/TIwnacZN1M=;
        b=mGgnebdB8kAVU+E2H5mynakxO+gKdMPzTPPnfuycCqzcB/1PHsmMTkSVCSiU7lhUUI
         ISo1GIYfQ9Vuzwy8IAUdLxEsRQEHulbbs8YpB1j9NdhX3ghVb/GEf8HZbQJhgD42L9W6
         J4tUmzOl3xNsWNsHob/Tg4tYwVVPoAH96k8sbSAmz9k1hDHaRLJWk5/a3Z2KIeJhmIRi
         P+wPPxwgb78DmyFbaOR+m8bYtICXyyJ/vHR5WzzWclsB1Fkx0e3wIXtATQwz9fbBhNY/
         pxq8WWRyFUd899J75q5wG/Hbanlc6WKpRWN+aVkgpq3ePXpaLkvsg0rYB/HkBA6FX4fW
         CiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690987315; x=1691592115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIjRCuFSh10TgeuSUQ8r4PrErxnjVCdj/TIwnacZN1M=;
        b=B6yDVqlBGHy+iKbHeD+12TUy2fSyme8isZLjVzJcURdeJQvnXtEIEDHdoMVEtO92Cj
         qsDM847jwIyeUXa+amcJmFVm44FFpKfxQwOVh21m1OpB05xjXxvj8k/C7Zm92z/rDKMc
         E1mmRd4qRbjOfmqbyMstxPP0bu+zjPjldFyT1A/6P0CWliWI3yC4hAe36IESKG7/680F
         rMnQuSwyec2uZs2JQWaw2ogcvYUMrW1KdIBiVF8D6L3v0flXyxASDzIUuzdT7F0fK2sA
         SQYbuS53N8cDcjSVOZZqJxAy+JDXFot6fMP3xwJDRmdTcsUIDJ0ypWMxi4vl0IfdM83b
         tjrw==
X-Gm-Message-State: ABy/qLZE5aTqXfJc8QuvYUJLnSZ96QXuu2A/LoQLv9mAy0GECzHXpR37
	Gg+XguROFaP2X5fgQ9IY/XSbq8ajrxtJ49/xtHM=
X-Google-Smtp-Source: 
 APBJJlFz2P+Hhh/+gr4lvaHd8cYOPbmuxQXrmDFhh17NWbkyLYYcpfmWzMEWjHFqCWqAW1bGM/Mh7zG6bY8iwCpx2CU=
X-Received: by 2002:a17:90a:fa05:b0:268:21c3:4fd8 with SMTP id
 cm5-20020a17090afa0500b0026821c34fd8mr19933605pjb.20.1690987314959; Wed, 02
 Aug 2023 07:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <87il9xoddo.wl-tiwai@suse.de>
In-Reply-To: <87il9xoddo.wl-tiwai@suse.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 2 Aug 2023 22:41:43 +0800
Message-ID: 
 <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
To: Takashi Iwai <tiwai@suse.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 sakari.ailus@iki.fi,
	tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: J3O6VMJQUABXLILGS77XFH73SDOL6VIB
X-Message-ID-Hash: J3O6VMJQUABXLILGS77XFH73SDOL6VIB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3O6VMJQUABXLILGS77XFH73SDOL6VIB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 2, 2023 at 8:08=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 02 Aug 2023 14:02:29 +0200,
> Shengjiu Wang wrote:
> >
> > On Wed, Aug 2, 2023 at 7:22=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wro=
te:
> > >
> > > On Wed, 02 Aug 2023 09:32:37 +0200,
> > > Hans Verkuil wrote:
> > > >
> > > > Hi all,
> > > >
> > > > On 25/07/2023 08:12, Shengjiu Wang wrote:
> > > > > Audio signal processing has the requirement for memory to
> > > > > memory similar as Video.
> > > > >
> > > > > This patch is to add this support in v4l2 framework, defined
> > > > > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > > > > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > > > > for audio case usage.
> > > > >
> > > > > The created audio device is named "/dev/audioX".
> > > > >
> > > > > And add memory to memory support for two kinds of i.MX ASRC
> > > > > module
> > > >
> > > > Before I spend time on this: are the audio maintainers OK with doin=
g
> > > > this in V4L2?
> > > >
> > > > I do want to have a clear statement on this as it is not something =
I
> > > > can decide.
> > >
> > > Well, I personally don't mind to have some audio capability in v4l2
> > > layer.  But, the only uncertain thing for now is whether this is a
> > > must-have or not.
> > >
> >
> > Thanks,  I am also not sure about this.  I am also confused that why
> > there is no m2m implementation for audio in the kernel.  Audio also
> > has similar decoder encoder post-processing as video.
> >
> > >
> > > IIRC, the implementation in the sound driver side was never done just
> > > because there was no similar implementation?  If so, and if the
> > > extension to the v4l2 core layer is needed, shouldn't it be more
> > > considered for the possible other route?
> > >
> >
> > Actually I'd like someone could point me to the other route. I'd like t=
o
> > try.
> >
> > The reason why I select to extend v4l2 for such audio usage is that v4l=
2
> > looks best for this audio m2m implementation.  v4l2 is designed for m2m
> > usage.  if we need implement another 'route',  I don't think it can do =
better
> > that v4l2.
> >
> > I appreciate that someone can share his ideas or doable solutions.
> > And please don't ignore my request, ignore my patch.
>
> Can you explain a bit more details of your demand?
> At least, a "big picture" showing how your hardware is implemented and
> what is exactly necessary would be helpful for understanding the
> problem.
>

We have the hardware IP: ASRC,  asynchronous sample rate converter.

Currently the ASRC in ALSA is to connect to another I2S device as
a sound card.  But we'd like to the ASRC can be used by user space directly
that user space application can get the output after conversion from ASRC.

The ASRC can be integrated into a multimedia framework (gstreamer) as a plu=
gin.

best regards
wang shengjiu
