Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0094E35569A
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 16:27:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88230166E;
	Tue,  6 Apr 2021 16:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88230166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617719231;
	bh=f6Kkb05Xy1ywWXaA4VDZYAUdTERpxd12TdolAcNa4cQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3fdR4tzBWjRiXmzox5hxlBmRV1ZuwwFH/InRuWI5VvR6YiXKKNzK5ZsLvihb+2kD
	 fJVictUNM/XGErwcdIsafq7LMG6a7cTmKSu04mctwx5BqeakTZDR8+5H4axE+S2BTb
	 tMdCcoENP4FNZmh777vDS43s+jV1VfXbpfLORkgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1BB0F80424;
	Tue,  6 Apr 2021 16:25:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 515F2F80425; Tue,  6 Apr 2021 16:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54372F80169
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 16:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54372F80169
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id 368DB3FA29;
 Tue,  6 Apr 2021 16:24:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id xeJpDRGo20-5; Tue,  6 Apr 2021 16:24:43 +0200 (CEST)
Received: from pc-gameroom.prchals.tk (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id 6EE8D3FA2D;
 Tue,  6 Apr 2021 16:24:43 +0200 (CEST)
From: Jiri Prchal <jiri.prchal@aksignal.cz>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: codecs: tlv320aic3x: rename probe function
Date: Tue,  6 Apr 2021 16:24:37 +0200
Message-Id: <20210406142439.102396-3-jiri.prchal@aksignal.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406142439.102396-1-jiri.prchal@aksignal.cz>
References: <20210406142439.102396-1-jiri.prchal@aksignal.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jiri Prchal <jiri.prchal@aksignal.cz>, Liam Girdwood <lgirdwood@gmail.com>
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

Renamed function to have it free for generic probe.

Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
---
 sound/soc/codecs/tlv320aic3x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 812f0f117fd3..6549ad9296ce 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1610,7 +1610,7 @@ static bool aic3x_is_shared_reset(struct aic3x_priv *aic3x)
 	return false;
 }
 
-static int aic3x_probe(struct snd_soc_component *component)
+static int aic3x_component_probe(struct snd_soc_component *component)
 {
 	struct aic3x_priv *aic3x = snd_soc_component_get_drvdata(component);
 	int ret, i;
@@ -1689,7 +1689,7 @@ static int aic3x_probe(struct snd_soc_component *component)
 
 static const struct snd_soc_component_driver soc_component_dev_aic3x = {
 	.set_bias_level		= aic3x_set_bias_level,
-	.probe			= aic3x_probe,
+	.probe			= aic3x_component_probe,
 	.controls		= aic3x_snd_controls,
 	.num_controls		= ARRAY_SIZE(aic3x_snd_controls),
 	.dapm_widgets		= aic3x_dapm_widgets,
-- 
2.25.1

