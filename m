Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED8C7F29DF
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Nov 2023 11:12:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90D32DEF;
	Tue, 21 Nov 2023 11:12:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90D32DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700561547;
	bh=h8L3lQy/ANPuvKUXI2K5S/ADUHW6NHtneLiCnva08PQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i6fq2/4ZLJQvi1DXF9C6+OpmRHgm/caqFZf3ulJDL7AzeqylpP62OVQdrPLW5n7J5
	 ztRdLcaX0zYiIxxvF6KT0t0/JXmVLRGrl+ZwGETIOO4eiwMS/o67eP7Ad5JGM9x+Th
	 H+0W4o7hhbwBzhW2YspRmq01x7+85BCquG2goHqg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CDA9F80580; Tue, 21 Nov 2023 11:11:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43EA1F80579;
	Tue, 21 Nov 2023 11:11:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A49DF802E8; Tue, 21 Nov 2023 11:11:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C285BF80249
	for <alsa-devel@alsa-project.org>; Tue, 21 Nov 2023 11:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C285BF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KDUK+0oV
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5c1f8b0c149so3032925a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Nov 2023 02:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700561504; x=1701166304;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h77UCHBzfS9YsxxGuMxQKATmfaJKyNycbGsrjaUmphU=;
        b=KDUK+0oVaf/rTqDhs9IY1tcvF8bxVVKXzCjxd+4ZumMsg2gxcTfN19NbBsl68c0l3r
         W/asUj6IJDs0KvCQk4LEpq41YbxJN5d5GMIb6i+y8ZAfHeGtRejVnF7vCSVStTv1gp5F
         szSx6NsXabY7YO7Wp7MTi76dEw48HASUH93K6Ms4tlfqlOI1hBGrDiTOwOaRvO+drHHQ
         q8nqIzfpbaP10nqedaz6OJLSJyErx9Xv+DIPv6ciHVt0AkUCDrTsE15vkOMACUOiMmnp
         6ebiaKBEiNfiisKz10yXZBIdNdkyfeqR9BjbqjuD92DJI4TkE4vJfYysuQPFcBRcSzF4
         TPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700561504; x=1701166304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h77UCHBzfS9YsxxGuMxQKATmfaJKyNycbGsrjaUmphU=;
        b=sshlmA6Qt61Fsl0j2NlKinkVlOhbhLalm0INSG2upB6U3RlomN9QxLy1nMD8LbpTze
         Enw65GYdADXGyoEGRkR8L6ue6OZL9j4724v1kk3oVrbr3n6RMBd4hSXIjWMW0nwzQMBh
         i3cEoFhNDq55TFuuhxS4kIaif0WATDolwgYYlzuo44YrNwuU+9SVCsoCjK7kR6DfKHNM
         txsvsRLG1U4IVxMQc1KI2X73hYz0lB3U601B7y9sh6D4i7s0luFgFaHVqBjwXWZAHhnQ
         Ct4+W2sGDGDJwWICDGGMPVSnbpUI76Glhwez8aUPyW/a46Gn9i76vc3aNjXFe389t0Wb
         zJ4g==
X-Gm-Message-State: AOJu0YzaAUiYr9tMpZHIwnZHwkq0IZdDHCzjvbPAH7qQeZTWpjPAtbNb
	ZSzuUMptZehb1LgXUwSUnGL9lNA0OQ/8N0Af2T4=
X-Google-Smtp-Source: 
 AGHT+IEp8j+Xt8I0EWdsh1ssJvEqhJY59UJ9RwYFSlAvOSHCZgQnKLiiltgHL/5rsbh4MhNNEDWqB0d6Hu9FlWOpSMc=
X-Received: by 2002:a05:6a21:789d:b0:187:15e2:fdd9 with SMTP id
 bf29-20020a056a21789d00b0018715e2fdd9mr8857392pzc.39.1700561504425; Tue, 21
 Nov 2023 02:11:44 -0800 (PST)
MIME-Version: 1.0
References: <1700552255-5364-1-git-send-email-shengjiu.wang@nxp.com>
 <1700552255-5364-14-git-send-email-shengjiu.wang@nxp.com>
 <0026a04d-8a04-4eeb-9f03-c68be6da5ec5@xs4all.nl>
In-Reply-To: <0026a04d-8a04-4eeb-9f03-c68be6da5ec5@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Nov 2023 18:11:33 +0800
Message-ID: 
 <CAA+D8APe+-_Z-vE2rffnF7S6Bss_3bigzb-Z2zHKof-7RARBKg@mail.gmail.com>
Subject: Re: [PATCH v10 13/14] media: imx-asrc: Add memory to memory driver
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
Message-ID-Hash: 6CBWHB2XOCMO3UDF6GTIRQO2TMI3W3XI
X-Message-ID-Hash: 6CBWHB2XOCMO3UDF6GTIRQO2TMI3W3XI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CBWHB2XOCMO3UDF6GTIRQO2TMI3W3XI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Nov 21, 2023 at 5:20=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 21/11/2023 08:37, Shengjiu Wang wrote:
> > Implement the ASRC memory to memory function using
> > the v4l2 framework, user can use this function with
> > v4l2 ioctl interface.
> >
> > User send the output and capture buffer to driver and
> > driver store the converted data to the capture buffer.
> >
> > This feature can be shared by ASRC and EASRC drivers
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/media/platform/nxp/Kconfig    |   13 +
> >  drivers/media/platform/nxp/Makefile   |    1 +
> >  drivers/media/platform/nxp/imx-asrc.c | 1264 +++++++++++++++++++++++++
> >  3 files changed, 1278 insertions(+)
> >  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
> >
>
> <snip>
>
> > +static const struct v4l2_ctrl_config asrc_src_rate_off_control =3D {
> > +     .ops =3D &asrc_m2m_ctrl_ops,
> > +     .id =3D V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET,
> > +     .name =3D "Audio Source Sample Rate Offset",
> > +     .type =3D V4L2_CTRL_TYPE_INTEGER64,
>
> Do you need this to be INTEGER64? If the actual number of bits
> of the fixed point value that the hardware uses fits in 32 bits,
> then you can just use the INTEGER type.
>
> > +     .min =3D 0xFFFFFF0000000000,
> > +     .max =3D 0x7fffffffff,
> > +     .def =3D 0,
> > +     .step =3D 1,
> > +     .flags =3D V4L2_CTRL_FLAG_UPDATE,
> > +     .fraction_bits =3D 32,
>
> Can't you use the actual number of fraction bits that the hardware
> uses? I can't imagine that it is actually 32 bits, it is almost
> certainly less.
>
>From the ratio point view, it is 44bits.  maximum 39 fractional bits.

> I do think that we need a helper function to fill in the min/max values.

what's the helper function look like?  Where can I find an example?

best regards
wang shengjiu


>
> Regards,
>
>         Hans
>
> > +};
> > +
> > +static const struct v4l2_ctrl_config asrc_dst_rate_off_control =3D {
> > +     .ops =3D &asrc_m2m_ctrl_ops,
> > +     .id =3D V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET,
> > +     .name =3D "Audio Dest Sample Rate Offset",
> > +     .type =3D V4L2_CTRL_TYPE_INTEGER64,
> > +     .min =3D 0xFFFFFF0000000000,
> > +     .max =3D 0x7fffffffff,
> > +     .def =3D 0,
> > +     .step =3D 1,
> > +     .flags =3D V4L2_CTRL_FLAG_UPDATE,
> > +     .fraction_bits =3D 32,
> > +};
>
