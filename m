Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A48D4F8FD3
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:50:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A50D618DA;
	Fri,  8 Apr 2022 09:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A50D618DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649404214;
	bh=FsyREYMYKn1QmBjCJun6dJg1NNqvs5q63rhd5zU1eOs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HGQ6xlEr0AwuwB4WuEHnsyBDmCHX41f1FQgzMVzffh52HY+/7V0kay8w3ZEmsewHc
	 7DxbtlnvbrRcjfznH+bZ0rbfKiQeMZWrM1ia2QEkEKT/GSUX/Eo0IQYCuAy+vuREba
	 cyg2h4xcMSO+WgDWi5Zjho33it7GlObfMCNhvxbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC66DF8051B;
	Fri,  8 Apr 2022 09:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12E98F8016A; Tue,  5 Apr 2022 14:10:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 513E7F8012C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 14:10:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 513E7F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f90euc1z"
Received: by mail-pj1-x102b.google.com with SMTP id gt4so5808184pjb.4
 for <alsa-devel@alsa-project.org>; Tue, 05 Apr 2022 05:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FbiE+hfmclVFPMzSs7FFPFZTMtCm2FkL6jROPMDnRco=;
 b=f90euc1zGDb5iI2Drt4AgWz4VSglJB6yfAjqBN2f2PEHYRVTGUMuR2aWLT+B9bQLYZ
 5mdNK58woXp0Y4e9aOv3d8OX/VqNTyQtckVs5+qiav9/te+260XIfZTexMNJ1laI1MOS
 UPtB203QxYia416r6lnWw63WrEB3TjBwSdLl2sTYYDa5Dgjfxv/80o+ItR/X4Fci8vsc
 bDwtnerqMSS5Tg51zD50a1oBl0zZM6gHRDpyLX+uQxW4P4PyIiMXRCZF7LYrOp504pSZ
 5By7/QzVinQqc/m+fx/fy/oyq/uJtMRlCqlfknv48FM1UjI/IphqHLC/x1Unw5gvUOJs
 T4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FbiE+hfmclVFPMzSs7FFPFZTMtCm2FkL6jROPMDnRco=;
 b=hQTAeriAqE2mG/OTQMe3GAzlKswLxXDKww3cGDs2weEQJlgg5gOfMauWIiTTrNZO+4
 Fx8palcs2Qiu4oRS7Ja1KBIZhr9gMZBy9z3MiM++t1uVcSBsCff98TupQl2vhPXrtSoo
 IGKJnaPCv7IEIkN/2S46JKJBLhH9F7JiW39hG18+7Dlpo7l4s4WM8YFEuRd/UQUI4oWT
 XvwdZJB+JHWqTp6tsidoEnUGNeHloxRmAYds/CctAJtsuVD5qiT7c2fkNFTTVn/XB5NT
 5g/tsCg7oAyAKBxKFt4Nv+K3AdynLTWA1jr/8uZ9Bd/YwYw51bdZ3vd48BXxb3HtdK9h
 GTQQ==
X-Gm-Message-State: AOAM5325TjryUMg6XqYqlAdrmKRHLUYTOtPIvWKtAmh4CUiQgPpds0FL
 laEx+hzGRqhXYM/6lcw1xg==
X-Google-Smtp-Source: ABdhPJysxtv6ffWslGA0KEeiw5vxSuzfXJxSlxUJAcxN0jasthK2NULv5We+duXJGrrCrP1B3w4OZw==
X-Received: by 2002:a17:902:e748:b0:153:b484:bdf4 with SMTP id
 p8-20020a170902e74800b00153b484bdf4mr3198892plf.66.1649160650444; 
 Tue, 05 Apr 2022 05:10:50 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 n52-20020a056a000d7400b004fad9132d73sm14980117pfv.129.2022.04.05.05.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 05:10:49 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: wm8731: Disable the regulator when probing fails
Date: Tue,  5 Apr 2022 20:10:38 +0800
Message-Id: <20220405121038.4094051-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 08 Apr 2022 09:48:11 +0200
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org
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

When the driver fails during probing, the driver should disable the
regulator, not just handle it in wm8731_hw_init().

The following log reveals it:

[   17.812483] WARNING: CPU: 1 PID: 364 at drivers/regulator/core.c:2257 _regulator_put+0x3ec/0x4e0
[   17.815958] RIP: 0010:_regulator_put+0x3ec/0x4e0
[   17.824467] Call Trace:
[   17.824774]  <TASK>
[   17.825040]  regulator_bulk_free+0x82/0xe0
[   17.825514]  devres_release_group+0x319/0x3d0
[   17.825882]  i2c_device_probe+0x766/0x940
[   17.829198]  i2c_register_driver+0xb5/0x130

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 sound/soc/codecs/wm8731.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index 5d4949c2ec9b..b14c6d104e6d 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -602,7 +602,7 @@ static int wm8731_hw_init(struct device *dev, struct wm8731_priv *wm8731)
 	ret = wm8731_reset(wm8731->regmap);
 	if (ret < 0) {
 		dev_err(dev, "Failed to issue reset: %d\n", ret);
-		goto err_regulator_enable;
+		goto err;
 	}
 
 	/* Clear POWEROFF, keep everything else disabled */
@@ -619,10 +619,7 @@ static int wm8731_hw_init(struct device *dev, struct wm8731_priv *wm8731)
 
 	regcache_mark_dirty(wm8731->regmap);
 
-err_regulator_enable:
-	/* Regulators will be enabled by bias management */
-	regulator_bulk_disable(ARRAY_SIZE(wm8731->supplies), wm8731->supplies);
-
+err:
 	return ret;
 }
 
@@ -760,21 +757,27 @@ static int wm8731_i2c_probe(struct i2c_client *i2c,
 		ret = PTR_ERR(wm8731->regmap);
 		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
 			ret);
-		return ret;
+		goto err_regulator_enable;
 	}
 
 	ret = wm8731_hw_init(&i2c->dev, wm8731);
 	if (ret != 0)
-		return ret;
+		goto err_regulator_enable;
 
 	ret = devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_wm8731, &wm8731_dai, 1);
 	if (ret != 0) {
 		dev_err(&i2c->dev, "Failed to register CODEC: %d\n", ret);
-		return ret;
+		goto err_regulator_enable;
 	}
 
 	return 0;
+
+err_regulator_enable:
+	/* Regulators will be enabled by bias management */
+	regulator_bulk_disable(ARRAY_SIZE(wm8731->supplies), wm8731->supplies);
+
+	return ret;
 }
 
 static const struct i2c_device_id wm8731_i2c_id[] = {
-- 
2.25.1

