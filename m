Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 247426002E
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 06:29:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEF8F16A2;
	Fri,  5 Jul 2019 06:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEF8F16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562300998;
	bh=fFJFl4ZQh8328Rj3ocpFy5Wgw5rDcOoO8n9fwHG0hRU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OYt9PRlEICddRPiM1IQOSNqEcw8bOsBBQYQLLP8nqD7Ij0PGfKLcOpg9rIBDjM5dL
	 Bm/DjWSH1UiwlgJehmy/azWI3OfihcifiGYSqaGsUrNeAjk3/g8+jZ32pfZ7tBZwNY
	 ocA2oKAq9jVBXMXFeCd+TfV4NF60viXXDQElcGYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F03FF80144;
	Fri,  5 Jul 2019 06:26:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70A2AF80141; Fri,  5 Jul 2019 06:26:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_PDS_NO_HELO_DNS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69871F800E7
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 06:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69871F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="NQaaID67"
Received: by mail-pg1-x542.google.com with SMTP id t132so3685512pgb.9
 for <alsa-devel@alsa-project.org>; Thu, 04 Jul 2019 21:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FfAso7efMu/aA+eHOC+kWuha2DdRu+sIyUVZpYri0wk=;
 b=NQaaID67Y+LZwPST2LvJBza5Z0GadFPix/sAuAKZfbGHz2qYjWAokPh73WmpEZVBX+
 ovAj5OC9r9vmp+giPJWm6aGtvcx9wCAxNasdbMQrs46bEhkDxQItAQ/gc7xQSOMGIiwi
 y1c+dcnmFLnIFj+8Cj21PpTCMX3HNEnakazQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FfAso7efMu/aA+eHOC+kWuha2DdRu+sIyUVZpYri0wk=;
 b=TdIrBdb1MF6cpkxpmIwVzsOjY3ugjw1ZjU6NrnctipNTjpcMSotHwLOah+vxIdMQGY
 TxX65oW8nf685jvGpamGdE6lOmTGMVwCubGCL92KA9JKxHmokON5mGCDvazDx1SP4ql8
 q3jykKj4JPM7yzmQJFb2/mKumuDzuSqbCd0ykCbmaZjU4KccFa93zBUFvRD3IlqEPo8y
 ioaGvYr9SNElUYDz1lbn2AXtoj8CCayFrjr3DcxnA6sZhSfztW+6NJ1yr8z1JkrtAPpx
 G4wgh/6KVJvgXROuDGpifg/jp7UD8YEa//G0QLGA1DxIsq31fv82uV3AN6dKl89aE2ga
 c9HA==
X-Gm-Message-State: APjAAAVcsboJD1i26+shiF37VNq1MMDxD1wSNu+ZYWi0UG9i9sf/f3aK
 tvs02EpJDRa/RjvKOkB66Ubb7g==
X-Google-Smtp-Source: APXvYqwZbL+s761iX960bRQQcsfHBESYYHX6caI+DhUbiPV9OOsTfm5vhRVAxh6UChQM0IMk+bwDTw==
X-Received: by 2002:a63:24c1:: with SMTP id k184mr2425512pgk.120.1562300810605; 
 Thu, 04 Jul 2019 21:26:50 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id h2sm6126547pgs.17.2019.07.04.21.26.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 21:26:50 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  5 Jul 2019 12:26:21 +0800
Message-Id: <20190705042623.129541-3-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190705042623.129541-1-cychiang@chromium.org>
References: <20190705042623.129541-1-cychiang@chromium.org>
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
Subject: [alsa-devel] [PATCH 2/4] drm: bridge: dw-hdmi: Report connector
	status using callback
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

Allow codec driver register callback function for plug event.

The callback registration flow:
dw-hdmi <--- hw-hdmi-i2s-audio <--- hdmi-codec

dw-hdmi-i2s-audio implements hook_plugged_cb op
so codec driver can register the callback.

dw-hdmi implements set_plugged_cb op so platform device can register the
callback.

When connector plug/unplug event happens, report this event using the
callback.

Make sure that audio and drm are using the single source of truth for
connector status.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 .../gpu/drm/bridge/synopsys/dw-hdmi-audio.h   |  3 ++
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   | 10 ++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 34 ++++++++++++++++++-
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
index 63b5756f463b..f523c590984e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
@@ -2,6 +2,8 @@
 #ifndef DW_HDMI_AUDIO_H
 #define DW_HDMI_AUDIO_H
 
