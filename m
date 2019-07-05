Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A65FA6022E
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 10:32:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F37F1692;
	Fri,  5 Jul 2019 10:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F37F1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562315536;
	bh=i+VguXM1LE8RyP5UWT5fM+xmjJ4GsI1kwR5Dc/OAyGA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xftt7KXIkJ3tpky2w5IAKCz2u2tpPbAwq7C4u4hRfGbkc5dLOXuoV10iUy0u6X1zS
	 gunJRUHMqzK42ZmfLVEt+nTY5E7dxH4h+dXo+ZoKisL070U+sDALnnzQNySh+/XYQE
	 0p2Ie/bvaTgYst8DTTCAVZQpVpVQK9jSIZEPylBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65B3BF80120;
	Fri,  5 Jul 2019 10:30:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F344FF8011F; Fri,  5 Jul 2019 10:30:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_PDS_NO_HELO_DNS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BFDAF800E1
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 10:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BFDAF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch
 header.b="AI94tmMh"
Received: by mail-ed1-x542.google.com with SMTP id d4so7492466edr.13
 for <alsa-devel@alsa-project.org>; Fri, 05 Jul 2019 01:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=QbM44vAJoF7F4CJFe8D/rdMDdvpEwrpfX/ASCNMAqXA=;
 b=AI94tmMhDWpYtJmSG9OE2YtmGF4jgP603p1zLogEX94WNdxqWXxqEwxrlkap0wV7Yl
 ZZRrsbZx4mmXa6AJ4tYAh2jqBqJjFu9u5l/agQqdcx6lc9fHqFA0EU/eN4baePIRYs0K
 ZXYrsPW7Y5tzH4uUsUdwjuKhodl8pkaIRj+10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=QbM44vAJoF7F4CJFe8D/rdMDdvpEwrpfX/ASCNMAqXA=;
 b=LZBY0QZ6YrOaKlyjdITM/U34FiAg8BkihbNlGF40q34pfhzOdEU56iB9liuY7OPCrU
 ndsD0DcKBcwG+B95L92CG+ZYSo1fr6atMPy9mIDbVtBXIBzb65BE/fuaDqRZgyl+EefW
 qp6HCNkrZgN59/HJnk6zL394j8BrE4USe470a8LKmxJeTYiSt2N7i7NFAYPmTsIF1wHr
 HEz6eaN1DWH/eLIiKqvkDMjrCqIpdyCqsF8F0FuJY8RCV30+UQpliZySNLXzHIx/Eqre
 Bcf+i/fB4WfMdenOI7SaDa3h5eVtvqm8ZDfCbmo6pFI8yALtDNqI7jKhi98Ffmg+9eER
 rOaQ==
X-Gm-Message-State: APjAAAXengbYbSbEpjcR4Dm8rTNZI9kQ7hOz8iORSOg77Y9r29QmZBGW
 db5puySACoT7xKwSnqCzDdoSNA==
X-Google-Smtp-Source: APXvYqwxQTfCTwjg1Nv3JLxxlgEvpmawVRx0vKkBJIxGnG7RJ1+MqMHZ1WkVfQw3vC+4ikaheGDsmw==
X-Received: by 2002:a17:906:ce21:: with SMTP id
 sd1mr2339496ejb.189.1562315425410; 
 Fri, 05 Jul 2019 01:30:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id j16sm481089ejq.66.2019.07.05.01.30.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 01:30:24 -0700 (PDT)
Date: Fri, 5 Jul 2019 10:30:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Message-ID: <20190705083022.GM15868@phenom.ffwll.local>
Mail-Followup-To: Cheng-Yi Chiang <cychiang@chromium.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Heiko Stuebner <heiko@sntech.de>,
 dianders@chromium.org, dgreid@chromium.org, tzungbi@chromium.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20190705042623.129541-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705042623.129541-1-cychiang@chromium.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 dgreid@chromium.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 0/4] Add HDMI jack support on RK3288
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

On Fri, Jul 05, 2019 at 12:26:19PM +0800, Cheng-Yi Chiang wrote:
> This patch series supports HDMI jack reporting on RK3288, which uses
> DRM dw-hdmi driver and hdmi-codec codec driver.
> 
> The previous discussion about reporting jack status using hdmi-notifier
> and drm_audio_component is at
> 
> https://lore.kernel.org/patchwork/patch/1083027/
> 
> The new approach is to use a callback mechanism that is
> specific to hdmi-codec.

I think this looks reasonable. There's the entire question of getting rid
of the platform_device in hdmi_codec an roll our own devices (so that it
all looks a bit cleaner, like e.g. the cec stuff does). But that can also
be done in a follow-up (if you can convince reviewers of that).
-Daniel

> Cheng-Yi Chiang (4):
>   ASoC: hdmi-codec: Add an op to set callback function for plug event
>   drm: bridge: dw-hdmi: Report connector status using callback
>   ASoC: rockchip_max98090: Add dai_link for HDMI
>   ASoC: rockchip_max98090: Add HDMI jack support
> 
>  .../gpu/drm/bridge/synopsys/dw-hdmi-audio.h   |   3 +
>  .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |  10 ++
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  32 ++++-
>  include/sound/hdmi-codec.h                    |  16 +++
>  sound/soc/codecs/hdmi-codec.c                 |  52 ++++++++
>  sound/soc/rockchip/rockchip_max98090.c        | 112 ++++++++++++++----
>  6 files changed, 201 insertions(+), 24 deletions(-)
> 
> -- 
> 2.22.0.410.gd8fdbe21b5-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
