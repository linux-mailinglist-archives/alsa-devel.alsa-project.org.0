Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C7A9EB9
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 11:45:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E5B01678;
	Thu,  5 Sep 2019 11:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E5B01678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567676733;
	bh=MTJWA3UQPbSEc7ljPkRMgvhop51fLB3ZPvGevlMtfQQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LoFbLBKAcl4Sx40fN79/dNDwWsHBnTVb64IOXfO9BinzVqbn7NrmtPnlzcNiZoVjh
	 bg+H+DlIwSp8NDlN56E4a5O2qAUzaPbUeui0HNgiC0jUfaHM25grkVFaRNrCvkBd8O
	 S3qWQraJUNtoYY9glctOvJSm2Zno8ekivZxiCwGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EEF0F80448;
	Thu,  5 Sep 2019 11:43:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D58FF80448; Thu,  5 Sep 2019 11:43:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25516F80227
 for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2019 11:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25516F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="KwRfK/Cv"
Received: by mail-pf1-x443.google.com with SMTP id y72so1356026pfb.12
 for <alsa-devel@alsa-project.org>; Thu, 05 Sep 2019 02:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kgR/rau9PNQnc1XrO3uDHAlTFaU8EKj1qkkgQWKlXHw=;
 b=KwRfK/CvuP30TijZ9J7kOzqGl6l928El2JhHJT+38Q+/hp7rCU7bqZA0U7kMamuslW
 5XQj0uFAvI+sovFMq8NA1UuaSpcSDD4IdOarNrpqKb6afjxUK1hfijwXuxdavgyP19Br
 P9nfVrS72UN6quo3MOCgkFUq/TH3+HH5hyqJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kgR/rau9PNQnc1XrO3uDHAlTFaU8EKj1qkkgQWKlXHw=;
 b=GJXQpepU3+Ke6bh+QztPvIDXVXX83z6TaLHVnBz2TB/3YQlQnQ9r//xhI4Q3lrpzAl
 2jJoX3Zp/Bh7x2jeS/1NGj9iNEOZDIT0tJr6pFfgHHwlz6wCPmOwagfMXqAHDwtBoICB
 w0N7Rrx8yRqt7wr34CVGkrQUhYeB7qwJ7nVAua+msxLvoxj8Vzr7pnvKlvea7M9UFY1s
 uWiPOcr+Q7/wLmF2DeEafvpmbW4OufA5kzAXcjAHc2zbcEgL348/MH+vYctla56aZciK
 t0a84QiKuUXY3VsTrf82FG+P1Vurw5MbqEzgyk/HVIIM8sIM9nAX/Vq1onU/dwc19FMh
 P8ow==
X-Gm-Message-State: APjAAAVdL5e8bGN1I2ltCKCADPneqTrID7vwZjgveG/i7mxMO93dBPhV
 jT/r2RQhyJrMBc4J9yV1hRXgcA==
X-Google-Smtp-Source: APXvYqz5IR9c5mog/LVvbNwuhK3G189Z8ZJSF7jvcWe5pUpOsa/a8rFtsJumvVxpIkOAWikyOWiQZA==
X-Received: by 2002:a17:90a:f48f:: with SMTP id
 bx15mr2937994pjb.113.1567676618357; 
 Thu, 05 Sep 2019 02:43:38 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id c17sm311633pfo.57.2019.09.05.02.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2019 02:43:37 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Thu,  5 Sep 2019 17:43:25 +0800
Message-Id: <20190905094325.33156-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, cain.cai@rock-chips.com,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 Yakir Yang <ykk@rock-chips.com>, sam@ravnborg.org, cychiang@chromium.org,
 zhengxing@rock-chips.com, linux-rockchip@lists.infradead.org,
 dgreid@chromium.org, tzungbi@chromium.org, jonas@kwiboo.se,
 jeffy.chen@rock-chips.com, eddie.cai@rock-chips.com,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 dianders@chromium.org, daniel@ffwll.ch, enric.balletbo@collabora.com,
 kuankuan.y@gmail.com
Subject: [alsa-devel] [PATCH v2] drm: bridge/dw_hdmi: add audio sample
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
Aduio Sample Channel Status information of all the channel
status bits in the IEC60958 frame.
Refer to 60958-3 page 10 for frequency, original frequency, and
wordlength setting.

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
 Original patch by Yakir Yang is at

 https://lore.kernel.org/patchwork/patch/539653/

 Change from v1 to v2:
 1. Remove the version check because this will only be called by
    dw-hdmi-i2s-audio, and the registers are available in I2S setup.
 2. Set these registers in dw_hdmi_i2s_hw_params.
 3. Fix the sample width setting so it can use 16 or 24 bits.

 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |  1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 70 +++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     | 20 ++++++
 include/drm/bridge/dw_hdmi.h                  |  2 +
 4 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 34d8e837555f..b801a28b0f17 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -102,6 +102,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
 	}
 
 	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
