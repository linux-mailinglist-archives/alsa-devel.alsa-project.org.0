Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31980B7B4A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 15:56:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A82DC167C;
	Thu, 19 Sep 2019 15:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A82DC167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568901416;
	bh=VGf9/oGzTWEwzjPzC/izt5y2gGqEIIbL57I8UbyVgh4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UrCe19hK9ewlU/DYKJZJ6gFsljM/o9GIWU1fKSSupHbQNec6eEXogbG0875q6JTOk
	 X7xzxZKLDwwYzf1dIxlleoBYrjb4k08sDITduBrUD+K9lHPXUCdXuGDmajaGCjMDPN
	 y4/BjjJw3pCCcXfml4GOU1FA1778Kul/xs+Gvh7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03A44F80361;
	Thu, 19 Sep 2019 15:55:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1387F80361; Thu, 19 Sep 2019 15:55:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C82DF80146
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 15:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C82DF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="FmYK84Ry"
Received: by mail-pg1-x544.google.com with SMTP id u17so1963350pgi.6
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcejNC9fZ/NTUQ3FSm9GGJHJUw8LFfPEgVCIpwJsA9I=;
 b=FmYK84RyOgnliQ31WHT/B2X1rhvCHXNKlvyGmlVRO6Gpnzh/yL+0IWnFuePQCs0YK7
 +EYn5B+vPDFY2t1doWxyw/Wd/JDH+PBoa7As7ehNNs/LaWfDv5hH9QpdJZvm+Yb2diYP
 DvCuozGD+FhcOyRrTAaTNxWnzHPNP9l0BEObg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcejNC9fZ/NTUQ3FSm9GGJHJUw8LFfPEgVCIpwJsA9I=;
 b=DJa2xe6TI80WDVDyPia1FxVvkXeU/YAIF1Wj07cMzo24IU0eeC6SR0Gqja70BN81vJ
 IfTHOBzLIJN3yphmbEJzdAOguwO0vTwjdRKrgM3KpRWpAdRBlOvrr44dwBt48E7F6umK
 /SiyrzER0i6LRNWblapIa9TEQ3n8FMuVxhX7Aw67ObhhtQOeiJZLlnIBed/Y7oyexB/1
 i882vZ2E/DrCUxBpGUXT1EgYWCtdYvz8VqQx5QjCSuNH+tKFKTpQ9/H5eHiWhtEWH1HA
 ViuT18W5Op1ZAhQJ3qDj+Vb0NSS/9tya59RJT0F8kdQualw/RcqjTRZXh1jHP08i73ki
 1hWQ==
X-Gm-Message-State: APjAAAW1//i2OmV3xiMxdCSklBc/deIj0Q3PHTzbYNmqXyaRJBYzMABA
 Kw210PAZ+B4YhHEYcXP7K24syw==
X-Google-Smtp-Source: APXvYqwzVnj7vxmA6CmoajQ5DhGoNUc4s8peBeQOyXU+7fwt6n3lmQmFbq+8zRi0BN2hVeUmT9gckw==
X-Received: by 2002:a17:90a:9dc1:: with SMTP id
 x1mr3790773pjv.98.1568901304488; 
 Thu, 19 Sep 2019 06:55:04 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id o195sm13065184pfg.21.2019.09.19.06.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 06:55:03 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 19 Sep 2019 21:54:46 +0800
Message-Id: <20190919135450.62309-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, dianders@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [alsa-devel] [PATCH v7 0/4] Add HDMI jack support on RK3288
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

https://patchwork.kernel.org/patch/11047447

has been picked up by Mark Brown in ASoC tree for-5.4 branch.

Changes from v6 to v7:

1. rockchip_max98090: Use phandle of HDMI from DTS to find
   codec_dai. With this we don't need to set fixed id for the
   created hdmi-audio-codec device.

Cheng-Yi Chiang (4):
  drm: bridge: dw-hdmi: Report connector status using callback
  ASoC: rockchip-max98090: Add description for rockchip,hdmi-codec
  ASoC: rockchip_max98090: Add dai_link for HDMI
  ASoC: rockchip_max98090: Add HDMI jack support

 .../bindings/sound/rockchip-max98090.txt      |   2 +
 .../boot/dts/rk3288-veyron-analog-audio.dtsi  |   1 +
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |  11 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  41 ++++-
 include/drm/bridge/dw_hdmi.h                  |   4 +
 sound/soc/rockchip/Kconfig                    |   3 +-
 sound/soc/rockchip/rockchip_max98090.c        | 149 ++++++++++++++----
 7 files changed, 182 insertions(+), 29 deletions(-)

-- 
2.23.0.237.gc6a4ce50a0-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
