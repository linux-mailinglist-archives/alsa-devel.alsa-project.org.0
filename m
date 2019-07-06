Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 224A160FD4
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jul 2019 12:20:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC50166C;
	Sat,  6 Jul 2019 12:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC50166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562408413;
	bh=NId3F8gOfhRH3IqpehDaoO0gSrqKWq400R7IpPSQzBY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kIkD29TVYkrUMHbPweQBHIR5Md0HJB/lmBzJQzKiLjuql0UZFjBqBwHhwPMwrudFh
	 k+/vLhfr9PTe85/A42w83EQSHKEYmWjbTPElYycnWHHQXYCcNlVfIbaUhb6nV+5l9R
	 CMuGz6k6fYqjM2FT3nqGbhgeM7aKD2rg6fgTQhq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BE35F80138;
	Sat,  6 Jul 2019 12:18:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1B8AF8013F; Sat,  6 Jul 2019 12:18:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PDS_NO_HELO_DNS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C107F80138
 for <alsa-devel@alsa-project.org>; Sat,  6 Jul 2019 12:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C107F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="LxmgdcxP"
Received: by mail-vs1-xe42.google.com with SMTP id m8so5270957vsj.0
 for <alsa-devel@alsa-project.org>; Sat, 06 Jul 2019 03:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jAVwcJuM+YKewDeekBtdpzxDH4pN8Z1qY7lRoAxlQ2k=;
 b=LxmgdcxPecTrogSpOJXeHAvpLygjo6I3MXbMM2SYl+QXjS6fO+EQHhi8KNRAZ1Z1aa
 7c0i45kq3WMa2ftCYUtfQ1IWl836CgNJ1myvCLLiNdPdEEBpafk5GG4cD/UCrtAGhTqT
 oaI01JbitM9uW1q7vmGKd2LVxuVnT5f0gv4yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jAVwcJuM+YKewDeekBtdpzxDH4pN8Z1qY7lRoAxlQ2k=;
 b=bsakbHXD3Ml/B9sI7z0oyOB07kXxjMKIXe3fZjraVdF2PUGJ3ihxFxv6J9c/zG59IQ
 /iteWJyw9i/JdYt7X38fn7SBQIdvN+cXHZqgct5hxh5USsLyHX3yZ36qts8UjEv/2EYi
 07KuQx93GmAiwccDbWHVLIaZCbQ32OFYmE5nxWQ/dOOOu3DNDz5ALOjCTpm5CpH/xTvH
 +QxlK3AT9fGI0xSttys8Tdk71rT6Rs5lE7+E5Jpj13DHJAVG8elsdxhAn+ZvDr3zilnD
 F6JXwc4uOElWu79d2rZ++6t4uCsSAKhxxjAy2NVZsQ/bl0Fw8635bMB8VZAnnrG3AI4K
 OPUg==
X-Gm-Message-State: APjAAAUP3P/4+qheUczA3M1SVH+brnyLUSj5I4TtzS7NyeNyoLXLGU+V
 ZXCI2+bjm7IxZQzN0Jak6+1T70lmrSI5qo1yFeoK5Q==
X-Google-Smtp-Source: APXvYqwHXziO50Z/T/wc7OBaLrepyZ4DeDeLVwv5g2F6618IyLzz5j+3wEg9LMO4ASJyJbXamm3xKkz3W1VhuzqonMQ=
X-Received: by 2002:a67:f7cd:: with SMTP id a13mr2560400vsp.163.1562408301993; 
 Sat, 06 Jul 2019 03:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-3-cychiang@chromium.org>
 <VI1PR06MB41425D1F24AC653F08AFA463ACF50@VI1PR06MB4142.eurprd06.prod.outlook.com>
 <CAFv8NwJXbJo=z_NDj+JQHD9LOmnbfM8v_N1uHn4sdBzF-FZQfA@mail.gmail.com>
 <20190705171618.GA35842@sirena.org.uk>
In-Reply-To: <20190705171618.GA35842@sirena.org.uk>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Sat, 6 Jul 2019 18:17:54 +0800
Message-ID: <CAFv8NwKhBKaDAzfdRVGzOs0M3quZeZANWQ2EDo210jy9M-c0cQ@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: "dianders@chromium.org" <dianders@chromium.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>,
 Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Takashi Iwai <tiwai@suse.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Russell King <rmk+kernel@armlinux.org.uk>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, "dgreid@chromium.org" <dgreid@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 2/4] drm: bridge: dw-hdmi: Report connector
 status using callback
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

On Sat, Jul 6, 2019 at 1:16 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Jul 05, 2019 at 03:31:24PM +0800, Cheng-yi Chiang wrote:
>
> > It was a long discussion.
> > I think the conclusion was that if we are only talking about
> > hdmi-codec, then we just need to extend the ops exposed in hdmi-codec
> > and don't need to use
> > hdmi-notifier or drm_audio_component.
>
> What I'd picked up from the bits of that discussion that I
> followed was that there was some desire to come up with a unified
> approach to ELD notification rather than having to go through
> this discussion repeatedly?  That would certianly seem more
> sensible.  Admittedly it was a long thread with lots of enormous
> mails so I didn't follow the whole thing.

Hi Mark, thanks for following the long thread.
The end of the discussion was at
https://lkml.org/lkml/2019/6/20/1397

Quoted from Daniel's suggestion:
"
I need to think about this more, but if all we need to look at is
hdmi_codec, then I think this becomes a lot easier. And we can ignore
drm_audio_component.h completely.
"

My thought is that the codec driver under ASoC are only these two:
hdac_hdmi.c and hdmi-codec.c  ( forgive me if I missed others. I just
grep "hdmi" under sound/soc/codecs/ )
hdac_hdmi.c is like a wrapper for HDA and drm_audio_components.
hdmi-codec.c is the only other codec driver that cares HDMI under ASoC.
So adding the jack/eld support at hdmi-codec driver can cover the
existing use cases for HDMI codec driver in ASoC.
That said, adding a new unified approach for Jack/ELD notification
that will only be used by hdmi-codec seems not a high priority.
Hope this explanation helps your decision.
Thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
