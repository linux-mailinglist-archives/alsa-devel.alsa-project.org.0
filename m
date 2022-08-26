Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3295A1EE0
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 04:36:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 729721607;
	Fri, 26 Aug 2022 04:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 729721607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661481405;
	bh=rp4FuS6V6VwKNC5xPZH2Zuc10ZhtU4Fsf9TN9bJJSt4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AbQH996dxa3L/UgiiKfcp85qe4HCqji711OIagP7urY0Z/sFZwuU1m0sxAUSY6sMx
	 yTuxQ/6RaNKovQ6mxMc1YopIgo09wagKzWnG5uwvtbmYWsecZZsPHqnr8qw1cV4sSM
	 w0tD+eP8g29Ndh9o+g95GCPxyYDqxlVE3Nln22Kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0A3DF80105;
	Fri, 26 Aug 2022 04:35:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E43E1F80238; Fri, 26 Aug 2022 04:35:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 349A3F800BD
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 04:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 349A3F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="A08NMEbd"
Received: by mail-pf1-x429.google.com with SMTP id y141so295426pfb.7
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 19:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc;
 bh=YLgxiF89rhAaSiqrAqLeGjys84eskoyDUq88fMYi6UA=;
 b=A08NMEbdQ2LVLqA2QG4Uylmc8AJCL8cjcSDZ4ToJVFabYXmHdQnjBm3N9UTpiyav+e
 1Eult2hfeviCaQM65yj3icHdLUJylJlFoSUszK2UlHMf8oouPQaGxXAICVp2Bn4a9pwH
 4xRyktRi+ruT9b+RcBk9uikJsfbxuN2g8ApnyBFh+5Ngn6MEiSX8rNIXwlVXWmPUX73N
 oxNvoUz0oWoiXa60u/W3CwkFYQTG9RF22hJ4HsoXeeTEaGKuzjfRFyWCBoLwpdGVJPP2
 M8LkKTlPkxdkhzBGnstnYPgCqlaIqiO3nuaAq1GYYHfP8rTXYuXluQQYBuAxo9VkE1AZ
 QoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=YLgxiF89rhAaSiqrAqLeGjys84eskoyDUq88fMYi6UA=;
 b=Bme74kB5iOeV9JM/e8kTL7TtDOybfipfQujz+nyjmN7GhSUQoUHCWQfAr5P7uhVuS3
 qCWo39lUSsksjE3/wTcS8m8r5M5c0aXeMacTw4YNKbV7JsPHKTdYMT54sqqKya38bmDM
 LzjBy9Mu4q5FxTfsYoRtmm8PjJgsx6Suz7v+BRNI78PWzfos3g3B67r9NOyxnOtIxzy2
 MUcfGJLuEu0gFzSX9iDJrhzuYKYICHOcxb/OwlHOcqTnXecaC5FTcE8RHpqE7Ytf2aQ8
 dPSzGhXlxEmf8TtVIOW+Qc8vWNdYOiWF2PgwtBUqNKJS4nutSyedyRlHPy9zHxDf+t5R
 aZ6w==
X-Gm-Message-State: ACgBeo2dmn1xtc8WGujLtHb0iKczob0oyf05anCvC+FnMazajvoj4Dcl
 Zskj89JmFeEIKDco1BPe+DU=
X-Google-Smtp-Source: AA6agR69TZnd2al9dGGB1ospcLnBSuFirgfInFDbZAM8DBaBB7U0jAg+RkbOzm4E7oPOXaZ5l7SSPQ==
X-Received: by 2002:a63:2bc5:0:b0:41d:9b5f:acb0 with SMTP id
 r188-20020a632bc5000000b0041d9b5facb0mr1550631pgr.439.1661481338519; 
 Thu, 25 Aug 2022 19:35:38 -0700 (PDT)
Received: from localhost.localdomain ([211.212.143.131])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a1709029a9100b00172ad292b6bsm269786plp.116.2022.08.25.19.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 19:35:38 -0700 (PDT)
From: Steve Lee <steve.lee.analog@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: max98390: Remove unnecessary amp on/off conrtol
Date: Fri, 26 Aug 2022 11:35:04 +0900
Message-Id: <20220826023504.6183-1-steve.lee.analog@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Steve Lee <steve.lee.analog@gmail.com>, ryans.lee@analog.com,
 krzk@kernel.org
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

 The Amp is already control in userspace before trigger calibrate function.
Remove unnecessary control in calibrate function.

Signed-off-by: Steve Lee <steve.lee.analog@gmail.com>
---
 sound/soc/codecs/max98390.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 91c0bf3d76fc..99e769190568 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -826,9 +826,6 @@ static int max98390_dsm_calibrate(struct snd_soc_component *component)
 	struct max98390_priv *max98390 =
 		snd_soc_component_get_drvdata(component);
 
-	regmap_write(max98390->regmap, MAX98390_R203A_AMP_EN, 0x81);
-	regmap_write(max98390->regmap, MAX98390_R23FF_GLOBAL_EN, 0x01);
-
 	regmap_read(max98390->regmap,
 		THERMAL_RDC_RD_BACK_BYTE1, &rdc);
 	regmap_read(max98390->regmap,
@@ -847,9 +844,6 @@ static int max98390_dsm_calibrate(struct snd_soc_component *component)
 	dev_info(component->dev, "rdc resistance about %d.%02d ohm, reg=0x%X temp reg=0x%X\n",
 		 rdc_integer, rdc_factor, rdc_cal_result, temp);
 
-	regmap_write(max98390->regmap, MAX98390_R23FF_GLOBAL_EN, 0x00);
-	regmap_write(max98390->regmap, MAX98390_R203A_AMP_EN, 0x80);
-
 	return 0;
 }
 
-- 
2.17.1

