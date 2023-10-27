Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F90C7D8E31
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 07:36:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68AE8A4E;
	Fri, 27 Oct 2023 07:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68AE8A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698384969;
	bh=ksRkRFnnSD5BohIVR6ujtifPZvny8O4Y4m+QDyGIIhA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OVfvk88Xz84rB2EHyGRO22FCF0ZFz9CE1DvsOOaaCyvJY2N3QOjQh1PfoIPttAunv
	 6Hl07I6CYJ9CcGJkqhmvkDToOeClMv2yS30WA5L6XQrBi/XsFHThdFQul1oNyA+Vfb
	 z1zOza5YwGVHmpWYqckWuLo1P+SfLtAN3cCE1vW0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96C73F8019B; Fri, 27 Oct 2023 07:35:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 257DFF80165;
	Fri, 27 Oct 2023 07:35:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FD3FF8019B; Fri, 27 Oct 2023 07:30:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 398E3F8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 07:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 398E3F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Vb8aI8Yd
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-564af0ac494so1446898a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 26 Oct 2023 22:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698384441; x=1698989241;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSH6er1S/8VpTk0zK1LTJVVGU+rFN/elA5pOh6jUYKs=;
        b=Vb8aI8Yd2UbPTXoTgg5YPZc6iyXlCjH0ecAdX1/j74sLsjEn3sIPhr0q1GiGBdhu9I
         ePoo1LyxBo1TW0KGU+ffNaGTFKA4Cw98GhERbc5O7toSqNenWTnfdgGQUsbyz9lugoCj
         tKg8hdFaVosESTarPCnFV6kaInI8AjAT4EMO9k8xHstOU68tio7KjvxGMKSgURULCq7o
         wl1A9boKv4gABxENmiwDzm/S5ScIzEGf1yHICM++n2Fzh/WfYkTEi7WQSdFwl/YKBGH8
         OiUf5iTTH5DG2VNZW76UWbtHFnlAO5JM84Y4+fLM40IcBN01uzyGDEUv8wYfsp7VRnwx
         RiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698384441; x=1698989241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSH6er1S/8VpTk0zK1LTJVVGU+rFN/elA5pOh6jUYKs=;
        b=SoCNLdd24hNC5el+RWo3jeL1JMbmnFIPxmw7jmDbatBsULM41skDIg4oZK9NbAqSjc
         2jbnW+le3uadqMCTrggZiTrETchvFn7EEgtLA435zxD4YkBe2VeVZPbj99rPLJWn1Xms
         +ZVe7M6jIZK/nF88QTbDMNPvpb5oFMzq/xkUptR5uSLxEkgstWXx8TqK8f4n6Ap4vvHT
         a7A1r/sm7uCDuOOjz5ur7/VfladCwSaXfsLSmcsgRRx904qsS66l6EzJ0keWJzGQhWu2
         Av1UvDF0zR/a1vW6p0GAx743BoQGuvy8O/K8D+9+XPETmFskPmLn4AMmG+214FL5mTXx
         Cw6Q==
X-Gm-Message-State: AOJu0Yz/OsC3ugmmgev+cA5tUnpG5EjIXU0vR7XygY9U42CwNYxiXnO7
	IVS3PR38rSX3AtonKdTcJIdy7Fgnx50YspRU0FY=
X-Google-Smtp-Source: 
 AGHT+IEnI8ab1+JdNF7ype3BwZWF15ZqPeMu0XQR0L+WWYyQ5mhuVfNxRleauDz1GPh94vZdw3ix9QMRKF9L/xPfAsI=
X-Received: by 2002:a17:90a:6d02:b0:27d:21dd:258f with SMTP id
 z2-20020a17090a6d0200b0027d21dd258fmr1611815pjj.37.1698384441050; Thu, 26 Oct
 2023 22:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <1697794232-2607-1-git-send-email-shengjiu.wang@nxp.com>
 <1697794232-2607-12-git-send-email-shengjiu.wang@nxp.com>
 <7929b801-63a4-4b30-9da7-e080e38a7e40@xs4all.nl>
In-Reply-To: <7929b801-63a4-4b30-9da7-e080e38a7e40@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 27 Oct 2023 13:27:09 +0800
Message-ID: 
 <CAA+D8APYcRvmscFcEx4bg5bpjUSmK7G7TZ8d3P-8-yZkvCrw8A@mail.gmail.com>
