Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CB7AA2AB
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 14:06:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 736F61689;
	Thu,  5 Sep 2019 14:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 736F61689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567685207;
	bh=vUJTuJFDSHb1gdVFpPkeg1/im8F2QO7S/XHiwlIOpUo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b3d0/binExGxEudBvmwUpDkjCWcEacmVSbS4h8RP8X6sL5bLM0jFluEKndjkItcGX
	 vxd1gsCGE4hiGSLx+pe039kcfa6cJpWY27OxMHOnywkZJLT+16TSC7D9sxGLYfIvuH
	 47C/3Sn/L2jYR33E8rf2e4zW13Emm+gw7b4yL7Xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDA27F8063B;
	Thu,  5 Sep 2019 14:01:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFDC0F805FF; Thu,  5 Sep 2019 14:01:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4068FF80448
 for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2019 14:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4068FF80448
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="bZvoaN8k"
Received: by mail-wr1-x441.google.com with SMTP id h7so1441628wrw.8
 for <alsa-devel@alsa-project.org>; Thu, 05 Sep 2019 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cwIBL4UHh/W/g2VGAibAzry/ewI4tWE5Tv7d1Udm+yA=;
 b=bZvoaN8kfBlJr557WiU4RA17OFezviTWtWGEFddijqdVU2icYp6sMDiTVcTPidBX6c
 DIHAjpnJAcmHLrnFZ4SCWBMqfwSNPA1NnA8yl0ZoteP+Zw3TZFXQGtUBrwx/4WesE+ip
 K8l5xpQwNjyH09ZncYod4oeArbPlGvBNbiIXyi5cGMRqHo3u0Qd31ig+LcKga4Rzr7Pk
 mtgMJjp93GlGrUngM0v5BNPOMf2LjPL6qDKxbbHIJtr/esoKcy52bXW8876IpwjJTxqJ
 2BkskNQ5IFxJNz6/DDQ/AwsWzTzwYmMq/0HNCUujKTaVPdYEM0CUmRBMVYJGBRzPu0Ym
 hDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cwIBL4UHh/W/g2VGAibAzry/ewI4tWE5Tv7d1Udm+yA=;
 b=GpCUQQmzfjX+EHcEQn2s36V+guX29aV/R/03FOTgL1/u/iu5WHi0rjhlPI7RcZJt02
 HaynQ+9yuweh8zqMK26yjBTZRFoqd91cuY+GS5bkz6tEcwc9GschGIkdaT0Foy357m5r
 JLOmRBzMqEtkjMmU3DffX/dN2194QjpeO66qQoobK3lQ7ajCa1LG/yWm4f6vUcFSTPkO
 db9AoZZSoC+l3FFixus1TG+xAjlUYYRoiZDYsOk/sydeuQhw8h8nQuwAqZ/LgPsvNwVR
 EFnr1gpPWdjF1ZDZ8IVQELFGLeMo+8GIkzoZLVST4SV7DBzKIpGqPk9Li0KQLNRBIfGI
 iwEA==
X-Gm-Message-State: APjAAAWJVv3uEi4HguPbdSEzg5itfyxi6XjW8q9HbAxHj1iBv/wbq0Yb
 B8Z1DLeA7eKWKeylp/kQroUhAQ==
X-Google-Smtp-Source: APXvYqzwbqkVLLSjcIoOrfnAmDwBx+OFVpJhIzJAo2/JMbRNzWLPcZyCMfUZhDW8FQH66JXu0xVWRQ==
X-Received: by 2002:a05:6000:128d:: with SMTP id
 f13mr2430516wrx.241.1567684893278; 
 Thu, 05 Sep 2019 05:01:33 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a18sm3436311wrh.25.2019.09.05.05.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 05:01:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Thu,  5 Sep 2019 14:01:17 +0200
Message-Id: <20190905120120.31752-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 5/8] ASoC: meson: tdmin: expose all 16 inputs
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

The TDMIN component, as it, has a maximum of 16 input. Depending on
the SoC, these may not all be connected.

Instead of decribing only the connected inputs of each SoC, describe
them all and let ASoC routing do the rest.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdmin.c | 47 +++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index cb87f17f3e95..973d4c02ef8d 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -43,7 +43,8 @@ static const struct regmap_config axg_tdmin_regmap_cfg = {
 };
 
 static const char * const axg_tdmin_sel_texts[] = {
-	"IN 0", "IN 1", "IN 2", "IN 3", "IN 4", "IN 5",
+	"IN 0", "IN 1", "IN 2",  "IN 3",  "IN 4",  "IN 5",  "IN 6",  "IN 7",
+	"IN 8", "IN 9", "IN 10", "IN 11", "IN 12", "IN 13", "IN 14", "IN 15",
 };
 
 /* Change to special mux control to reset dapm */
@@ -164,12 +165,22 @@ static int axg_tdmin_prepare(struct regmap *map,
 }
 
 static const struct snd_soc_dapm_widget axg_tdmin_dapm_widgets[] = {
-	SND_SOC_DAPM_AIF_IN("IN 0", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 1", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 2", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 3", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 4", NULL, 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_IN("IN 5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 0",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 1",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 2",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 3",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 4",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 5",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 6",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 7",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 8",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 9",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 10", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 11", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 12", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 13", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 14", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 15", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_MUX("SRC SEL", SND_SOC_NOPM, 0, 0, &axg_tdmin_in_mux),
 	SND_SOC_DAPM_PGA_E("DEC", SND_SOC_NOPM, 0, 0, NULL, 0,
 			   axg_tdm_formatter_event,
@@ -178,12 +189,22 @@ static const struct snd_soc_dapm_widget axg_tdmin_dapm_widgets[] = {
 };
 
 static const struct snd_soc_dapm_route axg_tdmin_dapm_routes[] = {
-	{ "SRC SEL", "IN 0", "IN 0" },
-	{ "SRC SEL", "IN 1", "IN 1" },
-	{ "SRC SEL", "IN 2", "IN 2" },
-	{ "SRC SEL", "IN 3", "IN 3" },
-	{ "SRC SEL", "IN 4", "IN 4" },
-	{ "SRC SEL", "IN 5", "IN 5" },
+	{ "SRC SEL", "IN 0",  "IN 0" },
+	{ "SRC SEL", "IN 1",  "IN 1" },
+	{ "SRC SEL", "IN 2",  "IN 2" },
+	{ "SRC SEL", "IN 3",  "IN 3" },
+	{ "SRC SEL", "IN 4",  "IN 4" },
+	{ "SRC SEL", "IN 5",  "IN 5" },
+	{ "SRC SEL", "IN 6",  "IN 6" },
+	{ "SRC SEL", "IN 7",  "IN 7" },
+	{ "SRC SEL", "IN 8",  "IN 8" },
+	{ "SRC SEL", "IN 9",  "IN 9" },
+	{ "SRC SEL", "IN 10", "IN 10" },
+	{ "SRC SEL", "IN 11", "IN 11" },
+	{ "SRC SEL", "IN 12", "IN 12" },
+	{ "SRC SEL", "IN 13", "IN 13" },
+	{ "SRC SEL", "IN 14", "IN 14" },
+	{ "SRC SEL", "IN 15", "IN 15" },
 	{ "DEC", NULL, "SRC SEL" },
 	{ "OUT", NULL, "DEC" },
 };
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
