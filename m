Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 017E966AAB
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 12:06:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 880AC1663;
	Fri, 12 Jul 2019 12:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 880AC1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562926007;
	bh=/Eq9D8MJHpey76jM1jjEH5uQ0d4N8aOzDDD077tXWOw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sIt51qM0mHbTMSdBXI+fHwXxUayyAzZiGNPPpx7lh/X12hPdy2gVfvlI/XALGdWzA
	 qyOmYxdZBDSr2g3PW4RF/HzGOHGpTH+lgamP9InT+bxLqnuQXEsrNCvviAesZFbi6r
	 FfWU+DmfgC/BHx2W8+6ESV3ahDHz0uCDxDklfN44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13DB0F80291;
	Fri, 12 Jul 2019 12:05:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 127B2F802A0; Fri, 12 Jul 2019 12:05:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42BC6F800D2
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 12:04:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42BC6F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="h5gkWOal"
Received: by mail-pf1-x441.google.com with SMTP id y15so4103375pfn.5
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+TShMWhLwN8SmBiAr6bXkiOWeqpu2JFdqFTK8VDDlU=;
 b=h5gkWOale1JKC7q3JJ5JGsYnwMF4rXg9ycUc8TyqSYhtPfDqhRXMww1hVtAmCVuclM
 LrU9dKHZvAhoV+SbdlPevRw4Qlz2t+djP0eaF314TPHOrJvU4wceLVI+L6oX3xV1R5CI
 ZLa7NiOko2q8t5XjCYGa2NgeIkOrLKeiErpTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+TShMWhLwN8SmBiAr6bXkiOWeqpu2JFdqFTK8VDDlU=;
 b=l80OytWsJVm59l20eK127QWtk0IZJbvatbzcNLoYT8USLf7UZFna6HByT58OwGO4vH
 41i+Ge4rLtUlxK/QLWypUDb+k//ZB6MtykJ7SNtvPMPG60ltRfOcuA2ex13K1U68s/zR
 ddR3XZq0cVFa7Nj7p7kJ3Qt+Yl+hDBT/MJXr8nBPal1dyUvbc025dmUxh0F4CKuoMFOj
 KzOz4IEWsFnLLQ6bphY8yubv9xlsexjTG3Y0LTi+752I09Wun8X9JN4G33KwcisQproH
 Ufe9rJxYTzORH2WEkymj0c97ZHLwFaEtpsz6um2eQSFDHS7irrItl0pgn9VGxAKMQYMu
 c8gg==
X-Gm-Message-State: APjAAAXOy6YbmzHRR06izEGy6HndgPq0SnD2exdn6CskFFrtZFDg1LKC
 4Tr/azoduMC5mreVLtjd8WNJnw==
X-Google-Smtp-Source: APXvYqwATmqfXzDCdurIM9yTmyaXPTBgWhe7CgwnZbiAoCvMtazQjnDbkVjRZW0J7jvst+vKxiVZOQ==
X-Received: by 2002:a63:e807:: with SMTP id s7mr9495461pgh.194.1562925895786; 
 Fri, 12 Jul 2019 03:04:55 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id v3sm7501412pfm.188.2019.07.12.03.04.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 03:04:54 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 12 Jul 2019 18:04:38 +0800
Message-Id: <20190712100443.221322-1-cychiang@chromium.org>
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
Subject: [alsa-devel] [PATCH v3 0/5] Add HDMI jack support on RK3288
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

Changes from v2 to v3:
- dw-hdmi-i2s-audio.c: Use fixed ID instead of auto ID.
- rk3288_hdmi_analog.c: Use the fixed name hdmi-audio-codec for codec device.
- rockchip_max98090: Use the fixed name hdmi-audio-codec for codec device.
- rockchip_max98090: Fix the dependency of hdmi-codec in Kconfig.

Cheng-Yi Chiang (5):
  ASoC: hdmi-codec: Add an op to set callback function for plug event
  drm: bridge: dw-hdmi: Report connector status using callback
  drm: dw-hdmi-i2s: Use fixed id for codec device
  ASoC: rockchip_max98090: Add dai_link for HDMI
  FROMLIST: ASoC: rockchip_max98090: Add HDMI jack support

 .../gpu/drm/bridge/synopsys/dw-hdmi-audio.h   |   3 +
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |  12 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  55 ++++++++-
 include/sound/hdmi-codec.h                    |  16 +++
 sound/soc/codecs/hdmi-codec.c                 |  45 +++++++
 sound/soc/rockchip/Kconfig                    |   3 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c       |   3 +-
 sound/soc/rockchip/rockchip_max98090.c        | 116 ++++++++++++++----
 8 files changed, 226 insertions(+), 27 deletions(-)

-- 
2.22.0.510.g264f2c817a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
