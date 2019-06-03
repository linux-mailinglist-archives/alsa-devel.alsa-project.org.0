Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CBA327C1
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 06:36:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD030168E;
	Mon,  3 Jun 2019 06:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD030168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559536591;
	bh=KJC/uNUzVoOwDt1PDt3hgbFlPSi/hLAdPFCtPclsAbM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f8HN7MrU2HNjCRYek4ekjP9in6xMGcEd8c5MYwE/F331yDX08zznDLbHf2AZxMi0u
	 xHJAvmSfscv0CwjFbKXDyatpe35Z3kVdMdhiKVXPhwHacBxH0U3TZPtvKazD1WdIIj
	 gwnUVNXCSo/KOWs7Dr+itYfuMT4emH/QwUaKyi4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91938F8973B;
	Mon,  3 Jun 2019 06:33:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B358DF89739; Mon,  3 Jun 2019 06:33:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B5BDF89735
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 06:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B5BDF89735
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="KJJ1x0++"
Received: by mail-pl1-x643.google.com with SMTP id g21so6474815plq.0
 for <alsa-devel@alsa-project.org>; Sun, 02 Jun 2019 21:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=THpWWd94tGmQN+NdFGT3/k0LHquClB5/KK663N0sln0=;
 b=KJJ1x0++tPXhvMrHIIn+IkJ/vK8nkc8NHbB2D6JxfEvO7fQ7JvXfP5vQQym4cUZid7
 eXWRl+urkk59DTsjUfW4h8UzpjNysutkrDV8SjNkxUyhnoYvWF9oflHr5Gj4oI4wI2dE
 aKzJPUU63kjAbR5g+z6/OO2IamS68nQduWMvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=THpWWd94tGmQN+NdFGT3/k0LHquClB5/KK663N0sln0=;
 b=KeImZ7qEIddszF9R2QWjsdpSqb9tr2DujIWWixPwpNM2UskHEb+E4+94lxAB69heZs
 aG+qJNcc6mE4dIzxTlncbkgeEi4D+CDLP++MgR6t+rIWdogWF77vshmawJ/RRMGMmp6x
 GNPOdktziTktbXEFgMyzb/gy1pNdNB2u12wmGTbZdjMVoVH8p4e/A/aPhM2qTyMJUKk3
 BhCa04vn4wQpotpcoFCiU4X89BKwvEft5a9ffAsAQV42pVmQ3vqQ9+Zgs+doT7mrt4zt
 +Apj1Ut3kOgNIYXHaG2D8BD8f+435ejKgUCIaJQgnSFFmZLAb6hEc2u1EoDmBfxlJ2mf
 3mhQ==
X-Gm-Message-State: APjAAAWegpw2doBsExvOe0qZh+vBi4+tN+KgviYn/NaN4bd4KmTAb4XP
 BDUqzOwt/cs8Q2rgVXfGTV0Hsw==
X-Google-Smtp-Source: APXvYqwws/fG+++4fl7pwkP7whHCh5KwVv/jHX0W+ARw9Qav4UnXZIe+8/mlxxK/nHoVLY0RrHtTyw==
X-Received: by 2002:a17:902:7591:: with SMTP id
 j17mr27660314pll.200.1559536416450; 
 Sun, 02 Jun 2019 21:33:36 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id i25sm13348782pfr.73.2019.06.02.21.33.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 21:33:35 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Mon,  3 Jun 2019 12:32:46 +0800
Message-Id: <20190603043251.226549-3-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190603043251.226549-1-cychiang@chromium.org>
References: <20190603043251.226549-1-cychiang@chromium.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: [alsa-devel] [PATCH 2/7] ASoC: hdmi-codec: use HDMI state notifier
	to add jack support
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

From: Philipp Zabel <p.zabel@pengutronix.de>

Use HDMI connection / disconnection notifications to update an ALSA
jack object. Also make a copy of the ELD block after every change.

This was posted by Philipp Zabel at

https://patchwork.kernel.org/patch/9430747/

Modified by Cheng-Yi Chiang:
- Fix the conflict of removed hdmi_codec_remove ops.
- Other minor fix for the conflict with latest hdmi-codec on ASoC
  for-next tree.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
The original patch is at https://patchwork.kernel.org/patch/9430747/
I could not find the LKML link for the patch.

 include/sound/hdmi-codec.h    |   7 +++
 sound/soc/codecs/Kconfig      |   1 +
 sound/soc/codecs/hdmi-codec.c | 104 +++++++++++++++++++++++++++++++++-
 3 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 9483c55f871b..4fa39c93363f 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -107,6 +107,13 @@ struct hdmi_codec_pdata {
 	void *data;
 };
 
+struct snd_soc_component;
+struct snd_soc_jack;
+
+int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
+			       struct snd_soc_jack *jack,
+			       struct device *dev);
+
 #define HDMI_CODEC_DRV_NAME "hdmi-audio-codec"
 
 #endif /* __HDMI_CODEC_H__ */
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 8f577258080b..f5f6dd04234c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -639,6 +639,7 @@ config SND_SOC_HDMI_CODEC
 	select SND_PCM_ELD
 	select SND_PCM_IEC958
 	select HDMI
