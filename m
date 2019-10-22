Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F08BE0367
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 13:52:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2864D1680;
	Tue, 22 Oct 2019 13:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2864D1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571745120;
	bh=Q8RVOsqENkdWVN0W988Nlfevf9nxJoT9QwJK2CqF1zk=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LnWxqydF4Nx6sWxdtGwCtTSj7k9vzbkelSm3vskPUGhCxwqeTPAmp7sL19yKp+VIJ
	 9YnIxIkgzFWXO1oGaViHUQqWufoq0Ty7vpnRBjLGyaSbX0FB/y8WNPn5g8aXMGQW7P
	 eSFm0p0u5+jgkDqHEVElojbtIh5k1ONJ6XjCGiXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0F8CF8063D;
	Tue, 22 Oct 2019 13:47:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 219FBF8063E; Tue, 22 Oct 2019 13:47:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53F75F80637
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 13:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53F75F80637
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="I0acZyZn"
Received: by mail-pl1-x64a.google.com with SMTP id 70so10323935ple.1
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=s0s8xkCRDoETkGIRm0ElT2FwVj33VJZ3cTstMqIB3IM=;
 b=I0acZyZn7Xa5n4obt1qg6joAIwyf9eiBWk/mW3Nlwg9fcmVvcxkuhvFIyFjP6M92dr
 QdJzMn7/AX2f9zcQntoB5Zkse6Pu+SHBIjb00x3UrLLdWyJg6s2YtB6Fu8qunSioqb/2
 Gycr9cOufMmEc1mn0DSCnsqeWMDvVDc+hZAs/QE9Hp5twycxtJjudehRrb6hEYsFYlXK
 b6yZtGFAEbG3wzWfdNZ4BbfoJEL6PWqgncjY6r2NSDEh+PAPI6wEZdcKJV8BsAcfVWWV
 Bup7DNuh9H23t+2obXziuAUtbntup0JtzB239+cUjg0vNJvV5MsMM7DfaO8j6ficqge6
 lF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=s0s8xkCRDoETkGIRm0ElT2FwVj33VJZ3cTstMqIB3IM=;
 b=DGQIcMLgmp2d9U034GZBBD8/ak+dMcmdi1M6W066JlcryZTGSAg5wNlQKZhQdSdT/f
 jejgADFpZbkJTNYrWWmwG5cJ3grHRB87VMExfFCjoqle+SVA1xVFKOdL/C0D0VQNZ/yg
 sRqvifApl2lfY8VT9FkYcWxn3QqlMBGNtICUB2qY3IgZ06avnBD9YX9FE2QIKSr4jKwz
 p+iQT+553JFUjXa057o32NniTZHS/FW7Y+HFwskK65thvAPwuTOqJpu52OGtJuoVZ9o9
 +BVrBn9mnFTWLOZNpxYo5XZJKm/Ey+GRKCnVkxbuG8R/ppDI0TlaL9zFMMzRcN7k3vPA
 H0GA==
X-Gm-Message-State: APjAAAXeNsrdhyFnBwOKrqSVxiENPwsyyqrUgTQdDBgb1zV40DgZ4eFX
 zOlumOhQTmbCwYa9rn9qCgjUQOtgxfkj
X-Google-Smtp-Source: APXvYqy9VizXIvEY2o6/3SHowrevaAyupW9XltTdBSGcXmWEmoUxzrtIaUakSyVtkK+jhJd4Wuu1Vf6Qx09o
X-Received: by 2002:a63:8f41:: with SMTP id r1mr3124518pgn.83.1571744829991;
 Tue, 22 Oct 2019 04:47:09 -0700 (PDT)
Date: Tue, 22 Oct 2019 19:45:04 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.5.I8247fd099947a7a67ac86479b9972ea98272f547@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, jonas@kwiboo.se, allen.chen@ite.com.tw,
 jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, tzungbi@google.com, dgreid@google.com
Subject: [alsa-devel] [PATCH 5/6] drm: bridge: it6505: report connector
	status
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

When a connector connected or disconnected, report the jack status.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 39 +++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 1d19184d2056..645d7947acc2 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -180,6 +180,10 @@ struct it6505 {
 	bool powered;
 	/* it6505 driver hold option */
 	unsigned int drv_hold;
+
+	hdmi_codec_plugged_cb plugged_cb;
+	struct device *codec_dev;
+	enum drm_connector_status last_connector_status;
 };
 
 static const struct regmap_range it6505_bridge_volatile_ranges[] = {
@@ -882,15 +886,31 @@ static const struct drm_connector_helper_funcs it6505_connector_helper_funcs = {
 	.get_modes = it6505_get_modes,
 };
 
+static void it6505_update_plugged_status(struct it6505 *it6505,
+					 enum drm_connector_status status)
+{
+	if (it6505->plugged_cb && it6505->codec_dev)
+		it6505->plugged_cb(it6505->codec_dev,
+				   status == connector_status_connected);
+}
+
 static enum drm_connector_status it6505_detect(struct drm_connector *connector,
 					       bool force)
 {
 	struct it6505 *it6505 = connector_to_it6505(connector);
+	enum drm_connector_status status;
 
 	if (gpiod_get_value(it6505->pdata.gpiod_hpd))
-		return connector_status_disconnected;
+		status = connector_status_disconnected;
+	else
+		status = connector_status_connected;
+
+	if (status != it6505->last_connector_status) {
+		it6505->last_connector_status = status;
+		it6505_update_plugged_status(it6505, status);
+	}
 
-	return connector_status_connected;
+	return status;
 }
 
 static const struct drm_connector_funcs it6505_connector_funcs = {
@@ -1341,10 +1361,23 @@ static void it6505_audio_shutdown(struct device *dev, void *data)
 	it6505->en_audio = 0;
 }
 
+static int it6505_audio_hook_plugged_cb(struct device *dev, void *data,
+					hdmi_codec_plugged_cb fn,
+					struct device *codec_dev)
+{
+	struct it6505 *it6505 = data;
+
+	it6505->plugged_cb = fn;
+	it6505->codec_dev = codec_dev;
+	it6505_update_plugged_status(it6505, it6505->last_connector_status);
+	return 0;
+}
+
 static const struct hdmi_codec_ops it6505_audio_codec_ops = {
 	.hw_params = it6505_audio_hw_params,
 	.trigger = it6505_audio_trigger,
 	.audio_shutdown = it6505_audio_shutdown,
+	.hook_plugged_cb = it6505_audio_hook_plugged_cb,
 };
 
 static int it6505_register_audio_driver(struct device *dev)
@@ -1354,6 +1387,7 @@ static int it6505_register_audio_driver(struct device *dev)
 		.ops = &it6505_audio_codec_ops,
 		.max_i2s_channels = 8,
 		.i2s = 1,
+		.data = it6505,
 	};
 	struct platform_device *pdev;
 
@@ -1364,6 +1398,7 @@ static int it6505_register_audio_driver(struct device *dev)
 		return PTR_ERR(pdev);
 
 	INIT_DELAYED_WORK(&it6505->delayed_audio, it6505_delayed_audio);
+	it6505->last_connector_status = connector_status_disconnected;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "bound to %s", HDMI_CODEC_DRV_NAME);
 	return 0;
-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
