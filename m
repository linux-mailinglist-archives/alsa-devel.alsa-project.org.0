Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EE12B70B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 15:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F40C1691;
	Mon, 27 May 2019 15:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F40C1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558965264;
	bh=z6tL8ELpuALrPPv8WbtrxfD70IBlMMyhyUdge/ZzVrE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rn0kW8uVWC2YTU3qY4agLEdrf2ob/8mgCYhMl67PItIkcnzvVvLIm5j8erOS8SZ8J
	 fibzn/E2HZ3sHCrhlkjOzn1nQEE+JWkM0EGlELminDOIcVBUYvmZg9ClpluFeYiteR
	 1L/KxJy92qYfdl5EvFtyWS/X+fwwAz3tOQRHaESQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83C6EF89742;
	Mon, 27 May 2019 15:48:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1398F8072E; Mon, 27 May 2019 15:48:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODY_13, PRX_BODY_78, SPF_HELO_NONE, SPF_PASS,
 T_DKIMWL_WL_HIGH, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17079F896E4
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 15:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17079F896E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="W99kAPbE"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RDmD8N012518;
 Mon, 27 May 2019 08:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1558964893;
 bh=8htxxYwVuVexeT6tGtkINtgVw0R60e9Wid5CiXQrcmU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=W99kAPbEUHTcmmo3fcYvJdkeyC4VN3Zlk5lzESfo/zsvKueF5FJ8qg+O+6tOt55qb
 k8WFw4/f4O6I3q6RX/K2UL2SaM29AP8zNO+ALjFY9a3rU6Qr/25aikUnqiRFeisCy0
 /zZ0LKu3ezRD6768PqCkC9DV3zsFS9f/KvnIfXqU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RDmDhg055064
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 08:48:13 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 08:48:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 08:48:13 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RDlviJ065947;
 Mon, 27 May 2019 08:48:11 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Date: Mon, 27 May 2019 16:47:57 +0300
Message-ID: <ef6895d016554b1e0c8b388d4993bcd6a3699341.1558964241.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1558964241.git.jsarha@ti.com>
References: <cover.1558964241.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: peter.ujfalusi@ti.com, a.hajda@samsung.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, robh@kernel.org
Subject: [alsa-devel] [PATCH v8 6/6] drm/bridge: sii902x: Implement HDMI
	audio support
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

Implement HDMI audio support by using ASoC HDMI codec. The commit
implements the necessary callbacks and configuration for the HDMI
codec and registers a virtual platform device for the codec to attach.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 469 ++++++++++++++++++++++++++++++-
 1 file changed, 463 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 19f982a00dba..bc3325c5e5c3 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -27,6 +27,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/clk.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
@@ -34,6 +35,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <sound/hdmi-codec.h>
+
 #define SII902X_TPI_VIDEO_DATA			0x0
 
 #define SII902X_TPI_PIXEL_REPETITION		0x8
@@ -75,6 +78,77 @@
 #define SII902X_AVI_POWER_STATE_MSK		GENMASK(1, 0)
 #define SII902X_AVI_POWER_STATE_D(l)		((l) & SII902X_AVI_POWER_STATE_MSK)
 
