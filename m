Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7EC1C36C0
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 12:23:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 846C716F0;
	Mon,  4 May 2020 12:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 846C716F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588587799;
	bh=SXNvhQwTnbwTuR5FxUGKuug9gPGPdfRyQRUMLLRPwto=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j6ClhG5m8BKP9ZVrLEqP+yl2Q1Frwan2O9fmScxE3FOp076zEBlbAgelrrD28J2zE
	 D/DbhqD6HqT8J2WGsYHefikaczEiIaUdggDpryod8u0+eW7RrSbMJLjIo9b7YGT9bF
	 7a5e8xK+1J8vbw1ayKcGyujO9K4wufXyDRuGmUrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A36B4F80258;
	Mon,  4 May 2020 12:21:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D77CF8022B; Fri,  1 May 2020 22:31:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7E15F800B6
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 22:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7E15F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IZueHg+q"
Received: by mail-oi1-x244.google.com with SMTP id t199so791197oif.7
 for <alsa-devel@alsa-project.org>; Fri, 01 May 2020 13:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Aw3e8mVIvyJuuMHDBcmrpRZQ8pmUJ6/p3E0ejTnOzLI=;
 b=IZueHg+quAhEQZcazBYn5lKk4Q5bWSeNfEqDuUoumS/xMd8mCgg9UBGE5JGNew5DGT
 YZTnlW+KAcgpL/2xMTrivpOzAoEIOJP0A2I8uRxPiHciqfxhBscwxEWhcaz7Q4fMYNI4
 iENxQ4Uis9S3WEhvcc8XYe093cAwcaF8X+nFq/tQk0ezVpaWGMw6T4WuX+RYrrr49h01
 +1gJQuItA11Vm8mcwmXS50AzQ5GCBFK7HWUETjbMqaiygMJkS8WP7Q30IYXKEBx0KUEY
 IXot/rAuYolf042gQy+JrVLzB7QveKDuFzKFVnBcCMwStnOyY7q/JJlTwtfMhjwA2hcs
 r+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Aw3e8mVIvyJuuMHDBcmrpRZQ8pmUJ6/p3E0ejTnOzLI=;
 b=lD5FX6YGdy9/yAhiM6MqkAwUeX7GsfW4/gtT5rfySvkE7PJIWfV0U8o+AMYqo6y+Nb
 NKW+QyJlZXQ/PEJ9kPLldCUutyF6rvdhkG7Cot5SAKCZ7c/3KJZAuaxlXnnuEBCLR/pb
 0poiiExnYeoJ+EW8NqvMTfsTuacYMXh3IBk/d1+ksDU/TZo7f4Rxqx3I1hVNs7ouMLeg
 4mdeZsvRD5sdFPclLUBCAQlwrlcYI6EyPhBX8J4oATmfTN0GCb7p4lVhgTEsiqjJifNT
 qm0tEVPmpk6LA0lJTFweBM5POoz1DZCBxgZOkN4BkE894v2M5QZzCJieD/N6Q71Xzvwc
 2NOQ==
X-Gm-Message-State: AGi0PubCzn5QapQm98TusLZqB6+4jw47Hm4GO9Sd/LRtccKVD6GLU3MT
 1y8rKXq5PRzD//b3YxMrKUz+6dYMNOY=
X-Google-Smtp-Source: APiQypJwv/nCrXGEQeWx11qFpOFEqxybWYJW6eHaVMR45QnLuZa8bPKKYDDsIuCuPu5Ix2aaQtfmng==
X-Received: by 2002:aca:4541:: with SMTP id s62mr1112665oia.100.1588365066872; 
 Fri, 01 May 2020 13:31:06 -0700 (PDT)
Received: from cdgarren-ubuntu.attlocal.net
 (99-145-188-157.lightspeed.iplsin.sbcglobal.net. [99.145.188.157])
 by smtp.gmail.com with ESMTPSA id s69sm1088111otb.4.2020.05.01.13.31.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 May 2020 13:31:06 -0700 (PDT)
From: chris.d.garren@gmail.com
X-Google-Original-From: cdgarren@indesign-llc.com
To: alsa-devel@alsa-project.org
Subject: [PATCH] Mark the ADAU7118 reset register as volatile.
Date: Fri,  1 May 2020 16:30:06 -0400
Message-Id: <1588365034-59198-1-git-send-email-cdgarren@indesign-llc.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 04 May 2020 12:21:36 +0200
Cc: Mark Brown <broonie@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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

From: Chris Garren <cdgarren@indesign-llc.com>

Without this the previously written value was written to this reg,
which caused the different configuration registers to be reset.
---
 sound/soc/codecs/adau7118-i2c.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/adau7118-i2c.c b/sound/soc/codecs/adau7118-i2c.c
index a821136..aa7afb3 100644
--- a/sound/soc/codecs/adau7118-i2c.c
+++ b/sound/soc/codecs/adau7118-i2c.c
@@ -32,6 +32,12 @@ static const struct reg_default adau7118_reg_defaults[] = {
 	{ ADAU7118_REG_RESET, 0x00 },
 };
 
+static bool adau7118_volatile(struct device *dev, unsigned int reg)
+{
+	return (reg == ADAU7118_REG_RESET);
+}
+
+
 static const struct regmap_config adau7118_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -39,6 +45,7 @@ static const struct regmap_config adau7118_regmap_config = {
 	.num_reg_defaults = ARRAY_SIZE(adau7118_reg_defaults),
 	.cache_type = REGCACHE_RBTREE,
 	.max_register = ADAU7118_REG_RESET,
+	.volatile_reg = adau7118_volatile,
 };
 
 static int adau7118_probe_i2c(struct i2c_client *i2c,
-- 
2.7.4

