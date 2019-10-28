Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EF5E6AD4
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 03:34:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25275192F;
	Mon, 28 Oct 2019 03:33:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25275192F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572230083;
	bh=dkjxvola0EIMqBpgIrZOYArYD/tI2aYCE+JYH5sZXtM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q0dIduxIa3/t69XUysLedjQMR+BoNoO7/fnqn0jriOgIG5dIz5qqBmDHB7H3LGPWI
	 YzmAKLAvxZlhuI5dFV0lsL6tN6Mr0+Cqyhx3PnsepMF/vWhhe64DN2PHJyu6QsLSEc
	 wOXlQQLH9D3EmVzYGXN085PsihMvwIheFQjfw4UY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72AA2F803D6;
	Mon, 28 Oct 2019 03:32:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BCECF80361; Mon, 28 Oct 2019 03:32:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 814A6F80145
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 03:32:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 814A6F80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="IysszB7/"
Received: by mail-wr1-x444.google.com with SMTP id l10so8214279wrb.2
 for <alsa-devel@alsa-project.org>; Sun, 27 Oct 2019 19:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w7WLAChacz4cdQUuGvSzDH2SDjigryRCbt+WDbtW90s=;
 b=IysszB7/4YwlqN2hIxbjmBzRqB+jb5hB3Tg+ljjzuq3A+FEhC3OFZFMovTbRT0LJfK
 H4qNyEspy1rpsUjibdaW/gAWpBeFZqCkQNS/a6m2giKGzWFHNCZXv+UikEp3b05qqUYQ
 XL2aGPYxYupmlhSDoZ4ce3ZDLKnBEnisKO4aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7WLAChacz4cdQUuGvSzDH2SDjigryRCbt+WDbtW90s=;
 b=iNb/qxFVemZ1cu0SQfQ+z6ftUFOSvQc7geln1NFUdg1Z+v5j5jWvYx9V2n7L9CldSx
 vM1yqs0EqSAMbgfJDrRqQDxA5HOc3MaXYeucidA4Tr9ROr745akO+9Vh23MHDnWp6n5V
 1FmhN8d29T+kLPYsAsCocAMoLqGUk8Vx6Of5ALVqn08vsI0pX/P5SJZwh4prnWvjBZEL
 cJKHW4S5wNT9+0EB6e62+aPMdDsNSNpYvW0TuKTdSIrQelZLkeDo8uV+gy2g7y2f7gYB
 oiM/dQk5yn4DAwJ/baDhZQuugHsF9e1GhJ4DPROqN+uyCXsuqqbULwp9FzkcKGyeJn/4
 yKEQ==
X-Gm-Message-State: APjAAAWexOAtkqKVaD6KJuAq8sn8RQ5VGzBXwfoGMgLsX6QBuN2ikkr3
 R/1+q6k0UM4KX4g2lqFk8/3Sk/OKPjYVecAf8Lfn7g==
X-Google-Smtp-Source: APXvYqzK0YBdyQgsMLm2ci9Dx4kOzJFycGTSzYpVPVfKV8gCZkiX6U1k76C9C14EYAVMDUxQGFHxdvyM+PTOBO8Lys4=
X-Received: by 2002:adf:b1d1:: with SMTP id r17mr12904765wra.201.1572229970951; 
 Sun, 27 Oct 2019 19:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191025133007.11190-1-cychiang@chromium.org>
 <20191025133007.11190-3-cychiang@chromium.org>
 <20191025162232.GA23022@bogus>
In-Reply-To: <20191025162232.GA23022@bogus>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 28 Oct 2019 10:32:24 +0800
Message-ID: <CAFv8NwKhe=CEuMCgeP1G0-Az4GEdMGPMMhvM3oY2=KmZNGrcRw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Doug Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [alsa-devel] [PATCH v8 2/6] ASoC: rockchip-max98090: Support
 usage with and without HDMI
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

On Sat, Oct 26, 2019 at 12:22 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Oct 25, 2019 at 09:30:03PM +0800, Cheng-Yi Chiang wrote:
> > There will be multiple boards sharing this machine driver.
> > Use compatible string to specify the use case.
> >
> > "rockchip,rockchip-audio-max98090" for max98090-only.
> > "rockchip,rockchip-audio-hdmi" for HDMI-only
> > "rockchip,rockchip-audio-max98090-hdmi" for max98090 plus
> >
> > Move these properties to optional because they are not needed for
> > HDMI-only use case.
> > "rockchip,audio-codec": The phandle of the MAX98090 audio codec
> > "rockchip,headset-codec": The phandle of Ext chip for jack detection
> >
> > The machine driver change will add support for HDMI codec in
> > rockchip-max98090.
> > Add one optional property "rockchip,hdmi-codec" to let user specify HDMI
> > device node in DTS so machine driver can find hdmi-codec device node for
> > codec DAI.
>
> Why not just use the presence of rockchip,hdmi-codec to enable HDMI or
> not. Maybe you still add rockchip,rockchip-audio-hdmi for HDMI only.
>
> Really, the same should have been done for which codec is used too, but
> I guess someone wanted 2 machine drivers.

Hi Rob,
Thanks for the quick reply.
I can make change in machine driver so that
- The presence of rockchip,audio-codec enable max98090
- The presence of rockchip,hdmi-codec enable HDMI.

With that, we don't need the three properties added in this patch:
"rockchip,rockchip-audio-max98090" for max98090-only.
"rockchip,rockchip-audio-hdmi" for HDMI-only
"rockchip,rockchip-audio-max98090-hdmi" for max98090 plus HDMI.

I will post an update soon. Thanks!

>
>
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  .../bindings/sound/rockchip-max98090.txt      | 38 +++++++++++++++++--
> >  1 file changed, 35 insertions(+), 3 deletions(-)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
