Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 370AC688C5B
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 02:16:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50BE61E4;
	Fri,  3 Feb 2023 02:15:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50BE61E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675386977;
	bh=KI7LsyRZh+ySLC38SIBqG/XmNl+8rjUy3XC1RUXhcXY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=avrZHBmxycZvajWrGhmbkbYiL9BXd3PCc0GJwF7H6LfV03WLAoXieqC/oFCDq+RtM
	 b+17xZJeX4Raxi/GYZwRB+2Ein3ee4SfaDLCaFMSSMNXcriLFxF+bDKqDB2RP74jr9
	 HbLnHT9WUGRLQ5Lub9g/CsCLWNGKgljX6lzligMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B27A2F80271;
	Fri,  3 Feb 2023 02:15:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F4DEF80169; Fri,  3 Feb 2023 02:15:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=5.0 tests=ENV_AND_HDR_SPF_MATCH,
 SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 346CEF80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 02:15:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 346CEF80169
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R561e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VamSsuS_1675386905; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VamSsuS_1675386905) by smtp.aliyun-inc.com;
 Fri, 03 Feb 2023 09:15:06 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: perex@perex.cz
Subject: [PATCH -next] ASoC: codecs: fix platform_no_drv_owner.cocci warning
Date: Fri,  3 Feb 2023 09:15:04 +0800
Message-Id: <20230203011504.78918-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, broonie@kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

./sound/soc/codecs/aw88395/aw88395.c:572:3-8: No need to set .owner here. The core will do it.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3935
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 sound/soc/codecs/aw88395/aw88395.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index bce403744c1a..16ca7ac5ad28 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -569,7 +569,6 @@ MODULE_DEVICE_TABLE(i2c, aw88395_i2c_id);
 static struct i2c_driver aw88395_i2c_driver = {
 	.driver = {
 		.name = AW88395_I2C_NAME,
-		.owner = THIS_MODULE,
 	},
 	.probe_new = aw88395_i2c_probe,
 	.id_table = aw88395_i2c_id,
-- 
2.20.1.7.g153144c