+/* Audio  */
+#define SII902X_TPI_I2S_ENABLE_MAPPING_REG	0x1f
+#define SII902X_TPI_I2S_CONFIG_FIFO0			(0 << 0)
+#define SII902X_TPI_I2S_CONFIG_FIFO1			(1 << 0)
+#define SII902X_TPI_I2S_CONFIG_FIFO2			(2 << 0)
+#define SII902X_TPI_I2S_CONFIG_FIFO3			(3 << 0)
+#define SII902X_TPI_I2S_LEFT_RIGHT_SWAP			(1 << 2)
+#define SII902X_TPI_I2S_AUTO_DOWNSAMPLE			(1 << 3)
+#define SII902X_TPI_I2S_SELECT_SD0			(0 << 4)
+#define SII902X_TPI_I2S_SELECT_SD1			(1 << 4)
+#define SII902X_TPI_I2S_SELECT_SD2			(2 << 4)
+#define SII902X_TPI_I2S_SELECT_SD3			(3 << 4)
+#define SII902X_TPI_I2S_FIFO_ENABLE			(1 << 7)
+
+#define SII902X_TPI_I2S_INPUT_CONFIG_REG	0x20
+#define SII902X_TPI_I2S_FIRST_BIT_SHIFT_YES		(0 << 0)
+#define SII902X_TPI_I2S_FIRST_BIT_SHIFT_NO		(1 << 0)
+#define SII902X_TPI_I2S_SD_DIRECTION_MSB_FIRST		(0 << 1)
+#define SII902X_TPI_I2S_SD_DIRECTION_LSB_FIRST		(1 << 1)
+#define SII902X_TPI_I2S_SD_JUSTIFY_LEFT			(0 << 2)
+#define SII902X_TPI_I2S_SD_JUSTIFY_RIGHT		(1 << 2)
+#define SII902X_TPI_I2S_WS_POLARITY_LOW			(0 << 3)
+#define SII902X_TPI_I2S_WS_POLARITY_HIGH		(1 << 3)
+#define SII902X_TPI_I2S_MCLK_MULTIPLIER_128		(0 << 4)
+#define SII902X_TPI_I2S_MCLK_MULTIPLIER_256		(1 << 4)
+#define SII902X_TPI_I2S_MCLK_MULTIPLIER_384		(2 << 4)
+#define SII902X_TPI_I2S_MCLK_MULTIPLIER_512		(3 << 4)
+#define SII902X_TPI_I2S_MCLK_MULTIPLIER_768		(4 << 4)
+#define SII902X_TPI_I2S_MCLK_MULTIPLIER_1024		(5 << 4)
+#define SII902X_TPI_I2S_MCLK_MULTIPLIER_1152		(6 << 4)
+#define SII902X_TPI_I2S_MCLK_MULTIPLIER_192		(7 << 4)
+#define SII902X_TPI_I2S_SCK_EDGE_FALLING		(0 << 7)
+#define SII902X_TPI_I2S_SCK_EDGE_RISING			(1 << 7)
+
+#define SII902X_TPI_I2S_STRM_HDR_BASE	0x21
+#define SII902X_TPI_I2S_STRM_HDR_SIZE	5
+
+#define SII902X_TPI_AUDIO_CONFIG_BYTE2_REG	0x26
+#define SII902X_TPI_AUDIO_CODING_STREAM_HEADER		(0 << 0)
+#define SII902X_TPI_AUDIO_CODING_PCM			(1 << 0)
+#define SII902X_TPI_AUDIO_CODING_AC3			(2 << 0)
+#define SII902X_TPI_AUDIO_CODING_MPEG1			(3 << 0)
+#define SII902X_TPI_AUDIO_CODING_MP3			(4 << 0)
+#define SII902X_TPI_AUDIO_CODING_MPEG2			(5 << 0)
+#define SII902X_TPI_AUDIO_CODING_AAC			(6 << 0)
+#define SII902X_TPI_AUDIO_CODING_DTS			(7 << 0)
+#define SII902X_TPI_AUDIO_CODING_ATRAC			(8 << 0)
+#define SII902X_TPI_AUDIO_MUTE_DISABLE			(0 << 4)
+#define SII902X_TPI_AUDIO_MUTE_ENABLE			(1 << 4)
+#define SII902X_TPI_AUDIO_LAYOUT_2_CHANNELS		(0 << 5)
+#define SII902X_TPI_AUDIO_LAYOUT_8_CHANNELS		(1 << 5)
+#define SII902X_TPI_AUDIO_INTERFACE_DISABLE		(0 << 6)
+#define SII902X_TPI_AUDIO_INTERFACE_SPDIF		(1 << 6)
+#define SII902X_TPI_AUDIO_INTERFACE_I2S			(2 << 6)
+
+#define SII902X_TPI_AUDIO_CONFIG_BYTE3_REG	0x27
+#define SII902X_TPI_AUDIO_FREQ_STREAM			(0 << 3)
+#define SII902X_TPI_AUDIO_FREQ_32KHZ			(1 << 3)
+#define SII902X_TPI_AUDIO_FREQ_44KHZ			(2 << 3)
+#define SII902X_TPI_AUDIO_FREQ_48KHZ			(3 << 3)
+#define SII902X_TPI_AUDIO_FREQ_88KHZ			(4 << 3)
+#define SII902X_TPI_AUDIO_FREQ_96KHZ			(5 << 3)
+#define SII902X_TPI_AUDIO_FREQ_176KHZ			(6 << 3)
+#define SII902X_TPI_AUDIO_FREQ_192KHZ			(7 << 3)
+#define SII902X_TPI_AUDIO_SAMPLE_SIZE_STREAM		(0 << 6)
+#define SII902X_TPI_AUDIO_SAMPLE_SIZE_16		(1 << 6)
+#define SII902X_TPI_AUDIO_SAMPLE_SIZE_20		(2 << 6)
+#define SII902X_TPI_AUDIO_SAMPLE_SIZE_24		(3 << 6)
+
+#define SII902X_TPI_AUDIO_CONFIG_BYTE4_REG	0x28
+
 #define SII902X_INT_ENABLE			0x3c
 #define SII902X_INT_STATUS			0x3d
 #define SII902X_HOTPLUG_EVENT			BIT(0)
