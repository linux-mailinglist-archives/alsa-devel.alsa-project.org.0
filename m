Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC5B473AA7
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:14:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BA6B1AE2;
	Tue, 14 Dec 2021 03:13:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BA6B1AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448072;
	bh=/TQgcnZVaPwE6QgVucHMyrGcGtxHCEhVsK4XJvvbulk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B7gXWoSl3eAhM1pcXyneIHrq3fSObkhEBk80JsJH597dFuUIRoM2R32FISk/1Ymm8
	 1CmlQIkiJOh39KdaWkf4VKzPBiTnHPfsFK65GTyBLn7WYMf3EHYledbqUd2RyR/5TL
	 d/K79wMYpUJGpTmBG2hCax6Nw0S9rvf03jdFy/ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42454F8057C;
	Tue, 14 Dec 2021 03:10:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2901DF8053D; Tue, 14 Dec 2021 03:09:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C85DBF80529
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C85DBF80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kfDhwTEH"
Received: by mail-pg1-x535.google.com with SMTP id r138so16093331pgr.13
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Li4Q+8tpvcGsQn3iQs6uOP5gn0QKZEXqEBjtw0WPMT0=;
 b=kfDhwTEHQCc4sCjuuaMznyrVt7ZBoNpxO+nPCNqWSPMn8gUG02xQWqX4XARf5gbRAI
 qakVjl6fuqYlZAnNRLY90FBPReLbCj20M1Q+BGLjSzuSCfQnOoz6g9+74x3qFMTQXIHo
 OaDWajvYuofo0+eol7Q8IXZoIvGkPMF5pboJ4v8SgD8/hSqUR0XlGEq9w11Gl5eEciRy
 jvlc4Qf11kBcZ1ogHs5ZmyjQaGL24Tn9sZoAGeqVFdO/Vx6NVsxOisJ10Q76cPlQ39xR
 /ATQomynSAx6ri9djiQY4GLRlJDj/BjuRkGaEhfG2exx8Pz58w0rUbUn/FEu3flWEBIf
 3tfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Li4Q+8tpvcGsQn3iQs6uOP5gn0QKZEXqEBjtw0WPMT0=;
 b=pc3ulgFh8sSyryByFYqqYbw66puhY/VsGYhL3Tm2vaC0luoguHog37tfjsVCsVXF2t
 fpFcQ6EmQ6MkpME4xVXuaf5Q/WiHdtCwRpg9ErahLqwsRG/7/eScphRFoJnaFE3ZdjFU
 4x8F5gjNvkt1rP6AA9BwJ3gtckcG4VCvE1uk4QdGRluj+67OZu5e9Zl7Ew84uh//S830
 YTwS99yqsrNp1e/kBAV7U2RQ1DYzzJgKR5+tPc8PvJgng08SCLCiYsKHNUOtUD+nM32M
 ZUGYMpT7djfPP2cQgpQXB7Yfb0zXjKjaEQzaMZf/jE9HN/e8cTl85dkcbnr/eDN9um5n
 D8kg==
X-Gm-Message-State: AOAM532rsn4KEOpx1Er0H/vmq3uBR00Hm3Nv4WLmydfbfOxEkKOrryMi
 XquEhxsG9VPedy5P1lGwsk4=
X-Google-Smtp-Source: ABdhPJwAxXMDlPC4GMAD0RJjSfx0pfaSx+g6cykfmFqshq/VLac8icvhro9mLqwRST7C6vrxKIMhLQ==
X-Received: by 2002:a63:cc54:: with SMTP id q20mr1638857pgi.553.1639447782530; 
 Mon, 13 Dec 2021 18:09:42 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:42 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 14/22] ASoC: generic: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:35 +0900
Message-Id: <20211214020843.2225831-15-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c  | 5 +----
 sound/soc/generic/audio-graph-card2.c | 4 ++--
 sound/soc/generic/simple-card.c       | 3 +--
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 7eb027238327..2b598af8feef 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -593,10 +593,7 @@ int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 err:
 	asoc_simple_clean_reference(card);
 
-	if (ret != -EPROBE_DEFER)
-		dev_err(dev, "parse error %d\n", ret);
-
-	return ret;
+	return dev_err_probe(dev, ret, "parse error\n");
 }
 EXPORT_SYMBOL_GPL(audio_graph_parse_of);
 
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index b6049bcfb771..c3947347dda3 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1238,8 +1238,8 @@ int audio_graph2_parse_of(struct asoc_simple_priv *priv, struct device *dev,
 err:
 	devm_kfree(dev, li);
 
-	if ((ret < 0) && (ret != -EPROBE_DEFER))
-		dev_err(dev, "parse error %d\n", ret);
+	if (ret < 0)
+		dev_err_probe(dev, ret, "parse error\n");
 
 	return ret;
 }
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index a3a7990b5cb6..a89d1cfdda32 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -642,8 +642,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 
 		ret = simple_parse_of(priv, li);
 		if (ret < 0) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "parse error %d\n", ret);
+			dev_err_probe(dev, ret, "parse error\n");
 			goto err;
 		}
 
-- 
2.25.1

