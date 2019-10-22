Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B33E5E0370
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 13:52:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D9CA1615;
	Tue, 22 Oct 2019 13:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D9CA1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571745166;
	bh=msQutKE0gaRKz5XyWtPqV0LkfAk0knzx1DPpoyZfNAc=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I1cpJQZaGpbRGUrjf7PPk/ptxF3PK0dv0WZyw7/21cCJLNrv/ztxkSR2v+1Qhc5LG
	 fHopHUXBzzbdN9zJOwuKHhKImK25RnZpGdXLw1sQmrT3y+GrQP68VkAxcsBlCcRFkN
	 dIO4wTbZzCe5QvuwPcfIWkL1QZG5TU6gwp6UuQuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2754F8065C;
	Tue, 22 Oct 2019 13:47:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69509F8065A; Tue, 22 Oct 2019 13:47:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D768BF8064C
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 13:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D768BF8064C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="DIDqCZeA"
Received: by mail-qt1-x84a.google.com with SMTP id u23so13725918qtb.22
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 04:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=T48tWlGrH2z44TnaLtsbXFIJ8HnlGaqO67n3JM09Qog=;
 b=DIDqCZeA05PLNKgdNR65FcBeK7ZuNM7RI1WYpop1VdWJpSktWHN7BLQmxoJ95oSoOj
 ocZM3wTXiXYuUAVS3FEX93PO9ufyw6CP5i+YYDPIty/fxPlMSKCcXkNPvmNBh84O7ji3
 RblCbKUAZNaBzTtr/pR/axxmyCdv692dB/bTcDeCPKl3MVNMNqRZbJ6Z/adaA3BTYQrS
 w5zSQ7dCbF1AqeSzyQTOSzMWPMjCvxo9vc1bzvGXkIvJQhoNDrBnxJUZLg5JCENpRl9s
 Zpbj++fZL3ZTMl0SHwrvyNXSlunWa1bW5Nlgh/uS0SUoUVN8gBsUbUseQXGQ57MR3Sxq
 8QlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=T48tWlGrH2z44TnaLtsbXFIJ8HnlGaqO67n3JM09Qog=;
 b=mKETzZXy7HDpZ9YCQtf0kWdS5FDRpcDJyY89m5WdX/hfvMCDoGsh2W1Kj5mdpvwMh/
 vYWe/C2EEMv/q2plYCMA/wfaxJCa1quzrTmgdwgLG1bKrbbvmHEcZNe5v9zcbrz3IWx9
 b1l/CnyIJKrjxmUd5grALtg/mr9VzItxzgjTjP05rS5+JXSlYRy8cdhK8w7/jizqhw3J
 87dZNpxK7a8P0fWeaPksckX4NoYj62zLQMJiMxCAfP7ZFOtzyQq7Vd4PZVXGvHTVNIfN
 3JQ9PZSfaKzCOloJCCf2+yzADdvbQt9t5i0NR9N21bq6bZeYpFE5uS6d1V6ztD8ffMXA
 wHBw==
X-Gm-Message-State: APjAAAU1W0G+Oup0Zx+jnafuZZlBUQwYin87+Qz0EHuA6/1ZP86IxNPx
 zKYUvWcavPNYfai2EgcCB8xmc1QacaqS
X-Google-Smtp-Source: APXvYqzLdQNX1Nkvs2wlFXNLo0RhFNgzd7th7BWIbuHvGPweK4oFS5GnrmsAHjH7EiF1oJZrrO6Xb3PQN00l
X-Received: by 2002:a0c:b59b:: with SMTP id g27mr2657124qve.184.1571744835079; 
 Tue, 22 Oct 2019 04:47:15 -0700 (PDT)
Date: Tue, 22 Oct 2019 19:45:05 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.6.I2e59e084bcd3aa34a651a7279bc63400e818cf0f@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, jonas@kwiboo.se, allen.chen@ite.com.tw,
 jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, tzungbi@google.com, dgreid@google.com
Subject: [alsa-devel] [PATCH 6/6] ASoC: mediatek: mt8183: support HDMI jack
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

Support HDMI jack reporting.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/Kconfig                    |  3 ++-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 20 ++++++++++++++++++-
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 8b29f3979899..0d8d75c5f984 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -126,9 +126,10 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
 	select SND_SOC_BT_SCO
 	select SND_SOC_TS3A227E
 	select SND_SOC_CROS_EC_CODEC
+	select SND_SOC_HDMI_CODEC
 	help
 	  This adds ASoC driver for Mediatek MT8183 boards
-	  with the MT6358 TS3A227E MAX98357A audio codec.
+	  with the MT6358 TS3A227E MAX98357A audio codec and HDMI codec.
 	  Select Y if you have such device.
 	  If unsure select "N".
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 258f1416fae1..23305dd2f958 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -11,6 +11,7 @@
 #include <sound/soc.h>
 #include <sound/jack.h>
 #include <linux/pinctrl/consumer.h>
+#include <sound/hdmi-codec.h>
 
 #include "mt8183-afe-common.h"
 #include "../../codecs/ts3a227e.h"
@@ -30,7 +31,7 @@ static const char * const mt8183_pin_str[PIN_STATE_MAX] = {
 struct mt8183_mt6358_ts3a227_max98357_priv {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pin_states[PIN_STATE_MAX];
-	struct snd_soc_jack headset_jack;
+	struct snd_soc_jack headset_jack, hdmi_jack;
 };
 
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
@@ -270,6 +271,22 @@ static const struct snd_soc_ops mt8183_mt6358_ts3a227_max98357_wov_ops = {
 	.shutdown = mt8183_mt6358_ts3a227_max98357_wov_shutdown,
 };
 
+static int
+mt8183_mt6358_ts3a227_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &priv->hdmi_jack, NULL, 0);
+	if (ret)
+		return ret;
+
+	return hdmi_codec_set_jack_detect(rtd->codec_dai->component,
+					  &priv->hdmi_jack);
+}
+
 static struct snd_soc_dai_link
 mt8183_mt6358_ts3a227_max98357_dai_links[] = {
 	/* FE */
@@ -436,6 +453,7 @@ mt8183_mt6358_ts3a227_max98357_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_tdm_ops,
+		.init = mt8183_mt6358_ts3a227_max98357_hdmi_init,
 		SND_SOC_DAILINK_REG(tdm),
 	},
 };
-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
