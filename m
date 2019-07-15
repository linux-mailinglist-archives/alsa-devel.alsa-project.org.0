Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E46AD698A8
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2019 17:58:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 479D81668;
	Mon, 15 Jul 2019 17:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 479D81668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563206306;
	bh=8CK4VB4G/z31CQS5/GdOLar1VhZYd47EV9q1wacQkkU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RVS9o8o6xEU40nHAOyeDMqr76wMxULT+QEZtNQJHYGVXctkT2RbdtVkp2tE3MyWQN
	 P8KcSl+55Vz4q0SMWx7sPbaqaN/AkokRNJvfptpO7dAlfwMxbz1cG13R/fcXNFg+Zj
	 1vcaDnE7yck1YF16sytZPrvNjdN+tdQgDDcYQH5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F46FF800D8;
	Mon, 15 Jul 2019 17:56:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67CBDF80367; Mon, 15 Jul 2019 17:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB7E4F800D8
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 17:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB7E4F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="SA30rmEv"
Received: by mail-ot1-x343.google.com with SMTP id r6so17536985oti.3
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BxdnANqifDB1z1Ih8rPgPPFQ52+wPGcxB0Lct34ID5Q=;
 b=SA30rmEvAAB/UeWM0cJpboyXWomGji7I7a5x3X8IC2z8RDCcu48fRpx3oXaTPieM78
 hMUBvyfACXuvhVyl7122TsYzmlo3PSQz9JgHl3IzAfFzF4LUSFpBOVOTOS1B1L4yygl7
 QOOGtMtHFpJt8B1LZKpTsfOdvejMLuCIDQCalifs34k7ukv+KzyMS3/rAXEkr2VMjwP1
 SBtlOVlmpKFktDXSl32r68WJn6RZP964o2hS1wrBNhCu42BpzNeAZYsIqnpYlDH19pdT
 IooGaAqomRnAwqqNrb8iHZz4u/RbyBz6uQU3gz+bKjgxr0xq0hFlSy/JRzbwLlHSQ+Nf
 EO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BxdnANqifDB1z1Ih8rPgPPFQ52+wPGcxB0Lct34ID5Q=;
 b=oDW128A0QTwc1y6iIaZwE612PxWD1b9vL0NAlRtnsNn8IMyfM8Ju2DwpiQ6mmxlpe/
 EYaYk9QHNrsTHjNCaZ0OU0LzLlMKnM2olKgw5dM5WwFm6eSzSfZaEMBpKubf1hEgcDY3
 NfDrRhwvCQjp7xOoQOMyQV3jk/Z2WNi0DoUICEX0Yt/lzwNlm5PLtUSSTj/77+xAAlWY
 /e19XFUvHwKFjvRB40XFTNAw+5H2D9XI+SWjHbv6xbAS1+2FhChBZQhe9R5k+1HgvZVe
 oDrQ4i4y6MM4MoGqdD86TRr9cby1Q0P3D+07YwW3VignY84LWu2ClS9HWUKQ+qaDVTJJ
 vVxQ==
X-Gm-Message-State: APjAAAXon7PCZUAnQc9FQwi+MVrnxGPMRBMllOp5+zLbQpmZRfr+nlNC
 sciuBdSYt8OnY6raafJfL16ruVufwu5SpguvyS5zFg==
X-Google-Smtp-Source: APXvYqwsZvLcK5LidkOK7j4XvKdYHFQb2nVh/AtXUYin5kr5W0WlZFyIM9UGzPAW85pcfSoyZbDk7ZxnfK/q+cptnb0=
X-Received: by 2002:a05:6830:1cd:: with SMTP id
 r13mr8619272ota.99.1563206191242; 
 Mon, 15 Jul 2019 08:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190712100443.221322-1-cychiang@chromium.org>
 <20190712100443.221322-2-cychiang@chromium.org>
 <20190712105745.xr7jxc626lwoaajx@shell.armlinux.org.uk>
In-Reply-To: <20190712105745.xr7jxc626lwoaajx@shell.armlinux.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 15 Jul 2019 23:56:19 +0800
Message-ID: <CA+Px+wWbmUemETY3OMk1T9XS2w8ZXvZUhVEGzw_w6AxtU8R0rw@mail.gmail.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: ALSA development <alsa-devel@alsa-project.org>, tzungbi@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH v3 1/5] ASoC: hdmi-codec: Add an op to set
 callback function for plug event
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jul 12, 2019 at 6:58 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Fri, Jul 12, 2019 at 06:04:39PM +0800, Cheng-Yi Chiang wrote:
> > Add an op in hdmi_codec_ops so codec driver can register callback
> > function to handle plug event.
> >
> > Driver in DRM can use this callback function to report connector status.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  include/sound/hdmi-codec.h    | 16 +++++++++++++
> >  sound/soc/codecs/hdmi-codec.c | 45 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 61 insertions(+)
> >
> > diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
> > index 7fea496f1f34..9a8661680256 100644
> > --- a/include/sound/hdmi-codec.h
> > +++ b/include/sound/hdmi-codec.h
> > @@ -47,6 +47,9 @@ struct hdmi_codec_params {
> >       int channels;
> >  };
> >
> > +typedef void (*hdmi_codec_plugged_cb)(struct device *dev,
> > +                                   bool plugged);
> > +
>
> I'd like to pose a question for people to think about.
>
> Firstly, typedefs are generally shunned in the kernel.  However, for
> these cases it seems to make sense.
>
> However, should the "pointer"-ness be part of the typedef or not?  To
> see what I mean, consider:
>
>         typedef void (*hdmi_foo)(void);
>
>         int register_foo(hdmi_foo foo);
>
> vs
>
>         typedef void hdmi_foo(void);
>
>         int register_foo(hdmi_foo *foo);
>
> which is more in keeping with how we code non-typedef'd code - it's
> obvious that foo is a pointer while reading the code.
I have a different opinion.  Its suffix "_cb" self-described it is a
callback function.  Since function and function pointer are equivalent
in the language, I think we don't need to emphasize that it is a
function "pointer".


> It seems to me that the latter better matches what is in the kernel's
> coding style, which states:
>
>   In general, a pointer, or a struct that has elements that can
>   reasonably be directly accessed should **never** be a typedef.
>
> or maybe Documentation/process/coding-style.rst needs updating?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