+	dw_hdmi_set_channel_status(hdmi, hparms->sample_width);
 	dw_hdmi_set_channel_count(hdmi, hparms->channels);
 	dw_hdmi_set_channel_allocation(hdmi, hparms->cea.channel_allocation);
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index bd65d0479683..d1daa369c8ae 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -582,6 +582,76 @@ static unsigned int hdmi_compute_n(unsigned int freq, unsigned long pixel_clk)
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
+				unsigned int sample_width)
+{
+	u8 aud_schnl_samplerate;
+	u8 aud_schnl_8;
+	u8 word_length_bits;
+
+	switch (hdmi->sample_rate) {
+	case 32000:
+		aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_32K;
+		break;
+	case 44100:
+		aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_44K1;
+		break;
+	case 48000:
+		aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_48K;
+		break;
+	case 88200:
+		aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_88K2;
+		break;
+	case 96000:
+		aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_96K;
+		break;
+	case 176400:
+		aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_176K4;
+		break;
+	case 192000:
+		aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_192K;
+		break;
+	case 768000:
+		aud_schnl_samplerate = HDMI_FC_AUDSCHNLS7_SMPRATE_768K;
+		break;
+	default:
+		dev_warn(hdmi->dev, "Unsupported audio sample rate (%u)\n",
+			 hdmi->sample_rate);
+		return;
+	}
+
+	/* set channel status register */
+	hdmi_modb(hdmi, aud_schnl_samplerate, HDMI_FC_AUDSCHNLS7_SMPRATE_MASK,
+		  HDMI_FC_AUDSCHNLS7);
+
+	/*
+	 * Set original frequency to be the same as frequency.
+	 * Use one-complement value as stated in IEC60958-3 page 13.
+	 */
+	aud_schnl_8 = (~aud_schnl_samplerate) <<
+			HDMI_FC_AUDSCHNLS8_ORIGSAMPFREQ_OFFSET;
+
+	/*
+	 * Refer to IEC60958-3 page 12. We can accept 16 bits or 24 bits.
+	 * Otherwise, set the register to 0t o indicate using default value.
+	 */
+	word_length_bits = (sample_width == 16) ? 0x2 :
+			    ((sample_width == 24) ? 0xb : 0);
+
+	aud_schnl_8 |= word_length_bits << HDMI_FC_AUDSCHNLS8_WORDLEGNTH_OFFSET;
+
+	hdmi_writeb(hdmi, aud_schnl_8, HDMI_FC_AUDSCHNLS8);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_set_channel_status);
+
 static void hdmi_set_clk_regenerator(struct dw_hdmi *hdmi,
 	unsigned long pixel_clk, unsigned int sample_rate)
 {
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index 6988f12d89d9..619ebc1c8354 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -158,6 +158,17 @@
 #define HDMI_FC_SPDDEVICEINF                    0x1062
 #define HDMI_FC_AUDSCONF                        0x1063
 #define HDMI_FC_AUDSSTAT                        0x1064
+#define HDMI_FC_AUDSV                           0x1065
+#define HDMI_FC_AUDSU                           0x1066
+#define HDMI_FC_AUDSCHNLS0                      0x1067
+#define HDMI_FC_AUDSCHNLS1                      0x1068
+#define HDMI_FC_AUDSCHNLS2                      0x1069
+#define HDMI_FC_AUDSCHNLS3                      0x106a
+#define HDMI_FC_AUDSCHNLS4                      0x106b
+#define HDMI_FC_AUDSCHNLS5                      0x106c
+#define HDMI_FC_AUDSCHNLS6                      0x106d
+#define HDMI_FC_AUDSCHNLS7                      0x106e
+#define HDMI_FC_AUDSCHNLS8                      0x106f
 #define HDMI_FC_DATACH0FILL                     0x1070
 #define HDMI_FC_DATACH1FILL                     0x1071
 #define HDMI_FC_DATACH2FILL                     0x1072
@@ -706,6 +717,15 @@ enum {
 /* HDMI_FC_AUDSCHNLS7 field values */
 	HDMI_FC_AUDSCHNLS7_ACCURACY_OFFSET = 4,
 	HDMI_FC_AUDSCHNLS7_ACCURACY_MASK = 0x30,
+	HDMI_FC_AUDSCHNLS7_SMPRATE_MASK = 0x0f,
+	HDMI_FC_AUDSCHNLS7_SMPRATE_192K = 0xe,
+	HDMI_FC_AUDSCHNLS7_SMPRATE_176K4 = 0xc,
+	HDMI_FC_AUDSCHNLS7_SMPRATE_96K = 0xa,
+	HDMI_FC_AUDSCHNLS7_SMPRATE_768K = 0x9,
+	HDMI_FC_AUDSCHNLS7_SMPRATE_88K2 = 0x8,
+	HDMI_FC_AUDSCHNLS7_SMPRATE_32K = 0x3,
+	HDMI_FC_AUDSCHNLS7_SMPRATE_48K = 0x2,
+	HDMI_FC_AUDSCHNLS7_SMPRATE_44K1 = 0x0,
 
 /* HDMI_FC_AUDSCHNLS8 field values */
 	HDMI_FC_AUDSCHNLS8_ORIGSAMPFREQ_MASK = 0xf0,
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index cf528c289857..12144d2f80f4 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -156,6 +156,8 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense);
 
 void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate);
 void dw_hdmi_set_channel_count(struct dw_hdmi *hdmi, unsigned int cnt);
+void dw_hdmi_set_channel_status(struct dw_hdmi *hdmi,
+				unsigned int sample_width);
 void dw_hdmi_set_channel_allocation(struct dw_hdmi *hdmi, unsigned int ca);
 void dw_hdmi_audio_enable(struct dw_hdmi *hdmi);
 void dw_hdmi_audio_disable(struct dw_hdmi *hdmi);
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
