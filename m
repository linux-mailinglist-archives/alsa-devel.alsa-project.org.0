Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6184C6B7EF
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 10:15:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C133D167B;
	Wed, 17 Jul 2019 10:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C133D167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563351307;
	bh=4KZPR7zPI+dh+eamz+rN1/Tm+OEBUXxqOK2gJ4pfj7c=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kEhvN6U8KDHpCoTLHqrxe9xeHQC5obMbpXPdzYKSVg7C0uYptjMrDT6oFJtD4xmy+
	 ye5YI5xRIBufSaqzwzR+ha+rKIXvxQtq4pmiGQA7Vi5IyFqhoqRrXHUjtMbI+9e3KK
	 Ojdgjss2zKF3QmeUlyji4bHU2EOGqL3EGzxWdrk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8045F80367;
	Wed, 17 Jul 2019 10:13:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93C1EF800C2; Wed, 17 Jul 2019 10:13:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C4C1F800C2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 10:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C4C1F800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="PGAFc+Pf"
Received: by mail-ua1-x942.google.com with SMTP id j8so9301923uan.6
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rPZj9UlJHzFlKhJn6/fmruVkm+j5FSEf7iBCwWIUVP4=;
 b=PGAFc+PfE3kR9fcYCHC8OBC1+IoRoDTjks9fGGEtJhXcGwvydqTrmOTUlJG5NcIoi+
 DhgCrVbGujMZ7kdW7pd2LxhnmzfkWVhrSGU6+vUrDINKdXOnsMlhOmTpRSBNgMGfmh6M
 2FzdJiKfwVdXZUmZgAS729lwaeb3EbIcBDD8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rPZj9UlJHzFlKhJn6/fmruVkm+j5FSEf7iBCwWIUVP4=;
 b=RoCkl9BXPJEpWlGzMQYfTMDSOEWEIR8dXZxA5TaKH4Gc1gVIx6nAscZkIZzrT8qYMv
 tnkdvc9Q57wAkt/soNrJNzhHGsf4bP0QskjCrWSSMQxtMWtCU+STQe5ACwBXw6BeLMT5
 puUSi6NAVI8cvY7DSAdcw51DYsX+u7820NL+TCh7F63U4duz+oSdLRrBVwYETZF6iXK/
 3DKUNwUsrr9AoHW4kOBXd8dnqf5VlfNW1ikB2vkcltAjhcJDoNThKsxAomtp5HIqsPd7
 h68+mlo3ijBNgJ2NCPqgOUHIH23dVRC5+7CMVrdMPgyvnjvv54xV7LgHT+JzqV3Xvwan
 0rHg==
X-Gm-Message-State: APjAAAUplLAHZgcyc9EWLPlkT26t+X4zH2Wd2Ift0O6JdPWbbdyAo5N5
 280Mxpg+EvuUdACBz/4Z/Pgw0ANux1vcMd7fKuWWQw==
X-Google-Smtp-Source: APXvYqw12VFX7Lv6Sh5rKLzmIJDafMfD4+5vdQs5GbevDPTLgen0n5WPlVHqD/WI9vXfnk5kxptgrH3h3fBuUjYs/4Q=
X-Received: by 2002:ab0:7c3:: with SMTP id d3mr6146624uaf.131.1563351195035;
 Wed, 17 Jul 2019 01:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190716115725.66558-1-cychiang@chromium.org>
 <20190716115725.66558-5-cychiang@chromium.org>
 <CA+Px+wV6RSfv4GL8+EJzXGq2nqzKtH9p23VTo2s30h0To2rQtg@mail.gmail.com>
In-Reply-To: <CA+Px+wV6RSfv4GL8+EJzXGq2nqzKtH9p23VTo2s30h0To2rQtg@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 17 Jul 2019 16:12:48 +0800
Message-ID: <CAFv8NwJu14XEDLE3Y+GTU2foFH3b5iBQ-q=tehjBYQ51m2LiCQ@mail.gmail.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 Dylan Reid <dgreid@chromium.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v4 4/5] ASoC: rockchip_max98090: Add
	dai_link for HDMI
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

On Tue, Jul 16, 2019 at 10:14 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Tue, Jul 16, 2019 at 7:58 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> >
> > diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
> > index b43657e6e655..d610b553ea3b 100644
> > --- a/sound/soc/rockchip/Kconfig
> > +++ b/sound/soc/rockchip/Kconfig
> > @@ -40,9 +40,10 @@ config SND_SOC_ROCKCHIP_MAX98090
> >         select SND_SOC_ROCKCHIP_I2S
> >         select SND_SOC_MAX98090
> >         select SND_SOC_TS3A227E
> > +       select SND_SOC_HDMI_CODEC
> >         help
> >           Say Y or M here if you want to add support for SoC audio on Rockchip
> > -         boards using the MAX98090 codec, such as Veyron.
> > +         boards using the MAX98090 codec and HDMI codec, such as Veyron.
> You should not need to select the option in this patch (but in next
> patch), because this patch does not depend on anything from
> hdmi-codec.c.
Thanks for the explanation.
I'll fix in v5.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
