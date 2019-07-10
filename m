Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA69641B7
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 09:10:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 357FA15E5;
	Wed, 10 Jul 2019 09:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 357FA15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562742608;
	bh=k39Idrt+Rc95Ka8DCnG8Qyn9FCSLWrWLZOzX/PHC7eI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RFUIF4WgDqqanC1y9Nl0DQB1DrnmkPRJoX/xjeGWlDdBNzZkWDs+biXuYf9tp/nna
	 BImbjMxuRV60BWl3ODnhPFeoXQa9Dyzz52ALe2UnpODO6XxTnKFhZh1gWqB02mTSDr
	 ZVE0x0oIGGK7Puq2sA2vxQM0ZbU3/rhBa46ZIw7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6084EF802BC;
	Wed, 10 Jul 2019 09:08:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C679F802A1; Wed, 10 Jul 2019 09:08:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA085F800DE
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 09:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA085F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="QvHVOdXM"
Received: by mail-pg1-x543.google.com with SMTP id t132so756215pgb.9
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 00:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l6Pj1C/JhLO9pIuL0o6GitOicJcsYgk0aas0LOHb1To=;
 b=QvHVOdXMpWGBXu6BQw2jb5hQWR/4IGqs4UNl0MT4bqGhu5Iajbok3zWGlXLBLlAlA9
 262x1usDPZZzrmJK/3Rcc1CmfG+FofUbFhNMjNYCW/5S2inZrI0tZc+5f/Yr3ArqOg1U
 UezUTifar1c9zaRSMgeuuMvYvOFH23m9ls4vM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l6Pj1C/JhLO9pIuL0o6GitOicJcsYgk0aas0LOHb1To=;
 b=ASU8NNahVLsjg5zRJIn53rSkwoMfyzI30NHUX0oX5fM8ng5RcoFOOAVGZ0BekEWlto
 XP5rB5niA6CAHoT2Huf+1c0p/ElIXNwJUuEiJyVFJ7coNk/se8XkbbFDadLjYzexGuxN
 3wXC1ghAgeACT3dQVqr6GRb5mkMW9ZflV7OWOU5fmxd4sbZEqxx9tGD+G68G4a1W9MbB
 mYireFfnhe2g0u7TdN4W6+wiRh5m7oOTBS54f3kf9zefA4agEkxK5x3MsLifu+sG641F
 pWnSpbtZ2iNco8N8FJGA7jWK1M9jdb9e/IQujdMW/9ad/WBNvLLR9+xjxoHEIDtUKOq2
 2suQ==
X-Gm-Message-State: APjAAAWKDPuMPMq2rgDLbhtcf8Q8MayzcXTiadeyGCqUI1ud6lK7d+pD
 N5KhjOv/Ji7+9DaergPZQaXL/g==
X-Google-Smtp-Source: APXvYqyptBK3QFmyTbtCBUlG3BZ20BDJXUXcje4pWPJB6gSPNpTgfvwvrkqkt0izgOTaBRL2tpwJwQ==
X-Received: by 2002:a65:500d:: with SMTP id f13mr34874390pgo.151.1562742491443; 
 Wed, 10 Jul 2019 00:08:11 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id h9sm1150976pgk.10.2019.07.10.00.08.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 00:08:10 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 10 Jul 2019 15:07:47 +0800
Message-Id: <20190710070751.260061-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
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
Subject: [alsa-devel] [PATCH v2 0/4] Add HDMI jack support on RK3288
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

Changes from v1 to v2:
- hdmi-codec.c: cleanup the sequence of hdmi_codec_jack_report and
  hdmi_codec_set_jack_detect.
- dw-hdmi.c: change argument of hdmi_codec_plugged_cb so it takes a generic
  device which has hdmi_codec_priv in its drvdata.
- dw-hdmi.c: add a helper function handle_plugged_change to check audio
  platform device and codec platform device before calling callback.
- dw-hdmi-c: avoid setting callback function if audio platform device or
  codec platform device is missing.
- rockchip_max98090: fix the checking of return code when setting sysclk
  on cpu_dai and codec_dai. cpu_dai error should be reported. For HDMI
  codec_dai, there is no need to set sysclk.

Cheng-Yi Chiang (4):
  ASoC: hdmi-codec: Add an op to set callback function for plug event
  drm: bridge: dw-hdmi: Report connector status using callback
  ASoC: rockchip_max98090: Add dai_link for HDMI
  ASoC: rockchip_max98090: Add HDMI jack support

 .../gpu/drm/bridge/synopsys/dw-hdmi-audio.h   |   3 +
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |  10 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  55 ++++++++-
 include/sound/hdmi-codec.h                    |  16 +++
 sound/soc/codecs/hdmi-codec.c                 |  45 +++++++
 sound/soc/rockchip/rockchip_max98090.c        | 116 ++++++++++++++----
 6 files changed, 221 insertions(+), 24 deletions(-)

-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
