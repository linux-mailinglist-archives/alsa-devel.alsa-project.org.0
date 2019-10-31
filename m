Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 849FBEAE6A
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2019 12:05:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C5881AD7;
	Thu, 31 Oct 2019 12:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C5881AD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572519957;
	bh=wUylMg0ICbyeL7AsZ8SvgkicNRjQHwke+mAUamBOE0I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D5EVOZR20L9y3FTrqIJ9H4faijdV63FmArL3Y4TkU17Qy/faZSw/VWJPBeJoMzUBi
	 f+srH1D0zmc53USxhZFACZh/CA3RS5XHGqOITL83zYlTNHMLIxXre7BO1QqemS0nZm
	 T6b+oUTuHzJZ7dvJy8+ik49ZsJ61h6UPo9Bpa5Mg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D4DBF805FB;
	Thu, 31 Oct 2019 12:03:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27F14F8036C; Thu, 31 Oct 2019 12:02:24 +0100 (CET)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5066F802A0
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 11:52:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5066F802A0
Received: from dhcp-159-84-61-180.univ-lyon2.fr ([159.84.61.180]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iQ83h-0004eH-85; Thu, 31 Oct 2019 11:52:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Date: Thu, 31 Oct 2019 11:52:02 +0100
Message-ID: <3977506.63UqibiCOv@phil>
In-Reply-To: <20191028071930.145899-7-cychiang@chromium.org>
References: <20191028071930.145899-1-cychiang@chromium.org>
 <20191028071930.145899-7-cychiang@chromium.org>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dianders@chromium.org, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [alsa-devel] [PATCH v9 6/6] ARM: dts: rockchip: Add HDMI audio
	support to rk3288-veyron-mickey.dts
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

Am Montag, 28. Oktober 2019, 08:19:30 CET schrieb Cheng-Yi Chiang:
> Add HDMI audio support to veyron-mickey. The sound card should expose
> one audio device for HDMI.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>

applied for 5.5 after removing the ".dts" from the patch subject

Thanks
Heiko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
