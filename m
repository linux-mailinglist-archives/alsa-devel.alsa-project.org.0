Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B66A1DABE5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 09:23:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B014F17C4;
	Wed, 20 May 2020 09:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B014F17C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589959431;
	bh=qXr5uimdM1mHbGHEtiEl0HeyUn/TC6zdn426tINDyB0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vVEfVYws5fFbrX6xqHRItfpPUN0a9WSCGSzJriy+YX03fncdQWoBqT/7HcoyCoJUC
	 9GAxseyrb1RWapyFFhhbGwr3PF1OmDtKBZyWVr2ZKYJKDagNtORCtx4HY5Rdtqgzml
	 odNfj4sglNhW0A3XB8Ge/m4lWxr6T32AsGF/S42c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A839F8028E;
	Wed, 20 May 2020 09:21:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43DC3F8026F; Wed, 20 May 2020 09:21:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2172F801DA
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 09:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2172F801DA
IronPort-SDR: O2A7XhfDbkH3yLGAs+Ql+z1ljHuxMCaIwWLTyHK/SvzWG0no3JovrMLMvPwxupWofTIdKzrQvI
 ToyZjDeRofQZ4zKVlFPEwna6xB8aiaeZ22aNX1A/ACcMfVDgI4h8bk8DHiRbvLfmqfq19KmJnZ
 t+VKStUjg6tw57sLcJwWGIBqn9usThNtXdwPpWj0N4EakW8UbEOu8Okw/tvRjrIKyEDzUTkQEO
 UgGspdxStyOC1gY0L0dIm9ngXaC8YiL3Gfo+TM638chFH1XVnz3840eeiJ0tCTUk5VvSPoqTG2
 sW8=
X-IronPort-AV: E=Sophos;i="5.73,413,1583190000"; 
   d="scan'208";a="8907986"
From: Pavel Dobias <dobias@2n.cz>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH 2/6] ASoC: max9867: don't use regmap defaults
Date: Wed, 20 May 2020 09:19:00 +0200
Message-ID: <20200520071904.15801-2-dobias@2n.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200520071904.15801-1-dobias@2n.cz>
References: <20200520071904.15801-1-dobias@2n.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX04.axis.com (10.0.5.18)
Cc: broonie@kernel.org, ladis@linux-mips.org, Pavel Dobias <dobias@2n.cz>
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

MAX9867 codec doesn't have reset pin, so the registers don't
have default values in the case of reboot without powering off.
Remove the reg_defaults struct and let the regmap read initial
state of the registers at startup instead of taking them from
reg_defaults struct.

Signed-off-by: Pavel Dobias <dobias@2n.cz>
---
 sound/soc/codecs/max9867.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 6d49a1cc98c6..93431646f2c7 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -463,35 +463,10 @@ static bool max9867_volatile_register(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct reg_default max9867_reg[] = {
-	{ 0x04, 0x00 },
-	{ 0x05, 0x00 },
-	{ 0x06, 0x00 },
-	{ 0x07, 0x00 },
-	{ 0x08, 0x00 },
-	{ 0x09, 0x00 },
-	{ 0x0A, 0x00 },
-	{ 0x0B, 0x00 },
-	{ 0x0C, 0x00 },
-	{ 0x0D, 0x00 },
-	{ 0x0E, 0x40 },
-	{ 0x0F, 0x40 },
-	{ 0x10, 0x00 },
-	{ 0x11, 0x00 },
-	{ 0x12, 0x00 },
-	{ 0x13, 0x00 },
-	{ 0x14, 0x00 },
-	{ 0x15, 0x00 },
-	{ 0x16, 0x00 },
-	{ 0x17, 0x00 },
-};
-
 static const struct regmap_config max9867_regmap = {
 	.reg_bits	= 8,
 	.val_bits	= 8,
 	.max_register	= MAX9867_REVISION,
-	.reg_defaults	= max9867_reg,
-	.num_reg_defaults = ARRAY_SIZE(max9867_reg),
 	.volatile_reg	= max9867_volatile_register,
 	.cache_type	= REGCACHE_RBTREE,
 };
-- 
2.20.1

