Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A571E641BA
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 09:10:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47EC082C;
	Wed, 10 Jul 2019 09:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47EC082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562742651;
	bh=93mZd8I9Xu26LrqB4/xxsYcIdI4W6fWU1Usrz5JqHvM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bA7lNJwnGTUfCc78KJpjY26XOBeOWt+Cjdi61vGpC5PZfWwZzuabKbcv1bo++o9Hc
	 f6KKPw1QPngd6as6BWwEeN7pANFSdICYvdu2nRpg1x78nzGLHHIATjmN+NwmaWyCyP
	 /yOnLkIlaw9sOVU5PoTOCI2p0WdkwuFbyeMQUytk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D080F802BD;
	Wed, 10 Jul 2019 09:08:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C9BFF802D2; Wed, 10 Jul 2019 09:08:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0F07F802BD
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 09:08:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0F07F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Y62o3+/K"
Received: by mail-pg1-x541.google.com with SMTP id m4so777950pgk.0
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 00:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cCvW1ogs/lTm73TtJzo66QSUw2j4h+OYuX2M2HCPPOg=;
 b=Y62o3+/K7I0CJx/JJA7oL5mmokKI12T+OpoAueo3EaQsxnlFKh9D9x8p0vtZ6RgZjF
 sj2E1ecgK749DWhXuEWt5u5UcjCOzbSDX79v0yRmu0Yzxb8M9FQEZzjt0regbofbHgZr
 VPWXrcRfBm46ama49cSnvvqWl7G3OHY0s8+IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cCvW1ogs/lTm73TtJzo66QSUw2j4h+OYuX2M2HCPPOg=;
 b=trWDTUTAF7khEOr+kB3OFPFS2E1FTR1jVYkQt94Kk/8HU7fkxTbm+wCHvwpSV3VKpu
 0auItLsSbEEAWeO0q8Oj5cNHfkPfrqsBLZhJKWnAN623lHsbeILGFQQlU1sqxwfJcP0D
 QB14d7oeV29bVD+8dFtfhEgaeMxouMy0lAJn5LcgdVpuTKwlhOUhxVXPo7JXuRiC2Q+7
 0n+XAAt8T9QxpdkkhdTPyJMRYZxzL4m11iFSAHAREOR3iSSgyxOYVzH3cRdtH3jdtoR9
 QOKl5XvH4v6p3c1Qtwe2KJ9DPRnZSw3TVmHxhgM3N4KW2BahNV/H5ITTYUFaX9AE29KY
 pPGA==
X-Gm-Message-State: APjAAAXtG/lsiF+MekCnDaBiaYnRMEM4hABUWFObiilgDnD/CCVAVHBK
 fL8Z6YMk8vnLYzgQTOg9hO1uLA==
X-Google-Smtp-Source: APXvYqyCqmkAcoKWAbwVtBp5p87wBXU2Zz+9ASx1Yaceqm53V/HNiYKnnezjpL3xe0B/FfDaIEOdCQ==
X-Received: by 2002:a63:5610:: with SMTP id k16mr35557003pgb.335.1562742506079; 
 Wed, 10 Jul 2019 00:08:26 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id s7sm1000140pjn.28.2019.07.10.00.08.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 00:08:25 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 10 Jul 2019 15:07:48 +0800
Message-Id: <20190710070751.260061-2-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190710070751.260061-1-cychiang@chromium.org>
References: <20190710070751.260061-1-cychiang@chromium.org>
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
Subject: [alsa-devel] [PATCH v2 1/4] ASoC: hdmi-codec: Add an op to set
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
 include/sound/hdmi-codec.h    | 16 +++++++++++++
 sound/soc/codecs/hdmi-codec.c | 45 +++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 7fea496f1f34..9a8661680256 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -47,6 +47,9 @@ struct hdmi_codec_params {
 	int channels;
 };
 
+typedef void (*hdmi_codec_plugged_cb)(struct device *dev,
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
index 0bf1c8cad108..32bf7441be5c 100644
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
@@ -663,6 +666,48 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
+				   unsigned int jack_status)
+{
+	if (hcp->jack && jack_status != hcp->jack_status) {
+		snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_LINEOUT);
+		hcp->jack_status = jack_status;
+	}
+}
+
+static void plugged_cb(struct device *dev, bool plugged)
+{
+	struct hdmi_codec_priv *hcp = dev_get_drvdata(dev);
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
+	int ret = -EOPNOTSUPP;
+
+	if (hcp->hcd.ops->hook_plugged_cb) {
+		hcp->jack = jack;
+		ret = hcp->hcd.ops->hook_plugged_cb(component->dev->parent,
+						    hcp->hcd.data,
+						    plugged_cb);
+		if (ret)
+			hcp->jack = NULL;
+	}
+	return ret;
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
