Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B75C25A06FA
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 03:51:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51C9AF3;
	Thu, 25 Aug 2022 03:50:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51C9AF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661392303;
	bh=Eso9Q4ebNFh2HLq9gtap4229fPye68IIgN+n26LA/Sc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TjEcGfDEpfTacnRFv7ywbxeHWuolqlnBff3QqTxcA5mj7c27JD8nqQxmKVSEZhOmi
	 fkpDqDKC3Fyh4dlb6ffPhuPDuRPcsnlEHXuHkQJkBW3RVS0bNisiEap5VbXjR5nadb
	 68U4Slm5e/VYMU4P+VQtLMly9uG44Z8t3jwxugB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC9AEF800BD;
	Thu, 25 Aug 2022 03:50:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C8D6F8025A; Thu, 25 Aug 2022 03:50:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8497F8014B
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 03:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8497F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E2WydSd/"
Received: by mail-pf1-x429.google.com with SMTP id x19so15467107pfq.1
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 18:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Iox1I1HWIYn7yI5+Jed1IAFmo6CAnMA4XFb5rru3bu0=;
 b=E2WydSd/J/ViO5uAMFfmmcRQ6rFSPQV7lyjr7/AflywCPj/gSjEyfqewAXCbGOPHHn
 s714pHAMS4S/I1qy/d+r6VP174uLMB7iuVtmLoaKTUiS0kdvAYeIMfnz15Os7Zm31uIU
 +ZVIdjFsMZRNWq51o1wSBmeuImPXkVm/FbR+h2QIuL1In9D2BQ2rBjgkzP5AuBMz0ZSB
 ApP4X3CUmYAMIc5yPTGQ7687PWbNqiKmU3k7VxoFfc1JZCyhhpRJPQIgXJ7DmwDKBFVW
 0IQCAzExZe1EGPDDePOOhEU90T4FwYKSsQLZZoStQ3SMvA8UAaTGkStlQgz9bsIV+g7o
 UDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Iox1I1HWIYn7yI5+Jed1IAFmo6CAnMA4XFb5rru3bu0=;
 b=gnrD4mV/7KQ9o//X6s1Hp0nipGu3uN7clh5ynlXfEE1W7neHYJbxbzJFGJxeooxB6a
 m84q/ciRuj+DwepZPeDmB+cGZlk81Cyn8jDeZFS70weV/FU8OQMUErSqZQWAyuelan6o
 IXAlRqWaOJnxkaufBltzpAH83yIVJDLHKFkFOuD21N9tj3ElPwzLYqZe3GRqR764Z3fq
 TbqaEh5vlyC+4kKFbfiCYnlgXd3BU7bMKX0ipOPUJe2aLAUyJuzM8VEY+FJm70/6G/Op
 kj55EAMimgppheSZlfauTWhk2tlLYKnG/h+ptqOO92AKkCMbdDxspMErKFjGlFGTZY+n
 nxkQ==
X-Gm-Message-State: ACgBeo0HwaJfsPTmCuEgcUQ6WWO5pt/4F4HQHE6qnUX4UTybiJwHvkt1
 Soki1XD+k9XMN7ztWYCCq9jkrQwviAda7vr7m+Y=
X-Google-Smtp-Source: AA6agR6T9Btu6gHuOR7Scy2c/Jm5V0jrg69tsAibGbCt5TMRyNDsQAS7uCSNMTh8/eIF0vBmsZljWw==
X-Received: by 2002:a05:6a00:140d:b0:52a:d561:d991 with SMTP id
 l13-20020a056a00140d00b0052ad561d991mr1557788pfu.46.1661392233092; 
 Wed, 24 Aug 2022 18:50:33 -0700 (PDT)
Received: from localhost ([116.232.53.255]) by smtp.gmail.com with ESMTPSA id
 83-20020a621756000000b0052b84ca900csm13647454pfx.62.2022.08.24.18.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 18:50:32 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: codecs: add suspend and resume for ES8316
Date: Thu, 25 Aug 2022 09:49:52 +0800
Message-Id: <20220825014952.1038508-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Zhu Ning <zhuning0077@gmail.com>, broonie@kernel.org,
 Zhu Ning <zhuning@everest-semi.com>, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

The registers may be lost after suspend due to powerdown.
regcache_sync solves this issue.

Signed-off-by: Zhu Ning <zhuning@everest-semi.com>
---
 sound/soc/codecs/es8316.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index de7185f73e1e..8643014472ae 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -767,9 +767,31 @@ static void es8316_remove(struct snd_soc_component *component)
 	clk_disable_unprepare(es8316->mclk);
 }
 
+static int es8316_resume(struct snd_soc_component *component)
+{
+	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
+
+	regcache_cache_only(es8316->regmap, false);
+	regcache_sync(es8316->regmap);
+
+	return 0;
+}
+
+static int es8316_suspend(struct snd_soc_component *component)
+{
+	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
+
+	regcache_cache_only(es8316->regmap, true);
+	regcache_mark_dirty(es8316->regmap);
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver soc_component_dev_es8316 = {
 	.probe			= es8316_probe,
 	.remove			= es8316_remove,
+	.resume			= es8316_resume,
+	.suspend		= es8316_suspend,
 	.set_jack		= es8316_set_jack,
 	.controls		= es8316_snd_controls,
 	.num_controls		= ARRAY_SIZE(es8316_snd_controls),
-- 
2.36.1

