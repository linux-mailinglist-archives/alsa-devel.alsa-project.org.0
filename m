Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F20E035F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 13:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C290A1655;
	Tue, 22 Oct 2019 13:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C290A1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571745011;
	bh=WfWnPENLBYdVwatXeqJjh+oXGFDwcScRke2w0vXCpm0=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UvlCNynRDWmsDobhUXCj+4DZ3Waz6YvFHik4PxBbJkJziM07Z4CnuD17mMVeE+L1L
	 ad326a3pNFTmqySE7McsnqpS78X4Ml6Wt3gqbGzlaPVS5Ge4bf+b3vzz0d2Wp0Nuko
	 mHFhWOtwL5XPYE7zF1SncTwsI7Da9GRCulCuwE1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BD43F805FE;
	Tue, 22 Oct 2019 13:47:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76AACF80390; Tue, 22 Oct 2019 13:46:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-ua1-x949.google.com (mail-ua1-x949.google.com
 [IPv6:2607:f8b0:4864:20::949])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAA81F80112
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 13:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAA81F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="v/XhJrE4"
Received: by mail-ua1-x949.google.com with SMTP id g23so159560uan.5
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 04:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=6PvO4YGcBPU7HqTKrAMBpr5jWnrEO6vhCWHVgxtCZF0=;
 b=v/XhJrE4hvhwOzEGcKs+eQoCDnnCj5mUo5POIAosRXGG9AR786k5ivdMEx0u1rAa0G
 6FwQqiAnM4B6RlupEtxMjyDNTPzx34+E+/70eATGUSkjoJ8W8GvCVILVpBm2wwS0OLtF
 FsHUuxV6o+LY4rkICqCZ2pv588XXJ85QW0p3TajaPFxkmYIuxmsJAgn01++mJD7sr8FX
 qQK7k3vaWYUeu/1UDlFrcRHs8lKDl5yseG5047lhqeRkvc7QVEOoMnskxTlBn2dviIYF
 WvDKYhDmT/6v2QcIjvBcyBFdj5zYQORvKyeT9rKwpfGTE+vQjTOHSioHV293JvSx2+5k
 jm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6PvO4YGcBPU7HqTKrAMBpr5jWnrEO6vhCWHVgxtCZF0=;
 b=FMmMSGxABSa7+Oo55x3UCOYd2vnrWdSnEzfggwgPJ8BjlwxAZOQXwz0ePpvFTgUSet
 Q6P88LGGjkHLhGP9NjVyhzgDcr02WdIAllWqa/Qi2jrfmK3avPmFkAVSdPNOQXY4pzGn
 QQvmhbbxSM8MEEbmOC1tvWA+DvZO4R2eHWnxPtnYP4F3JZNVUBuNzP+mfLLB1EdEEKOi
 Z3e0qmXxefpIY6uBvGyOpUN8ShD+NuNKIFjWTwJVUVFNwxKk/P10w/QTEr6A1OdxxRlH
 06FB5/faST7v9C3C/18Lld1MCIRrrrGjgRuGT9mgfsqOM3ZLTJt/iV+jKu+WIFp4U8gv
 rXVg==
X-Gm-Message-State: APjAAAX6qwv3YkM38ESpsj+aCXo+NjCEQk+lFmk1H1M7kk937twZbR3Z
 dW3PaF9mU+MJohq2I4Jd9BrrcG9W583s
X-Google-Smtp-Source: APXvYqwY1rlBy1N3hHiRYbjJlOMwfLIOQOq0dmz2amkEN+2rQ4+TI3BcHF+QmqbKwaRye4ZzLeXpjHYP/Bkz
X-Received: by 2002:a67:f2da:: with SMTP id a26mr1534141vsn.60.1571744814867; 
 Tue, 22 Oct 2019 04:46:54 -0700 (PDT)
Date: Tue, 22 Oct 2019 19:45:01 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.2.I66284413ef7dbbf4b6ea7735f71807ebd35bf7e8@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, jonas@kwiboo.se, allen.chen@ite.com.tw,
 jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, tzungbi@google.com, dgreid@google.com
Subject: [alsa-devel] [PATCH 2/6] drm: bridge: it6505: bridge to hdmi-codec
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

From: Allen Chen <allen.chen@ite.com.tw>

Bridge to hdmi-codec to support audio feature.

It is observed that some DP-to-HDMI dongles will get into bad states
if sending InfoFrame without audio data.  Defer to enable it6505's
audio feature when PCM triggers START or RESUME.

Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 152 ++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 5e046f677343..1d19184d2056 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -26,6 +26,8 @@
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 
+#include <sound/hdmi-codec.h>
+
 #define AX 0
 #define BX 1
 #define AUDSEL I2S
