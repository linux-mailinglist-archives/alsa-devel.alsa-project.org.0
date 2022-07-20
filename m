Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8297357ABD1
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 03:18:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17F031709;
	Wed, 20 Jul 2022 03:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17F031709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658279890;
	bh=zpto+oeNiWjXnod2Q4EhyPbxGSUuEeTxG/WNDLCYAkc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ljSb1M53WsqiV6z5fHZUfHgygVegiQkyVjVgi3TL9Sr35y+YTBHYU2ACONKCHdrtX
	 eBGzvb9lLctnuVS08lsICo4rIxTO0bIVL4wSziIpkLvVrzvUnJBncIwLOXv/D1JdSl
	 WrkngqEnhNuUJvW4jLc6yEeZ6uLFDVPLp6XgTOOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 236A3F80566;
	Wed, 20 Jul 2022 03:16:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61ABCF80563; Wed, 20 Jul 2022 03:16:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD2F0F804FA
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 03:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD2F0F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oJHJnu59"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46511617BF;
 Wed, 20 Jul 2022 01:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFE6C341C6;
 Wed, 20 Jul 2022 01:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658279749;
 bh=zpto+oeNiWjXnod2Q4EhyPbxGSUuEeTxG/WNDLCYAkc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oJHJnu59Xbj4LOfhpk4QbJ8AYKw2lnNZ7sqFXVQha7RRL8yCFAC1o0sUvD5DjqnYb
 V8UF/f8tIOwtwlg8wVgZFq1iPcUzYyjcKVca37MPbXKiRztVDnwP1+MEezRmgD7qbE
 qjzLmC6Mzhd1U88j/++jNqGVvueCmuSq39wvfcJJHFbFgXw+Zk4hCWjWNP1QbWWprf
 bk4fCJz/U98v/0Iv6+ZwHoNB3Qj4lcl9hr+VkyhQ/S6rpkYtsFWzT7ievW3CDryAcN
 zJX86uoc8/F/UEwM9Da3NZMZD25P92hpU66SXL20zryIwFCl2z97BuIhG+LgX+q/dK
 dLBpwBswXjRSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 31/42] ASoC: wm8998: Fix event generation for
 input mux
Date: Tue, 19 Jul 2022 21:13:39 -0400
Message-Id: <20220720011350.1024134-31-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011350.1024134-1-sashal@kernel.org>
References: <20220720011350.1024134-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 tiwai@suse.com, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit 15b2e5d10ccf32a1a1ae7c636511e2f51320fdb5 ]

wm8998_inmux_put returns the value of snd_soc_dapm_mux_update_power,
which returns a 1 if a path was found for the kcontrol. This is
obviously different to the expected return a 1 if the control
was updated value. This results in spurious notifications to
user-space. Update the handling to only return a 1 when the value is
changed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220628153409.3266932-2-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8998.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index 00b59fc9b1fe..ab5481187c71 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -108,6 +108,7 @@ static int wm8998_inmux_put(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mode_reg, mode_index;
 	unsigned int mux, inmode, src_val, mode_val;
+	int change, ret;
 
 	mux = ucontrol->value.enumerated.item[0];
 	if (mux > 1)
@@ -137,14 +138,20 @@ static int wm8998_inmux_put(struct snd_kcontrol *kcontrol,
 	snd_soc_component_update_bits(component, mode_reg,
 				      ARIZONA_IN1_MODE_MASK, mode_val);
 
-	snd_soc_component_update_bits(component, e->reg,
-				      ARIZONA_IN1L_SRC_MASK |
-				      ARIZONA_IN1L_SRC_SE_MASK,
-				      src_val);
+	change = snd_soc_component_update_bits(component, e->reg,
+					       ARIZONA_IN1L_SRC_MASK |
+					       ARIZONA_IN1L_SRC_SE_MASK,
+					       src_val);
 
-	return snd_soc_dapm_mux_update_power(dapm, kcontrol,
-					     ucontrol->value.enumerated.item[0],
-					     e, NULL);
+	ret = snd_soc_dapm_mux_update_power(dapm, kcontrol,
+					    ucontrol->value.enumerated.item[0],
+					    e, NULL);
+	if (ret < 0) {
+		dev_err(arizona->dev, "Failed to update demux power state: %d\n", ret);
+		return ret;
+	}
+
+	return change;
 }
 
 static const char * const wm8998_inmux_texts[] = {
-- 
2.35.1