Subject: Re: [RFC PATCH v7 11/13] media: uapi: Add audio rate controls support
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QGUWZC52QZGC4OX2JD6745W3KH2HHBWE
X-Message-ID-Hash: QGUWZC52QZGC4OX2JD6745W3KH2HHBWE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QGUWZC52QZGC4OX2JD6745W3KH2HHBWE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 25, 2023 at 6:47=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 20/10/2023 11:30, Shengjiu Wang wrote:
> > Add V4L2_CID_M2M_AUDIO_SOURCE_RATE and V4L2_CID_M2M_AUDIO_DEST_RATE
> > new IDs for rate control.
> >
> > Add V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET and
> > V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET for clock drift.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../media/v4l/ext-ctrls-audio-m2m.rst          | 18 ++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c      | 12 ++++++++++++
> >  include/uapi/linux/v4l2-controls.h             |  5 +++++
> >  3 files changed, 35 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.=
rst b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > index 82d2ecedbfee..e6972a2d3b17 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > @@ -19,3 +19,21 @@ Audio M2M Control IDs
> >      The Audio M2M class descriptor. Calling
> >      :ref:`VIDIOC_QUERYCTRL` for this control will
> >      return a description of this control class.
> > +
> > +.. _v4l2-audio-asrc:
> > +
> > +``V4L2_CID_M2M_AUDIO_SOURCE_RATE``
>
> Add ' (integer menu)' after the name.
>
> > +    Sets the audio source rate, unit is (Hz)
>
> (Hz) -> Hz.
>
> General question: is 'rate' good enough or should it be 'sample rate'?

Ok, will use 'sample rate'.

Best regards
Wang shengjiu
>
> > +
> > +``V4L2_CID_M2M_AUDIO_DEST_RATE``
> > +    Sets the audio destination rate, unit is (Hz)
>
> Ditto here.
>
> > +
> > +``V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET``
>
> Add ' (fixed point)' after the name.
>
> > +    Sets the offset for audio source rate, unit is (Hz).
>
> for -> from the
>
> (Hz) -> Hz
>
> > +    Offset expresses the drift of clock if there is. It is
> > +    equal to real rate minus ideal rate.
>
> How about:
>
> The offset compensates for any clock drift. The actual source audio
> rate is the ideal source audio rate from ``V4L2_CID_M2M_AUDIO_SOURCE_RATE=
``
> plus this fixed point offset.
>
> > +
> > +``V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET``
> > +    Sets the offset for audio destination rate, unit is (Hz)
> > +    Offset expresses the drift of clock if there is. It is
> > +    equal to real rate minus ideal rate.
>
> Same changes as for V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET.
>
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/=
v4l2-core/v4l2-ctrls-defs.c
> > index 2a85ea3dc92f..b695cbdd1f6e 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1245,6 +1245,10 @@ const char *v4l2_ctrl_get_name(u32 id)
> >
> >       /* Audio M2M controls */
> >       case V4L2_CID_M2M_AUDIO_CLASS:  return "Audio M2M Controls";
> > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE:    return "Audio Source Samp=
le Rate";
> > +     case V4L2_CID_M2M_AUDIO_DEST_RATE:      return "Audio Dest Sample=
 Rate";
> > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET:     return "Audio Sou=
rce Sample Rate Offset";
> > +     case V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET:       return "Audio Des=
t Sample Rate Offset";
>
> Related to my question above: "Sample Rate" or just "Rate"? Whatever we p=
ick, it should
> be consistent.
>
> >       default:
> >               return NULL;
> >       }
> > @@ -1606,6 +1610,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, e=
num v4l2_ctrl_type *type,
> >       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> >               *type =3D V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> >               break;
> > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE:
> > +     case V4L2_CID_M2M_AUDIO_DEST_RATE:
> > +             *type =3D V4L2_CTRL_TYPE_INTEGER_MENU;
> > +             break;
> > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET:
> > +     case V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET:
> > +             *type =3D V4L2_CTRL_TYPE_FIXED_POINT;
> > +             break;
> >       default:
> >               *type =3D V4L2_CTRL_TYPE_INTEGER;
> >               break;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index eb0f0a76f867..d433c6f0b533 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -3498,4 +3498,9 @@ struct v4l2_ctrl_av1_film_grain {
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
> >  #endif
>
> Regards,
>
>         Hans
