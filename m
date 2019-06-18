Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A99499E2
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 09:07:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0DB8171E;
	Tue, 18 Jun 2019 09:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0DB8171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560841639;
	bh=CBGQ9om+vKRZr8JnWQFP8CPKAClTL6jYHEwE4+Ssyws=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kPezVvB6Gj/8xGSDglAafr8Bs579OEbLwGEwxrt6QdXk2Rj0N5S/sgHtDU0riUA2B
	 kK+CkFhRHtqW2+KVl0RNnu0rup+KXbkiAwUEbeDb6MU8JXpODyxvQPhmZfbRwAJHsq
	 cJ9NBZTLiodga39hVLLDfYKF3vPE8bTkWZ+rf3cg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79CADF89729;
	Tue, 18 Jun 2019 09:05:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCE85F89724; Tue, 18 Jun 2019 09:05:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x949.google.com (mail-ua1-x949.google.com
 [IPv6:2607:f8b0:4864:20::949])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 286C7F80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 09:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 286C7F80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ABLH4hQE"
Received: by mail-ua1-x949.google.com with SMTP id m2so1233340uap.12
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 00:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=xFt6uo+0ZBlhkR9GZBmaSF7cHyVvO8GfOxOxN4LiT4A=;
 b=ABLH4hQEABPnigB6Or5QhBjmFvkzrVEiSfYPCwWR0CnfNCGLIKdLxm3THKOz468uey
 MiiWcVxKtnHBuDhPWWXKeTiXtwULekpMmOX17eWctn3c0wQJ10Uf76Fi5KjLVllo2wI5
 d4xYZVnJTxazPs1UugWPDtBhDH9huLSvltDW6hhxsRL7iW2V2zaueE/+SvVZ3KcaUf3M
 FEaKEXVF+JKPypJBxGoN9N6gUPfrxm09s33jfdOxGcyyMweYBvJrTKhiK18ymMYKPGYx
 qQBbpnrYkUXxLO1ovQBdM0tftJuQcTFbpZ294kFeIVcFs4p4kBpRuEN0aKBHJ8lpGTT3
 RAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=xFt6uo+0ZBlhkR9GZBmaSF7cHyVvO8GfOxOxN4LiT4A=;
 b=F7SFP7Xp1M0Ye77bReq3dizwlJIrZmpOdkN+NAHPqREQXHOYZuCH4Sx8qKOWL+lXRu
 AoXoKdV6M3+szqMsWiF6Y/UlMA4PLfAWtwYQLrKm0M/BbTKC7HObV+1ZPOChxeSoGPQY
 5uByCyIPDI+D2B4cwdgls7346GAFvpsWn/SwZ4UewvwmYrt4KeBBSg6EwF2dQQWRJ6li
 WhcZset5ReC4bdqR0pRN4lO4AqD2rdBPd9JfzQaUBmSFpujdXfAjqPdK9gNiWeJwdVtP
 0E8TRqiepCkFIJGW/zYcNUDcjaT3FnYaTVU9ZNeGkZcVy6j1cfiykbyjYODGGHI3Zjv2
 VxDQ==
X-Gm-Message-State: APjAAAWdDBJ1Tjjpb7nISMPoQVXfQQAon9dQs3XNK+ATwHl8yY2bMJ5W
 /T49JrkPURqp+pDhSWBPGvLDY/oZPndd
X-Google-Smtp-Source: APXvYqwPac8U0j37iGc4V+60o1/HT8OGhGB7w93b1mw04LaSGqTAWXhWvTnYAw90IWIHTWkpS1BV30WImAmX
X-Received: by 2002:a67:6485:: with SMTP id y127mr35927257vsb.19.1560841514265; 
 Tue, 18 Jun 2019 00:05:14 -0700 (PDT)
Date: Tue, 18 Jun 2019 15:05:03 +0800
Message-Id: <20190618070503.36310-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH] ASoC: Intel: skl: extract common function
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

Extract common logic to a function to avoid duplicate code.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Refactor HDMI init to as most Intel machine drivers did, e.g.
kbl_da7219_max98357a.c.

 .../soc/intel/boards/skl_nau88l25_max98357a.c | 39 +++++-------------
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 40 +++++--------------
 2 files changed, 18 insertions(+), 61 deletions(-)

diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index 3ce8efbeed12..485614c4fa47 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -179,7 +179,7 @@ static int skylake_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
+static int skylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 {
 	struct skl_nau8825_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *dai = rtd->codec_dai;
@@ -189,7 +189,7 @@ static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 	if (!pcm)
 		return -ENOMEM;
 
-	pcm->device = SKL_DPCM_AUDIO_HDMI1_PB;
+	pcm->device = device;
 	pcm->codec_dai = dai;
 
 	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
@@ -197,40 +197,19 @@ static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
+static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct skl_nau8825_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
-	struct skl_hdmi_pcm *pcm;
-
-	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
-	pcm->device = SKL_DPCM_AUDIO_HDMI2_PB;
-	pcm->codec_dai = dai;
-
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
+	return skylake_hdmi_init(rtd, SKL_DPCM_AUDIO_HDMI1_PB);
+}
 
-	return 0;
+static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
+{
+	return skylake_hdmi_init(rtd, SKL_DPCM_AUDIO_HDMI2_PB);
 }
 
 static int skylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct skl_nau8825_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
-	struct skl_hdmi_pcm *pcm;
-
-	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
-	pcm->device = SKL_DPCM_AUDIO_HDMI3_PB;
-	pcm->codec_dai = dai;
-
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
-
-	return 0;
+	return skylake_hdmi_init(rtd, SKL_DPCM_AUDIO_HDMI3_PB);
 }
 
 static int skylake_nau8825_fe_init(struct snd_soc_pcm_runtime *rtd)
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index 1a7ac8bdf543..772cbd6940db 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -198,7 +198,7 @@ static int skylake_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
+static int skylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 {
 	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *dai = rtd->codec_dai;
@@ -208,7 +208,7 @@ static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 	if (!pcm)
 		return -ENOMEM;
 
-	pcm->device = SKL_DPCM_AUDIO_HDMI1_PB;
+	pcm->device = device;
 	pcm->codec_dai = dai;
 
 	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
@@ -216,41 +216,19 @@ static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
+static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
-	struct skl_hdmi_pcm *pcm;
-
-	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
-	pcm->device = SKL_DPCM_AUDIO_HDMI2_PB;
-	pcm->codec_dai = dai;
-
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
-
-	return 0;
+	return skylake_hdmi_init(rtd, SKL_DPCM_AUDIO_HDMI1_PB);
 }
 
+static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
+{
+	return skylake_hdmi_init(rtd, SKL_DPCM_AUDIO_HDMI2_PB);
+}
 
 static int skylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
-	struct skl_hdmi_pcm *pcm;
-
-	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
-	pcm->device = SKL_DPCM_AUDIO_HDMI3_PB;
-	pcm->codec_dai = dai;
-
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
-
-	return 0;
+	return skylake_hdmi_init(rtd, SKL_DPCM_AUDIO_HDMI3_PB);
 }
 
 static int skylake_nau8825_fe_init(struct snd_soc_pcm_runtime *rtd)
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
