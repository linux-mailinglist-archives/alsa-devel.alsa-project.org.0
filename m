Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC64A60032
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 06:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F8B216A2;
	Fri,  5 Jul 2019 06:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F8B216A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562301069;
	bh=1hVv8dkfwH0HApnAsullH9r/ehkgoz7YFIvlk+0whOw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pdpeb5raVuGqLDK3uZioBGBmGNE7BaAEuptZk03ruChMEClJhj1gTP/pO1d+Bpbfx
	 YbNHL1Ge+vEtyx9xtbS04oJ1D0fwh2HYb+IqzehUAT6449jn0PknS5aFp/rEgf02JY
	 CLcY/+mgigIl6UdcaVqXHqhUqk4R0dwshN3Rgejo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FA74F80171;
	Fri,  5 Jul 2019 06:27:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08CDEF8015A; Fri,  5 Jul 2019 06:27:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_PDS_NO_HELO_DNS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7E8AF80145
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 06:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7E8AF80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Hbexc+aC"
Received: by mail-pg1-x542.google.com with SMTP id u17so3211799pgi.6
 for <alsa-devel@alsa-project.org>; Thu, 04 Jul 2019 21:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mt+OhzkdZXuABUeOm3oIQQxV+A0uMRzmq60uCRJmAJE=;
 b=Hbexc+aCBum/RZ12dI3r5/XyzyiK+MvJQgQ2XO3/HVioP3PM/nCddAlz1xrMohN7M1
 S0TUfchH1at/5Y1i17XhZAcSUqCKCip2aybO7YsuTVjIwJXSYImaa+d0n/+JHH0FYNkL
 NI0/aW8eXuQCvg6kpGPrNaIfIBqJ7QUDBMvFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mt+OhzkdZXuABUeOm3oIQQxV+A0uMRzmq60uCRJmAJE=;
 b=tAGQoJNVEmzAvTzhAJWC16IynLApYI0O44IkF35UmDjlvenc1JzxlT0c4OAwpMJU/A
 6D8DnZ17YlI80C/7aOLdk+oqbLCpKK+TwoSyW/1kyaSzAfGNTbfAu+XCBGpMlUUMmcsp
 7diW1Tw3ajlLBdtCEhadCkWo762ZOpTit+RFWjNnBjbbnGCm/+svGBSfr85LwPYzaDPh
 IB5wylY6GURKJZ7Pvwmu2dKCZqZ1zq1YirVVGjV2g3aAyFi6pdkoSZf0i1Nub2Dve3kJ
 7YfJ/T3YQkIizlIBBl3Y5O8P4KuFKEqGpqFVBCqqQoaeD4zBZT90Vueq905kC3+1oE8z
 F1/Q==
X-Gm-Message-State: APjAAAVzSZk/BQ27V2Io0wcNqxcQPADz2wRgb6rq5P+z40u5dpJYtPWM
 u/o4/h3YiyO3LMDCsnnBnkXlIg==
X-Google-Smtp-Source: APXvYqywd4tkamYO1Fai6BvXNjXkhsYojIRkBX4/rKYkl5GdlfV7TnbJIDpy2ZVfWAPldm8d1RwzHA==
X-Received: by 2002:a17:90a:8d86:: with SMTP id
 d6mr2081909pjo.94.1562300823498; 
 Thu, 04 Jul 2019 21:27:03 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id t10sm6811920pjr.13.2019.07.04.21.27.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 21:27:02 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  5 Jul 2019 12:26:23 +0800
Message-Id: <20190705042623.129541-5-cychiang@chromium.org>
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
Subject: [alsa-devel] [PATCH 4/4] ASoC: rockchip_max98090: Add HDMI jack
	support
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

In machine driver, create a jack and let hdmi-codec report jack status.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/rockchip/rockchip_max98090.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 195309d1225a..c0e430ca4d12 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -15,6 +15,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <sound/hdmi-codec.h>
 
 #include "rockchip_i2s.h"
 #include "../codecs/ts3a227e.h"
@@ -129,6 +130,25 @@ enum {
 	DAILINK_HDMI,
 };
 
+static struct snd_soc_jack rk_hdmi_jack;
+
+static int rk_hdmi_init(struct snd_soc_pcm_runtime *runtime)
+{
+	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_component *component = runtime->codec_dai->component;
+	int ret;
+
+	/* enable jack detection */
+	ret = snd_soc_card_jack_new(card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &rk_hdmi_jack, NULL, 0);
+	if (ret) {
+		dev_err(card->dev, "Can't new HDMI Jack %d\n", ret);
+		return ret;
+	}
+
+	return hdmi_codec_set_jack_detect(component, &rk_hdmi_jack);
+}
+
 /* max98090 and HDMI codec dai_link */
 static struct snd_soc_dai_link rk_dailinks[] = {
 	[DAILINK_MAX98090] = {
@@ -146,6 +166,7 @@ static struct snd_soc_dai_link rk_dailinks[] = {
 		.ops = &rk_aif1_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
+		.init = rk_hdmi_init,
 		SND_SOC_DAILINK_REG(hdmi),
 	}
 };
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