@@ -82,6 +156,16 @@
 
 #define SII902X_REG_TPI_RQB			0xc7
 
+/* Indirect internal register access */
+#define SII902X_IND_SET_PAGE			0xbc
+#define SII902X_IND_OFFSET			0xbd
+#define SII902X_IND_VALUE			0xbe
+
+#define SII902X_TPI_MISC_INFOFRAME_BASE		0xbf
+#define SII902X_TPI_MISC_INFOFRAME_END		0xde
+#define SII902X_TPI_MISC_INFOFRAME_SIZE	\
+	(SII902X_TPI_MISC_INFOFRAME_END - SII902X_TPI_MISC_INFOFRAME_BASE)
+
 #define SII902X_I2C_BUS_ACQUISITION_TIMEOUT_MS	500
 
 struct sii902x {
@@ -91,6 +175,16 @@ struct sii902x {
 	struct drm_connector connector;
 	struct gpio_desc *reset_gpio;
 	struct i2c_mux_core *i2cmux;
+	/*
+	 * Mutex protects audio and video functions from interfering
+	 * each other, by keeping their i2c command sequences atomic.
+	 */
+	struct mutex mutex;
+	struct sii902x_audio {
+		struct platform_device *pdev;
+		struct clk *mclk;
+		u32 i2s_fifo_sequence[4];
+	} audio;
 };
 
 static int sii902x_read_unlocked(struct i2c_client *i2c, u8 reg, u8 *val)
@@ -162,8 +256,12 @@ sii902x_connector_detect(struct drm_connector *connector, bool force)
 	struct sii902x *sii902x = connector_to_sii902x(connector);
 	unsigned int status;
 
+	mutex_lock(&sii902x->mutex);
+
 	regmap_read(sii902x->regmap, SII902X_INT_STATUS, &status);
 
+	mutex_unlock(&sii902x->mutex);
+
 	return (status & SII902X_PLUGGED_STATUS) ?
 	       connector_status_connected : connector_status_disconnected;
 }
@@ -185,6 +283,8 @@ static int sii902x_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int num = 0, ret;
 
+	mutex_lock(&sii902x->mutex);
+
 	edid = drm_get_edid(connector, sii902x->i2cmux->adapter[0]);
 	drm_connector_update_edid_property(connector, edid);
 	if (edid) {
@@ -198,14 +298,19 @@ static int sii902x_get_modes(struct drm_connector *connector)
 	ret = drm_display_info_set_bus_formats(&connector->display_info,
 					       &bus_format, 1);
 	if (ret)
-		return ret;
+		goto error_out;
 
 	ret = regmap_update_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA,
 				 SII902X_SYS_CTRL_OUTPUT_MODE, output_mode);
 	if (ret)
-		return ret;
+		goto error_out;
+
+	ret = num;
+
+error_out:
+	mutex_unlock(&sii902x->mutex);
 
-	return num;
+	return ret;
 }
 
 static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
@@ -225,20 +330,28 @@ static void sii902x_bridge_disable(struct drm_bridge *bridge)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 
+	mutex_lock(&sii902x->mutex);
+
 	regmap_update_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA,
 			   SII902X_SYS_CTRL_PWR_DWN,
 			   SII902X_SYS_CTRL_PWR_DWN);
+
+	mutex_unlock(&sii902x->mutex);
 }
 
 static void sii902x_bridge_enable(struct drm_bridge *bridge)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 
