Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D167859BDB
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Feb 2024 07:08:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C75DBAE8;
	Mon, 19 Feb 2024 07:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C75DBAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708322935;
	bh=4p3chFjmYrTbHPpVrweGEgP2/JTbJWJhCYkS0mNGTyM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ax/uP+BeWNMNAt/Tgawv/fh+WiOSl8Rt7/eGEBR005piqGhXgLzd/9zquQDoTX+K1
	 pu9m2kCAyfEHxQbjcaCh8opUqsc8bhC2HFm7z7D0bSrMvMIcqo7majLQDdo6gg3sWJ
	 eHnEBT34pnofWH1P01IIkb88NrbPa16gBoRd7ALg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B075F805A0; Mon, 19 Feb 2024 07:08:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DE85F8059F;
	Mon, 19 Feb 2024 07:08:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04937F80496; Mon, 19 Feb 2024 07:04:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8501F800ED
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 07:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8501F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JwEtAOuY
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3650c7e0dd2so5168315ab.2
        for <alsa-devel@alsa-project.org>;
 Sun, 18 Feb 2024 22:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708322629; x=1708927429;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoCJLYOduj9n23MLx0saV8cGvj1vyy+InFEBX0fNSWY=;
        b=JwEtAOuY59zoH7jIXwrIIPEcDrptTyWGFIuNRnwGvYR+7lXbEraKPPOabkw0dMJsmJ
         2riMywA7ZAR1NB6vN756x1POt+cFrIsViuazK1WbAVlvz4bKcoODrHV85EquAvYJiR8T
         /mLgpHW3HCUozdcEr4iBpyJKzXUwLB+SkZgWDO6gESg3P56fNm+tvHVAO/dWTLd5RFaO
         7R7VgNgTJiVpzDiflixm9Q+m5X1IOG2ACXY0uh2hlFlsDVqQEzaEgXTcI+MtZrUNsC1S
         P6zCUnKmQti2eBUlLK8yOj83fhrXmwthza1876pyqclu74w4CtI+T/GYKeEp16rND493
         BHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708322629; x=1708927429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoCJLYOduj9n23MLx0saV8cGvj1vyy+InFEBX0fNSWY=;
        b=WY9X+PaOFhURvbY1UfKZO1yIrigl7/0jiDb9C3BKflRws3f8eQXgPyz648DmeVx0Be
         uYQG4ge2Pa3P9cQhszVAjhDtXGvfQW4fdbttKdtEQFawS4YrFJEqpyzeHOSer7rs2eT9
         H4grOEXcjLMI3LdStHOmh4QJGLhd1OnCsr8tBJUYoWgQ8zWbNDlEiqJgMUjy1nRuuQjn
         bLt8qLqHtuIUmA/jkQURV5wP/TtVjqe2ZVhqSt8Zz+FzYMC/7Af3rPWDDso9xq8pxJ9i
         LemMSa4P6XYUJOhO+8prKz5RzO9sGH+KAdQdpmTmaKZRUgiz1rc5diK1GYqHmx2t8Zxy
         /Ekg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXKZHiryBKvXme1AUo6fVnuOHqYf44m8E6t0jk/pTxVSkhtR100o1ysbHTI0xwJaHyVOXUHXzhdDf2p3AE54RuuhCLMd2yrlQ0lPk=
X-Gm-Message-State: AOJu0YxyRNvdnEQSoKDB8gLiC9ndLshqIVqypXJ9fOlrzOuwAwLpp1AY
	yKIZVLFY67Hpq91nCyy8lez424L8Lh+kqNDVOfvCLWwpql1umNe5XUsBXcn7sjblx1vF1mG46z8
	gG7XdBzLALCbmIQ76yAOuGG7xWkI=
X-Google-Smtp-Source: 
 AGHT+IEYk69UufUFWwE7DTTiq8C+0ZQ+JTG7QL74tqi/J6KrU4GZcFAsfIhM3H47exPifWYnK4hxbC8F6eipbdBDtHw=
X-Received: by 2002:a92:d78b:0:b0:363:e573:da77 with SMTP id
 d11-20020a92d78b000000b00363e573da77mr9821592iln.18.1708322628698; Sun, 18
 Feb 2024 22:03:48 -0800 (PST)
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
 <1705581128-4604-11-git-send-email-shengjiu.wang@nxp.com>
 <20240217105708.53c81b04@coco.lan>
In-Reply-To: <20240217105708.53c81b04@coco.lan>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Feb 2024 14:03:37 +0800
Message-ID: 
 <CAA+D8APQy0NaZH44zgoHfMJ1pFS3TporVZZt7zV=Yy-edWacdg@mail.gmail.com>
Subject: Re: [PATCH v12 10/15] media: uapi: Add audio rate controls support
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
 sakari.ailus@iki.fi,
	tfiga@chromium.org, m.szyprowski@samsung.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 47HKIU3MHUDASHUZ6EHNUXT6OVF4IF7V
