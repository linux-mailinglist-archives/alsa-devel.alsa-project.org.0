Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F010A6B84F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 10:35:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E9E21689;
	Wed, 17 Jul 2019 10:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E9E21689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563352527;
	bh=aKIFMyPs9IMQx6Ak+3UUIKEiE6HsspoGpAHhGNd7ShU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q3dH9vH/LVD5l98GdHWecA0Zixa4jVFjl9+AjUbYpjKaAfVl/LiyLNJu27xnWUvm5
	 FEy15wtxjyoAkx86/YHy1a3ESSMNYwNnW3be6Wl2+KCkfXU3hOWf8v39BOdlwL3Z+e
	 XpF9UNqHDIZfTXXpsG4KR+MiXx0hha+Zy+JGdjSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF6FCF80363;
	Wed, 17 Jul 2019 10:33:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A91EF80363; Wed, 17 Jul 2019 10:33:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35DBFF800C4
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 10:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35DBFF800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="RD8M6nun"
Received: by mail-pg1-x544.google.com with SMTP id s1so4500637pgr.2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 01:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xi/I3CroR7sIGb/RSMeX63hsRQQZqTXzOZE3S6HZ8ZY=;
 b=RD8M6nunAIi1kjnoYpVPNjZL741NzPqIoh1uWt5E5r6urvKBD5w/QXtHFHOWkKP7rU
 eDsE9C26mS+c6F9BsjN7Sldy2EKwIdp+wSVCSX2fTTKK8nRLbbtA6GlxK16zRW/fm06H
 NZfy1y4+ZGSX3EopmPRAj88diV1ho2PkxjqX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xi/I3CroR7sIGb/RSMeX63hsRQQZqTXzOZE3S6HZ8ZY=;
 b=W9C692f1BRj61EBPytmBkfwNR1gdIdnYm99RiiwtzAZK4vON/Wt6DLr3VtqcT/PZOS
 ZYBGyEXWldFHXIKYI7jCesBi9upXe2I8dzCr/+4nWyVfpg987cqP60opmVTMMKJPe2bW
 +7ij6xUe7L713hnCfgknQDq0bX9+SbsOUs+UuILj7u9n4gGHgOagQWm3a/c2ukrlUEw/
 YhTgNZS7QYUU8qgaO0VaDFq3QFzhkd7MJdhFX9IJOQf0B/8u4gPrlToirWUbw8KpSFY4
 Kj3T8cZVBA21b6ArZ4Z6nE98hvU+6Em97Cf4hDFKNSDSwDMrtAaktwnfXg0SAFJcQDtp
 +TSQ==
X-Gm-Message-State: APjAAAWD4Tx4efNYdDp6wbynOOYdLgIeq8L/kFxD5f+fwPywI5RvcZIV
 CTrloqAybcfqnKtsgJWGZCJjoQ==
X-Google-Smtp-Source: APXvYqzYyxaOAPwCDczy1nF4W7TyzTBcE11lWgiyzwF6LECNndF7weCTc6ymyZwVNBlIDSpFxsBrbA==
X-Received: by 2002:a63:506:: with SMTP id 6mr39061533pgf.434.1563352414509;
 Wed, 17 Jul 2019 01:33:34 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id r2sm33193385pfl.67.2019.07.17.01.33.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 01:33:33 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 17 Jul 2019 16:33:22 +0800
Message-Id: <20190717083327.47646-1-cychiang@chromium.org>
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
Subject: [alsa-devel] [PATCH v5 0/5] Add HDMI jack support on RK3288
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

Changes from v4 to v5:
- synopsys/Kconfig: Remove the incorrect dependency change in v4.
- rockchip/Kconfig: Add dependency of hdmi-codec when it is really need
  for jack support.

Cheng-Yi Chiang (5):
  ASoC: hdmi-codec: Add an op to set callback function for plug event
  drm: bridge: dw-hdmi: Report connector status using callback
  drm: dw-hdmi-i2s: Use fixed id for codec device
  ASoC: rockchip_max98090: Add dai_link for HDMI
  ASoC: rockchip_max98090: Add HDMI jack support

 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |  13 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  41 ++++++-
 include/drm/bridge/dw_hdmi.h                  |   4 +
 include/sound/hdmi-codec.h                    |  17 +++
 sound/soc/codecs/hdmi-codec.c                 |  46 +++++++
 sound/soc/rockchip/Kconfig                    |   3 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c       |   3 +-
 sound/soc/rockchip/rockchip_max98090.c        | 116 ++++++++++++++----
 8 files changed, 216 insertions(+), 27 deletions(-)

-- 
2.22.0.510.g264f2c817a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
