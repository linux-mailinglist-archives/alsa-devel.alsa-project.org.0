Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2909377001D
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 14:21:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D93503E7;
	Fri,  4 Aug 2023 14:20:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D93503E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691151676;
	bh=QS2FhhkfEvOxkglRWjF4jgd13JYHGia3cJR5BIHCSgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JyQwvZz8/XNr2wKNcw4jFogdY6eNycT9StGK5I6UkNlT/DfCkw3w7Qz8JOkvKZmTq
	 CTdUHrngT58a1VYwqRP87zyXdPDjGUMWvcReOrij5126s/xL46QfuC5kJHw4cQbcCj
	 Bu6tlVFqgSrcyLmG1gij206AtJqszqoELWqZWLiQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F870F80520; Fri,  4 Aug 2023 14:20:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5063F801D5;
	Fri,  4 Aug 2023 14:20:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2F52F8025A; Fri,  4 Aug 2023 14:20:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 246C0F8015B
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 14:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 246C0F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=kbQlGVsJ
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3490cf176feso7365875ab.0
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Aug 2023 05:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691151606; x=1691756406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrwOUvJz44BN5+OtSVByIy8J3CpPSze+6riYsFxfsMQ=;
        b=kbQlGVsJp70sWB8QfAfHW27v/PNM84FAARz14y/rUBtAb4gtteYLF+sn3H3D69jwb4
         iugxxkMuzylxdHfEz68QjqfCS3RjX+xRrF7VgiAJmgHYmZNCgzJLzl5t3NCgn19UakBF
         Uri4Pbjl8XI0HprawdOaGavbl11N4d3J0u4idM0gNqUqtgZGiMFA46XMdGEnNaez+jGv
         omJgYUuHUIyiRKUZrCKuW11ITVCEioymwgiMnOxdY079JEeNQ198TGzr1cuVWSfvmkMY
         R5XueAh45t8KGN/CABOf79zw24ngPZXbrF2YJMsy5YewAvNxQQlydN/iyNlR8y2472/1
         DdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691151606; x=1691756406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrwOUvJz44BN5+OtSVByIy8J3CpPSze+6riYsFxfsMQ=;
        b=GlLH4XYCiO+Bh+apZ1Ydyd6sMnyJlNQfijGgWgSrq0NdaZCfaLIbYQicljE+z0oGar
         6Ftj0kvdRNxeh0VDE6qeIlwSmfJa+FdUB7gCqX7vti8E5j0X0NUyfp+BlAMeBLArJAE8
         1L2xkQhE4cXtTwXzU9Eu1/GRoVUj1KhVME1gvQD2HLyNfCiCSDLOpuC6BfquTLnz0ZHR
         Osxfbrh/oFvDMEsjg+Ts0qgE9ukiWzZS+ESJPxk6+qMV+dXTHK5VDJ9qC2vryVdf1Jvs
         eu3EpODrMEz7HUrbBn/zRGgH656vjjNCmM+b4oM0PgAaanrh6tufsJaPps1psUl8Y/A2
         CByw==
X-Gm-Message-State: AOJu0YzMSGm3liO6zCeUIuDuWF9+w+VzMX2XSORyWqaJVr6xv/5YF9P9
	NNPMZAl/FCWTt4u8XGN19Ia1dGQJrl768Gb4HiQ=
X-Google-Smtp-Source: 
 AGHT+IGXmtFNaA0hRyLJ1GmqVu20WaJ5uUAJgyR8e37qIbW6h/p7fMU2JoYVpgxxO9U9RB7zJ7ER+mQH+cMrPNHxCQQ=
X-Received: by 2002:a05:6e02:184e:b0:345:cdbe:833c with SMTP id
 b14-20020a056e02184e00b00345cdbe833cmr1983943ilv.28.1691151606515; Fri, 04
 Aug 2023 05:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <d038360b-22a2-3869-cd64-2da827736faa@xs4all.nl>
