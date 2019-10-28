Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8447AE6D15
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 08:21:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11F2B1AAB;
	Mon, 28 Oct 2019 08:20:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11F2B1AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572247291;
	bh=L3P3/xhep9D60wAi5GZC5OqIY6to+bhJVZq9Ub9vOPA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hQApkBpceV4Cd/cExI5cMPeZBJMk/0m3yYN9eiJymfsmJZpudHg9HPnujuF6+H5vy
	 R2NersEeUdjW55mMfXYj50VkSEUqqYLbUCch7aQI+U5VhBivPCPmWz8YY0LYiDvG5Y
	 7zOTyNyS6sLvfVwp331ZVBZWdUku6dj2Vv9T5W0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4D2EF803D6;
	Mon, 28 Oct 2019 08:19:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84816F80361; Mon, 28 Oct 2019 08:19:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0CACF8011D
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 08:19:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0CACF8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="P4SRp8hs"
Received: by mail-pg1-x542.google.com with SMTP id p1so6295062pgi.4
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 00:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1kARxN4zXqzFWFi9Hzge3EGrR8GY2GeJ7Yqz9IBjLtM=;
 b=P4SRp8hsDD5IeFRKKfwF24MUFSYWQUG8Pifned/ZXWMMwEDxyNi2fo2IBqSZemeTIr
 YXzLkF57dbipVFhFy74e+kfK6A+vvnGLJ9qcYvXjfL/f0CZKSBWPERoIjFznbevPjcKy
 2Yr0AWo8FKDfZP5ZaXkh/LIexFunlbxZ+g2ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1kARxN4zXqzFWFi9Hzge3EGrR8GY2GeJ7Yqz9IBjLtM=;
 b=IlDrF8AKXiyeeTHMFnNOr2g651x7nhp92VGii4LoD8w7DjOlAn0ewRtbQNvV5eWtvK
 L+fin91Wt23n8IBacded06H0dX63Mb3JhFRxOcS7Yav/cj6MS9b9CTg+81oLkrnMNZYv
 K9rJCnk1OKsQdFLPjh+bSQP+LDOIahLgxI+vBQwn+XJxbfdgLEBr+UWLyeZE+c7jsZn0
 bK7vLZpn0jQbbRmlheqMgEB/BDlur21gSIgDCfR53y7fJ3vqx8yzFCMhj7wCXFvRyrAR
 PyAZsuQOk254zY2OmjOTcHDulYKqksO9UyEj9OKGKDMDD7KmL1HmvmqSVxsJtdoOmQcN
 K3yQ==
X-Gm-Message-State: APjAAAV/jZqmQgB6XW8ez+3J/5902IGJBYGKScZTS/AULxutm6Ymbtdw
 9q1tC9OqvA/qt9Xhj0zANXEaYw==
X-Google-Smtp-Source: APXvYqyQ6aIEt1WbaZMUGlnrW1jFW16UZAwHLIo+j1unzlK77i3d3XcL512n21QVNwPfdFP+R7kEQQ==
X-Received: by 2002:a63:ff56:: with SMTP id s22mr19089316pgk.44.1572247179560; 
 Mon, 28 Oct 2019 00:19:39 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id h28sm12513742pgn.14.2019.10.28.00.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2019 00:19:38 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Mon, 28 Oct 2019 15:19:24 +0800
Message-Id: <20191028071930.145899-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dianders@chromium.org, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [alsa-devel] [PATCH v9 0/6] Add HDMI jack support on RK3288
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

This patch series supports HDMI jack reporting on RK3288, which uses
DRM dw-hdmi driver and hdmi-codec codec driver.

The previous discussion about reporting jack status using hdmi-notifier
and drm_audio_component is at

https://lore.kernel.org/patchwork/patch/1083027/

The new approach is to use a callback mechanism that is
specific to hdmi-codec.

The dependent change on hdmi-codec.c

commit 6fa5963c37a2 ("ASoC: hdmi-codec: Add an op to set callback function for plug event")

has been merged to upstream.

Changes from v8 to v9:

1. rockchip_max98090:
   Use the presence of rockchip,audio-codec to determine the presense of max98090
   in sound card.
   Use the presence of rockchip,hdmi-codec to determine the presence of HDMI in
   sound card.
   Remove the compatible strings added in v8.

2. #include <sound/hdmi-codec.h> should be in the patch of adding HDMI jack support.

Cheng-Yi Chiang (6):
  drm: bridge: dw-hdmi: Report connector status using callback
  ASoC: rockchip-max98090: Support usage with and without HDMI
  ASoC: rockchip_max98090: Optionally support HDMI use case
  ASoC: rockchip_max98090: Add HDMI jack support
  ARM: dts: rockchip: Add HDMI support to rk3288-veyron-analog-audio
  ARM: dts: rockchip: Add HDMI audio support to rk3288-veyron-mickey.dts

 .../bindings/sound/rockchip-max98090.txt      |  27 +-
 .../boot/dts/rk3288-veyron-analog-audio.dtsi  |   1 +
 arch/arm/boot/dts/rk3288-veyron-mickey.dts    |   7 +
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |  11 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  41 ++-
 include/drm/bridge/dw_hdmi.h                  |   4 +
 sound/soc/rockchip/Kconfig                    |   3 +-
 sound/soc/rockchip/rockchip_max98090.c        | 313 ++++++++++++++----
 8 files changed, 338 insertions(+), 69 deletions(-)

-- 
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
