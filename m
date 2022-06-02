Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C07AF53B611
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 11:30:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DB701724;
	Thu,  2 Jun 2022 11:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DB701724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654162242;
	bh=0MkC4xAzK+OBepmHgGbAmP/hq9VUQW/1GZNUdwuJr0E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LKay4KmsgTc5KOdP+3ZBtUhTNVN/H9bvL6uFTrgdfGyTAL7eZvCwT8ddNNTwnJh5B
	 r9oSxxPHVRKkfCj9Hlar9r6IJIPkS4eUzwUG4oC1K9AmDHw2IGPYnp6rzZlgsE2xSe
	 e4GYMMgA8b07NDGBRvmDM54xnk8sJ5ZZyqoRI7Vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBD6CF8025E;
	Thu,  2 Jun 2022 11:29:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A72BEF80236; Thu,  2 Jun 2022 11:29:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E911F80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 11:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E911F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Nr81SdxZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8DC0BB80DAF;
 Thu,  2 Jun 2022 09:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C72CC385A5;
 Thu,  2 Jun 2022 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654162173;
 bh=0MkC4xAzK+OBepmHgGbAmP/hq9VUQW/1GZNUdwuJr0E=;
 h=From:To:Cc:Subject:Date:From;
 b=Nr81SdxZt3ed8yLhZYcW62v88T9jMvtZj4CCP7uzpIysHSxVKFMLk1LXqYzh4+sBg
 OJyXo6Za60wFhlrSQFyD763zy38KpVKJGRRCiRcUeDKNj1Rx7U1Ef/mtChhS5mFqON
 k6z+6KPTL69ZVlk6BRYHuMat6ccl5winvD+3IK2Bjuk1xmXpuNbJW9f6R6u20UNAyX
 Lz2I6123Vhw8tHL1KE8kFbWo8f+CdKm69d9UiqePKDk0+aEMv3ofABdVH3EP2G4/NJ
 ijfurmpyePJXk12SNH4IZ7ok3r5exOPAIFOY4bPvCx67AdBWLnCOZ1OyVWRS0mogk9
 ggZhA8L/DqrPg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 David Rhodes <david.rhodes@cirrus.com>
Subject: [PATCH] ASoC: ops: Clarify snd_soc_info_volsw_sx()
Date: Thu,  2 Jun 2022 11:29:20 +0200
Message-Id: <20220602092921.3302713-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2019; h=from:subject;
 bh=0MkC4xAzK+OBepmHgGbAmP/hq9VUQW/1GZNUdwuJr0E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimICzJv/x7we2qnbmB0FIMSP4gwVY4kJaw5PF0KmA
 ZO+V8niJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpiAswAKCRAk1otyXVSH0KZzB/
 4nrTSWtBGxnAn1AfmmQTxi/axn+W2B2gLHsGBeKAa1W3s0zdTJlZfU83ow/Gm8z4J3QoZ6iE6A3rHw
 xyVWQumetPV4crIMcZ4y0jUTFZH50lYcenvdR7IWRgBzuVVXZVNbUNGrjQaRGZRMthv+RaqsF4x/lV
 GxtLGW1sX/8uW7APpiMhv5TOPfwitdgS/GDFdL0Y5YgySvBnJjJmGblwMhmexvTcI3TEuKTZ83aPtK
 VEDOLQ16jeKRGme1aSF7x0iViq+/1gN/Vxuddw3Bl+ABsOpD3apdVo9BWSasTOqnTAE33oIOVGxdn6
 JPtFhI2Y1tY/G8fGv5/UI93Emby+Z6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

Currently snd_soc_info_volsw_sx() is implemented indirectly, wrapping
snd_soc_info_volsw() and modifying the values it sets up rather than
directly setting up the values reported to userspace. This makes it much
harder to follow what the intended behaviour of these controls is. Let's
rewrite the function to be self contained with a clarifying comment at the
top in an effort to help maintainability.

Signed-off-by: Mark Brown <broonie@kernel.org>
---

Build tested only.

 sound/soc/soc-ops.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index a0ca58ba1627..03010577046c 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -203,7 +203,8 @@ EXPORT_SYMBOL_GPL(snd_soc_info_volsw);
  * Callback to provide information about a single mixer control, or a double
  * mixer control that spans 2 registers of the SX TLV type. SX TLV controls
  * have a range that represents both positive and negative values either side
- * of zero but without a sign bit.
+ * of zero but without a sign bit. min is the minimum register value, max is
+ * the number of steps.
  *
  * Returns 0 for success.
  */
@@ -212,12 +213,21 @@ int snd_soc_info_volsw_sx(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	int max;
 
-	snd_soc_info_volsw(kcontrol, uinfo);
-	/* Max represents the number of levels in an SX control not the
-	 * maximum value, so add the minimum value back on
-	 */
-	uinfo->value.integer.max += mc->min;
+	if (mc->platform_max)
+		max = mc->platform_max;
+	else
+		max = mc->max;
+
+	if (max == 1 && !strstr(kcontrol->id.name, " Volume"))
+		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	else
+		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+
+	uinfo->count = snd_soc_volsw_is_stereo(mc) ? 2 : 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = max;
 
 	return 0;
 }
-- 
2.30.2

