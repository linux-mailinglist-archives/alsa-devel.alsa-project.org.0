Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BC4E98EF
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 10:11:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A3C22325;
	Wed, 30 Oct 2019 10:11:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A3C22325
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572426710;
	bh=eGzIAO47Ahs0FetP/+BwLi5HOqcN/1dRNB/P4KJavMw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VkMZuMHp6iLbj3x3pdd5qjIrGlX7eJ0S7YQof5jU15NeXV2DYLV0H9Noe+r/SVlHp
	 Z32z7ggQX4PIUkoEO5q3I7jmowJt3ujXEfMXre5WosTBtvE7WZiq6dpIHA8BE3e1Fm
	 oHhkN1bXNhKT7XdRAFNupThXNoCHvSCMu8sej/ms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFEB3F802A1;
	Wed, 30 Oct 2019 10:10:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8E48F80361; Wed, 30 Oct 2019 10:10:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 128B6F8015A
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 10:10:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 128B6F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rgD3YR7u"
Received: by mail-io1-xd42.google.com with SMTP id c11so1624124iom.10
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 02:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3BXeivFO4X0coYk6B/avMJFt+nMNImCe8Y2eVzRxJFc=;
 b=rgD3YR7uT2D0dkZuQMZgyLiH4b7hPEZWk818ADfeJHzIIEODqIjPi2Vwf4LkxgAJmn
 GugrOnHZ98V0Z5fmecKHMcS4hhuDDgAuQ45STgVaPP8PMGfNK8RQBIkyqnJcuPIbjHpl
 7yMmKCa2oWZjT98EoCyr6Qd1oE0fmu+QDael6BlSgXecboYQs5C6kbhzYZOH1MoZf652
 CMiu/cM0XoYvWCxUEw/QTl/q0/a/x3fI2q5xfQL6mBfYtpOxKH9AXmxUYDTxVIH74NwP
 P7u0BMgZXlVHQDYXTqHqKWo2W12R4VEUMqhCBlZcEmk7Wlxy94ZwfULaTy0x03tOe9Qr
 KxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3BXeivFO4X0coYk6B/avMJFt+nMNImCe8Y2eVzRxJFc=;
 b=KSgdeAAcVIzG4gBvvNBmzzi7ZTE1c13qXq5iEiq5dro+ZW/MCSYfkxD0uwhBFtLg0X
 gsRPXM8Sa8FC9hPkugaovWS7P1GyJG5NERAT/26q8ZLVIV02K683EhChnlJFEODmJy6m
 XZdSWCME18H5Aqn/54w/LalgdvQHZRAnfVF/dnrxa0m797O8euApVUjwu4cY/LiFZAXw
 M6lXuzJLNs9062Rl2WrWSsfV6nqqjYIyvhGsdFw0ioACYPeMyI5rm40WEJjx5eAHeQ9V
 apYqv/qqwg5wQc/yp434O0qIxXS0aEmivi3c5LlYWTTh2g5+i1znfh/Uj9zpv1B+75Ag
 yEvw==
X-Gm-Message-State: APjAAAUftvOjaovDbAV6UmmcDYvXtFp6A14Hh+mA0kEJa70n19Lz/cMa
 JTVCpMOTMI5qabT/SCXktM82I7eRFBytd100TLl3Hg==
X-Google-Smtp-Source: APXvYqwsMJgbtEnWJYSgXn3eGjvbOusJ0jj+WPFGATdoFjsdJMwxpkNReWQUMncR1sWsj4rp80BoxS+tjeE5DjoKEvw=
X-Received: by 2002:a02:900a:: with SMTP id w10mr16212181jaf.29.1572426598410; 
 Wed, 30 Oct 2019 02:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191028071930.145899-1-cychiang@chromium.org>
 <20191028071930.145899-6-cychiang@chromium.org>
In-Reply-To: <20191028071930.145899-6-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 30 Oct 2019 17:09:46 +0800
Message-ID: <CA+Px+wXAo5EPjudneS+aFEAfBRAQR1Xp6goutdMdYTPeKcfTTA@mail.gmail.com>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [alsa-devel] [PATCH v9 5/6] ARM: dts: rockchip: Add HDMI
	support to rk3288-veyron-analog-audio
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

Mark,

This series has 6 patches.  We noticed you have merged the first 4
patches (includes the DT binding one:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/157668.html).

There are 2 DTS patches are still on the list:
- [PATCH v9 5/6] ARM: dts: rockchip: Add HDMI support to
rk3288-veyron-analog-audio
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/157499.html
- [PATCH v9 6/6] ARM: dts: rockchip: Add HDMI audio support to
rk3288-veyron-mickey.dts
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/157500.html

Are you waiting for other maintainers' acknowledgement?  Or do we need
to resend them with maybe some modifications?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
