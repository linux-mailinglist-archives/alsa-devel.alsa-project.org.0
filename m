Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4017850494E
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Apr 2022 21:29:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6592169A;
	Sun, 17 Apr 2022 21:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6592169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650223752;
	bh=VU/5Z4haxYYhKE4V9VwJdtTsYNsxP6Lu/CcB9TW67Vo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sxfKeenKG3C4k8u9PlenArzRwcjDyK1ffOFGGjneDg9yoXkO2NFkezaxVq1EmaDSK
	 HyM3BTnvJxR7OLl/F8vPme470FA8gIo+r+pAE+FeN8FoAnE8xCrn1PjQzRShl9uThA
	 2Cjj8thDQyV0biVYX+/OOke+/Xz3xx3gjfzwwoDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41333F80253;
	Sun, 17 Apr 2022 21:28:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E245DF80155; Sun, 17 Apr 2022 21:28:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDC0DF800FB
 for <alsa-devel@alsa-project.org>; Sun, 17 Apr 2022 21:28:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDC0DF800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jpnpgXmg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C55A860C91;
 Sun, 17 Apr 2022 19:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2280CC385A4;
 Sun, 17 Apr 2022 19:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650223685;
 bh=VU/5Z4haxYYhKE4V9VwJdtTsYNsxP6Lu/CcB9TW67Vo=;
 h=From:To:Cc:Subject:Date:From;
 b=jpnpgXmg1B7ppZL5yTdi5635naOwcPNcF0FJJJPGfKfN24wC49XlhLaE3EpFtCjA1
 ax15cWbqlH1htFoSTDRcudHUriTlms0ijcW3HZK/kN5fUOjUgnptHUDutl3Dx/gbt/
 dWYsFqkCMAeMtxtkxImZL6IAvq5VTomdDyFdMUgBsmyKZgInsQwWWx/at13E0yOXSh
 /9+bq/gw4clw+gie0O67adsLoXYWA30nTrO5lr1HrSIeAw4qB35knrgK0ynYjerXiD
 9UpgaGBRKifQME7xz1CF7+abXL5ObYxstwv3Fe+ctMXxJ5ksWPG7P0AMuGOHo2VWZi
 npKGgBX6n4ycA==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2] ASoC: da7219: Fix change notifications for tone generator
 frequency
Date: Sun, 17 Apr 2022 20:27:33 +0100
Message-Id: <20220417192733.7382-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624; h=from:subject;
 bh=VU/5Z4haxYYhKE4V9VwJdtTsYNsxP6Lu/CcB9TW67Vo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiXGn59/wJ+xHZJaBfMQIQLFbTJbNONVprTdL2ioau
 DBKogl2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYlxp+QAKCRAk1otyXVSH0EG7B/
 9/0j6mDiTBIj9/KOwISLLJUKu1ktt+x0I5w7QP6zdK0x4dVJqCs80r+oqY/bFw9yorGiA6py1FlbQy
 7vFm1J6402cT88YwvcmlRgW0qltD7wRsjV4lGcCeG2NeKvovRDDAYqbl0rwai8EjATatzwhZiETPfv
 QIFQA6x3gE0iTMO4SLdpGjBD8eY/yMil5qtx2ijQPOsiZg010Yr+cIYhQz2+0HJULIo0F0H2sLxau9
 C2vKT9BCEamA4ldXynGwYfzTjTBPup34qetztbPb5HyBRoIuNZHhonzE9XusF+B2Eu+Tit0IqY2Y5T
 jgAWSV2+Ly+Wia79pdteEevlatiUpu
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
index a28d3601b932..c08e15830cec 100644
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
+	if (ret == 0)
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

