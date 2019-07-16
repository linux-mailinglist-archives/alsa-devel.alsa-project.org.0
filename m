Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC766A375
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 10:01:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98C73168E;
	Tue, 16 Jul 2019 10:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98C73168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563264115;
	bh=ziA5z8oitMsoXThVs0ru/JP16bWg7dk2GQB2dTocy9g=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qaMcyHgb1w6D9+WkUWCIy6XWKFKFR+0u50P2fjpsJAnIEkPFbS39BywdNu8yQeT+p
	 2XuxhqM9UxZIs3M0IEzJ55J1Eu930c5b89YqpcQEEBCXfTFlLE41LB2Jv39J7W+2/Q
	 IcBrD0dcKjyjLBFtN77VV88FTmeV/LEclZnDQr9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5395F80362;
	Tue, 16 Jul 2019 10:00:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CEA5F80376; Tue, 16 Jul 2019 10:00:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86B81F800C4
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 10:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86B81F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="WkIXGD93"
Received: by mail-vs1-xe41.google.com with SMTP id m23so13286964vso.1
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 01:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0k1aHf58/gxem57t+/HJk9SNpX74KfXqdFRssCgasHQ=;
 b=WkIXGD93vnc7/jgdUJCOyAhWfQWj4JwZxZhvfijDRISLuLx4yflZHTDWWSxx7WAFgi
 P/75eR1ocFjiim/HAtaQ/hHHMdj/AJhGCoGv3O1KDMwV3amytYQ+kgBq/LAKt+YymIQH
 cgPBdjhd4eTA/OcE54ml3PqvteVAcATrUZsBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0k1aHf58/gxem57t+/HJk9SNpX74KfXqdFRssCgasHQ=;
 b=Zt9eGPsqUY1HbGrZ0NlfdC3N8nwhyUxSkJApDEp+N5YQydmlFsLI2ePhyy0yZJ2+ED
 +TAw1tfzfRvgmAV9+MiQz4WFVdtYrHbAob80U5W9Uj2KK0fNhjfIL1f/XR3YpfIM77b4
 OMUAwF2VbfjATXweksys6DHpYp/pvmY/aud+Y0oucu1l0bHTKeHtxcdiB+hOhOJlhwfq
 Lk26sWVHIG0ReKn4H1N1xKK+qGfP/H0gddxO/e7iZ85GJZBg9dy+Y1V+XNUqlnq83vmj
 YQkEmIq4GARY1Kbthvv9mklMqSvVrMfuiaaFX5+O3dZiu4DGNW4Am9AEZr5ozuz/J/aV
 IUMQ==
X-Gm-Message-State: APjAAAWapYGAuWcqivxEWLZK01W5e+jfRa9KtztUOTbbTPw0J1zL8rfd
 uCx2ZNd4ccwagTy9qvm4PkXIEqfDLPjUxpC3gH0x5g==
X-Google-Smtp-Source: APXvYqz3UlcLWtTzFizosrgSxqzhf3bbaJZCfMhWBpiXfCrTTv26BLTLvewBhZnAiR6udq4k9bpOekTvU0tfbVw4RAQ=
X-Received: by 2002:a67:ebcb:: with SMTP id y11mr9527514vso.138.1563264004214; 
 Tue, 16 Jul 2019 01:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190712100443.221322-1-cychiang@chromium.org>
 <20190712100443.221322-2-cychiang@chromium.org>
 <20190712105745.xr7jxc626lwoaajx@shell.armlinux.org.uk>
 <CA+Px+wWbmUemETY3OMk1T9XS2w8ZXvZUhVEGzw_w6AxtU8R0rw@mail.gmail.com>
In-Reply-To: <CA+Px+wWbmUemETY3OMk1T9XS2w8ZXvZUhVEGzw_w6AxtU8R0rw@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 16 Jul 2019 15:59:36 +0800
Message-ID: <CAFv8NwKwd8Yf4UmqUhcaP1pL2K_d_FSZm9JyY_Azy13017RWgg@mail.gmail.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: ALSA development <alsa-devel@alsa-project.org>, tzungbi@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dylan Reid <dgreid@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Jul 15, 2019 at 11:56 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Fri, Jul 12, 2019 at 6:58 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > On Fri, Jul 12, 2019 at 06:04:39PM +0800, Cheng-Yi Chiang wrote:
> > > Add an op in hdmi_codec_ops so codec driver can register callback
> > > function to handle plug event.
> > >
> > > Driver in DRM can use this callback function to report connector status.
> > >
> > > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > > ---
> > >  include/sound/hdmi-codec.h    | 16 +++++++++++++
> > >  sound/soc/codecs/hdmi-codec.c | 45 +++++++++++++++++++++++++++++++++++
> > >  2 files changed, 61 insertions(+)
> > >
> > > diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
> > > index 7fea496f1f34..9a8661680256 100644
> > > --- a/include/sound/hdmi-codec.h
> > > +++ b/include/sound/hdmi-codec.h
> > > @@ -47,6 +47,9 @@ struct hdmi_codec_params {
> > >       int channels;
> > >  };
> > >
> > > +typedef void (*hdmi_codec_plugged_cb)(struct device *dev,
> > > +                                   bool plugged);
> > > +
> >
> > I'd like to pose a question for people to think about.
> >
> > Firstly, typedefs are generally shunned in the kernel.  However, for
> > these cases it seems to make sense.
> >
> > However, should the "pointer"-ness be part of the typedef or not?  To
> > see what I mean, consider:
> >
> >         typedef void (*hdmi_foo)(void);
> >
> >         int register_foo(hdmi_foo foo);
> >
> > vs
> >
> >         typedef void hdmi_foo(void);
> >
> >         int register_foo(hdmi_foo *foo);
> >
> > which is more in keeping with how we code non-typedef'd code - it's
> > obvious that foo is a pointer while reading the code.
> I have a different opinion.  Its suffix "_cb" self-described it is a
> callback function.  Since function and function pointer are equivalent
> in the language, I think we don't need to emphasize that it is a
> function "pointer".
>
>

Hi Russell and Tzungbi, thank you for the review.
Regarding this typedef of callback function, I found a thread
discussing this very long time ago:

https://yarchive.net/comp/linux/typedefs.html

From that thread, Linus gave an example of using typedef for function
pointer that is following to this pattern.
I also looked around how other driver use it:
$ git grep typedef | grep _cb | less | wc -l
138
$ git grep typedef | grep _cb | grep "(\*" | wc -l
115
Most of the typedef of callback function use this pattern.
So I think this should be fine.
Thanks!


> > It seems to me that the latter better matches what is in the kernel's
> > coding style, which states:
> >
> >   In general, a pointer, or a struct that has elements that can
> >   reasonably be directly accessed should **never** be a typedef.
> >
> > or maybe Documentation/process/coding-style.rst needs updating?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
