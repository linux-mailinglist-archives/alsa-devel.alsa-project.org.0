Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D3C152894
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 10:41:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1020916A0;
	Wed,  5 Feb 2020 10:40:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1020916A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580895692;
	bh=uzq0zuDqOYCJ90ejD0z8FRESahyYoUZEm6jpVbv5GDg=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n7u93JkLT4o46yKVhBLLEqdK63DZ2/jtnKCO1xBGTg5/82gqpeGRWmF+nvtmiZikF
	 3m1b4PRXYcx3dYCR8mNYWrkkixbd/ibmgOqledaC8WKCKqTL6IVeAuiyEkFlRw7FP+
	 qqX7EW05sqpZwtDBs4hbVnFlSDMui9wFiuRTeok8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 941EDF8027B;
	Wed,  5 Feb 2020 10:38:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E02DF80279; Wed,  5 Feb 2020 10:38:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7385EF80277
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 10:38:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7385EF80277
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="bbLPD11p"
Received: by mail-qk1-x749.google.com with SMTP id m13so888538qka.9
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 01:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=3xSqtFmkuhmH7fZvAamf8hbYq+ufSxebJYVWVye4C7Y=;
 b=bbLPD11pJNP7z0qv5E33IZM/9P32aN1BiTDiclSD91ktgW9ymyd0g4owTP4KK+LwzR
 K+WhzY9i2aokt6o2xdpnl66xUsaFQ/cDWKeK+44fu2Pbcy4K9+6h5BaapO4wA5UWfHnl
 qbqglmyx1tjGdqR9cBn07Y7vtOUMKq+ekzWw0ihual64ADtttR8wm0JHH22mQjQLk9tZ
 EVwoS/Og+xRMjTYucYE69Vgyhtn/5WFTpOFLwW0YekDxIDgqEr9i0CBXDjAlmbK9emD5
 7EQH5+S2WcyAw6vWVOxga4H6jbS447UNf1GPb9C0PdxteybJaxwfpgzXs94lyNCrOIN2
 Hq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=3xSqtFmkuhmH7fZvAamf8hbYq+ufSxebJYVWVye4C7Y=;
 b=U6jcq6Z3NeAx23Glf73Yt5y0zzfFjrdk3zOMu5wZ+lxBenigbGLbagGSHHpSd7C476
 UR2p/Gr34+xUFBWix9MboJWmOUUfaQ+6D8l2ybop4NK76fSoBDZgquNCCXOGicI09cfn
 BiAqA5SBfGm4ai8Spx8223EcZmKnOufd/Ir0XFq9gDM5dxfEBd5Wnqk6axqs5KAzuAx5
 fDgtYZ+8fdi1DRnBGsEQje9EmmkBJ/M3fK62jw7LGC3YZoS7gQtVlgenYN0vd1ysPx1F
 H9wjUusHK1urocafpwouVeY3vd73oI/shTGRfVDsrSCMUmPSxXufnoXkp1ka1n8v7i3v
 ToPw==
X-Gm-Message-State: APjAAAXEyvp8w6L3xy1WdGA5JJqKg5ip5YLZGPdqrWk1IjFDTh8ZjPjZ
 B3mMaGyquxnxt2acAS4+98d+yXuoqJ1P
X-Google-Smtp-Source: APXvYqx2aVafJaBi4FAJbVRsUMEjozIunQWr9coCiHXvYR3Vgt99h+edhRyud9ckFrhlWW7s5OKnOxs8PRRW
X-Received: by 2002:a05:620a:2043:: with SMTP id
 d3mr32700550qka.279.1580895496183; 
 Wed, 05 Feb 2020 01:38:16 -0800 (PST)
Date: Wed,  5 Feb 2020 17:37:45 +0800
In-Reply-To: <20200205093745.79298-1-tzungbi@google.com>
Message-Id: <20200205170416.3.I253f51edff62df1d88005de12ba601aa029b1e99@changeid>
Mime-Version: 1.0
References: <20200205093745.79298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 3/3] ASoC: mediatek: mt8173-rt5650: support
	HDMI jack reporting
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

Uses hdmi-codec to support HDMI jack reporting.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index ef6f23675286..849b050a54d1 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -11,6 +11,7 @@
 #include <linux/of_gpio.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
+#include <sound/hdmi-codec.h>
 #include "../../codecs/rt5645.h"
 
 #define MCLK_FOR_CODECS		12288000
@@ -98,7 +99,7 @@ static const struct snd_soc_ops mt8173_rt5650_ops = {
 	.hw_params = mt8173_rt5650_hw_params,
 };
 
-static struct snd_soc_jack mt8173_rt5650_jack;
+static struct snd_soc_jack mt8173_rt5650_jack, mt8173_rt5650_hdmi_jack;
 
 static int mt8173_rt5650_init(struct snd_soc_pcm_runtime *runtime)
 {
@@ -144,6 +145,19 @@ static int mt8173_rt5650_init(struct snd_soc_pcm_runtime *runtime)
 				      &mt8173_rt5650_jack);
 }
 
+static int mt8173_rt5650_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &mt8173_rt5650_hdmi_jack, NULL, 0);
+	if (ret)
+		return ret;
+
+	return hdmi_codec_set_jack_detect(rtd->codec_dai->component,
+					  &mt8173_rt5650_hdmi_jack);
+}
+
 enum {
 	DAI_LINK_PLAYBACK,
 	DAI_LINK_CAPTURE,
@@ -222,6 +236,7 @@ static struct snd_soc_dai_link mt8173_rt5650_dais[] = {
 		.name = "HDMI BE",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
+		.init = mt8173_rt5650_hdmi_init,
 		SND_SOC_DAILINK_REG(hdmi_be),
 	},
 };
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
