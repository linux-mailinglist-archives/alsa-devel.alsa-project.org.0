Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E78A60D7
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 07:53:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD7B7167C;
	Tue,  3 Sep 2019 07:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD7B7167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567489984;
	bh=3zPB9tVbQqRIAkATkxDdr1IzOJhiz7bb7JuH4pXRs7I=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PbTLofERIKaqCJK3ocX00sn1kuDeb60JMQ+dp+VeiC2VjTOA5adZoeB4VuyF6BNNC
	 nZZXnDH3IEqNolDvSrmBvVg+Sf8YOU3+ehbf0Tli9d956pHVdaQwpnnYZPPVMDegNo
	 vQdBTB0PNqeWsoJpemYq5oqHrICVwjtvMgi+gyNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E170F80228;
	Tue,  3 Sep 2019 07:51:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9FC9F803D7; Tue,  3 Sep 2019 07:51:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5C18F80228
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 07:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5C18F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="K51UO9D1"
Received: by mail-pg1-x543.google.com with SMTP id n190so8511091pgn.0
 for <alsa-devel@alsa-project.org>; Mon, 02 Sep 2019 22:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TkPI7O1fVqnq6R/nJ+Pnt20RhQ4GXULllM+CXg8v034=;
 b=K51UO9D1aK3b/3+8I8RJfUnmD0e4/8iXNOPu94gB7YnCEMvStQ4ALdBjUCj5CQCsNK
 A1DXvkowreIHI/5gRRYxx9ZT8oZJq7skjn5YAvwNNDBhdy2b+89gjVkJPFxELRiAGCpH
 Er4/qOP3ASoq2/XBObfI2FaPdQjTHx5bnKmU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TkPI7O1fVqnq6R/nJ+Pnt20RhQ4GXULllM+CXg8v034=;
 b=imX5fCOEd05trZ3rtbnmZa9iC0LeoUw9PFFeI8oCaX6IMjHOgHw1UN9d7YAoj8XYjL
 knwWOMDJJuhKrpgWxil3n8lrvfR/VnXhYu/+3kOB/kWx5j+klZXUpKvo8QnBq8a7VK6S
 7k2TdStHDy5M9baksUiSWFNX93K3iE+RpRQzQnU83cWJw4IHFTM5khcmMUqdC2nF/i5w
 dSi0cCD2+NHJ5Qy0FO7Rhx+0FjO4h/4sjkXJ4Hfw3LuCAuw5+7o3dnFOEfqAnN6loo+q
 NKN8w14vwXGYEmgdXDRqmC+jy6TJFKl9BZlmsiWPGMmoMtMz59WTWLB7vknePKimvY+C
 OYGA==
X-Gm-Message-State: APjAAAUCorJ0vla1CKIIvmJZnZHoklMsDJlbx81eQglWLjox010jkfaM
 0tYTj2YekuRH7DjceskP2nAamA==
X-Google-Smtp-Source: APXvYqy+o0Y8D6HEyRM06kw7O9+KYZ0JH6HO+T0Xt4tKvQ5MDBFAx9QHtwodeC4EErYbNCsjkWMd+g==
X-Received: by 2002:a63:2a08:: with SMTP id q8mr28160269pgq.415.1567489872170; 
 Mon, 02 Sep 2019 22:51:12 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id g24sm6508687pfo.178.2019.09.02.22.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2019 22:51:11 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2019 13:51:03 +0800
Message-Id: <20190903055103.134764-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org, zhengxing@rock-chips.com,
 kuninori.morimoto.gx@renesas.com, a.hajda@samsung.com, airlied@linux.ie,
 kuankuan.y@gmail.com, jeffy.chen@rock-chips.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, cain.cai@rock-chips.com,
 linux-rockchip@lists.infradead.org, eddie.cai@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
 Yakir Yang <ykk@rock-chips.com>, enric.balletbo@collabora.com,
 dgreid@chromium.org, sam@ravnborg.org, linux-arm-kernel@lists.infradead.org,
 cychiang@chromium.org
Subject: [alsa-devel] [PATCH] drm: bridge/dw_hdmi: add audio sample channel
	status setting
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
Audio Sample Channel Status information of all the channel
status bits in the IEC60958 frame.
Refer to 60958-3 page 10 for frequency, original frequency, and
wordlength setting.

This fix the issue that audio does not come out on some monitors
(e.g. LG 22CV241)

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 59 +++++++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h | 20 ++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index bd65d0479683..34d46e25d610 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -582,6 +582,63 @@ static unsigned int hdmi_compute_n(unsigned int freq, unsigned long pixel_clk)
 	return n;
 }
 
+static void hdmi_set_schnl(struct dw_hdmi *hdmi)
+{
+	u8 aud_schnl_samplerate;
+	u8 aud_schnl_8;
+
+	/* These registers are on RK3288 using version 2.0a. */
+	if (hdmi->version != 0x200a)
+		return;
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
+	/* This means word length is 16 bit. Refer to IEC60958-3 page 12. */
+	aud_schnl_8 |= 2 << HDMI_FC_AUDSCHNLS8_WORDLEGNTH_OFFSET;
+
+	hdmi_writeb(hdmi, aud_schnl_8, HDMI_FC_AUDSCHNLS8);
+}
+
 static void hdmi_set_clk_regenerator(struct dw_hdmi *hdmi,
 	unsigned long pixel_clk, unsigned int sample_rate)
 {
@@ -620,6 +677,8 @@ static void hdmi_set_clk_regenerator(struct dw_hdmi *hdmi,
 	hdmi->audio_cts = cts;
 	hdmi_set_cts_n(hdmi, cts, hdmi->audio_enable ? n : 0);
 	spin_unlock_irq(&hdmi->audio_lock);
+
+	hdmi_set_schnl(hdmi);
 }
 
 static void hdmi_init_clk_regenerator(struct dw_hdmi *hdmi)
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
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