+	select HDMI_NOTIFIERS
 
 config SND_SOC_ES7134
        tristate "Everest Semi ES7134 CODEC"
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 6a0cc8d7e141..fe796a7475a5 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -12,9 +12,12 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
  * General Public License for more details.
  */
+#include <linux/hdmi-notifier.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/string.h>
 #include <sound/core.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -282,6 +285,13 @@ struct hdmi_codec_priv {
 	struct snd_pcm_chmap *chmap_info;
 	unsigned int chmap_idx;
 	struct mutex lock;
+	struct snd_soc_jack *jack;
+	/* Lock to protect setting and getting eld. */
+	struct mutex eld_lock;
+	struct device *dev;
+	struct hdmi_notifier *notifier;
+	struct notifier_block nb;
+	unsigned int jack_status;
 };
 
 static const struct snd_soc_dapm_widget hdmi_widgets[] = {
@@ -308,7 +318,9 @@ static int hdmi_eld_ctl_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
 
+	mutex_lock(&hcp->eld_lock);
 	memcpy(ucontrol->value.bytes.data, hcp->eld, sizeof(hcp->eld));
+	mutex_unlock(&hcp->eld_lock);
 
 	return 0;
 }
@@ -393,7 +405,7 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
-	int ret = 0;
+	int ret;
 
 	ret = mutex_trylock(&hcp->lock);
 	if (!ret) {
@@ -408,9 +420,9 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	}
 
 	if (hcp->hcd.ops->get_eld) {
+		mutex_lock(&hcp->eld_lock);
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
-
 		if (!ret) {
 			ret = snd_pcm_hw_constraint_eld(substream->runtime,
 							hcp->eld);
@@ -419,6 +431,7 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 		}
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
+		mutex_unlock(&hcp->eld_lock);
 	}
 	return 0;
 
@@ -747,6 +760,77 @@ static const struct snd_soc_component_driver hdmi_driver = {
 	.non_legacy_dai_naming	= 1,
 };
 
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
+static int hdmi_codec_notify(struct notifier_block *nb, unsigned long event,
+			     void *data)
+{
+	struct hdmi_codec_priv *hcp = container_of(nb, struct hdmi_codec_priv,
+						   nb);
+	struct hdmi_notifier *n = data;
+
+	if (!hcp->jack)
+		return NOTIFY_OK;
+
+	switch (event) {
+	case HDMI_NEW_ELD:
+		mutex_lock(&hcp->eld_lock);
+		memcpy(hcp->eld, n->eld, sizeof(hcp->eld));
+		mutex_unlock(&hcp->eld_lock);
+		/* fall through */
+	case HDMI_CONNECTED:
+		hdmi_codec_jack_report(hcp, SND_JACK_LINEOUT);
+		break;
+	case HDMI_DISCONNECTED:
+		hdmi_codec_jack_report(hcp, 0);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+/**
+ * hdmi_codec_set_jack_detect - register HDMI state notifier callback
+ * @component: the hdmi-codec instance
+ * @jack: ASoC jack to report (dis)connection events on
+ * @dev: hdmi_notifier device, usually HDMI_TX or CEC device
+ */
+int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
+			       struct snd_soc_jack *jack,
+			       struct device *dev)
+{
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	hcp->notifier = hdmi_notifier_get(dev);
+	if (!hcp->notifier)
+		return -ENOMEM;
+
+	hcp->jack = jack;
+	hcp->nb.notifier_call = hdmi_codec_notify;
+	ret = hdmi_notifier_register(hcp->notifier, &hcp->nb);
+	if (ret)
+		goto err_notifier_put;
+
+	return 0;
+
+err_notifier_put:
+	hdmi_notifier_put(hcp->notifier);
+	hcp->notifier = NULL;
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hdmi_codec_set_jack_detect);
+
 static int hdmi_codec_probe(struct platform_device *pdev)
 {
 	struct hdmi_codec_pdata *hcd = pdev->dev.platform_data;
@@ -774,6 +858,7 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 
 	hcp->hcd = *hcd;
 	mutex_init(&hcp->lock);
+	mutex_init(&hcp->eld_lock);
 
 	daidrv = devm_kcalloc(dev, dai_count, sizeof(*daidrv), GFP_KERNEL);
 	if (!daidrv)
@@ -797,6 +882,20 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 			__func__, ret);
 		return ret;
 	}
+
+	hcp->dev = dev;
+
+	return 0;
+}
+
+static int hdmi_codec_remove(struct platform_device *pdev)
+{
+	struct hdmi_codec_priv *hcp = platform_get_drvdata(pdev);
+
+	if (hcp->notifier) {
+		hdmi_notifier_unregister(hcp->notifier, &hcp->nb);
+		hdmi_notifier_put(hcp->notifier);
+	}
 	return 0;
 }
 
@@ -805,6 +904,7 @@ static struct platform_driver hdmi_codec_driver = {
 		.name = HDMI_CODEC_DRV_NAME,
 	},
 	.probe = hdmi_codec_probe,
+	.remove = hdmi_codec_remove,
 };
 
 module_platform_driver(hdmi_codec_driver);
-- 
2.22.0.rc1.257.g3120a18244-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