In-Reply-To: <d038360b-22a2-3869-cd64-2da827736faa@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 4 Aug 2023 20:19:49 +0800
Message-ID: 
 <CAA+D8ANSihjxvqkATE9z460sPz4nbcUqhDrR3eiEjPaU6ytrXQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Takashi Iwai <tiwai@suse.de>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 sakari.ailus@iki.fi,
	tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: A4DOUXWKCJ6F7CPOL7XZJERP2U5WB3DE
X-Message-ID-Hash: A4DOUXWKCJ6F7CPOL7XZJERP2U5WB3DE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A4DOUXWKCJ6F7CPOL7XZJERP2U5WB3DE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 2, 2023 at 8:28=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> On 02/08/2023 14:02, Shengjiu Wang wrote:
> > On Wed, Aug 2, 2023 at 7:22=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wro=
te:
> >>
> >> On Wed, 02 Aug 2023 09:32:37 +0200,
> >> Hans Verkuil wrote:
> >>>
> >>> Hi all,
> >>>
> >>> On 25/07/2023 08:12, Shengjiu Wang wrote:
> >>>> Audio signal processing has the requirement for memory to
> >>>> memory similar as Video.
> >>>>
> >>>> This patch is to add this support in v4l2 framework, defined
> >>>> new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> >>>> V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> >>>> for audio case usage.
> >>>>
> >>>> The created audio device is named "/dev/audioX".
> >>>>
> >>>> And add memory to memory support for two kinds of i.MX ASRC
> >>>> module
> >>>
> >>> Before I spend time on this: are the audio maintainers OK with doing
> >>> this in V4L2?
> >>>
> >>> I do want to have a clear statement on this as it is not something I
> >>> can decide.
> >>
> >> Well, I personally don't mind to have some audio capability in v4l2
> >> layer.  But, the only uncertain thing for now is whether this is a
> >> must-have or not.
> >>
> >
> > Thanks,  I am also not sure about this.  I am also confused that why
> > there is no m2m implementation for audio in the kernel.  Audio also
> > has similar decoder encoder post-processing as video.
> >
> >>
> >> IIRC, the implementation in the sound driver side was never done just
> >> because there was no similar implementation?  If so, and if the
> >> extension to the v4l2 core layer is needed, shouldn't it be more
> >> considered for the possible other route?
> >>
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
> To give a bit more background: if it is decided to use the v4l API for th=
is
> (and I have no objection to this from my side since API/framework-wise it=
 is a
> good fit for this), then there are a number of things that need to be don=
e to
> get this into the media subsystem:
>
> - documentation for the new uAPI
> - add support for this to v4l2-ctl
> - add v4l2-compliance tests for the new device
> - highly desirable: have a virtual driver (similar to vim2m) that support=
s this:
>   it could be as simple as just copy input to output. This helps regressi=
on
>   testing.
> - it might need media controller support as well. TBD.
>
> None of this is particularly complex, but taken all together it is a fair
> amount of work that also needs a lot of review time from our side.
>
> I want to add one more option to the mix: drivers/media/core/v4l2-mem2mem=
.c is
> the main m2m framework, but it relies heavily on the videobuf2 framework =
for
> the capture and output queues.
>
> The core vb2 implementation in drivers/media/common/videobuf2/videobuf2-c=
ore.c
> is independent of V4L2 and can be used by other subsystems (in our case, =
it is
> also used by the DVB API). It is a possibility to create an alsa version =
of
> v4l2-mem2mem.c that uses the core vb2 code with an ALSA uAPI on top.
>
> So in drivers/media/common/videobuf2/ you would have a videobuf2-alsa.c b=
esides
> the already existing videobuf2-v4l2.c and -dvb.c.
>
> Perhaps parts of v4l2-mem2mem.c can be reused as well in that case, but I=
 am
> not sure if it is worth the effort. I suspect copying it to an alsa-mem2m=
em.c
> and adapting it for alsa is easiest if you want to go that way.
>

Thanks.

Does this means that videobuf2-v4l2.c and v4l2-mem2mem.c are dedicate
for video device? if audio want to use v4l2 framework,  need to create
videobuf2-alsa.c and alsa-mem2mem.c, but it may cause a lot of function
duplicate.

Best regards
Wang Shengjiu
