Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B5D481225
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 12:46:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DDE4174E;
	Wed, 29 Dec 2021 12:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DDE4174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640778409;
	bh=8hewVM7vU+XUWPtGt6tGEotMq2xdiD+RK3NBsy2xbwg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JQkMr48TzQZp4RAK3k9e0OBd7ObontK5qoV1xMKpdA36qJM6N8slNNLraoufDU/L+
	 5EywWsI+LlkywP0ewlpqvVPHGNxGIEBUu+bld6stX9vjz1G2btFvpPzLNTPdx4Qrrw
	 J9AKttpeyNt8wkRGpKz3ilFbyMxpoDEKYjP0NWDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABDCDF80236;
	Wed, 29 Dec 2021 12:45:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80680F80236; Wed, 29 Dec 2021 12:45:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02613F800CE
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 12:45:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02613F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KSKnc49D"
Received: by mail-qk1-x72e.google.com with SMTP id de30so19686949qkb.0
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 03:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5tJ+orUquZC7dXXCYq+qNFqhYoTDrb9wSj8plGLuOu8=;
 b=KSKnc49DufZLkNDb46tKQsHG0iHG+2ESW5x9r1LnmukjFPRAKNafz1g7Yqajm7/0Ik
 nOjFZe80LUGJGTbeXdM0V2FNoflx53LkCIsCtwll3RUSDvq/XWb/xYz7nczjZVr/kzz1
 nf7AQ9hU6B8HW0kdKJHjYWQbs+h+Udzb1od/IP8FZxOO3VUPUOhj3b58Dsak80JYPxAf
 6aBcyBvDMZ9VCe/l7WT3hkwrFqEnxO0HSzqyytjoq7Bmh2pdBo5x8sTRxBj78QVcdw52
 wjDpg5k3EkMSotWMgAjK5st8EZrmc3qv5vygEaNSUXim7qei45dxbA0qFjk2ZUNdYG2P
 yt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5tJ+orUquZC7dXXCYq+qNFqhYoTDrb9wSj8plGLuOu8=;
 b=E4hF0rsYrTLsR1gX84YdmD9uKtMiTyh7/LPwDCtw+m7nCU+Bmk4JUbRaBJKq9oX5H9
 ZmYh9J1ULvaC442k1c//5VjBt39U6WC0NdkVzut7SZu4SCaa8B4tUQf0SyIKDty5utDX
 YSHGI3ew/g19bVZXxrHwBkXIYJH3cNnZQPkc9j7ukKyg+G+aeqEbYOTX7x1subO0LoOU
 dhyHjnhK5l05A+p+cHS2HfJWNSUCrIufSzJVioHMwdQz2QJ3X9wvVeDI+N1RxzjF3p4p
 gHMXd4V8XJxcYRhYP/aDSIszoScZ1Uy4/r10Y/asOkPJ/tZw4drCviCciG293p5gaCYY
 Q6EQ==
X-Gm-Message-State: AOAM533IPSEySe3cc/E+X35bR4IQaW0pRTPl7Ne6f4/Kf8BJrSAHKEsa
 IWsaDTKW2hsHhut0Qco8AYY=
X-Google-Smtp-Source: ABdhPJyPJzA19ye8gIdI38NOAMDC3LSOZ8QZEHRdts0SyuTBGfJKDu7aTlmMDM2+0YC+zsK/wJoCaw==
X-Received: by 2002:a05:620a:4087:: with SMTP id
 f7mr17519909qko.639.1640778327314; 
 Wed, 29 Dec 2021 03:45:27 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:4bbe:5997:2c6c:1a08])
 by smtp.gmail.com with ESMTPSA id
 g14sm18085936qko.55.2021.12.29.03.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 03:45:26 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH v2 1/3] ASoC: cs4265: Fix part number ID error message
Date: Wed, 29 Dec 2021 08:44:55 -0300
Message-Id: <20211229114457.4101989-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 ckeepax@opensource.cirrus.com, Paul.Handrigan@cirrus.com,
 james.schulman@cirrus.com
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

From: Fabio Estevam <festevam@denx.de>

The Chip ID - Register 01h contains the following description
as per the CS4265 datasheet:

"Bits 7 through 4 are the part number ID, which is 1101b (0Dh)"

The current error message is incorrect as it prints CS4265_CHIP_ID,
which is the register number, instead of printing the expected
part number ID value.

To make it clearer, also do a shift by 4, so that the error message
would become:

[    4.218083] cs4265 1-004f: CS4265 Part Number ID: 0x0 Expected: 0xd

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
Changes since v1:
- None

 sound/soc/codecs/cs4265.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index cffd6111afac..b89002189a2b 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -611,8 +611,8 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_client,
 	if (devid != CS4265_CHIP_ID_VAL) {
 		ret = -ENODEV;
 		dev_err(&i2c_client->dev,
-			"CS4265 Device ID (%X). Expected %X\n",
-			devid, CS4265_CHIP_ID);
+			"CS4265 Part Number ID: 0x%x Expected: 0x%x\n",
+			devid >> 4, CS4265_CHIP_ID_VAL >> 4);
 		return ret;
 	}
 	dev_info(&i2c_client->dev,
-- 
2.25.1