+#include <sound/hdmi-codec.h>
+
 struct dw_hdmi;
 
 struct dw_hdmi_audio_data {
@@ -17,6 +19,7 @@ struct dw_hdmi_i2s_audio_data {
 
 	void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
 	u8 (*read)(struct dw_hdmi *hdmi, int offset);
+	int (*set_plugged_cb)(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn);
 };
 
 #endif
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 5cbb71a866d5..7b93cf05c985 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -104,10 +104,20 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
 	return -EINVAL;
 }
 
+static int dw_hdmi_i2s_hook_plugged_cb(struct device *dev, void *data,
+				       hdmi_codec_plugged_cb fn)
+{
+	struct dw_hdmi_i2s_audio_data *audio = data;
+	struct dw_hdmi *hdmi = audio->hdmi;
+
+	return audio->set_plugged_cb(hdmi, fn);
+}
+
 static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
 	.hw_params	= dw_hdmi_i2s_hw_params,
 	.audio_shutdown	= dw_hdmi_i2s_audio_shutdown,
 	.get_dai_id	= dw_hdmi_i2s_get_dai_id,
+	.hook_plugged_cb = dw_hdmi_i2s_hook_plugged_cb,
 };
 
 static int snd_dw_hdmi_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 045b1b13fd0e..c69a399fc7ca 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -26,6 +26,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/bridge/dw_hdmi.h>
 
+#include <sound/hdmi-codec.h>
+
 #include <uapi/linux/media-bus-format.h>
 #include <uapi/linux/videodev2.h>
 
@@ -185,6 +187,9 @@ struct dw_hdmi {
 	void (*disable_audio)(struct dw_hdmi *hdmi);
 
 	struct cec_notifier *cec_notifier;
+
+	hdmi_codec_plugged_cb plugged_cb;
+	enum drm_connector_status last_connector_result;
 };
 
 #define HDMI_IH_PHY_STAT0_RX_SENSE \
@@ -209,6 +214,17 @@ static inline u8 hdmi_readb(struct dw_hdmi *hdmi, int offset)
 	return val;
 }
 
+static int hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn)
+{
+	mutex_lock(&hdmi->mutex);
+	hdmi->plugged_cb = fn;
+	if (hdmi->audio && !IS_ERR(hdmi->audio))
+		fn(hdmi->audio,
+		   hdmi->last_connector_result == connector_status_connected);
+	mutex_unlock(&hdmi->mutex);
+	return 0;
+}
+
 static void hdmi_modb(struct dw_hdmi *hdmi, u8 data, u8 mask, unsigned reg)
 {
 	regmap_update_bits(hdmi->regm, reg << hdmi->reg_shift, mask, data);
@@ -2044,6 +2060,7 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
 					     connector);
+	enum drm_connector_status result;
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->force = DRM_FORCE_UNSPECIFIED;
@@ -2051,7 +2068,20 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	dw_hdmi_update_phy_mask(hdmi);
 	mutex_unlock(&hdmi->mutex);
 
-	return hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
+	result = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
+
+	mutex_lock(&hdmi->mutex);
+	if (result != hdmi->last_connector_result) {
+		dev_dbg(hdmi->dev, "read_hpd result: %d", result);
+		if (hdmi->plugged_cb && hdmi->audio && !IS_ERR(hdmi->audio)) {
+			hdmi->plugged_cb(hdmi->audio,
+					 result == connector_status_connected);
+			hdmi->last_connector_result = result;
+		}
+	}
+	mutex_unlock(&hdmi->mutex);
+
+	return result;
 }
 
 static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
@@ -2460,6 +2490,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	hdmi->rxsense = true;
 	hdmi->phy_mask = (u8)~(HDMI_PHY_HPD | HDMI_PHY_RX_SENSE);
 	hdmi->mc_clkdis = 0x7f;
+	hdmi->last_connector_result = connector_status_disconnected;
 
 	mutex_init(&hdmi->mutex);
 	mutex_init(&hdmi->audio_mutex);
@@ -2653,6 +2684,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
 		audio.hdmi	= hdmi;
 		audio.write	= hdmi_writeb;
 		audio.read	= hdmi_readb;
+		audio.set_plugged_cb = hdmi_set_plugged_cb;
 		hdmi->enable_audio = dw_hdmi_i2s_audio_enable;
 		hdmi->disable_audio = dw_hdmi_i2s_audio_disable;
 
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
