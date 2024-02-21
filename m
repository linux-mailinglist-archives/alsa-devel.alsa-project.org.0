Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EBF85CF55
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 05:37:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9436F844;
	Wed, 21 Feb 2024 05:36:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9436F844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708490224;
	bh=oL4jzuCKbGJSQdHdOTD8mVuXHXW9YeehgSh1yQfUYr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BF7ztLa4AJwdhKP7nYRkWXWGunJcEB51rDTB0/rs4v14N1FLASKP+jgSssWZREXi7
	 psriehAc9jGWAMA1nD/MJ9xaGVPGS9wLaOkjLj6jgEOXWSPOrWepNqA865dSYej794
	 2XIcfr4cOJ/ZdYE36ag8D9mzxHPPnZyx4c3u8CHo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B023F805A1; Wed, 21 Feb 2024 05:36:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8223F805A0;
	Wed, 21 Feb 2024 05:36:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B07A8F80496; Wed, 21 Feb 2024 05:34:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7393DF8019B
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 05:33:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7393DF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=W6yYG/6F
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-564e4df00f3so1038460a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 20 Feb 2024 20:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708489989; x=1709094789;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmY04dbj/vIU0t6pHPXsLFor7e8BbOlWKLitvKLNgfs=;
        b=W6yYG/6FApglg7+ek+KF6PMkF+JVg3DxmT4MHtzV9etkJnK7oAmanut5Cab5MUhk/3
         kvvYQSnpolG7VvZtufMHTQFihMCBkYshzJw1tBXm1aBpHYrcj9i8eTnXV0UeYBnrVbnX
         Hce3ioPLG/skslhnd4Vo5PtAjf82lC4vcuII0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708489989; x=1709094789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmY04dbj/vIU0t6pHPXsLFor7e8BbOlWKLitvKLNgfs=;
        b=RGi4TATsWjwCOUR2mVEIZxVWNpwAef/L6sskKRk7nDzqpZeVUIpVYvO4lWMoRWwhq2
         y8lMjRESLcAw3Wz9yVZnlvQ5zzcZxLHlYlyIo618wiVeIQP1q2/PiOo9OgUdf3vK3FPK
         s597llTPKnbv0Z4kof++c7meb2JsseUrJN/28olpjbBzhh/mMgK1tp9UV4Nirb8bgnvw
         yfSBzXxW/1DzWVT9QYBk2h39yvr4mvEWMOe2XUmUa7kWb5080bxOg8mJunv+QGsZK56b
         mgvjaJsJF7UWYNI0qtP8zHtmstZjm/JGXjlWhT+4LqKuIb+275LS+EHvdGPlC44dkkkd
         6wKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyZ1yz7YirlSzt1AiiMuU+PPhTHqj5nYxpfy77KGxDuZFA7Jf20kwYv4HRKo0UvKOybnD+o+v/Q+FxS0kONVj3AR0xQFFE2pcu9u0=
X-Gm-Message-State: AOJu0YwDWjM2A5/YiEPvE2Zi3mgru9EfQzDL2YLrU7U8A9f8+VcFQvpu
	crar2tsFiBTo13nB0GXiF6KVKW3fsLPc/v0QjfDKNi3sehSdKqOYdcmRmvnCAgenK9PtPBns8ka
	iPA==
X-Google-Smtp-Source: 
 AGHT+IGMi2sax862Djm3Ax1U6bSnMZUM+LhOd1K1uSxDbw5RG6kpin+dB9WZV2VqKc+GpoROTibOiw==
X-Received: by 2002:a17:906:80c5:b0:a3f:2259:da62 with SMTP id
 a5-20020a17090680c500b00a3f2259da62mr1168277ejx.52.1708489989656;
        Tue, 20 Feb 2024 20:33:09 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id
 tb5-20020a1709078b8500b00a3d599f47c2sm4605284ejc.18.2024.02.20.20.33.08
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 20:33:08 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-41270d0b919so8488485e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 20 Feb 2024 20:33:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWL+nKRebk3RN0E64bXIAGXSXJRf3Gn2xLZz/4PDCnIjBBSBE/p+DgSCQwEy1x/xzx/wR9/+g4PYBXZXxV8vzesclWM7HeOJ0/NwHo=
X-Received: by 2002:a5d:47a4:0:b0:33d:6ede:1149 with SMTP id
 4-20020a5d47a4000000b0033d6ede1149mr2829350wrb.35.1708489988167; Tue, 20 Feb
 2024 20:33:08 -0800 (PST)
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
 <1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 21 Feb 2024 13:32:50 +0900
X-Gmail-Original-Message-ID: 
 <CAAFQd5Ddip8n90Ma+d_kqgARoMRvpmk5Yyo+D_Csop6Ws8bHqw@mail.gmail.com>
Message-ID: 
 <CAAFQd5Ddip8n90Ma+d_kqgARoMRvpmk5Yyo+D_Csop6Ws8bHqw@mail.gmail.com>
Subject: Re: [PATCH v12 07/15] media: v4l2: Add audio capture and output
 support
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, m.szyprowski@samsung.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QERKZTXZWOG7EI7WGLFIIVHTBSUJ5364
X-Message-ID-Hash: QERKZTXZWOG7EI7WGLFIIVHTBSUJ5364
X-MailFrom: tfiga@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QERKZTXZWOG7EI7WGLFIIVHTBSUJ5364/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jan 18, 2024 at 10:15=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> Audio signal processing has the requirement for memory to
> memory similar as Video.
>
> This patch is to add this support in v4l2 framework, defined
> new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> for audio case usage.
>
> The created audio device is named "/dev/v4l-audioX".
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../userspace-api/media/v4l/buffer.rst        |  6 ++
>  .../media/v4l/dev-audio-mem2mem.rst           | 71 +++++++++++++++++++
>  .../userspace-api/media/v4l/devices.rst       |  1 +
>  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
>  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
>  .../media/videodev2.h.rst.exceptions          |  2 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 +++
>  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++
>  include/media/v4l2-dev.h                      |  2 +
>  include/media/v4l2-ioctl.h                    | 34 +++++++++
>  include/uapi/linux/videodev2.h                | 17 +++++
>  13 files changed, 222 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem2m=
em.rst

For drivers/media/common/videobuf2:

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
