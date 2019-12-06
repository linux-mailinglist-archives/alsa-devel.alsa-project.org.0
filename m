Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DDD114CF6
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2019 08:54:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7993483E;
	Fri,  6 Dec 2019 08:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7993483E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575618879;
	bh=9rwUZVXADiX9lUdLl705ZthUPV8MCGGbeRFR87RhCKA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EY0KCpgY0RryIX2/lxD2qWoEWep5eCFbsuwF+SLXhe7LdXGFgR7s6QPY+Ycjk+XNw
	 EfIaV9mP5G6YT/JxLolwr+JNYUe1+o4l9FwNAZIN9PmvlcBTus3nwdygaFBQ1ysiR6
	 nCbefWP4PMKKqBDwbea3lENXN3sAHinZ/GLD/qws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94080F80216;
	Fri,  6 Dec 2019 08:52:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A0CCF80217; Fri,  6 Dec 2019 08:52:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D182DF80135
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 08:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D182DF80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aC69QMes"
Received: by mail-pl1-x642.google.com with SMTP id w7so2367669plz.12
 for <alsa-devel@alsa-project.org>; Thu, 05 Dec 2019 23:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F/nVMSvIlBe6KxhL/GKB+x3grLOZijuR5eaAuvD4Z3g=;
 b=aC69QMes8d8Y60ab+b/nr3pzwc2OcICzdEZglBU4tCczyIBnlwC8/SwivcCPU7/Uip
 LeiwmwTcApgtDTxCZ9H3fNcVUu13E9gqNXArnFg2vUJ9j23Hi7Qq5Zq1nH++ujGKtffq
 ST4kpRiBvj2umUUpHSvu0jBLwKgmZgCkjmlsed5wiZMk9xmLNr62LAFZkl3HgMzE5mCd
 +Q7IYGw4vAU1WpdzK1RCdZCSoZZ3URWnBrZ8K+mACqQaoburreR/oswT0ldlenbZe0h1
 VNl3U5hF/KG/FZmlsnkICnC115+m53L/3vwY4eorv/aIVL19fE4dim6omGwfH/UoA7HI
 lUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F/nVMSvIlBe6KxhL/GKB+x3grLOZijuR5eaAuvD4Z3g=;
 b=N5UFHzqCyp7AAyuTcv17mjTnlSQAgkiGoyMx/kFW8jCczwtSorRZeHqe1tvsp2HSOG
 eRIf66WDWG6WCZa1u219iGL23UekBuxhEJBHuakhkYZG+UikID+2En5rjwzcFw6bC69f
 lwEHBKUUL+flmGChOFhb2Rv/aMKaCWvPAngzrYHOb5hkhIBihQ13t5vrb7LVo/w3zqS6
 nAClukbOJPMezVHHf113mPdmDA6uVT/uv/D3uNn5EN1lPtOET33Wyc+FmphW8VLyvEsY
 G5+xQYK5pjKjSKK+7eTBUCE7paNqeBBGEcGtLur+/KqFyq9dW9ek3UmPNgPQ2+PzbpxP
 wTuQ==
X-Gm-Message-State: APjAAAWums/yrVb1r5TPqoOAAZFvrYNGnNFe87QQy0JIV1YoDaDbyH0E
 BbkTHkT7NHvJ1Kotz9MDKQM=
X-Google-Smtp-Source: APXvYqxMyuR+T1yV865sqEMXS9IDUST5vK00nDZONJTWjFfaGJUHCgtS3FvbuE1jXuMDmVFJd9xWcw==
X-Received: by 2002:a17:902:fe03:: with SMTP id
 g3mr13652599plj.1.1575618744043; 
 Thu, 05 Dec 2019 23:52:24 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id y199sm16009412pfb.137.2019.12.05.23.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 23:52:23 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Fri,  6 Dec 2019 15:52:09 +0800
Message-Id: <20191206075209.18068-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: Brian Austin <brian.austin@cirrus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 James Schulman <james.schulman@cirrus.com>
Subject: [alsa-devel] [PATCH] ASoC: cs42l42: add missed
	regulator_bulk_disable in remove and fix probe failure
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

The driver forgets to call regulator_bulk_disable() in remove like that
in probe failure.
Besides, some failed branches in probe do not handle failure correctly.
Add the missed call and revise wrong direct returns to fix it.

Fixes: 2c394ca79604b ("ASoC: Add support for CS42L42 codec")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 5125bb9b37b5..96b3cff50ce9 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1796,8 +1796,10 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 	/* Reset the Device */
 	cs42l42->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
 		"reset", GPIOD_OUT_LOW);
-	if (IS_ERR(cs42l42->reset_gpio))
-		return PTR_ERR(cs42l42->reset_gpio);
+	if (IS_ERR(cs42l42->reset_gpio)) {
+		ret = PTR_ERR(cs42l42->reset_gpio);
+		goto err_disable;
+	}
 
 	if (cs42l42->reset_gpio) {
 		dev_dbg(&i2c_client->dev, "Found reset GPIO\n");
@@ -1831,13 +1833,13 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 		dev_err(&i2c_client->dev,
 			"CS42L42 Device ID (%X). Expected %X\n",
 			devid, CS42L42_CHIP_ID);
-		return ret;
+		goto err_disable;
 	}
 
 	ret = regmap_read(cs42l42->regmap, CS42L42_REVID, &reg);
 	if (ret < 0) {
 		dev_err(&i2c_client->dev, "Get Revision ID failed\n");
-		return ret;
+		goto err_disable;
 	}
 
 	dev_info(&i2c_client->dev,
@@ -1863,7 +1865,7 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 	if (i2c_client->dev.of_node) {
 		ret = cs42l42_handle_device_data(i2c_client, cs42l42);
 		if (ret != 0)
-			return ret;
+			goto err_disable;
 	}
 
 	/* Setup headset detection */
@@ -1892,6 +1894,8 @@ static int cs42l42_i2c_remove(struct i2c_client *i2c_client)
 	/* Hold down reset */
 	gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
 
+	regulator_bulk_disable(ARRAY_SIZE(cs42l42->supplies),
+				cs42l42->supplies);
 	return 0;
 }
 
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
