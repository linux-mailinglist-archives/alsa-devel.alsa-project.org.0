Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B57E6220EFC
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 16:16:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB64A1673;
	Wed, 15 Jul 2020 16:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB64A1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594822586;
	bh=LQgdzAtptqfZ+od3zO8ujDn+0Y2lc1v6nm81+2/dFkU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HsJBEua9qYA5ow8haRo2O0EjNU2q0Wj6ivn/47JdHoqu17gh4nCd66KkoXEglZ6t8
	 XteNtwQWS//Aap1pFf/kPjPGfMMJkST1ty0TBrWGuRKLGMa25nnMuTxXkfbFVNoon5
	 bNAnpEPIu9xJwADPQBOWHHP0N8K2Q+pK6u18OLWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33EE7F8028A;
	Wed, 15 Jul 2020 16:14:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0323F80227; Wed, 15 Jul 2020 16:13:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C04D1F80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 16:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C04D1F80113
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3D21A1A01F3;
 Wed, 15 Jul 2020 16:13:50 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E43AF1A0461;
 Wed, 15 Jul 2020 16:13:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 31265402E4;
 Wed, 15 Jul 2020 22:13:38 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com
Subject: [PATCH v2 1/3] ASoC: simple-card-utils: Support configure pin_name
 for asoc_simple_init_jack
Date: Wed, 15 Jul 2020 22:09:37 +0800
Message-Id: <1594822179-1849-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
References: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Currently the pin_name is fixed in asoc_simple_init_jack, but some driver
may use a different pin_name. So add a new parameter in
asoc_simple_init_jack for configuring pin_name.

If this parameter is NULL, then the default pin_name is used.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 include/sound/simple_card_utils.h     | 6 +++---
 sound/soc/generic/simple-card-utils.c | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index bbdd1542d6f1..86a1e956991e 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -12,9 +12,9 @@
 #include <sound/soc.h>
 
 #define asoc_simple_init_hp(card, sjack, prefix) \
-	asoc_simple_init_jack(card, sjack, 1, prefix)
+	asoc_simple_init_jack(card, sjack, 1, prefix, NULL)
 #define asoc_simple_init_mic(card, sjack, prefix) \
-	asoc_simple_init_jack(card, sjack, 0, prefix)
+	asoc_simple_init_jack(card, sjack, 0, prefix, NULL)
 
 struct asoc_simple_dai {
 	const char *name;
@@ -131,7 +131,7 @@ int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
 
 int asoc_simple_init_jack(struct snd_soc_card *card,
 			       struct asoc_simple_jack *sjack,
-			       int is_hp, char *prefix);
+			       int is_hp, char *prefix, char *pin);
 int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			       struct link_info *li);
 
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 8c54dc6710fe..b408cb5ed644 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -540,7 +540,8 @@ EXPORT_SYMBOL_GPL(asoc_simple_parse_pin_switches);
 
 int asoc_simple_init_jack(struct snd_soc_card *card,
 			  struct asoc_simple_jack *sjack,
-			  int is_hp, char *prefix)
+			  int is_hp, char *prefix,
+			  char *pin)
 {
 	struct device *dev = card->dev;
 	enum of_gpio_flags flags;
@@ -557,12 +558,12 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 
 	if (is_hp) {
 		snprintf(prop, sizeof(prop), "%shp-det-gpio", prefix);
-		pin_name	= "Headphones";
+		pin_name	= pin ? pin : "Headphones";
 		gpio_name	= "Headphone detection";
 		mask		= SND_JACK_HEADPHONE;
 	} else {
 		snprintf(prop, sizeof(prop), "%smic-det-gpio", prefix);
-		pin_name	= "Mic Jack";
+		pin_name	= pin ? pin : "Mic Jack";
 		gpio_name	= "Mic detection";
 		mask		= SND_JACK_MICROPHONE;
 	}
-- 
2.27.0

