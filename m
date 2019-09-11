Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F23FAF7EB
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 10:28:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD33316FE;
	Wed, 11 Sep 2019 10:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD33316FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568190529;
	bh=i2a87/ZdeV3dgNaBc3/tv5LCfzY7JL0rcTiTG9utDvc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QKouXh1iR8cfkWwNygFDa1Zkkr9r3qFygN62c6BbZOQIAk7uywDCuJ+z4ewGbbNVl
	 AA8UzjQRdJrv5VzwkaPds/5882RgA7CVb1PhJTbktB9SRmDgjxcULlFnw7JXu/AmIJ
	 oWUI2VeXTLaI9kfg+YdJtZ8AIbaeujUt0EDxxUXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B147F80323;
	Wed, 11 Sep 2019 10:27:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAA4BF80323; Wed, 11 Sep 2019 10:27:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5EE1F802DF
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 10:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5EE1F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="SkDdQyZv"
Received: by mail-pf1-x441.google.com with SMTP id 205so13210676pfw.2
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4r0nmZkQSsR2gJHf1JrXB09YJMiVgOB3zCW5D3saotk=;
 b=SkDdQyZvW4zi69+lyo92l0Kk3Thw/bwocTopP9fFph6zyBMtEB/3j1KLDMRUxqxdz8
 +GfX2YdSkpKSLb2PvhEGCOF4NwPA/U6Y1kiPxadIOSTS6TyJZFma9bzPGLj2n8QbL23D
 Hr+J8YoPtLhznecB9zPycHkXrnWu5k+PMPJ+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4r0nmZkQSsR2gJHf1JrXB09YJMiVgOB3zCW5D3saotk=;
 b=unMmBr8DYGq+9Vg3xHXsx8A/WC6QEKsPQzFGwjQn6hyO/lrnlbS+M86cn2j7quOd3F
 K6bb5eD89pOxNYgRGNIZlBQQR0V18KGC2l76qfX3cpXExICEXaMjg7NfMJyAhA2inWsi
 5iMUBjj4Vf/+OGm6WYN6cJipRt2AM3Si6i63YsdiuSIbrtwYxcEyP9cNnAC5nv3vU6MX
 mPeGegLiI9fT5bN8HRQA9uuf6Wru22RWBKQVh9u/H+qdvRzX7YTpjsfPp9ZA5088CN7E
 G2491OQpyHSbjIqoDz5fBdDoa6F9z/YwfUSJa8aDd/TF45y9/NZqzdMgPpPIULrgOerX
 +u/g==
X-Gm-Message-State: APjAAAXLTNFYZhBZbldNPPfY8AzpQL+ypE4nq/ZYhGPFDdhAaGJyncWB
 3KixyP8VZdAYi8PKou4M7meTnA==
X-Google-Smtp-Source: APXvYqyu86LR1qJn3qdq+8oCOL+6X9M/yekQdNO+TlGPFuebwd792sRf58JYMVY/Ym+ipZH+zK0xSA==
X-Received: by 2002:a63:487:: with SMTP id 129mr4981704pge.14.1568190416941;
 Wed, 11 Sep 2019 01:26:56 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id t12sm22798655pfe.58.2019.09.11.01.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2019 01:26:55 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 11 Sep 2019 16:26:46 +0800
Message-Id: <20190911082646.134347-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 Neil Armstrong <narmstrong@baylibre.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, cain.cai@rock-chips.com, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, Yakir Yang <ykk@rock-chips.com>,
 sam@ravnborg.org, Jerome Brunet <jbrunet@baylibre.com>,
 zhengxing@rock-chips.com, linux-rockchip@lists.infradead.org,
 dgreid@chromium.org, cychiang@chromium.org, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, jeffy.chen@rock-chips.com,
 eddie.cai@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, dianders@chromium.org,
 daniel@ffwll.ch, enric.balletbo@collabora.com, kuankuan.y@gmail.com
Subject: [alsa-devel] [PATCH v3] drm: bridge/dw_hdmi: add audio sample
	channel status setting
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

