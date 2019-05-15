Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 086451F57C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 15:20:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6997516C2;
	Wed, 15 May 2019 15:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6997516C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557926455;
	bh=W8ercEri6ERwp4bv81tD2anlcaYEYKo58Eh0c71EdBQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZorLPzPpjYz3B718J3ZcCmrPek2KmL7tPKf3Dng2w3RA9LCt+2e1Iyx9Ii7Jj6s3O
	 h7QtvpppqgrN5PtK9HhDgcBjzy2TEtASFL7IOB5hFZ8yf0DFpwZCX98jpoYa9vV17p
	 cAbwVW80XO7p/b4hiAMAffsjEOOk+GH4CTCk8T+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2BFFF80C17;
	Wed, 15 May 2019 15:19:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF8ECF896B2; Wed, 15 May 2019 15:19:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC550F80C17
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 15:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC550F80C17
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="X1lAu5ZH"
Received: by mail-wr1-x441.google.com with SMTP id b18so2626185wrq.12
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 06:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2h106Z4/ATcPU1QRPJE9+ZrjCSAT+SxJpUGNW5+ypdI=;
 b=X1lAu5ZHCCzjYghnscD0OX/jA0eMlPFEIG8XZk5dovfhL4UaTlEOtCBhFZFxVzm/Tx
 pAuVx3DJBiDzhUUHz/kN5GlFuAml795hgYaBtvabvfgbbSrUquNiIytC02wU6fj3fGpV
 INbx6MKpj3ZgfAYTSaDK2uVDCHND1QaFcBdR+pzG5vz7wuf9++VSiy/sSnyHl2lnRX4K
 iD8w9VgD4eEWjD7rTwGUzq2ueadZtVALe0cg3iNfzNm+P/LBrM1AkLpMcCw3Fcdvgogo
 fQ92LKWlhxnHDQLEc8iLHSjHlbisyKDTjc72ScH+sPXvyRVEgeAlm70JJ+g8h/ZGY0eW
 KeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2h106Z4/ATcPU1QRPJE9+ZrjCSAT+SxJpUGNW5+ypdI=;
 b=tb3l77k+y7OgIl7iG5yoAaQpwEcn8n2lUrKed99d3wFo9Yy1z+69NZ1Km5OSiDWBXw
 CvVruvuZzXTemGs/6vHtcqiowWzMHwRNIP7Z3rTL0Z1BcP7PBZZbZNMJlG+0mI28KDVL
 j6QAXBJxB2mZYJ1ipGimn8zM95bx5TshLvB7gA711YToZNU1t1H70BlO8fyTlwHh/w+6
 5N5+vI6OEEgS3ES7AB7OzGaU/vTzrrIcP9u3cQooJnCKDh9/L7GVdUZrcehPuD/10AZd
 Ofbu7EBcaEIyZJbysE7LK6+dLGaUlep+0FkFTvN9iHG6QiXKvFaStKeq9Dk7hmvrqV+y
 AfrQ==
X-Gm-Message-State: APjAAAU1BkPfzwOfMsloX4beijdvoG4mWORDn1k7VV93npDJCjZo2HzW
 tqR0iCOICT1yBwcITtZgs16ZbQ==
X-Google-Smtp-Source: APXvYqz/lQB5wpF2+qRrJ4I1Hpnj5Nzq4JBpunwqfTjfsaJ/6TVlW1DUT56LRi4iginnZTHgAhAYZg==
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr25107467wrp.281.1557926344035; 
 Wed, 15 May 2019 06:19:04 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b206sm2789848wmd.28.2019.05.15.06.19.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 06:19:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 15 May 2019 15:18:54 +0200
Message-Id: <20190515131858.32130-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515131858.32130-1-jbrunet@baylibre.com>
References: <20190515131858.32130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 1/5] ASoC: meson: axg-card: set link name based
	on link node name
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

So far the link names of the axg sound card was derived from the cpu name
of the link. Since the dai link must be unique, it works as long as a
device does not provide more than one cpu dai. However, the 'tohdmitx'
does provide 2 dais used as cpu on codec-to-codec links

Instead of cpu name, use the node name of the dai link. DT already enforce
the uniqueness of this name

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index aa54d2c612c9..5c8deee8d512 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -80,10 +80,11 @@ static int axg_card_parse_dai(struct snd_soc_card *card,
 
 static int axg_card_set_link_name(struct snd_soc_card *card,
 				  struct snd_soc_dai_link *link,
+				  struct device_node *node,
 				  const char *prefix)
 {
 	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
-				    prefix, link->cpu_of_node->full_name);
+				    prefix, node->full_name);
 	if (!name)
 		return -ENOMEM;
 
@@ -474,7 +475,7 @@ static int axg_card_set_be_link(struct snd_soc_card *card,
 		codec++;
 	}
 
-	ret = axg_card_set_link_name(card, link, "be");
+	ret = axg_card_set_link_name(card, link, node, "be");
 	if (ret)
 		dev_err(card->dev, "error setting %pOFn link name\n", np);
 
@@ -483,6 +484,7 @@ static int axg_card_set_be_link(struct snd_soc_card *card,
 
 static int axg_card_set_fe_link(struct snd_soc_card *card,
 				struct snd_soc_dai_link *link,
+				struct device_node *node,
 				bool is_playback)
 {
 	link->dynamic = 1;
@@ -497,7 +499,7 @@ static int axg_card_set_fe_link(struct snd_soc_card *card,
 	else
 		link->dpcm_capture = 1;
 
-	return axg_card_set_link_name(card, link, "fe");
+	return axg_card_set_link_name(card, link, node, "fe");
 }
 
 static int axg_card_cpu_is_capture_fe(struct device_node *np)
@@ -527,9 +529,9 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		return ret;
 
 	if (axg_card_cpu_is_playback_fe(dai_link->cpu_of_node))
-		ret = axg_card_set_fe_link(card, dai_link, true);
+		ret = axg_card_set_fe_link(card, dai_link, np, true);
 	else if (axg_card_cpu_is_capture_fe(dai_link->cpu_of_node))
-		ret = axg_card_set_fe_link(card, dai_link, false);
+		ret = axg_card_set_fe_link(card, dai_link, np, false);
 	else
 		ret = axg_card_set_be_link(card, dai_link, np);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
