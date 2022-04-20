Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0205C50896F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 15:35:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B2EF1A9D;
	Wed, 20 Apr 2022 15:34:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B2EF1A9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650461749;
	bh=GHrFOdpg6TspBSfnDAG+ZUkqiO+u514wMfcPZJ/f39M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n9DmxCH1qTIXVY/LT50tVKy6rY0l7AQtR3vU5KZjxvQabF8MK7eXl2j+r0r9O0hc5
	 SYxnemNM448ROaVRadVCoXVHodHV930yfG7a7B/PJ6EQTwI4BPoBY4175UO0P2gWiM
	 0fMqEjH54z7qt015iQJ9D/nhiRQ/5hsKY5UWOMNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05232F800C1;
	Wed, 20 Apr 2022 15:34:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6695DF80125; Wed, 20 Apr 2022 15:34:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77699F800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 15:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77699F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F8uPJlns"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30ECAB81D6E;
 Wed, 20 Apr 2022 13:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35C3C385A1;
 Wed, 20 Apr 2022 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650461682;
 bh=GHrFOdpg6TspBSfnDAG+ZUkqiO+u514wMfcPZJ/f39M=;
 h=From:To:Cc:Subject:Date:From;
 b=F8uPJlnsHpqEmINv3CBOCJD294sm5dfqM6MWCjtoXfgNxbLLetavt/FNbLRyMuQkh
 Hkn3jm2LzTcat6dlALOfmQyV6ZJZRsOxD1L1YZwSGYRNAgh/SWEbP+pXoNeNYKAVX/
 n4ZFIcTCEAgeX89auYRVHWN6nahbpr4s11y/3iOxW0HFbFFraSl+T3gCFeSPApUB33
 5z/B4VYWUOlyaC05SkRCVC5RAgYwktcCCrwTVJTvaPRNpAYDbhcDvLOaNZ/SrvML2M
 bzrDvUJ4DgapZvFADTXSOlkTTcqDBMBRBi8ZWh0G0bWornbP6+HfmbD367Vrg3MAQx
 mLhsfGpvoXJ8g==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3] ASoC: da7219: Fix change notifications for tone generator
 frequency
Date: Wed, 20 Apr 2022 14:34:37 +0100
Message-Id: <20220420133437.569229-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; h=from:subject;
 bh=GHrFOdpg6TspBSfnDAG+ZUkqiO+u514wMfcPZJ/f39M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiYAu12WDnBuqOCA/FrEsGT7yCDwHQQAjNv1YLGsRe
 0Pbb2oqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmALtQAKCRAk1otyXVSH0G96B/
 40Kki0Bf/4vX06GlBzuuwjPr0P4xvKUJSlFeZ7pS8P+tL6KGzOKOqACGAWOHETVnbJSApq3S3vOXNm
 dvxUcmJJtWocGY7MGh4pRz7EsQzj025Kox59BxKWUC2c15sj5i8D8OtyB5rVX5nKs8esgKZi5h/VVq
 FSqE6Saj2eDNdO2DJA0xcLgiAzKdUrJoN3iuMCSqilziwxtxE0QtF/1eg5+THHHB7eYS3Kagt9/0Tf
 dxAJxZdAOSa11x2T4RfDUHXMF0XH0ljP7SbDvwjX+4VY1mN2R/Z8EFPihSjY8dQ9N8N81ELPvdUFPd
 2CtY11A5STWbb6bqnpcewrZnEaYjuo
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
notifications are generated appropriately when the value changes.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/da7219.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index a28d3601b932..7fdef38ed8cd 100644
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
+	if (ret == 0 && (val_old != val_new))
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

