Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1698129883
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2019 16:51:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3972A1683;
	Mon, 23 Dec 2019 16:50:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3972A1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577116276;
	bh=pm8DZcpgZSs/ExLqOjuQyr03ocrsB1qStefH3DZJSjM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zv/7OE8M1796tRrdQT4+9GW7p2ZTziJqC9NCrmwv8kcNh8u7WHMCPrtVJ4s8awLXF
	 d1ahU3vQlAzfdTS8wJwp1rUUJFkDfE4L5UW/G05lFqnhRF8mn5y97OWUjI7yabvpv/
	 J6ZuTOVth+tS9cm+BYa74Qcg8bosQVAUymCsmOzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80E6AF80271;
	Mon, 23 Dec 2019 16:48:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB7D7F8012F; Mon, 23 Dec 2019 16:48:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from node.akkea.ca (node.akkea.ca [192.155.83.177])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46A68F80130
 for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2019 16:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46A68F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="OQheLzYK"; 
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="OQheLzYK"
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id A26024E201A;
 Mon, 23 Dec 2019 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1577116074; bh=WqmvSpCpKdfEKGMrhNPJ7uiAMSHmxyw8X3Se1/YVDR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=OQheLzYKE9s1TnbenSYyXx03UE/6UOn2CCyMI4T/mbVfdzkd4u2rjMOV+MKqt5yim
 AtPEgyto7OeFqdkjr3306FXxQM4C1MA5bYZqjerTPr6qBo08H+Gm2IQrObiBWt8Q3k
 TMec4N1J32ByymT/QeeBi/Enptz8ZX+61ABIr32E=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W_oXF-J36k12; Mon, 23 Dec 2019 15:47:54 +0000 (UTC)
Received: from midas.localdomain (S0106788a2041785e.gv.shawcable.net
 [70.66.86.75])
 by node.akkea.ca (Postfix) with ESMTPSA id 1AD9E4E2006;
 Mon, 23 Dec 2019 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1577116074; bh=WqmvSpCpKdfEKGMrhNPJ7uiAMSHmxyw8X3Se1/YVDR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=OQheLzYKE9s1TnbenSYyXx03UE/6UOn2CCyMI4T/mbVfdzkd4u2rjMOV+MKqt5yim
 AtPEgyto7OeFqdkjr3306FXxQM4C1MA5bYZqjerTPr6qBo08H+Gm2IQrObiBWt8Q3k
 TMec4N1J32ByymT/QeeBi/Enptz8ZX+61ABIr32E=
From: "Angus Ainslie (Purism)" <angus@akkea.ca>
To: broonie@kernel.org
Date: Mon, 23 Dec 2019 07:47:11 -0800
Message-Id: <20191223154712.18581-2-angus@akkea.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223154712.18581-1-angus@akkea.ca>
References: <20191223154712.18581-1-angus@akkea.ca>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, kernel@puri.sm,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v4 1/2] ASoC: gtm601: add Broadmobi bm818 sound
	profile
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The Broadmobi bm818 uses stereo sound at 48Khz sample rate

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 sound/soc/codecs/gtm601.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/gtm601.c b/sound/soc/codecs/gtm601.c
index d454294c8d06..7f05ebcb88d1 100644
--- a/sound/soc/codecs/gtm601.c
+++ b/sound/soc/codecs/gtm601.c
@@ -13,7 +13,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/device.h>
+#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/initval.h>
@@ -47,6 +47,24 @@ static struct snd_soc_dai_driver gtm601_dai = {
 	},
 };
 
+static struct snd_soc_dai_driver bm818_dai = {
+	.name = "bm818",
+	.playback = {
+		.stream_name = "Playback",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	},
+	.capture = {
+		.stream_name = "Capture",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	},
+};
+
 static const struct snd_soc_component_driver soc_component_dev_gtm601 = {
 	.dapm_widgets		= gtm601_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(gtm601_dapm_widgets),
@@ -60,13 +78,19 @@ static const struct snd_soc_component_driver soc_component_dev_gtm601 = {
 
 static int gtm601_platform_probe(struct platform_device *pdev)
 {
+	const struct snd_soc_dai_driver *dai_driver;
+
+	dai_driver = of_device_get_match_data(&pdev->dev);
+
 	return devm_snd_soc_register_component(&pdev->dev,
-			&soc_component_dev_gtm601, &gtm601_dai, 1);
+			&soc_component_dev_gtm601,
+			(struct snd_soc_dai_driver *)dai_driver, 1);
 }
 
 #if defined(CONFIG_OF)
 static const struct of_device_id gtm601_codec_of_match[] = {
-	{ .compatible = "option,gtm601", },
+	{ .compatible = "option,gtm601", .data = (void *)&gtm601_dai },
+	{ .compatible = "broadmobi,bm818", .data = (void *)&bm818_dai },
 	{},
 };
 MODULE_DEVICE_TABLE(of, gtm601_codec_of_match);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