@@ -146,6 +148,7 @@ struct it6505 {
 	struct notifier_block event_nb;
 	struct extcon_dev *extcon;
 	struct work_struct extcon_wq;
+	struct delayed_work delayed_audio;
 	enum sys_status status;
 	bool hbr;
 	u8 en_ssc;
@@ -1223,6 +1226,149 @@ static void it6505_set_audio(struct it6505 *it6505)
 	dptxset(it6505, 0xD3, 0x20, 0x00);
 }
 
+static void it6505_delayed_audio(struct work_struct *work)
+{
+	struct it6505 *it6505 = container_of(work, struct it6505,
+					     delayed_audio.work);
+
+	it6505_set_audio(it6505);
+	it6505->en_audio = 1;
+}
+
+static int it6505_audio_hw_params(struct device *dev, void *data,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+	unsigned int channel_num = params->cea.channels;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "setting %d Hz, %d bit, %d channels\n",
+			     params->sample_rate, params->sample_width,
+			     channel_num);
+
+	if (!it6505->bridge.encoder)
+		return -ENODEV;
+
+	switch (params->sample_rate) {
+	case 24000:
+		it6505->aud_fs = AUD24K;
+		break;
+	case 32000:
+		it6505->aud_fs = AUD32K;
+		break;
+	case 44100:
+		it6505->aud_fs = AUD44P1K;
+		break;
+	case 48000:
+		it6505->aud_fs = AUD48K;
+		break;
+	case 88200:
+		it6505->aud_fs = AUD88P2K;
+		break;
+	case 96000:
+		it6505->aud_fs = AUD96K;
+		break;
+	case 176400:
+		it6505->aud_fs = AUD176P4K;
+		break;
+	case 192000:
+		it6505->aud_fs = AUD192K;
+		break;
+	default:
+		DRM_DEV_DEBUG_DRIVER(dev, "sample rate: %d Hz not support",
+				     params->sample_rate);
+		return -EINVAL;
+	}
+
+	switch (params->sample_width) {
+	case 16:
+		it6505->audwordlength = AUD16BIT;
+		break;
+	case 18:
+		it6505->audwordlength = AUD18BIT;
+		break;
+	case 20:
+		it6505->audwordlength = AUD20BIT;
+		break;
+	case 24:
+	case 32:
+		it6505->audwordlength = AUD24BIT;
+		break;
+	default:
+		DRM_DEV_DEBUG_DRIVER(dev, "wordlength: %d bit not support",
+				     params->sample_width);
+		return -EINVAL;
+	}
+
+	if (channel_num == 0 || channel_num % 2) {
+		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
+				     channel_num);
+		return -EINVAL;
+	}
+	it6505->aud_ch = channel_num;
+
+	return 0;
+}
+
+static int it6505_audio_trigger(struct device *dev, int event)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+
+	DRM_DEV_DEBUG_DRIVER(dev, "event: %d", event);
+	switch (event) {
+	case HDMI_CODEC_TRIGGER_EVENT_START:
+	case HDMI_CODEC_TRIGGER_EVENT_RESUME:
+		queue_delayed_work(system_wq, &it6505->delayed_audio,
+				   msecs_to_jiffies(180));
+		break;
+	case HDMI_CODEC_TRIGGER_EVENT_STOP:
+	case HDMI_CODEC_TRIGGER_EVENT_SUSPEND:
+		cancel_delayed_work(&it6505->delayed_audio);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void it6505_audio_shutdown(struct device *dev, void *data)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+
+	dptxset(it6505, 0xE8, 0x22, 0x00);
+	dptxset(it6505, 0x05, 0x02, 0x02);
+	it6505->en_audio = 0;
+}
+
+static const struct hdmi_codec_ops it6505_audio_codec_ops = {
+	.hw_params = it6505_audio_hw_params,
+	.trigger = it6505_audio_trigger,
+	.audio_shutdown = it6505_audio_shutdown,
+};
+
+static int it6505_register_audio_driver(struct device *dev)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &it6505_audio_codec_ops,
+		.max_i2s_channels = 8,
+		.i2s = 1,
+	};
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &codec_data,
+					     sizeof(codec_data));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	INIT_DELAYED_WORK(&it6505->delayed_audio, it6505_delayed_audio);
+
+	DRM_DEV_DEBUG_DRIVER(dev, "bound to %s", HDMI_CODEC_DRV_NAME);
+	return 0;
+}
+
 /***************************************************************************
  * DPCD Read and EDID
  ***************************************************************************/
@@ -2460,6 +2606,12 @@ static int it6505_i2c_probe(struct i2c_client *client,
 		return err;
 	}
 
+	err = it6505_register_audio_driver(dev);
+	if (err < 0) {
+		DRM_DEV_ERROR(dev, "Failed to register audio driver: %d", err);
+		return err;
+	}
+
 	/* Register aux channel */
 	it6505->aux.name = "DP-AUX";
 	it6505->aux.dev = dev;
-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