+	mutex_lock(&sii902x->mutex);
+
 	regmap_update_bits(sii902x->regmap, SII902X_PWR_STATE_CTRL,
 			   SII902X_AVI_POWER_STATE_MSK,
 			   SII902X_AVI_POWER_STATE_D(0));
 	regmap_update_bits(sii902x->regmap, SII902X_SYS_CTRL_DATA,
 			   SII902X_SYS_CTRL_PWR_DWN, 0);
+
+	mutex_unlock(&sii902x->mutex);
 }
 
 static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
@@ -265,27 +378,32 @@ static void sii902x_bridge_mode_set(struct drm_bridge *bridge,
 	buf[9] = SII902X_TPI_AVI_INPUT_RANGE_AUTO |
 		 SII902X_TPI_AVI_INPUT_COLORSPACE_RGB;
 
+	mutex_lock(&sii902x->mutex);
+
 	ret = regmap_bulk_write(regmap, SII902X_TPI_VIDEO_DATA, buf, 10);
 	if (ret)
-		return;
+		goto out;
 
 	ret = drm_hdmi_avi_infoframe_from_display_mode(&frame,
 						       &sii902x->connector, adj);
 	if (ret < 0) {
 		DRM_ERROR("couldn't fill AVI infoframe\n");
-		return;
+		goto out;
 	}
 
 	ret = hdmi_avi_infoframe_pack(&frame, buf, sizeof(buf));
 	if (ret < 0) {
 		DRM_ERROR("failed to pack AVI infoframe: %d\n", ret);
-		return;
+		goto out;
 	}
 
 	/* Do not send the infoframe header, but keep the CRC field. */
 	regmap_bulk_write(regmap, SII902X_TPI_AVI_INFOFRAME,
 			  buf + HDMI_INFOFRAME_HEADER_SIZE - 1,
 			  HDMI_AVI_INFOFRAME_SIZE + 1);
+
+out:
+	mutex_unlock(&sii902x->mutex);
 }
 
 static int sii902x_bridge_attach(struct drm_bridge *bridge)
@@ -326,6 +444,335 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
 	.enable = sii902x_bridge_enable,
 };
 
