Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F464A00D0
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 20:26:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A96F51700;
	Fri, 28 Jan 2022 20:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A96F51700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643397964;
	bh=tyJ2sMDa8liiG8FbUQcGAysJSRYi3GmVMEJmQb2mVRU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oTNfR+CVbBpW0FhfPmAJIanssstUhQo+IXnujUzV0tN/BockvSnru6kux1Ryo27x1
	 dI7O1F9CXrMNZFHij6Siup6AN4Eruxe/C9nt1OmcoccDtmu3NoSNx9TiizpkDdPcoq
	 nm/liBfAZmlVqyv5YT6RkbSeda/DOF/DAXcxOLEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 023BEF80246;
	Fri, 28 Jan 2022 20:25:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60A5DF80240; Fri, 28 Jan 2022 20:24:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3959F8014B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 20:24:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3959F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hK84eGww"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8CA25B81CA6;
 Fri, 28 Jan 2022 19:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661CBC340E7;
 Fri, 28 Jan 2022 19:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643397891;
 bh=tyJ2sMDa8liiG8FbUQcGAysJSRYi3GmVMEJmQb2mVRU=;
 h=From:To:Cc:Subject:Date:From;
 b=hK84eGwwHR0Ao8dPWCgOFXeRERxlmGbEm57DuHWf4/AKro+2eK26FbKzVEZmZOBDg
 zBqTiHAkaPVXXl6RSTo5Rnqovmu9mq+6bDQwQtem4/6pIz8bTZn3/2NIt63GHfUuOh
 /MFpFlvDYkLvq3xvwsQ9PzzICaEHbqkKlMJyNnt7elTnYE7Li41tMOhFanb5sTqm+x
 VpjTgAZaVJ6ttTQLCd3Q0jr6HmE0huWbff6GiHpFrrTau/eTZ5rhW49ZRFxGsgcjkx
 nzDlgOFqvolEDMCoXTzp1gmDaoBmAGDoQMiHJfYmvG17c0IoHVL5/v8h4UXRx9tVxG
 9JewWmwtl3+kg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ops: Check for negative values before reading them
Date: Fri, 28 Jan 2022 19:24:43 +0000
Message-Id: <20220128192443.3504823-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; h=from:subject;
 bh=tyJ2sMDa8liiG8FbUQcGAysJSRYi3GmVMEJmQb2mVRU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh9EK/S5g+RZ3ZxFpkexH9+xrmZ8I5rek1AQrJTJy5
 qJpPT7qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfRCvwAKCRAk1otyXVSH0PMeB/
 9Gf9VzuQ5mpK+SjZF3Gcbplapop1klO9ubqM+WjTazEQog/vi52cm0vZLs93YkJE+xUCewRQ5z4Ni8
 +LYWTKvaMoxKpt/w3CtpZiJxckwfQ45rawYIa7pV8onhA/RYeS8g0GShXZRDKaGdHX90VbWTBE4NqM
 QHBUKz/3ZLESWlJ/QSt3b5BwVwvrKSno5Umfk+3HMAj7b1Re9qMGWUawaNIhuKbjSNnJl5rK0jG5Q0
 2OFG0cqXHtw6ihVDTNZA7uMd07nsepfHE3YRHRfx0B72xIQNKlREqsR+HAfAe7mbFaJsCO4HlU8DvR
 /mQ4fMxvm5zqcxfEEJ2hfI+L/2Oe29
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

The controls allow inputs to be specified as negative but our manipulating
them into register fields need to be done on unsigned variables so the
checks for negative numbers weren't taking effect properly. Do the checks
for negative values on the variable in the ABI struct rather than on our
local unsigned copy.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-ops.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index dc0e7c8d31f3..9833611b83d1 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -316,26 +316,26 @@ int snd_soc_put_volsw(struct snd_kcontrol *kcontrol,
 	if (sign_bit)
 		mask = BIT(sign_bit + 1) - 1;
 
+	if (ucontrol->value.integer.value[0] < 0)
+		return -EINVAL;
 	val = ucontrol->value.integer.value[0];
 	if (mc->platform_max && val > mc->platform_max)
 		return -EINVAL;
 	if (val > max - min)
 		return -EINVAL;
-	if (val < 0)
-		return -EINVAL;
 	val = (val + min) & mask;
 	if (invert)
 		val = max - val;
 	val_mask = mask << shift;
 	val = val << shift;
 	if (snd_soc_volsw_is_stereo(mc)) {
+		if (ucontrol->value.integer.value[1] < 0)
+			return -EINVAL;
 		val2 = ucontrol->value.integer.value[1];
 		if (mc->platform_max && val2 > mc->platform_max)
 			return -EINVAL;
 		if (val2 > max - min)
 			return -EINVAL;
-		if (val2 < 0)
-			return -EINVAL;
 		val2 = (val2 + min) & mask;
 		if (invert)
 			val2 = max - val2;
@@ -423,13 +423,13 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	int err = 0;
 	unsigned int val, val_mask;
 
+	if (ucontrol->value.integer.value[0] < 0)
+		return -EINVAL;
 	val = ucontrol->value.integer.value[0];
 	if (mc->platform_max && val > mc->platform_max)
 		return -EINVAL;
 	if (val > max - min)
 		return -EINVAL;
-	if (val < 0)
-		return -EINVAL;
 	val_mask = mask << shift;
 	val = (val + min) & mask;
 	val = val << shift;
-- 
2.30.2

