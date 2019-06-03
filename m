Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E2C327BD
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 06:35:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B99201669;
	Mon,  3 Jun 2019 06:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B99201669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559536507;
	bh=FFHKl4qy5lWuOrnpF6Y6cAh5Qc8LxscEytKpq2ZaHqI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l/YrPAIW8Aj6GpnEu5p61MrfzpLKaSSyzAgAsH9nXanwCY2lQfGo6aXWNH2RyZr0N
	 uhdyJGppW0QEYbsQCfiY+QeaolmsqTbUFTThcuVno/EZ7WCy6CDANSkQKwp6djx01p
	 dpnPb92e3zdIvHso7A2oCTNiLGS723hJHuWH6EoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14AB7F896ED;
	Mon,  3 Jun 2019 06:33:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03FD1F896CE; Mon,  3 Jun 2019 06:33:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 192E4F896CE
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 06:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 192E4F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="VeaP4rlc"
Received: by mail-pl1-x641.google.com with SMTP id x7so5471152plr.12
 for <alsa-devel@alsa-project.org>; Sun, 02 Jun 2019 21:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gbBoXtkybCih+d0Fl03vwDQsITr3snGAAM8qh+nRjII=;
 b=VeaP4rlcKfdj36YiD4gQN5PLFZoAC42M84KJTEVRE31jLss30T+2akFEYuIFscw/ch
 osRR3hmV4eFkOymM8RI/dzrIeWeqmeCdj51ANhdIi8KizrDsWOPaglP+WSVFVgD9Tnl7
 MddyM0pP/JzICG9T/EMHkZSnnKGiIZeN7crL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gbBoXtkybCih+d0Fl03vwDQsITr3snGAAM8qh+nRjII=;
 b=HGqpZAU3vX+guY0ADdzD53d7CqCjF6whl8CceXkmkciwCoHeFyZB6dCRa9m5/qihqA
 dz0n9mrzpWWfqpWmFeGocjyPgYZQLIHm4CZpbRiCK3cC82LaZB+oHfXDVM4hFzB4OrfS
 OlGwn0DnxdS7g2ZXveDMIlwC40lDF0wzZLhczzRi5U9q/LOWE/eOL4+ooXc+46vCv50l
 HZNtWV4tHUaHal6eqUUeV+oDKCwlYK8+o4M7fpN0C+BEoaJBZnjlgUsDtRneW6GtM9OE
 YnZQMAb5vFmQmmN1tmQKBbeIyYlDJv5//7LMXA2Rp2Pfy5tAIBkfEUKvU3w43Wp23afl
 ZyfA==
X-Gm-Message-State: APjAAAW1sEp7yWrk9z/FH9F0qg7Gf+pqAYnYfou0oG/hMjBV5dN7O53j
 zdHeo3010oooN2/3aI54LZh0ew==
X-Google-Smtp-Source: APXvYqwHPRACAb2NVy4vT95TjNhB37pT6HfXrPSfjEO5DvIiqn/QoGGQisMAL1weRQlGa/4txReURQ==
X-Received: by 2002:a17:902:54f:: with SMTP id
 73mr27187074plf.246.1559536392351; 
 Sun, 02 Jun 2019 21:33:12 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id d19sm11382053pjs.22.2019.06.02.21.33.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 21:33:11 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Mon,  3 Jun 2019 12:32:44 +0800
Message-Id: <20190603043251.226549-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: [alsa-devel] [PATCH 0/7] Add HDMI audio support on RK3288 veyron
	board
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

This patch series is to support HDMI audio on RK3288 veyron board.

To support jack reporting, there are two old patches:

video: add HDMI state notifier support

<https://lore.kernel.org/linux-media/20161213150813.37966-2-hverkuil@xs4all.nl/>

ASoC: hdmi-codec: use HDMI state notifier to add jack support

<https://patchwork.kernel.org/patch/9430355/>

They are modified to pass checkpatch checking based on latest ASoC tree

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git

for-next branch.

With these two patches at hand, hdmi-notifier support is then added to dw-hdmi
driver so the plug/unplug event can be passed to codec driver.

The rest patches are about machine driver rockchip_max98090.
A HDMI DAI link is added for HDMI playback so there will be two devices on
this sound card. One for max98090 and one for HDMI.
The HDMI node is passed from DTS so machine driver can set the correct
hdmi-notifier on codec driver.

Cheng-Yi Chiang (5):
  drm/bridge/synopsys: dw-hdmi: Add HDMI notifier support
  ASoC: rockchip_max98090: Add dai_link for HDMI
  ASoC: rockchip: rockchip-max98090: Add node for HDMI
  ASoC: rockchip_max98090: Add HDMI jack support
  ARM: dts: rockchip: Specify HDMI node to sound card node

Hans Verkuil (1):
  video: add HDMI state notifier support

Philipp Zabel (1):
  ASoC: hdmi-codec: use HDMI state notifier to add jack support

 .../bindings/sound/rockchip-max98090.txt      |   2 +
 MAINTAINERS                                   |   6 +
 .../boot/dts/rk3288-veyron-analog-audio.dtsi  |   1 +
 drivers/gpu/drm/bridge/synopsys/Kconfig       |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  28 +++-
 drivers/video/Kconfig                         |   3 +
 drivers/video/Makefile                        |   1 +
 drivers/video/hdmi-notifier.c                 | 145 ++++++++++++++++++
 include/linux/hdmi-notifier.h                 | 112 ++++++++++++++
 include/sound/hdmi-codec.h                    |   7 +
 sound/soc/codecs/Kconfig                      |   1 +
 sound/soc/codecs/hdmi-codec.c                 | 104 ++++++++++++-
 sound/soc/rockchip/rockchip_max98090.c        | 123 ++++++++++++---
 13 files changed, 508 insertions(+), 26 deletions(-)
 create mode 100644 drivers/video/hdmi-notifier.c
 create mode 100644 include/linux/hdmi-notifier.h

-- 
2.22.0.rc1.257.g3120a18244-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