From: Yakir Yang <ykk@rock-chips.com>

When transmitting IEC60985 linear PCM audio, we configure the
Aduio Sample Channel Status information in the IEC60958 frame.
The status bit is already available in iec.status of hdmi_codec_params.

This fix the issue that audio does not come out on some monitors
(e.g. LG 22CV241)

Note that these registers are only for interfaces:
I2S audio interface, General Purpose Audio (GPA), or AHB audio DMA
(AHBAUDDMA).
For S/PDIF interface this information comes from the stream.

Currently this function dw_hdmi_set_channel_status is only called
from dw-hdmi-i2s-audio in I2S setup.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---

Change from v2 to v3:
1. Reuse what is already set in iec.status in hw_param.
2. Remove all useless definition of registers and values.
3. Note that the original sampling frequency is not written to
   the channel status as we reuse create_iec958_consumer in pcm_iec958.c.
   Without that it can still play audio fine.

 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |  1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 20 +++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     |  2 ++
 include/drm/bridge/dw_hdmi.h                  |  1 +
 4 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 34d8e837555f..20f4f92dd866 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -102,6 +102,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	}
 
 	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
+	dw_hdmi_set_channel_status(hdmi, hparms->iec.status);
 	dw_hdmi_set_channel_count(hdmi, hparms->channels);
 	dw_hdmi_set_channel_allocation(hdmi, hparms->cea.channel_allocation);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index bd65d0479683..aa7efd4da1c8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -582,6 +582,26 @@ static unsigned int hdmi_compute_n(unsigned int freq, unsigned long pixel_clk)
 	return n;
 }
 
+/*
+ * When transmitting IEC60958 linear PCM audio, these registers allow to
+ * configure the channel status information of all the channel status
+ * bits in the IEC60958 frame. For the moment this configuration is only
+ * used when the I2S audio interface, General Purpose Audio (GPA),
+ * or AHB audio DMA (AHBAUDDMA) interface is active
+ * (for S/PDIF interface this information comes from the stream).
+ */
+void dw_hdmi_set_channel_status(struct dw_hdmi *hdmi,
+				u8 *channel_status)
+{
+	/*
+	 * Set channel status register for frequency and word length.
+	 * Use default values for other registers.
+	 */
+	hdmi_writeb(hdmi, channel_status[3], HDMI_FC_AUDSCHNLS7);
+	hdmi_writeb(hdmi, channel_status[4], HDMI_FC_AUDSCHNLS8);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_set_channel_status);
+
 static void hdmi_set_clk_regenerator(struct dw_hdmi *hdmi,
 	unsigned long pixel_clk, unsigned int sample_rate)
 {
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index 6988f12d89d9..fcff5059db24 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -158,6 +158,8 @@
 #define HDMI_FC_SPDDEVICEINF                    0x1062
 #define HDMI_FC_AUDSCONF                        0x1063
 #define HDMI_FC_AUDSSTAT                        0x1064
+#define HDMI_FC_AUDSCHNLS7                      0x106e
+#define HDMI_FC_AUDSCHNLS8                      0x106f
 #define HDMI_FC_DATACH0FILL                     0x1070
 #define HDMI_FC_DATACH1FILL                     0x1071
 #define HDMI_FC_DATACH2FILL                     0x1072
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index cf528c289857..4b3e863c4f8a 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -156,6 +156,7 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense);
 
 void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate);
 void dw_hdmi_set_channel_count(struct dw_hdmi *hdmi, unsigned int cnt);
+void dw_hdmi_set_channel_status(struct dw_hdmi *hdmi, u8 *channel_status);
 void dw_hdmi_set_channel_allocation(struct dw_hdmi *hdmi, unsigned int ca);
 void dw_hdmi_audio_enable(struct dw_hdmi *hdmi);
 void dw_hdmi_audio_disable(struct dw_hdmi *hdmi);
-- 
2.23.0.162.g0b9fbb3734-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
