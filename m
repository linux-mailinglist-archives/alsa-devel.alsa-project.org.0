Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0FB4108BB
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Sep 2021 23:37:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F82C847;
	Sat, 18 Sep 2021 23:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F82C847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632001053;
	bh=Kwpp0Fj2x26Eg78Ja7Z4hycUKbPpkJLdheziTeB1Zi8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cX4eNwVEIJMhU/OZSLIjLCjUd9+kLYWlQYSTM5fHSTAhPAjldxtDOvERfuUmdI+Ww
	 6539VKBM/BlcMYfx8UO2CkvnNHlRo/D6f3une8HVYGTm43mQmHVnhNEEzMaIGWv7Ve
	 FPuuUgbshJucs5235dWOsRypAVhTR6NWSdyEB9g8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB8ABF80137;
	Sat, 18 Sep 2021 23:36:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED13AF8025E; Sat, 18 Sep 2021 23:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D1D1F80137
 for <alsa-devel@alsa-project.org>; Sat, 18 Sep 2021 23:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D1D1F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sang-engineering.com
 header.i=@sang-engineering.com header.b="y+DWnL+r"
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=k1; bh=Kwpp0Fj2x26Eg7
 8Ja7Z4hycUKbPpkJLdheziTeB1Zi8=; b=y+DWnL+rlbKwj54YmFiewuQaS11s/E
 +D/GrBAn071zxivs29KhJvwpb+29pXGJ3EIGZZL0KWXmTNVZ2JYXXzt3gGpVBrA2
 /GHF77p+5u4/ZDMJ11BdMS1+bHcTKifbbr6nRBb2c10eqvYmXSLZ7PymDcoUygwk
 Riu67C9lfpUnE=
Received: (qmail 1967036 invoked from network); 18 Sep 2021 23:36:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 18 Sep 2021 23:36:03 +0200
X-UD-Smtp-Session: l3s3148p1@BrCw1UvM0JMgAwDPXyF2AO3QmsoMF7XN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: codecs: max98390: simplify getting the adapter of a
 client
Date: Sat, 18 Sep 2021 23:35:52 +0200
Message-Id: <20210918213553.14514-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210918213553.14514-1-wsa+renesas@sang-engineering.com>
References: <20210918213553.14514-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mark Brown <broonie@kernel.org>
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

We have a dedicated pointer for that, so use it. Much easier to read and
less computation involved.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Please apply to your subsystem tree.

 sound/soc/codecs/max98390.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index b392567c2b3e..d1882cbc9381 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -1021,7 +1021,7 @@ static int max98390_i2c_probe(struct i2c_client *i2c,
 	int reg = 0;
 
 	struct max98390_priv *max98390 = NULL;
-	struct i2c_adapter *adapter = to_i2c_adapter(i2c->dev.parent);
+	struct i2c_adapter *adapter = i2c->adapter;
 
 	ret = i2c_check_functionality(adapter,
 		I2C_FUNC_SMBUS_BYTE
-- 
2.30.2

