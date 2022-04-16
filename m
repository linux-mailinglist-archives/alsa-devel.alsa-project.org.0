Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1C95036A6
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Apr 2022 14:54:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A0541704;
	Sat, 16 Apr 2022 14:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A0541704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650113650;
	bh=4L3NfQ2POEX6etb/24DF8Wi9rMkJiPPS08lGG/w6ZOE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jBJUqOWVelkKRBhfYM47sfQX250T7bOuW1Wzx64OHMAIyYK3v6fgZyiLbkS9PQCOF
	 +BLosYzzHATOfeKtq3ZgwNJqoz9oXeTq30dcAz4oDDeqPv44ocz12nW5JzRmfDP4f1
	 HxxDFvztJ7rXEaLVHO/NaM7SGRtgtv77Zj8hcG1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5AEAF80095;
	Sat, 16 Apr 2022 14:53:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A538CF80161; Sat, 16 Apr 2022 14:53:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 953D0F80095
 for <alsa-devel@alsa-project.org>; Sat, 16 Apr 2022 14:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 953D0F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sqjDUeyh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF84560EFA;
 Sat, 16 Apr 2022 12:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448D3C385A1;
 Sat, 16 Apr 2022 12:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650113582;
 bh=4L3NfQ2POEX6etb/24DF8Wi9rMkJiPPS08lGG/w6ZOE=;
 h=From:To:Cc:Subject:Date:From;
 b=sqjDUeyhMqgzLpinaGvocS/A3bPmWA4FJ6ObHacfWbHSEVFCIHT80eOMc8LkWlx/D
 5WP9sfJTCRtzSsv0KIU2zk6mUiXBdyZYfCE/ick2HCO1Pa4ew1wTvnX0KjmQxDkRtM
 IZDGCEv5izY+du7xsD19yooCd7ncZMbJrrV1K69nD2w4tWCcpv3AOSeeusHCUdaxMD
 3UGUN+eAO7d+rlHAjxTEy0HEFQ+u8SyltflXFnNKgz5k/veQhh4DzT7imGBwMreUO9
 L9eCM7rvi4wl1YqNwQ0VvVVxPWc7VQysVELFuot8MQ+IXE+/aIaUMASoV6EiR6PRcB
 cq4EB6dbAYxsQ==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: da7219: Fix change notifications for tone generator
 frequency
Date: Sat, 16 Apr 2022 13:52:56 +0100
Message-Id: <20220416125257.197348-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624; h=from:subject;
 bh=4L3NfQ2POEX6etb/24DF8Wi9rMkJiPPS08lGG/w6ZOE=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqSoPYIH/WtCS8oXXMlmOKBV6McXWZdgffvRwclpDyYpSKd3
 pIV3MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQATqVDlYGhQ6Vigec3W4uqq7i8COz
 5r/xPzeXN80uqS/fUvJLqmv3zw2Wqxy/KiTNPIiMfJfzcaTuS7lcYUlrBM7U5rxX/H9Rr+qXLrzlee
 OJMy0+vH9k3PTVQ750oKKD9NK3/3YXVpR+2hzbZsHa11E0T7TI9KtZdbNs4Sv743ZvUMm5imy0V2ys
 WvHR33cy5/ezEt3o/357xkUX+O2Hf5YuyLNosHzytkenla+dYRHcNVEQ87RJ94Cj7WvD3XjGVqNDeP
 09Yun01JcZVL39wx4z7/1thsnldCWlJ/TkWN1PfTvjN/X+ZVSr9/11hhktjfGJFypbNSHf12Ur+yK5
 i31HX8Y7yUln+dMbZIa9bhFQU+AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

The tone generator frequency control just returns 0 on successful write,
not a boolean value indicating if there was a change or not.  Compare
what was written with the value that was there previously so that
notifications are generated appropraitely when the value changes.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/da7219.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index a28d3601b932..166a3cad3445 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -446,7 +446,7 @@ static int da7219_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mixer_ctrl =
 		(struct soc_mixer_control *) kcontrol->private_value;
 	unsigned int reg = mixer_ctrl->reg;
-	__le16 val;
+	__le16 val_new, val_old;
 	int ret;
 
 	/*
@@ -454,13 +454,19 @@ static int da7219_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 * Therefore we need to convert to little endian here to align with
 	 * HW registers.
 	 */
-	val = cpu_to_le16(ucontrol->value.integer.value[0]);
+	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
 	mutex_lock(&da7219->ctrl_lock);
-	ret = regmap_raw_write(da7219->regmap, reg, &val, sizeof(val));
+	ret = regmap_raw_read(da7219->regmap, reg, &val_old, sizeof(val_old));
+	if (ret != 0)
+		ret = regmap_raw_write(da7219->regmap, reg,
+				&val_new, sizeof(val_new));
 	mutex_unlock(&da7219->ctrl_lock);
 
-	return ret;
+	if (ret < 0)
+		return ret;
+
+	return val_old != val_new;
 }
 
 
-- 
2.30.2

