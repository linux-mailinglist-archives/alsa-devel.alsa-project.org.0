Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E370E990B
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 10:17:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F85A232A;
	Wed, 30 Oct 2019 10:16:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F85A232A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572427032;
	bh=8FjIeAKyJakjjxLzbQ0c1Il+A7SUSy+s68wFSjgy9lM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pZRNZ80VWH4ZFm5dvZt5vuq0e2G47DNBxYgmYbP5XAmLxtki9xKF/B7tbNzOkir/w
	 zL6DF6QAwPBTpH1ygMwVg64WWkHHPKdwlOt6gLTnLvjI3DBj/hfZDsVRGeAvSivTeE
	 plRv8FTHJbpE6uEzp0NGATVlkY+gYqUY3397MH20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92AA0F8044A;
	Wed, 30 Oct 2019 10:15:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 995CCF80361; Wed, 30 Oct 2019 10:15:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC9F6F8015A
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 10:15:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC9F6F8015A
Received: from [91.217.168.176] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iPk42-00079b-Tm; Wed, 30 Oct 2019 10:14:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 30 Oct 2019 10:14:49 +0100
Message-ID: <9095671.y4VLy4llMG@phil>
In-Reply-To: <CA+Px+wXAo5EPjudneS+aFEAfBRAQR1Xp6goutdMdYTPeKcfTTA@mail.gmail.com>
References: <20191028071930.145899-1-cychiang@chromium.org>
 <20191028071930.145899-6-cychiang@chromium.org>
 <CA+Px+wXAo5EPjudneS+aFEAfBRAQR1Xp6goutdMdYTPeKcfTTA@mail.gmail.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Liam Girdwood <lgirdwood@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
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

Hi,

Am Mittwoch, 30. Oktober 2019, 10:09:46 CET schrieb Tzung-Bi Shih:
> This series has 6 patches.  We noticed you have merged the first 4
> patches (includes the DT binding one:
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/157668.html).
> 
> There are 2 DTS patches are still on the list:
> - [PATCH v9 5/6] ARM: dts: rockchip: Add HDMI support to
> rk3288-veyron-analog-audio
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/157499.html
> - [PATCH v9 6/6] ARM: dts: rockchip: Add HDMI audio support to
> rk3288-veyron-mickey.dts
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/157500.html
> 
> Are you waiting for other maintainers' acknowledgement?  Or do we need
> to resend them with maybe some modifications?

nope all good like it is, ideally driver-changes (including the binding)
and the devicetree-changes itself go through my tree in this case, as
otherwise we would often run into conflicts if dts change go through
vastly different maintainer trees.

Of course dts changes can only get applied after the driver side is happy,
so I'll be picking up these 2 changes (hopefully shortly)


Heiko



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