+static int sii902x_mute(struct sii902x *sii902x, bool mute)
+{
+	struct device *dev = &sii902x->i2c->dev;
+	unsigned int val = mute ? SII902X_TPI_AUDIO_MUTE_ENABLE :
+		SII902X_TPI_AUDIO_MUTE_DISABLE;
+
+	dev_dbg(dev, "%s: %s\n", __func__, mute ? "Muted" : "Unmuted");
+
+	return regmap_update_bits(sii902x->regmap,
+				  SII902X_TPI_AUDIO_CONFIG_BYTE2_REG,
+				  SII902X_TPI_AUDIO_MUTE_ENABLE, val);
+}
+
+static const int sii902x_mclk_div_table[] = {
+	128, 256, 384, 512, 768, 1024, 1152, 192 };
+
+static int sii902x_select_mclk_div(u8 *i2s_config_reg, unsigned int rate,
+				   unsigned int mclk)
+{
+	int div = mclk / rate;
+	int distance = 100000;
+	u8 i, nearest = 0;
+
+	for (i = 0; i < ARRAY_SIZE(sii902x_mclk_div_table); i++) {
+		unsigned int d = abs(div - sii902x_mclk_div_table[i]);
+
+		if (d >= distance)
+			continue;
+
+		nearest = i;
+		distance = d;
+		if (d == 0)
+			break;
+	}
+
+	*i2s_config_reg |= nearest << 4;
+
+	return sii902x_mclk_div_table[nearest];
+}
+
+static const struct sii902x_sample_freq {
+	u32 freq;
+	u8 val;
+} sii902x_sample_freq[] = {
+	{ .freq = 32000,	.val = SII902X_TPI_AUDIO_FREQ_32KHZ },
+	{ .freq = 44000,	.val = SII902X_TPI_AUDIO_FREQ_44KHZ },
+	{ .freq = 48000,	.val = SII902X_TPI_AUDIO_FREQ_48KHZ },
+	{ .freq = 88000,	.val = SII902X_TPI_AUDIO_FREQ_88KHZ },
+	{ .freq = 96000,	.val = SII902X_TPI_AUDIO_FREQ_96KHZ },
+	{ .freq = 176000,	.val = SII902X_TPI_AUDIO_FREQ_176KHZ },
+	{ .freq = 192000,	.val = SII902X_TPI_AUDIO_FREQ_192KHZ },
+};
+
+static int sii902x_audio_hw_params(struct device *dev, void *data,
+				   struct hdmi_codec_daifmt *daifmt,
+				   struct hdmi_codec_params *params)
+{
+	struct sii902x *sii902x = dev_get_drvdata(dev);
+	u8 i2s_config_reg = SII902X_TPI_I2S_SD_DIRECTION_MSB_FIRST;
+	u8 config_byte2_reg = (SII902X_TPI_AUDIO_INTERFACE_I2S |
+			       SII902X_TPI_AUDIO_MUTE_ENABLE |
+			       SII902X_TPI_AUDIO_CODING_PCM);
+	u8 config_byte3_reg = 0;
+	u8 infoframe_buf[HDMI_INFOFRAME_SIZE(AUDIO)];
+	unsigned long mclk_rate;
+	int i, ret;
+
+	if (daifmt->bit_clk_master || daifmt->frame_clk_master) {
+		dev_dbg(dev, "%s: I2S master mode not supported\n", __func__);
+		return -EINVAL;
+	}
+
+	switch (daifmt->fmt) {
+	case HDMI_I2S:
+		i2s_config_reg |= SII902X_TPI_I2S_FIRST_BIT_SHIFT_YES |
+			SII902X_TPI_I2S_SD_JUSTIFY_LEFT;
+		break;
+	case HDMI_RIGHT_J:
+		i2s_config_reg |= SII902X_TPI_I2S_SD_JUSTIFY_RIGHT;
+		break;
+	case HDMI_LEFT_J:
+		i2s_config_reg |= SII902X_TPI_I2S_SD_JUSTIFY_LEFT;
+		break;
+	default:
+		dev_dbg(dev, "%s: Unsupported i2s format %u\n", __func__,
+			daifmt->fmt);
+		return -EINVAL;
+	}
+
+	if (daifmt->bit_clk_inv)
+		i2s_config_reg |= SII902X_TPI_I2S_SCK_EDGE_FALLING;
+	else
+		i2s_config_reg |= SII902X_TPI_I2S_SCK_EDGE_RISING;
+
+	if (daifmt->frame_clk_inv)
+		i2s_config_reg |= SII902X_TPI_I2S_WS_POLARITY_LOW;
+	else
+		i2s_config_reg |= SII902X_TPI_I2S_WS_POLARITY_HIGH;
+
+	if (params->channels > 2)
+		config_byte2_reg |= SII902X_TPI_AUDIO_LAYOUT_8_CHANNELS;
+	else
+		config_byte2_reg |= SII902X_TPI_AUDIO_LAYOUT_2_CHANNELS;
+
+	switch (params->sample_width) {
+	case 16:
+		config_byte3_reg |= SII902X_TPI_AUDIO_SAMPLE_SIZE_16;
+		break;
+	case 20:
+		config_byte3_reg |= SII902X_TPI_AUDIO_SAMPLE_SIZE_20;
+		break;
+	case 24:
+	case 32:
+		config_byte3_reg |= SII902X_TPI_AUDIO_SAMPLE_SIZE_24;
+		break;
+	default:
+		dev_err(dev, "%s: Unsupported sample width %u\n", __func__,
+			params->sample_width);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(sii902x_sample_freq); i++) {
+		if (params->sample_rate == sii902x_sample_freq[i].freq) {
+			config_byte3_reg |= sii902x_sample_freq[i].val;
+			break;
+		}
+	}
+
+	ret = clk_prepare_enable(sii902x->audio.mclk);
+	if (ret) {
+		dev_err(dev, "Enabling mclk failed: %d\n", ret);
+		return ret;
+	}
+
+	mclk_rate = clk_get_rate(sii902x->audio.mclk);
+
+	ret = sii902x_select_mclk_div(&i2s_config_reg, params->sample_rate,
+				      mclk_rate);
+	if (mclk_rate != ret * params->sample_rate)
+		dev_dbg(dev, "Inaccurate reference clock (%ld/%d != %u)\n",
+			mclk_rate, ret, params->sample_rate);
+
+	mutex_lock(&sii902x->mutex);
+
+	ret = regmap_write(sii902x->regmap,
+			   SII902X_TPI_AUDIO_CONFIG_BYTE2_REG,
+			   config_byte2_reg);
+	if (ret < 0)
+		goto out;
+
+	ret = regmap_write(sii902x->regmap, SII902X_TPI_I2S_INPUT_CONFIG_REG,
+			   i2s_config_reg);
+	if (ret)
+		goto out;
+
+	for (i = 0; sii902x->audio.i2s_fifo_sequence[i] &&
+		     i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence); i++)
+		regmap_write(sii902x->regmap,
+			     SII902X_TPI_I2S_ENABLE_MAPPING_REG,
+			     sii902x->audio.i2s_fifo_sequence[i]);
+
+	ret = regmap_write(sii902x->regmap, SII902X_TPI_AUDIO_CONFIG_BYTE3_REG,
+			   config_byte3_reg);
+	if (ret)
+		goto out;
+
+	ret = regmap_bulk_write(sii902x->regmap, SII902X_TPI_I2S_STRM_HDR_BASE,
+				params->iec.status,
+				min((size_t) SII902X_TPI_I2S_STRM_HDR_SIZE,
+				    sizeof(params->iec.status)));
+	if (ret)
+		goto out;
+
+	ret = hdmi_audio_infoframe_pack(&params->cea, infoframe_buf,
+					sizeof(infoframe_buf));
+	if (ret < 0) {
+		dev_err(dev, "%s: Failed to pack audio infoframe: %d\n",
+			__func__, ret);
+		goto out;
+	}
+
+	ret = regmap_bulk_write(sii902x->regmap,
+				SII902X_TPI_MISC_INFOFRAME_BASE,
+				infoframe_buf,
+				min(ret, SII902X_TPI_MISC_INFOFRAME_SIZE));
+	if (ret)
+		goto out;
+
+	/* Decode Level 0 Packets */
+	ret = regmap_write(sii902x->regmap, SII902X_IND_SET_PAGE, 0x02);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(sii902x->regmap, SII902X_IND_OFFSET, 0x24);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(sii902x->regmap, SII902X_IND_VALUE, 0x02);
+	if (ret)
+		goto out;
+
+	dev_dbg(dev, "%s: hdmi audio enabled\n", __func__);
+out:
+	mutex_unlock(&sii902x->mutex);
+
+	if (ret) {
+		clk_disable_unprepare(sii902x->audio.mclk);
+		dev_err(dev, "%s: hdmi audio enable failed: %d\n", __func__,
+			ret);
+	}
+
+	return ret;
+}
+
+static void sii902x_audio_shutdown(struct device *dev, void *data)
+{
+	struct sii902x *sii902x = dev_get_drvdata(dev);
+
+	mutex_lock(&sii902x->mutex);
+
+	regmap_write(sii902x->regmap, SII902X_TPI_AUDIO_CONFIG_BYTE2_REG,
+		     SII902X_TPI_AUDIO_INTERFACE_DISABLE);
+
+	mutex_unlock(&sii902x->mutex);
+
+	clk_disable_unprepare(sii902x->audio.mclk);
+}
+
+int sii902x_audio_digital_mute(struct device *dev, void *data, bool enable)
+{
+	struct sii902x *sii902x = dev_get_drvdata(dev);
+
+	mutex_lock(&sii902x->mutex);
+
+	sii902x_mute(sii902x, enable);
+
+	mutex_unlock(&sii902x->mutex);
+
+	return 0;
+}
+
+static int sii902x_audio_get_eld(struct device *dev, void *data,
+				 uint8_t *buf, size_t len)
+{
+	struct sii902x *sii902x = dev_get_drvdata(dev);
+
+	mutex_lock(&sii902x->mutex);
+
+	memcpy(buf, sii902x->connector.eld,
+	       min(sizeof(sii902x->connector.eld), len));
+
+	mutex_unlock(&sii902x->mutex);
+
+	return 0;
+}
+
+static const struct hdmi_codec_ops sii902x_audio_codec_ops = {
+	.hw_params = sii902x_audio_hw_params,
+	.audio_shutdown = sii902x_audio_shutdown,
+	.digital_mute = sii902x_audio_digital_mute,
+	.get_eld = sii902x_audio_get_eld,
+};
+
+static int sii902x_audio_codec_init(struct sii902x *sii902x,
+				    struct device *dev)
+{
+	static const u8 audio_fifo_id[] = {
+		SII902X_TPI_I2S_CONFIG_FIFO0,
+		SII902X_TPI_I2S_CONFIG_FIFO1,
+		SII902X_TPI_I2S_CONFIG_FIFO2,
+		SII902X_TPI_I2S_CONFIG_FIFO3,
+	};
+	static const u8 i2s_lane_id[] = {
+		SII902X_TPI_I2S_SELECT_SD0,
+		SII902X_TPI_I2S_SELECT_SD1,
+		SII902X_TPI_I2S_SELECT_SD2,
+		SII902X_TPI_I2S_SELECT_SD3,
+	};
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &sii902x_audio_codec_ops,
+		.i2s = 1, /* Only i2s support for now. */
+		.spdif = 0,
+		.max_i2s_channels = 0,
+	};
+	u8 lanes[4];
+	u32 num_lanes, i;
+
+	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
+		dev_dbg(dev, "%s: No \"#sound-dai-cells\", no audio\n",
+			__func__);
+		return 0;
+	}
+
+	num_lanes = of_property_read_variable_u8_array(dev->of_node,
+						       "sil,i2s-data-lanes",
+						       lanes, 1,
+						       ARRAY_SIZE(lanes));
+
+	if (num_lanes == -EINVAL) {
+		dev_dbg(dev,
+			"%s: No \"sil,i2s-data-lanes\", use default <0>\n",
+			__func__);
+		num_lanes = 1;
+		lanes[0] = 0;
+	} else if (num_lanes < 0) {
+		dev_err(dev,
+			"%s: Error gettin \"sil,i2s-data-lanes\": %d\n",
+			__func__, num_lanes);
+		return num_lanes;
+	}
+	codec_data.max_i2s_channels = 2 * num_lanes;
+
+	for (i = 0; i < num_lanes; i++)
+		sii902x->audio.i2s_fifo_sequence[i] |= audio_fifo_id[i] |
+			i2s_lane_id[lanes[i]] |	SII902X_TPI_I2S_FIFO_ENABLE;
+
+	if (IS_ERR(sii902x->audio.mclk)) {
+		dev_err(dev, "%s: No clock (audio mclk) found: %ld\n",
+			__func__, PTR_ERR(sii902x->audio.mclk));
+		return 0;
+	}
+
+	sii902x->audio.pdev = platform_device_register_data(
+		dev, HDMI_CODEC_DRV_NAME, PLATFORM_DEVID_AUTO,
+		&codec_data, sizeof(codec_data));
+
+	return PTR_ERR_OR_ZERO(sii902x->audio.pdev);
+}
+
 static const struct regmap_range sii902x_volatile_ranges[] = {
 	{ .range_min = 0, .range_max = 0xff },
 };
