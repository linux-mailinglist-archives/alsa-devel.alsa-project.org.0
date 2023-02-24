Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA436A1D43
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 15:09:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 147551ED;
	Fri, 24 Feb 2023 15:08:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 147551ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677247787;
	bh=rybO/20a98fdHKZtAB7oYS7Qk4A/VAIx86q+e/5lOVk=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ah11tsNXBrTHq6geOwT0ve1l/Bxi5FWUcp84qWZcRf/Orrpno5uYau5AZfuavQPuB
	 QIh0jZBEfwu6FTLmnNO4RKQmEK1HFRXyhf306O3iFscje3bR9/U2QusHxf38IaW288
	 E39UBmymv/iTIUBAFejBxMr5/NwVAugS/muY+ZzQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE5CDF80116;
	Fri, 24 Feb 2023 15:07:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24765F800DF; Fri, 24 Feb 2023 15:07:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B2A7F800DF
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 15:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B2A7F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OmTs//tH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 349B7B81C96;
	Fri, 24 Feb 2023 14:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08BFC433EF;
	Fri, 24 Feb 2023 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677247659;
	bh=rybO/20a98fdHKZtAB7oYS7Qk4A/VAIx86q+e/5lOVk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OmTs//tHgMOqlO4pBkuI4QNT+r3RvoMDvdw6thVQrGkpocB8Sbjw0sf0o8vq/PDCc
	 1NrGOdY32Yy1zieCRxbHRtcTTwguX5Z3xNyM54a0t6kiBUCnOSEpGmaQNBlQJCKAVn
	 jeNUxHqKEfDgZIVNxTdkxsT+MhaMA20dUZP4p3qfCX/OPzDLkm4V2SaBuEKPRyuqq0
	 tc/9hNdSjA6NQH38QetCmZggKlxxXR0S+M1f/UinzPSFPIiWXdhakdRdgwWyJH1fg2
	 MKUWaOJK2u9ZygQbyifTdd5m86m1a8n3tvtOXQ0O3f2cZI3UQ8ShV55MURfxZ8OEyp
	 6zrH74kutPU5Q==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Feb 2023 14:03:56 +0000
Subject: [PATCH 2/4] ASoC: mt8192: Fix event generation for controls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-asoc-mt8192-quick-fixes-v1-2-9a85f90368e1@kernel.org>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2499; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rybO/20a98fdHKZtAB7oYS7Qk4A/VAIx86q+e/5lOVk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+MSi4fcXZN3SX4ycFjonmo5T8TgNsx4vC5u7yU/9
 bTHy3wOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/jEogAKCRAk1otyXVSH0D3vB/
 9ia/xAkAhL29HBF3oLJN4EAHzoTo9/U803oY9OmuCnbFYIyZfbExiJ6KEEtVehzMd2/QmsbP52SuSh
 lmofPFSTpP/RTnKEIIYTwtci+Zbs00fBAswcmXXZka9HvxLx+9Clo17BXibbr/LfXDvEFmew3hT8wj
 FETIwQi7SE4Z16st+sJz/+9U2vexecqNTjz8FpBvo9mU4iOOsJCoacyPafifC9MmIYca+0RzvJkL8h
 6IYxu5L6Smkv6Pl0sqhhmI5SIQKzHu5Rvg7bFKut8PPA88GBms825FDxn4rAjObpCVhaPXdVDEXK5Y
 dl0sdV86a6hAyiIxp4EWsqi2ZErFF7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: XQR6UETNBMZK5EGQET34UII7SEPVKFN7
X-Message-ID-Hash: XQR6UETNBMZK5EGQET34UII7SEPVKFN7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQR6UETNBMZK5EGQET34UII7SEPVKFN7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA controls put() operations should return 1 if the value changed and 0
if it remains the same, fix the mt8192 driver to do so.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index bc8753f1001c..a33d1ce33349 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -591,16 +591,19 @@ static int stf_positive_gain_set(struct snd_kcontrol *kcontrol,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int gain_db = ucontrol->value.integer.value[0];
+	bool change = false;
 
 	afe_priv->stf_positive_gain_db = gain_db;
 
 	if (gain_db >= 0 && gain_db <= 24) {
-		regmap_update_bits(afe->regmap,
-				   AFE_SIDETONE_GAIN,
-				   POSITIVE_GAIN_MASK_SFT,
-				   (gain_db / 6) << POSITIVE_GAIN_SFT);
+		regmap_update_bits_check(afe->regmap,
+					 AFE_SIDETONE_GAIN,
+					 POSITIVE_GAIN_MASK_SFT,
+					 (gain_db / 6) << POSITIVE_GAIN_SFT,
+					 &change);
 	}
-	return 0;
+
+	return change;
 }
 
 static int mt8192_adda_dmic_get(struct snd_kcontrol *kcontrol,
@@ -621,12 +624,17 @@ static int mt8192_adda_dmic_set(struct snd_kcontrol *kcontrol,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dmic_on;
+	bool change;
 
 	dmic_on = ucontrol->value.integer.value[0];
 
+	change = (afe_priv->mtkaif_dmic != dmic_on) ||
+		(afe_priv->mtkaif_dmic_ch34 != dmic_on);
+
 	afe_priv->mtkaif_dmic = dmic_on;
 	afe_priv->mtkaif_dmic_ch34 = dmic_on;
-	return 0;
+
+	return change;
 }
 
 static int mt8192_adda6_only_get(struct snd_kcontrol *kcontrol,
@@ -647,11 +655,14 @@ static int mt8192_adda6_only_set(struct snd_kcontrol *kcontrol,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int mtkaif_adda6_only;
+	bool change;
 
 	mtkaif_adda6_only = ucontrol->value.integer.value[0];
 
+	change = afe_priv->mtkaif_adda6_only != mtkaif_adda6_only;
 	afe_priv->mtkaif_adda6_only = mtkaif_adda6_only;
-	return 0;
+
+	return change;
 }
 
 static const struct snd_kcontrol_new mtk_adda_controls[] = {

-- 
2.30.2

