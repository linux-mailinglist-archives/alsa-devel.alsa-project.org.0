Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6248148F2C7
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jan 2022 00:04:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E94CD1FBA;
	Sat, 15 Jan 2022 00:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E94CD1FBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642201455;
	bh=B2HkSFilh9sKaZbabj/L0za+eRomK7Hb5pBKxxcUEYo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fy7fmDArQEa6ZB8CIfWd+vawo7H51Ld213fw51Lt6X4hCP9X215gealrclDUYTQhQ
	 w7N8YualpRx+5jw3egqiJBn+x0Q1U9b/wQzmYPLMBSS7sLAtgsh2NBCpk0LzSSlKVM
	 KsgaDwsItpnDSNiVoBgrmgqMjQxC3gVUASeC6O6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01D15F8050F;
	Sat, 15 Jan 2022 00:02:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11DFEF80424; Sat, 15 Jan 2022 00:02:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47F35F8032B
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 00:02:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47F35F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JVAC7svk"
Received: by mail-pg1-x531.google.com with SMTP id i30so3908095pgl.0
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 15:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X0lN8KgwngdIWQtX+1YBYkcWtXacsAROFK0Re0Isayk=;
 b=JVAC7svkA82CIskoX9XxpEfg+B8GFkTpb3ivSbFZgI/HPbD7sY7z1Mp2/N0DGlMyj1
 4kRKb6WX3EXTB1GWlBwz1HHIo/SBYne1AVVReufn7082hSWgZV8LusfLssbZ+nO+QZMF
 zfKkrjxjOuZUoKGjf2YwUeV1EFcNl2i1ZeX5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X0lN8KgwngdIWQtX+1YBYkcWtXacsAROFK0Re0Isayk=;
 b=GTNhjijuUg/2ZkmFTf8yqH70E6Zph0FEe59dOQYxBYoK66Koisd3UWqil2pv9aCwRy
 eZEYZDN2L2tjYY/ybo3zidGrO2VGD6/Hckkei4nkgyW8hi42kW3CX0iUWJEivB++GjCr
 bC/ZfWza5eyn44Qq6YcbH6tCdpF2THEWw2zakRQkFs1BAZ07dnIZjKz742YllVIImTl/
 NNH7FModcgOzmUqF8VPDAH67+PBGnGRLxvVRTD4T4kk64sqRZf+S+Lx/nnYMTkAzyGDi
 XgMxjjycv6wGaMHA5Ycz1cDDKm5/oK87sx5oLRPhKQvmRN+t2sHvtfhJnjCyX7rHNSLe
 7oMw==
X-Gm-Message-State: AOAM531vx2OA5X4A63yS4XJQUbxAeQAo+p+qV/98/Ipsnv3hIvw1SRGF
 3S8Y80mkZbZ1js5f+3C1pGnV/+rDlJO5vg==
X-Google-Smtp-Source: ABdhPJxEEE2CEn37OnjZYtyIw2or9NSfWoMKhSqZ32s/6jckTLsVQCguVm+8geqnseEdUH1GvQWwKw==
X-Received: by 2002:a62:1b49:0:b0:4be:f4a5:14a6 with SMTP id
 b70-20020a621b49000000b004bef4a514a6mr10888650pfb.31.1642201350433; 
 Fri, 14 Jan 2022 15:02:30 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id j14sm6719717pfu.15.2022.01.14.15.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 15:02:29 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/3] drm/rockchip: cdn-dp: Support HDMI codec plug-change
 callback
Date: Fri, 14 Jan 2022 15:02:08 -0800
Message-Id: <20220114150129.v2.2.I20d754a1228aa5c51a18c8eb15a2c60dec25b639@changeid>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114230209.4091727-1-briannorris@chromium.org>
References: <20220114230209.4091727-1-briannorris@chromium.org>
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

(no changes since v1)

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