@@ -338,6 +785,8 @@ static const struct regmap_access_table sii902x_volatile_table = {
 static const struct regmap_config sii902x_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
+	.disable_locking = true, /* struct sii902x mutex should be enough */
+	.max_register = SII902X_TPI_MISC_INFOFRAME_END,
 	.volatile_table = &sii902x_volatile_table,
 	.cache_type = REGCACHE_NONE,
 };
@@ -347,9 +796,13 @@ static irqreturn_t sii902x_interrupt(int irq, void *data)
 	struct sii902x *sii902x = data;
 	unsigned int status = 0;
 
+	mutex_lock(&sii902x->mutex);
+
 	regmap_read(sii902x->regmap, SII902X_INT_STATUS, &status);
 	regmap_write(sii902x->regmap, SII902X_INT_STATUS, status);
 
+	mutex_unlock(&sii902x->mutex);
+
 	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev)
 		drm_helper_hpd_irq_event(sii902x->bridge.dev);
 
@@ -510,6 +963,8 @@ static int sii902x_probe(struct i2c_client *client,
 		return PTR_ERR(sii902x->reset_gpio);
 	}
 
+	mutex_init(&sii902x->mutex);
+
 	sii902x_reset(sii902x);
 
 	ret = regmap_write(sii902x->regmap, SII902X_REG_TPI_RQB, 0x0);
@@ -550,6 +1005,8 @@ static int sii902x_probe(struct i2c_client *client,
 	sii902x->bridge.timings = &default_sii902x_timings;
 	drm_bridge_add(&sii902x->bridge);
 
+	sii902x_audio_codec_init(sii902x, dev);
+
 	i2c_set_clientdata(client, sii902x);
 
 	sii902x->i2cmux = i2c_mux_alloc(client->adapter, dev,
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
