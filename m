Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DB66A7DD
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 13:59:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D787168B;
	Tue, 16 Jul 2019 13:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D787168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563278367;
	bh=JT/PJC+xcxqQPJDaxd+FkeFKorWyex+q3PNDNvZn2Uk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hoAdxElpFPHzasT+jonpn3MHTbbVqTtrPX7nhfrOXUXpLk+sMknzXqBPU9tXJXEnN
	 Ia6dyhZM9xOWMotRg2mX3pqT4I1o3YIN79dAdQ9U/mirCqHYtrwlVIgAgxKU2tIVk+
	 g55ctAFYL4orSdIUm4uz4ccXIXxYr8ZbqJUOs+Ok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EF28F800C4;
	Tue, 16 Jul 2019 13:57:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94AC7F80376; Tue, 16 Jul 2019 13:57:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06951F800C4
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 13:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06951F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ktGe9+lA"
Received: by mail-pg1-x543.google.com with SMTP id i18so9327959pgl.11
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 04:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IeXE1WNIbLgZbuXjaQOxWA+uaePxQPbUYQ3+kYNaWMc=;
 b=ktGe9+lAGPHwFi/wlz8lD76+AeIaTQtERkWK4VsGnh1JYg9WPux230jP1y7OvF1kD+
 ZXbjD8fqqdXuMjOOoKBf0pLRsxEuM6VZC4+OvbNncs/GBXHHvW2rt6ldjj/ebR3ZDpu+
 XNugwN2hk34e+scqI+o0eCXzJhj5hbsMCDaiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IeXE1WNIbLgZbuXjaQOxWA+uaePxQPbUYQ3+kYNaWMc=;
 b=mELWasxhQA+LljeglzKHO5USZMdp1cqr6tzLEOK6tgUwTUqg+KQoJqS3QVlS6lgLYF
 vMqbJ+/OKx2D4ycLIPyNwB7g+wy41omL3kiQzeSRkxL0Hf9tfAdlM4iruKpt0ofusZQ5
 5q29a+Aq8V0dD7IBIf92VggDGF+cyIeVzJuSYjeFYvuxjUmbt30O3MVwlhqreUB3+TTq
 ouUgE8UGhk/MfgI1OrzSI/6tGodQNpU9070kUMfdcIf9jyHS/ELdjJj9LHxUvXB990Ok
 iYZVZgSuMBdb44XbSzRhZ/bVMJ0A6b6/cjamU/2inf5qGXA0ZDYWT+oY0FfiOqk8rWHs
 Dn7A==
X-Gm-Message-State: APjAAAXijXPGXlyFsrUvy2cWTkaUaRL5KFcv/6DbWe1YS02mwfRLpqeT
 CDbcN/kHyBXIerGT7KC51hVmxNXDqy4=
X-Google-Smtp-Source: APXvYqxZI85uD2GdvaU3cmn0bFXHmYYOfFV7BJ7eG6YxMTU8Do/1HOLml+Z27bIuOXPOuQu/8HZpFg==
X-Received: by 2002:a63:1215:: with SMTP id h21mr33096297pgl.221.1563278255748; 
 Tue, 16 Jul 2019 04:57:35 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id e10sm21197516pfi.173.2019.07.16.04.57.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 04:57:34 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 16 Jul 2019 19:57:20 +0800
Message-Id: <20190716115725.66558-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 tzungbi@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [PATCH v4 0/5] Add HDMI jack support on RK3288
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

Changes from v3 to v4:
- hdmi-codec.h: Modify the hook_plugged_cb ops to take an additional argument,
  that is, the pointer to struct device for codec device.
- dw-hdmi-i2s-audio.c: Simplify the registration of callback so it uses
  dw_hdmi_set_plugged_cb exported by dw-hdmi.c.
- dw-hdmi.c: Simplify the flow to invoke callback since now dw_hdmi has a
  pointer to codec device as callback argument. There is no need to rely
  on driver data of other driver.
- dw-hdmi.c: Minor change for readability.
- synopsys/Kconfig: Fix the dependency of hdmi-codec in Kconfig.
- Fixed the incorrect FROMLIST title of patch 5/5.

Cheng-Yi Chiang (5):
  ASoC: hdmi-codec: Add an op to set callback function for plug event
  drm: bridge: dw-hdmi: Report connector status using callback
  drm: dw-hdmi-i2s: Use fixed id for codec device
  ASoC: rockchip_max98090: Add dai_link for HDMI
  ASoC: rockchip_max98090: Add HDMI jack support

 drivers/gpu/drm/bridge/synopsys/Kconfig       |   2 +-
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |  13 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  41 ++++++-
 include/drm/bridge/dw_hdmi.h                  |   4 +
 include/sound/hdmi-codec.h                    |  17 +++
 sound/soc/codecs/hdmi-codec.c                 |  46 +++++++
 sound/soc/rockchip/Kconfig                    |   3 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c       |   3 +-
 sound/soc/rockchip/rockchip_max98090.c        | 116 ++++++++++++++----
 9 files changed, 217 insertions(+), 28 deletions(-)

-- 
2.22.0.510.g264f2c817a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