X-Message-ID-Hash: 47HKIU3MHUDASHUZ6EHNUXT6OVF4IF7V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47HKIU3MHUDASHUZ6EHNUXT6OVF4IF7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Feb 17, 2024 at 5:57=E2=80=AFPM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Em Thu, 18 Jan 2024 20:32:03 +0800
> Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
>
> > Add V4L2_CID_M2M_AUDIO_SOURCE_RATE and V4L2_CID_M2M_AUDIO_DEST_RATE
> > new IDs for rate control.
> >
> > Add V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET and
> > V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET for clock drift.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../media/v4l/ext-ctrls-audio-m2m.rst         | 20 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  6 ++++++
> >  include/uapi/linux/v4l2-controls.h            |  5 +++++
> >  3 files changed, 31 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.=
rst b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > index 82d2ecedbfee..de579ab8fb94 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > @@ -19,3 +19,23 @@ Audio M2M Control IDs
> >      The Audio M2M class descriptor. Calling
> >      :ref:`VIDIOC_QUERYCTRL` for this control will
> >      return a description of this control class.
> > +
> > +.. _v4l2-audio-asrc:
> > +
> > +``V4L2_CID_M2M_AUDIO_SOURCE_RATE (integer menu)``
> > +    Sets the audio source sample rate, unit is Hz
> > +
> > +``V4L2_CID_M2M_AUDIO_DEST_RATE (integer menu)``
> > +    Sets the audio destination sample rate, unit is Hz
> > +
> > +``V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET (fixed point)``
> > +    Sets the offset from the audio source sample rate, unit is Hz.
> > +    The offset compensates for any clock drift. The actual source audi=
o
> > +    sample rate is the ideal source audio sample rate from
> > +    ``V4L2_CID_M2M_AUDIO_SOURCE_RATE`` plus this fixed point offset.
> > +
> > +``V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET (fixed point)``
> > +    Sets the offset from the audio destination sample rate, unit is Hz=
.
> > +    The offset compensates for any clock drift. The actual destination=
 audio
> > +    sample rate is the ideal source audio sample rate from
> > +    ``V4L2_CID_M2M_AUDIO_DEST_RATE`` plus this fixed point offset.
>
> Hmm... first of all, controls on V4L2 API can either be get or set.
> So, starting the sentence with "Set" sounds an assumption that may
> be wrong.

Ok, will update the description.
>
> Also, I would explain a little bit more about the frequency offset values=
,
> as clock drift adjustment on PCM streams is something that can be done
> using different approaches.
>
> I'm assuming that what you wanted here is to use it to check if the
> video and audio clocks have some drift, and reducing or increasing
> the audio sample rate dynamically to ensure that such drift will
> stay constraint to a maximum allowed drift measured in mili or nano
> seconds. So, userspace would be expected to be monitoring such drift
> and increasing/decreasing the sample frequency as needed to maintain
> such constraint.
>
> Is that the way such uAPI is expected to work?

Yes. Userspace should monitor the drift, get the offset based on the
common sample rate (8k, 44.1k, 48k...) then send it to the driver.
The offset is a fixed point. it is base on the patch:
https://patchwork.kernel.org/project/linux-media/patch/cec82507-ced9-4e7d-8=
02c-04a40f84a4b4@xs4all.nl/

Best regards
Shengjiu Wang
>
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/=
v4l2-core/v4l2-ctrls-defs.c
> > index 2a85ea3dc92f..91e1f5348c23 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1245,6 +1245,8 @@ const char *v4l2_ctrl_get_name(u32 id)
> >
> >       /* Audio M2M controls */
> >       case V4L2_CID_M2M_AUDIO_CLASS:  return "Audio M2M Controls";
> > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE:    return "Audio Source Samp=
le Rate";
> > +     case V4L2_CID_M2M_AUDIO_DEST_RATE:      return "Audio Destination=
 Sample Rate";
> >       default:
> >               return NULL;
> >       }
> > @@ -1606,6 +1608,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, e=
num v4l2_ctrl_type *type,
> >       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> >               *type =3D V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> >               break;
> > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE:
> > +     case V4L2_CID_M2M_AUDIO_DEST_RATE:
> > +             *type =3D V4L2_CTRL_TYPE_INTEGER_MENU;
> > +             break;
> >       default:
> >               *type =3D V4L2_CTRL_TYPE_INTEGER;
> >               break;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index a8b4b830c757..30129ccdc282 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -3495,6 +3495,11 @@ struct v4l2_ctrl_av1_film_grain {
> >  #define V4L2_CID_M2M_AUDIO_CLASS_BASE  (V4L2_CTRL_CLASS_M2M_AUDIO | 0x=
900)
> >  #define V4L2_CID_M2M_AUDIO_CLASS       (V4L2_CTRL_CLASS_M2M_AUDIO | 1)
> >
> > +#define V4L2_CID_M2M_AUDIO_SOURCE_RATE       (V4L2_CID_M2M_AUDIO_CLASS=
_BASE + 0)
> > +#define V4L2_CID_M2M_AUDIO_DEST_RATE (V4L2_CID_M2M_AUDIO_CLASS_BASE + =
1)
> > +#define V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET        (V4L2_CID_M2M_AUD=
IO_CLASS_BASE + 2)
> > +#define V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET  (V4L2_CID_M2M_AUDIO_CLASS=
_BASE + 3)
> > +
> >  /* MPEG-compression definitions kept for backwards compatibility */
> >  #ifndef __KERNEL__
> >  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
>
>
>
> Thanks,
> Mauro
