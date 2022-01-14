Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7329148F0DC
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 21:19:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 220371FF4;
	Fri, 14 Jan 2022 21:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 220371FF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642191570;
	bh=ReFge8k4EKpPsdeCypEoB090HyNuIsuwi59kH36Kr58=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NTB2UE96JdnjV+8K9Dv4r52IxpJF+5JXYNWwZzsiSt8e1f3ZXE5AIGYarrrl3odPy
	 gghopYXsnqaTKR+bAFdps584EQBnqnsx8y6Mp/dDvU8JChvkGEnV4KMk4vFjyS7tNa
	 EaGCFhw+iSzt5gMI64WxPcyQTIF9wBol1mbn8gSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1249BF8032B;
	Fri, 14 Jan 2022 21:17:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 138BDF80519; Fri, 14 Jan 2022 21:17:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1458DF8032B
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 21:17:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1458DF8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="CrBAAcV6"
Received: by mail-pg1-x52a.google.com with SMTP id t32so3621465pgm.7
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 12:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WzNR7uSNnSdg4hsXrt3ZJe57Rjz9RsU1uoLFUYgup5s=;
 b=CrBAAcV6rcqYR96Cru/pA8UOx2tnvMIIOfcqFcAownzSFPyuPgvkhzfxi/+POTmI6F
 s3dystHa98fH+SbgMv8XKpF0nN2hyQmJRb/usWgQVAeEMKkFbOl1RLbU6G0QKyJYa1cp
 atbPBFu4vpIdYe+oAsO4YZx7Pu3BhgN/ev32M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WzNR7uSNnSdg4hsXrt3ZJe57Rjz9RsU1uoLFUYgup5s=;
 b=EMkguZntChdL/u3fw4LyY/bUf+GmQ2stdcJEw7rZq862fpW/MH0kZkPOICwXT3wuRG
 V7V4ILhn4mK65etl28nuavjhxs9miRN/uV9us/+dt7OKk0el4ginctnXoqB6OrkCofKA
 5dsyapz7drqz4j84semY6VHTkWTcP89LR93ck4AR39Gk2pGvF00ndWcXpoaIx8U9qEKX
 Jh9taZPJuDfdhUtyIDbqaAUclJ7xtpk3EINfYZ/gbl/mEDsXyV1WGAxa1vHjNpt1Skat
 6t3nIjd0dyhFQ1AoFY6Uo7rqs2ipcQyQFKrszRk6Ehjm6EeHwumeQwUHMdqdOVHI6VoE
 8naQ==
X-Gm-Message-State: AOAM531vYR8ecCim9fidG0KEwsaQTOxqhUoumimr5y58IpcJt8Bp0o6S
 OslI+xqkDfVhzwRKzu1CTGxkzA==
X-Google-Smtp-Source: ABdhPJyHj22cXTGtfbh2J7pBTC9HY1zTyXX803MbP2uAPR8gM88DcF40tdq9nbUgQqifT6xthI1Ncw==
X-Received: by 2002:a63:4620:: with SMTP id t32mr3538422pga.531.1642191435052; 
 Fri, 14 Jan 2022 12:17:15 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id p50sm5982690pfw.51.2022.01.14.12.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 12:17:14 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/3] drm/rockchip: cdn-dp: Support HDMI codec plug-change
 callback
Date: Fri, 14 Jan 2022 12:16:51 -0800
Message-Id: <20220114121515.2.I20d754a1228aa5c51a18c8eb15a2c60dec25b639@changeid>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114201652.3875838-1-briannorris@chromium.org>
References: <20220114201652.3875838-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, Brian Norris <briannorris@chromium.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some audio servers like to monitor a jack device (perhaps combined with
EDID, for audio-presence info) to determine DP/HDMI audio presence.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/rockchip/cdn-dp-core.c | 28 ++++++++++++++++++++++++++
 drivers/gpu/drm/rockchip/cdn-dp-core.h |  4 ++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 16497c31d9f9..edd6a1fc46cd 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -586,6 +586,13 @@ static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
 	return drm_dp_channel_eq_ok(link_status, min(port->lanes, sink_lanes));
 }
 
+static void cdn_dp_audio_handle_plugged_change(struct cdn_dp_device *dp,
+					       bool plugged)
+{
+	if (dp->codec_dev)
+		dp->plugged_cb(dp->codec_dev, plugged);
+}
+
 static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
 {
 	struct cdn_dp_device *dp = encoder_to_dp(encoder);
@@ -641,6 +648,9 @@ static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
 		DRM_DEV_ERROR(dp->dev, "Failed to valid video %d\n", ret);
 		goto out;
 	}
+
+	cdn_dp_audio_handle_plugged_change(dp, true);
+
 out:
 	mutex_unlock(&dp->lock);
 }
@@ -651,6 +661,8 @@ static void cdn_dp_encoder_disable(struct drm_encoder *encoder)
 	int ret;
 
 	mutex_lock(&dp->lock);
+	cdn_dp_audio_handle_plugged_change(dp, false);
+
 	if (dp->active) {
 		ret = cdn_dp_disable(dp);
 		if (ret) {
@@ -846,11 +858,27 @@ static int cdn_dp_audio_get_eld(struct device *dev, void *data,
 	return 0;
 }
 
+static int cdn_dp_audio_hook_plugged_cb(struct device *dev, void *data,
+					hdmi_codec_plugged_cb fn,
+					struct device *codec_dev)
+{
+	struct cdn_dp_device *dp = dev_get_drvdata(dev);
+
+	mutex_lock(&dp->lock);
+	dp->plugged_cb = fn;
+	dp->codec_dev = codec_dev;
+	cdn_dp_audio_handle_plugged_change(dp, dp->connected);
+	mutex_unlock(&dp->lock);
+
+	return 0;
+}
+
 static const struct hdmi_codec_ops audio_codec_ops = {
 	.hw_params = cdn_dp_audio_hw_params,
 	.audio_shutdown = cdn_dp_audio_shutdown,
 	.mute_stream = cdn_dp_audio_mute_stream,
 	.get_eld = cdn_dp_audio_get_eld,
+	.hook_plugged_cb = cdn_dp_audio_hook_plugged_cb,
 	.no_capture_mute = 1,
 };
 
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
index 81ac9b658a70..d808a9de45ed 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
@@ -10,6 +10,7 @@
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
+#include <sound/hdmi-codec.h>
 
 #include "rockchip_drm_drv.h"
 
@@ -101,5 +102,8 @@ struct cdn_dp_device {
 
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	bool sink_has_audio;
+
+	hdmi_codec_plugged_cb plugged_cb;
+	struct device *codec_dev;
 };
 #endif  /* _CDN_DP_CORE_H */
-- 
2.34.1.703.g22d0c6ccf7-goog

