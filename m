Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E9A6002D
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 06:29:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF401168F;
	Fri,  5 Jul 2019 06:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF401168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562300954;
	bh=HHYEweet7KT7b9dpbwwpqI73uRRXC8sTkBssDgikzp4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BlTXjIHNBpUn2iHIWytXn9g3hbw3l+t/z6/IXUZ3wOC6D6YPqI8z4zVk2w1aSjkL0
	 5ySiKu4QVSVC6g0Gl2BmswNMvEcpDUcmhK7G01oheRJ3x+MDK+gtSM+xs+Qrua451I
	 8EYD6D4SQxppHxI0e/xD6gP1cglq+zWMnmNQ2Nfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1152F8013F;
	Fri,  5 Jul 2019 06:26:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13765F80137; Fri,  5 Jul 2019 06:26:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_PDS_NO_HELO_DNS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEEBEF80133
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 06:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEEBEF80133
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="nMtfntFD"
Received: by mail-pf1-x442.google.com with SMTP id y15so3726434pfn.5
 for <alsa-devel@alsa-project.org>; Thu, 04 Jul 2019 21:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+3G7gaXEJuSaVZO7JAbYh3wKp+iQz6Nh9jSGcVM+k6U=;
 b=nMtfntFDTuoSfK9/VFf/q1vvFv3BHdF9zSOETr3vqyb6NzVWs4/fbfev94T09R+aUd
 3vNBcFB033ya7IZyhwEjfeccLxwKb4rNzeYxICCdJ6mDfnK8h5MLTINtR+qH1dqoaGr8
 WFkvrCy91KPXVRYCKm4om3V826Sg44F5rrCGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+3G7gaXEJuSaVZO7JAbYh3wKp+iQz6Nh9jSGcVM+k6U=;
 b=AUajg3MeE8m7+WAc8BXNY7D7/945tJwucE20FyZWRseomCk+a8PDS0f6AL0GuLLUyg
 FbJCJXgow6v7NQaUr0urMXSsmr6cjzvWpAJdQru3sUElOIimx789+qKgwdcEYQtbtPEt
 ikwUtGhYPAGB+xSDdNmjf7D1pMnPbyiSN83ejvpLWnvWbpE0l/rPnbniHVHJoGNqdKfy
 4ueRNnN+6jlgvipSAsRYs6zBHCEM14A/0zgUgX+pKkbRQ907CEi51/4dgkCEuS1DGIyq
 IGuSkeDyKielqu7ZQbjKsFsWTriuS/adwXh1/6fhJFCj/5Cvl2dTk2ADp7K/ee/3p4gh
 pjJw==
X-Gm-Message-State: APjAAAVwx3o6dPbolymXXi9ClNtzYXXYor9LxRm3/JqBeGMGC4XDGlZo
 88oCEMPwtN1lNzp4HZEjZ35qeg==
X-Google-Smtp-Source: APXvYqxo3SdDzWV2z9ih0ZiNNE3HnS7c3zDkLrVJE1fvL3y0/NYA0aJNny09tyDNEaQonEEmk3XdTw==
X-Received: by 2002:a65:430a:: with SMTP id j10mr2429110pgq.374.1562300804603; 
 Thu, 04 Jul 2019 21:26:44 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id b29sm17718645pfr.159.2019.07.04.21.26.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 21:26:44 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  5 Jul 2019 12:26:20 +0800
Message-Id: <20190705042623.129541-2-cychiang@chromium.org>
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
Subject: [alsa-devel] [PATCH 1/4] ASoC: hdmi-codec: Add an op to set
	callback function for plug event
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

Add an op in hdmi_codec_ops so codec driver can register callback
function to handle plug event.

Driver in DRM can use this callback function to report connector status.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 include/sound/hdmi-codec.h    | 16 +++++++++++
 sound/soc/codecs/hdmi-codec.c | 52 +++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 7fea496f1f34..26c02abb8eba 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -47,6 +47,9 @@ struct hdmi_codec_params {
 	int channels;
 };
 
+typedef void (*hdmi_codec_plugged_cb)(struct platform_device *dev,
+				      bool plugged);
+
 struct hdmi_codec_pdata;
 struct hdmi_codec_ops {
 	/*
@@ -88,6 +91,13 @@ struct hdmi_codec_ops {
 	 */
 	int (*get_dai_id)(struct snd_soc_component *comment,
 			  struct device_node *endpoint);
+
+	/*
+	 * Hook callback function to handle connector plug event.
+	 * Optional
+	 */
+	int (*hook_plugged_cb)(struct device *dev, void *data,
+			       hdmi_codec_plugged_cb fn);
 };
 
 /* HDMI codec initalization data */
@@ -99,6 +109,12 @@ struct hdmi_codec_pdata {
 	void *data;
 };
 
+struct snd_soc_component;
+struct snd_soc_jack;
+
+int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
+			       struct snd_soc_jack *jack);
+
 #define HDMI_CODEC_DRV_NAME "hdmi-audio-codec"
 
 #endif /* __HDMI_CODEC_H__ */
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 0bf1c8cad108..5e7075f78c38 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/string.h>
 #include <sound/core.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -274,6 +275,8 @@ struct hdmi_codec_priv {
 	struct snd_pcm_chmap *chmap_info;
 	unsigned int chmap_idx;
 	struct mutex lock;
+	struct snd_soc_jack *jack;
+	unsigned int jack_status;
 };
 
 static const struct snd_soc_dapm_widget hdmi_widgets[] = {
@@ -663,6 +666,55 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
+				   unsigned int jack_status)
+{
+	if (!hcp->jack)
+		return;
+
+	if (jack_status != hcp->jack_status) {
+		snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_LINEOUT);
+		hcp->jack_status = jack_status;
+	}
+}
+
+static void plugged_cb(struct platform_device *pdev, bool plugged)
+{
+	struct platform_device *codec_pdev = platform_get_drvdata(pdev);
+	struct hdmi_codec_priv *hcp = platform_get_drvdata(codec_pdev);
+
+	if (plugged)
+		hdmi_codec_jack_report(hcp, SND_JACK_LINEOUT);
+	else
+		hdmi_codec_jack_report(hcp, 0);
+}
+
+/**
+ * hdmi_codec_set_jack_detect - register HDMI plugged callback
+ * @component: the hdmi-codec instance
+ * @jack: ASoC jack to report (dis)connection events on
+ */
+int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
+			       struct snd_soc_jack *jack)
+{
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	if (hcp->hcd.ops->hook_plugged_cb) {
+		hcp->jack = jack;
+		ret = hcp->hcd.ops->hook_plugged_cb(component->dev->parent,
+						    hcp->hcd.data,
+						    plugged_cb);
+		if (ret) {
+			hcp->jack = NULL;
+			return ret;
+		}
+		return 0;
+	}
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(hdmi_codec_set_jack_detect);
+
 static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
