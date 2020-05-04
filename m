Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DDE1C3B8D
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 15:46:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 436431717;
	Mon,  4 May 2020 15:45:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 436431717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588599985;
	bh=SE9mgX2cVxfHH9O3cBjLROz83EJFEYiEW37CpvRMQHc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NCjaPn1KG1oig5r1gImKaeIk0ELFgvTvFT79TS4488ga0H+nE6TN0P8Ft8PwpyRtj
	 ZP1ZS2pnJlDJqDHWZsLEiYJAiPVl01OWzbYeCY79jQ6XwfY+Xid27zU5uavg4XyII7
	 ntzOw7C4dzkgw6KTF/T6dJfGss/jIdm715kHt5mk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B0F9F80258;
	Mon,  4 May 2020 15:44:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24BAAF80249; Mon,  4 May 2020 15:44:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F6A4F800EE
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 15:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F6A4F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SJ2RAe0h"
Received: by mail-oi1-x242.google.com with SMTP id i13so6615820oie.9
 for <alsa-devel@alsa-project.org>; Mon, 04 May 2020 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=fKmW+1ZOOw5yEYVWDgFJz125CSW4gCA3lXH+BFydT68=;
 b=SJ2RAe0hmehcElOi7VI7CyUX9d4WnhNKKhIjne5pwD4fw4Lu4JOxO6+BDaSAGrtpKA
 kBmWuwnP+KoGnjQcPuFUtKXUzFz3/LwU2HaQc4coxRIb/Z7HSV5tksbEFN0wv+fNcSnI
 2RBJF4EnUh0+HgDk1QcDr0FgDm/cvgpJKkkv5cxfnOyGbz5OKl7cpGPBMx2IzL+3ix6m
 6fn8v0aO4g4GiDEKYlBowaxpj1Gq4d/WGZZP5dsDQttRAM/d8GVQLDkXXpDVkVR/hEhp
 otlZrXzz3FRGcVAPFCU8nWY1WtoHu+mD4ByL8i6zrqFk4N9mK5nwOb1j2Q44NXEVdkXy
 IwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fKmW+1ZOOw5yEYVWDgFJz125CSW4gCA3lXH+BFydT68=;
 b=WFF0dI4lf/vzd5dpJ4uHtiW7566a6sqcxxoQwUhHnFKg8bIHWs8bfpyFOzlgNYOqpe
 s9ePbhpUDucKpfhaRAIulglnFOO09jlE7IMyKKrL90qlrVlFD8uSIuh4llXfC3Axe+Zj
 y12ex6HvKMlE7JfX2K/tl221KWozn2XlFO8djmBfJ+4JVzn+wEgCGW9HEZa5NLuEBicD
 7sNHprYlzMnz3emUEMIn/2+26IhBK8Sm7H1inKLcsoS+tZjrQfj1mO4v4bynjfZ8dw4c
 FtstKE+mJywFx/9RMPlvp8mrm69Do2hBai6Ug690fnoMXfUsyWseRVzn7yNLWHO2r33p
 nOJA==
X-Gm-Message-State: AGi0Pubh5YLmc8ecGhN7bD3BU+1XXXyZjfVgxy0/mxz25uPW2MBxfLUe
 LIMVk9NZUIndcu7/dQSSrQrPJsa3BeTUBg==
X-Google-Smtp-Source: APiQypIbLIzDkhan5aCP77GaAlUOeWaUCWbbr8gyOm+5O/2rWXlap4fC48/dQsS5aloiGS/l0ZFlPQ==
X-Received: by 2002:a05:6808:24f:: with SMTP id
 m15mr9285435oie.152.1588599876677; 
 Mon, 04 May 2020 06:44:36 -0700 (PDT)
Received: from cdgarren-ubuntu.attlocal.net
 (99-145-188-157.lightspeed.iplsin.sbcglobal.net. [99.145.188.157])
 by smtp.gmail.com with ESMTPSA id c13sm3314649oos.14.2020.05.04.06.44.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 May 2020 06:44:36 -0700 (PDT)
From: chris.d.garren@gmail.com
X-Google-Original-From: cdgarren@indesign-llc.com
To: alsa-devel@alsa-project.org
Subject: [PATCH] Mark the ADAU7118 reset register as volatile.
Date: Mon,  4 May 2020 09:43:20 -0400
Message-Id: <1588599820-57994-1-git-send-email-cdgarren@indesign-llc.com>
X-Mailer: git-send-email 2.7.4
Cc: Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Chris Garren <cdgarren@indesign-llc.com>
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

Signed-off-by: Chris Garren <cdgarren@indesign-llc.com>
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

