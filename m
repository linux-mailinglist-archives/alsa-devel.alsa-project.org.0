Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D592A2D0A
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 04:57:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DA7815E2;
	Fri, 30 Aug 2019 04:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DA7815E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567133854;
	bh=tEaBuM3/QLIxKDgciFcfVMhgr5S174swWMQ+RxxlA+Y=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qSu6b5WG/zU3m5AFEU+/VHbTRLvykUAW94L03BHURDl2OXRY9LmGw+diF8g2wLJqf
	 TWHkoX7/LFKoM6+NWjhg20I/ippUz4ZuJkB7v0aWw4znPRrapOF3Srbm7uRCOZBz4v
	 gr+3Of8P6NTwtDjCWTZBfFwyFv2mhNWmB+LyaadY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A84DEF80376;
	Fri, 30 Aug 2019 04:55:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 697A7F80369; Fri, 30 Aug 2019 04:55:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21EA5F80096
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 04:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21EA5F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="go/AeEsI"
Received: by mail-ua1-x942.google.com with SMTP id g13so1856429uap.5
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 19:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uVJP3tNQZmRfMHp/W2ZEuVlB3ztV/VuTs152oodDoRA=;
 b=go/AeEsI5vC+mODTwi/w5PsQtEjcwg1f3Pf9r94z/spWywhIHshzlHgOAz73WeypOX
 pqMIDya9cWyUswo1xPqA+BADMwbb805CpsmQht+9dYBhC6NqBViosIEVvwIli8l3sTlO
 1jIG9p8bhTKdxA20ytec9mf4cYGdg+LwRAdxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uVJP3tNQZmRfMHp/W2ZEuVlB3ztV/VuTs152oodDoRA=;
 b=YKOvUqkRf8tJldogx/oeokaHulejZIm547wbOrcfQryqrUeVbtXkocDE3fudgqwzZT
 8UINbr9NrXCI6ho+4pL6puq3CV1plB6TKKgKCZ6akp3yBl2iDrFueCqKOENWtx9oMfy2
 BNgzE8j4ziaK69OIbMfIGUpVY5RAGLRgXaGtzdX93uhd9HT0tMgSLGsXhcPCHGa/fyAF
 Ov9nDtYePZ1SEOeJrnHSU7qSQuZYYl62gXtG6AHtISiLZ2OfW1KZkSWhxqOVpjakbuEF
 jzI/6FlM0SjfmvXrrCGX6L3vHUGNtDt7Aa53iJzKGD7yPsJb1uFQmoruY8lF98w7IYyg
 rIkQ==
X-Gm-Message-State: APjAAAX76mPRIeijPD9OFxNKJfu06fbJ+svGFhcKbiLYUUTS27H5dJjQ
 KBof7OO5Hq3ksX0F+ZRcFozUFziAlWTuzegczLpziA==
X-Google-Smtp-Source: APXvYqz3y2+iMq8OG/5tEVPvpxYHj7wpUTGqFySYc0DUG/K3JsZPiNj8noweU6gAsRnU3oLPZiigq/TH0naxasIEv+E=
X-Received: by 2002:ab0:7c3:: with SMTP id d3mr6638328uaf.131.1567133739477;
 Thu, 29 Aug 2019 19:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190717083327.47646-1-cychiang@chromium.org>
 <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
In-Reply-To: <CA+Px+wX4gbntkd6y8NN8xwXpZLD4MH9rTeHcW9+Ndtw=3_mWBw@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 30 Aug 2019 10:55:12 +0800
Message-ID: <CAFv8NwLiY+ro0L4c5vjSOGN8jA-Qr4zm2OWvVHkiuoa7_4e2Fg@mail.gmail.com>
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

On Wed, Jul 17, 2019 at 6:28 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Wed, Jul 17, 2019 at 4:33 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> >
> > This patch series supports HDMI jack reporting on RK3288, which uses
> > DRM dw-hdmi driver and hdmi-codec codec driver.
> >
> > The previous discussion about reporting jack status using hdmi-notifier
> > and drm_audio_component is at
> >
> > https://lore.kernel.org/patchwork/patch/1083027/
> >
> > The new approach is to use a callback mechanism that is
> > specific to hdmi-codec.
> >
> > Changes from v4 to v5:
> > - synopsys/Kconfig: Remove the incorrect dependency change in v4.
> > - rockchip/Kconfig: Add dependency of hdmi-codec when it is really need
> >   for jack support.
> >
> > Cheng-Yi Chiang (5):
> >   ASoC: hdmi-codec: Add an op to set callback function for plug event
> >   drm: bridge: dw-hdmi: Report connector status using callback
> >   drm: dw-hdmi-i2s: Use fixed id for codec device
> >   ASoC: rockchip_max98090: Add dai_link for HDMI
> >   ASoC: rockchip_max98090: Add HDMI jack support
> >
> LGTM.
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

Hi Daniel,
Do you have further concern on this patch series related to hdmi-codec
and drm part ?
We would like to merge this patch series if possible.
They will be needed in many future chrome projects for HDMI audio jack
detection.
Thanks a lot!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
