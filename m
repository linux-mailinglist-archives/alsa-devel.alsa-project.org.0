Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04827E4C47
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 15:32:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64F8D17EC;
	Fri, 25 Oct 2019 15:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64F8D17EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572010334;
	bh=2LPB4Nx0/EyNbaIHN4FLILOQQH5CIm97GxtZHHvJqGs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AhzUfizSULFpKrhcdDUXo2rFZMlzFoxWZR2xns7E/difubnb6maR3tqHFHs3wyP3e
	 jx777IniNjjPinU6zkxMMqlROZIHSe2a1dwzdxL9p4DreeKCSEq5670UvW08rXI2BX
	 bsC7BioyLCw7aBL8nVIPNdYxQcUMqoV3o2Vkkcjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 985E7F802A0;
	Fri, 25 Oct 2019 15:30:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A39BF80368; Fri, 25 Oct 2019 15:30:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69DF8F80112
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 15:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69DF8F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="hkoiNtYv"
Received: by mail-pg1-x542.google.com with SMTP id l3so1552139pgr.8
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 06:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgk2VpYDvWxnQGOn4CatnKUbEjzqifjDf+V5kplLk3Y=;
 b=hkoiNtYvvdlvP8l6YHJ0NAcOrbqzyTeM8GV5/CrfA0sqk7Un42PZnP+hIk4FRUHCIp
 uJrYQ2nf1MsX5xGpT+4LwiS2I3HKNvMGsveUyU2msEa+qqz8o7Wpw53WLVf2C//dpdWz
 NESc7oSR3+f7btvnpogS3AxngiEYpeuPmaTk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgk2VpYDvWxnQGOn4CatnKUbEjzqifjDf+V5kplLk3Y=;
 b=niMsPFH+AFifdEyxr3LXV6PorN3cvY5TtEVyp4V3gOzUIEgQWa8zL9MXSsHcpaN+KW
 tBt/b6Pgt/Jx4afrFzAtmWDYwYG0NPDi7MYw9iR2DnxknwjTNL8v4dXbHv5JQa5yCzhM
 GLv+er8oY2woDWDJDxNRUcxi5JZ9vt/oypG+iQ/LszvovWL7w2nywO7J7KK1Fe+GTMls
 xT3ZYIsHVJnQnIysT2Nu2s0YSVz1H4wAdsAD4bCbEecTSI4teYS8govBK6BXu0+K4zNx
 R2fx99UE3YYEqF3TvrKG6joT8XVI1Dbb5HlnI7IG8GCV5+Xlxcmyk1CIB8BvH2U60NAZ
 pPyw==
X-Gm-Message-State: APjAAAWAKIVJcPjlG6ELRp5YBuARPU9vFiUoOYKg/+myeikxPcVG8ubw
 7bx/uc5PG7n9enofmz0PRVkDgQ==
X-Google-Smtp-Source: APXvYqzpgx+nnjFmllOVgEw2I1Zze+v/IxDlqkvyVnWJ0/LUdRWU4MyQ5DhY20Cz7S6cmMoKn0X/FQ==
X-Received: by 2002:a65:4bc3:: with SMTP id p3mr4465303pgr.188.1572010221995; 
 Fri, 25 Oct 2019 06:30:21 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id q20sm2534518pfl.79.2019.10.25.06.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2019 06:30:20 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 25 Oct 2019 21:30:01 +0800
Message-Id: <20191025133007.11190-1-cychiang@chromium.org>
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
Subject: [alsa-devel] [PATCH v8 0/6] Add HDMI jack support on RK3288
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

6fa5963c37a2 ASoC: hdmi-codec: Add an op to set callback function for plug event

has been merged to upstream.

Changes from v7 to v8:

1. rockchip_max98090: Allow three different use cases:
   max98090-only: For backward compatibility where DTS does not specify HDMI node.
   HDMI-only: For HDMI-only board like veyron-mickey.
   max98090 + HDMI: For other veyron boards.
   Pass different compatible string to specify the use case.

2. Add more maintainers to cc-list for new device property reviewing.

Cheng-Yi Chiang (6):
  drm: bridge: dw-hdmi: Report connector status using callback
  ASoC: rockchip-max98090: Support usage with and without HDMI
  ASoC: rockchip_max98090: Optionally support HDMI use case
  ASoC: rockchip_max98090: Add HDMI jack support
  ARM: dts: rockchip: Add HDMI support to rk3288-veyron-analog-audio
  ARM: dts: rockchip: Add HDMI audio support to rk3288-veyron-mickey.dts

 .../bindings/sound/rockchip-max98090.txt      |  38 +-
 .../boot/dts/rk3288-veyron-analog-audio.dtsi  |   3 +-
 arch/arm/boot/dts/rk3288-veyron-mickey.dts    |   7 +
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |  11 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  41 +-
 include/drm/bridge/dw_hdmi.h                  |   4 +
 sound/soc/rockchip/Kconfig                    |   3 +-
 sound/soc/rockchip/rockchip_max98090.c        | 392 +++++++++++++++---
 8 files changed, 425 insertions(+), 74 deletions(-)

-- 
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
