Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C764C153D8C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 04:21:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 645C01668;
	Thu,  6 Feb 2020 04:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 645C01668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580959269;
	bh=K7jvHd/nyqsObtlZMvNtIpR/YFMMIuT/KyeoouBobG8=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eC5yMUR/7BH4LcV37QIu3JNj8g/H0DF/H/Ea7QAdHLpLcGnRMuJXRud4Xzqu3OQRC
	 Q6+N4uJDbdADeE0y9WyiUWsJNLsT67mRKhZe1RQPQeVMVVLYDVVqbjF6yDPXY8diei
	 1b4dC7JzlCFmbvApY6Tun64XtwTUWaIRx5caO9Lw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29A1CF80276;
	Thu,  6 Feb 2020 04:18:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0E40F80274; Thu,  6 Feb 2020 04:18:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08765F80248
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 04:18:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08765F80248
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="naFzHNYg"
Received: by mail-qt1-x84a.google.com with SMTP id r9so2906478qtc.4
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 19:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=GKdSBpWKS5JubKvYHooQ1tsJLs+L1G4clF+7s5FbyHw=;
 b=naFzHNYgTkl6FjZpBOkCA2X/QrskO3Nyj3+Up6Q4sv70fhZlsQ9OfLbIfk1r0c13f4
 eZ7iIngf+0/feqrVf4l2k8moJ1SVAXQLPEgJmjMmLuiAAM62o0X1gRX7fFP7t6Mr4H36
 0+tUG3s5KDIURJ7Z1Rk1MINTJQ76nBZiKGmkjah2srKyBHJuv9h4O7MfxPvMBZK1fY6M
 wiMDH4EIJkavj55219XnSvbSenUmn+5oNJblgUzaI2YDjn6mPonp1jk3SsKy5ukJVDVO
 t+iWto0HpgeelkmDD2dNdvWDV9C80RAhjpVNvaLx92zuCH5OS92Vsn3t90c9w2TAruRG
 +bSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GKdSBpWKS5JubKvYHooQ1tsJLs+L1G4clF+7s5FbyHw=;
 b=mcy7VG/UDTVangvE2/hwg2CHnouZph7JYl2X2uI9+do+APbZDpooRAWi5ojsKQ3pAP
 WlsSdCwSqlZx/rbKsHKkBVx1JjRCXuWHa6BqeZS5VDbzMQsoT6mjgXS8TlWIvSW7m5mi
 DUnmbg0VfSLz/wbiDCnT1h/LiHe6j0muQGU6wlZwl8gSRbAPFflC7sOZzswhMWIpVIie
 AVVim+OzE50cF/nu7ptp0YYSeIFJmtPyRuynZeEtNjQ0ipip35o6BC9bh9Ek3OVTLP5h
 HMjASrvYPuGrib5Dwc1DjwoOyz/P97Grnn938W+FGKdnaw3jxEYyLSnmdTGgxZLRxeIY
 j8ug==
X-Gm-Message-State: APjAAAV3Vl0LmBbI/h+LvhnP/UVUnLTcHWe6bv0u6V9l0Y+mlEwoefqz
 mGcGzUEdZLg16mFz29Z7rRMJWY+MYY6R
X-Google-Smtp-Source: APXvYqyJ0n0UFWdJRGiNBcfGeJ9XTuOgIvFLDSVvgEpiQSthosjpQX4dk4r4oRet+K8HdyV3vkafiTKoFhUX
X-Received: by 2002:a0c:ffc4:: with SMTP id h4mr662384qvv.233.1580959101083;
 Wed, 05 Feb 2020 19:18:21 -0800 (PST)
Date: Thu,  6 Feb 2020 11:17:51 +0800
In-Reply-To: <20200206031752.193298-1-tzungbi@google.com>
Message-Id: <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
Mime-Version: 1.0
References: <20200206031752.193298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v2 2/3] drm/mediatek: support HDMI jack status
	reporting
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

1.
Provides a callback (i.e. mtk_hdmi_audio_hook_plugged_cb) to hdmi-codec.
When ASoC machine driver calls hdmi_codec_set_jack_detect(), the
callback will be invoked to save plugged_cb and codec_dev parameters.

+---------+  set_jack_  +------------+ plugged_cb  +----------+
| machine | ----------> | hdmi-codec | ----------> | mtk-hdmi |
+---------+  detect()   +------------+ codec_dev   +----------+

2.
When there is any jack status changes, mtk-hdmi will call the
plugged_cb() to notify hdmi-codec.  And then hdmi-codec will call
snd_soc_jack_report().

+----------+ plugged_cb  +------------+
| mtk-hdmi | ----------> | hdmi-codec | -> snd_soc_jack_report()
+----------+ codec_dev   +------------+
             connector_status

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 34 ++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 23c2b0e8693d..fccdd975947d 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -169,6 +169,8 @@ struct mtk_hdmi {
 	bool audio_enable;
 	bool powered;
 	bool enabled;
+	hdmi_codec_plugged_cb plugged_cb;
+	struct device *codec_dev;
 };
 
 static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
@@ -1194,13 +1196,23 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
 	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
 }
 
+static enum drm_connector_status
+mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
+{
+	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
+
+	if (hdmi->plugged_cb && hdmi->codec_dev)
+		hdmi->plugged_cb(hdmi->codec_dev, connected);
+
+	return connected ?
+	       connector_status_connected : connector_status_disconnected;
+}
+
 static enum drm_connector_status hdmi_conn_detect(struct drm_connector *conn,
 						  bool force)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
-
-	return mtk_cec_hpd_high(hdmi->cec_dev) ?
-	       connector_status_connected : connector_status_disconnected;
+	return mtk_hdmi_update_plugged_status(hdmi);
 }
 
 static void hdmi_conn_destroy(struct drm_connector *conn)
@@ -1648,20 +1660,36 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 	return 0;
 }
 
+static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
+					  hdmi_codec_plugged_cb fn,
+					  struct device *codec_dev)
+{
+	struct mtk_hdmi *hdmi = data;
+
+	hdmi->plugged_cb = fn;
+	hdmi->codec_dev = codec_dev;
+	mtk_hdmi_update_plugged_status(hdmi);
+
+	return 0;
+}
+
 static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.hw_params = mtk_hdmi_audio_hw_params,
 	.audio_startup = mtk_hdmi_audio_startup,
 	.audio_shutdown = mtk_hdmi_audio_shutdown,
 	.digital_mute = mtk_hdmi_audio_digital_mute,
 	.get_eld = mtk_hdmi_audio_get_eld,
+	.hook_plugged_cb = mtk_hdmi_audio_hook_plugged_cb,
 };
 
 static int mtk_hdmi_register_audio_driver(struct device *dev)
 {
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 	struct hdmi_codec_pdata codec_data = {
 		.ops = &mtk_hdmi_audio_codec_ops,
 		.max_i2s_channels = 2,
 		.i2s = 1,
+		.data = hdmi,
 	};
 	struct platform_device *pdev;
 
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
