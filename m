Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAAF490317
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 08:46:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F26FC1787;
	Mon, 17 Jan 2022 08:45:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F26FC1787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642405601;
	bh=nVojK749fmbikJ8Ylv61w+rfH9eMOuHdf6x9SWu9cSY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ycd4399khZgsW0Tna4XcCxeA52XTv82s1GKgIf7vyaBmnw5DLcu2a8qT7hVQlFRKZ
	 hPDM/WcGs2JIJQt862t0DKlqoiqdglvNRNirvG63xFGNwJy1RBFKl6n8XcvNv2eS7S
	 QZVEhofMTMX5/PCANz2jzvjoQ+1OPFwTYRaTJwno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6F66F8047B;
	Mon, 17 Jan 2022 08:45:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CAB2F80425; Mon, 17 Jan 2022 08:45:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82F01F80249
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 08:45:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82F01F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="SUwsxZsx"
Received: by mail-lf1-x134.google.com with SMTP id p27so42602079lfa.1
 for <alsa-devel@alsa-project.org>; Sun, 16 Jan 2022 23:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nVojK749fmbikJ8Ylv61w+rfH9eMOuHdf6x9SWu9cSY=;
 b=SUwsxZsxjvlQaEwoE7XT7C+KHZ9jGQQayZYDeXg5DlUCjdR5AwuUOSqu5Vnxhj5hfU
 cZct8MLYPqEIXtyX72Hymgmw/UKBQ1+Skmdl8fCeXQDsuDDeIpc+chJKRuX7BUddxkgp
 I/CiGnBzl6R++Z3e4nfaDlKGmOZMTWnoQWeYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nVojK749fmbikJ8Ylv61w+rfH9eMOuHdf6x9SWu9cSY=;
 b=UNhuJUcOebYWP0Ay4VXKCsFOh6/NXH9RX+sLP6ErplIg4a5lhBjZjjul2Avl69kyuW
 RKLpXqnxZdNe0If+Ci5BgqnDrrN+x8oa5Tgq+NVimEpPowPRrFdXGxXnHumdKPUA2s0T
 lreqSjaxRZd/3YhbKiS6ct1jLEnw5zo4YMjABJD2cf7wq9wdvgOQr3FYgpFqmvwRSAyy
 ZAKRXlqU7X8VUzvhBbYqWkZJdJutRIePm5hJKWuuKwPTOxuQ0AFHvRiZ38fqX6Q4+HUZ
 yztR2BwA+uELIJf8ga861tZrMyEA43LaRNmvPyw1mTzrz/3c4/5/tXgWMVW0ggUrptdu
 QL+g==
X-Gm-Message-State: AOAM532MaETzp8ov8E/+Do/fLI5C2+N9HkUllHKF8Bn61ShKsQemQBgf
 0lIhMVyog7ZR1hLBgEUlBqXOUJFaA0nDZhyAAal0RkRcjRDG9w==
X-Google-Smtp-Source: ABdhPJwG9NvWR9p35lcYW0jwX/k5v4481qRKalDO5NxJSEYxWGLzootcvrIELTsY/GzSoLCDQfiA7L3OWsPgQKfrGNM=
X-Received: by 2002:a2e:2285:: with SMTP id i127mr4064849lji.414.1642405520722; 
 Sun, 16 Jan 2022 23:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20220114230209.4091727-1-briannorris@chromium.org>
 <20220114150129.v2.2.I20d754a1228aa5c51a18c8eb15a2c60dec25b639@changeid>
In-Reply-To: <20220114150129.v2.2.I20d754a1228aa5c51a18c8eb15a2c60dec25b639@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 17 Jan 2022 15:45:09 +0800
Message-ID: <CAGXv+5Gm4ru8m5bZV_zm10U+FQRBSw7qq1eiL+hh+Z=5pZ7pYQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/rockchip: cdn-dp: Support HDMI codec
 plug-change callback
To: Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Lin Huang <hl@rock-chips.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, Jan 15, 2022 at 7:03 AM Brian Norris <briannorris@chromium.org> wrote:
>
> Some audio servers like to monitor a jack device (perhaps combined with
> EDID, for audio-presence info) to determine DP/HDMI audio presence.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
