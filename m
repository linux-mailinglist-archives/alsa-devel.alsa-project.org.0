Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DB1ACF1F
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 15:53:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED7191658;
	Sun,  8 Sep 2019 15:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED7191658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567950800;
	bh=sfT+brxQ8G70z844MrwOmS2NxSMYO4C44U2nnZfQ778=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U8nqFlomFI+Vj+DylghCkZbdfhp8OP99GsYb/SLRLkBkGlk3WUUqcEvzLSu56pViO
	 ZQT1hQ14UxPr2cBfNImm+JoOZht/rdeitRA9jKQeUPJEeIURLCcPWYDjPmhDiepCMy
	 fisLUsw8qrpGGxjfmRJxfnhNWE6z/OjEfLSZXZxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCFD0F80368;
	Sun,  8 Sep 2019 15:51:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3386EF80368; Sun,  8 Sep 2019 15:51:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19000F800C1
 for <alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 15:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19000F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="gVLsd+T0"
Received: by mail-ua1-x944.google.com with SMTP id f9so3465004uaj.4
 for <alsa-devel@alsa-project.org>; Sun, 08 Sep 2019 06:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/OjUEd4QSp7PdF6VW4aQrBE3Z+/uVpO6ArZ5TFedKOc=;
 b=gVLsd+T0GXYo4KXD8R+kiCVmUyc3iXlvJ5SL3N90TjeV223lfZq0lpVImmm1TQPLvr
 biVG3B/n3OMziPN/L+IVvhgX7Ge1Bk7hcW/JG/CkZ9zrfy4+DonIP5+MTrsf/9lW9zj+
 GDyNN76Ur/2fW2BBK/M7SqE9yXZfqSEsSHkh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/OjUEd4QSp7PdF6VW4aQrBE3Z+/uVpO6ArZ5TFedKOc=;
 b=uj26nVXx7rbSNVpcNwPxYMeqeA2/AvDhP/bBqVE4twn3e21l2aQx4WwV0Fr031IDCy
 uTbVm4ugqm+1XY29Jr3gY5pq0QB0SkYjdscQTz/4OYF7n8UtYJwbLHJGocBq+F/HCk7Y
 JzCiOenhLji0ijY6oVbD2qI0o/vdkwIMRpRQd+/vjtacFiIbx2O2d6/DKpTXIXLChZck
 XuJJBKIER/GR3iR9VXXDfCYvEHzkmWXS+vgxn5tQUvnlHTRSjaxJCN4NivyqJRbxiTgP
 eUBU3OxQ74OcSv4dR2/uVFd15c0/yU7USgkQ6Y8kC6whsMGQspvDbhgaVsuJb2sfXrOU
 opRw==
X-Gm-Message-State: APjAAAXzQs/0ZFZQSQbvSKZn1CU5bQ5KXjBBHOPy+0u9ThQizAun3Y60
 b9KGZqeYcqUxygkEu/Y791Nk2WoHyk3RAmYZra6MyA==
X-Google-Smtp-Source: APXvYqz0WcmHMeiK6IT+v7kmZTAGTgr1Hd/fvxS4YbL4elq2hJMpg584VDsJiFFWnsbRAAo6uqeDZQp5p3+XGhBLzrU=
X-Received: by 2002:ab0:7c3:: with SMTP id d3mr8981573uaf.131.1567950687342;
 Sun, 08 Sep 2019 06:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190717083327.47646-1-cychiang@chromium.org>
 <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
 <CAFv8NwLiY+ro0L4c5vjSOGN8jA-Qr4zm2OWvVHkiuoa7_4e2Fg@mail.gmail.com>
In-Reply-To: <CAFv8NwLiY+ro0L4c5vjSOGN8jA-Qr4zm2OWvVHkiuoa7_4e2Fg@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Sun, 8 Sep 2019 21:51:01 +0800
Message-ID: <CAFv8NwJjG4mwfnYO=M3O9nZN48D6aY72nQuqEFpZL68dh5727w@mail.gmail.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 Dylan Reid <dgreid@chromium.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v5 0/5] Add HDMI jack support on RK3288
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

On Fri, Aug 30, 2019 at 10:55 AM Cheng-yi Chiang <cychiang@chromium.org> wrote:
>
> On Wed, Jul 17, 2019 at 6:28 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > On Wed, Jul 17, 2019 at 4:33 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> > >
> > > This patch series supports HDMI jack reporting on RK3288, which uses
> > > DRM dw-hdmi driver and hdmi-codec codec driver.
> > >
> > > The previous discussion about reporting jack status using hdmi-notifier
> > > and drm_audio_component is at
> > >
> > > https://lore.kernel.org/patchwork/patch/1083027/
> > >
> > > The new approach is to use a callback mechanism that is
> > > specific to hdmi-codec.
> > >
> > > Changes from v4 to v5:
> > > - synopsys/Kconfig: Remove the incorrect dependency change in v4.
> > > - rockchip/Kconfig: Add dependency of hdmi-codec when it is really need
> > >   for jack support.
> > >
> > > Cheng-Yi Chiang (5):
> > >   ASoC: hdmi-codec: Add an op to set callback function for plug event
> > >   drm: bridge: dw-hdmi: Report connector status using callback
> > >   drm: dw-hdmi-i2s: Use fixed id for codec device
> > >   ASoC: rockchip_max98090: Add dai_link for HDMI
> > >   ASoC: rockchip_max98090: Add HDMI jack support
> > >
> > LGTM.
> >
> > Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
>
> Hi Daniel,
> Do you have further concern on this patch series related to hdmi-codec
> and drm part ?
> We would like to merge this patch series if possible.
> They will be needed in many future chrome projects for HDMI audio jack
> detection.
> Thanks a lot!

Hi Neil,
I am not sure if this patch series is under your radar.
Would you mind taking a look ?
This patch series has been following great suggestions from various
reviewers, so I hope it is fine now.

Audio jack reporting for HDMI might not be needed for other OS, but it
is a must on ChromeOS.
We have many previous projects using different local patch sets to
achieve HDMI jack reporting.
I hope that we can achieve a proper way and really get the patches
merged to mainline.
Thanks a lot!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
