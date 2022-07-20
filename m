Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0554657ABCD
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 03:17:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F1401718;
	Wed, 20 Jul 2022 03:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F1401718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658279839;
	bh=kJrQBRgcHwPrceGKRT8UGUQb08ZTG9IZ5DwasvAIodQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AswAXcYiOH96uTO25OLLiiIT/+/UQPnSHUkRfC8+nDz3PQR5e8KdI4GnmX/0Tnmtg
	 j9u5WXyIkdnjfKQHnU7pLdoBg3DBk4bIpMc+9W0xDdcUl8rQncDq5UmBGKwrCCasJF
	 PDuFskaZUmVCsh81uxKVdD70T8LFdwZ5OmsBMW+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E1E1F8054A;
	Wed, 20 Jul 2022 03:16:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE46EF8028B; Wed, 20 Jul 2022 03:15:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F203AF8028B
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 03:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F203AF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iZW/q1oy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4492616F6;
 Wed, 20 Jul 2022 01:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1E7C385A2;
 Wed, 20 Jul 2022 01:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658279746;
 bh=kJrQBRgcHwPrceGKRT8UGUQb08ZTG9IZ5DwasvAIodQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iZW/q1oy1EJvnnNoklZpvn6+zAysnU5j1kz3kPGkAyFazbWrgvPn9SswjvX8qjair
 tGKDR/PHLulGsBXXe2vrPLNmmoZ4btbOJwu2xNpCMMxBJFcRBSe4GhjOtmWFgw7MH+
 GJwjW4obYEAv4kpY4P1zuAu/pafwmGrQtyuJSSoYJmu0Gww/uLrvLcGHb8KNLzzFEH
 jgf3DTKq7MJhG9VuzYJQcx7LtH8MgZ6VcXHHmHBDhlLVvt5NhOSSL0lpamKOA/B1Bv
 M0BgENes3SBiQCsKDGSpCwPCrZGMBCqV9yesI6rdJAHM78QaWO96a5p7JHXjFE16QG
 SPHlV6m+oTjhQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 30/42] ASoC: wm5102: Fix event generation for
 output compensation
Date: Tue, 19 Jul 2022 21:13:38 -0400
Message-Id: <20220720011350.1024134-30-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011350.1024134-1-sashal@kernel.org>
References: <20220720011350.1024134-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 simont@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit 71b5ab96ffe6589abe7a2e302b83f7a426ebe099 ]

The output compensation controls always returns zero regardless of if
the control value was updated. This results in missing notifications
to user-space of the control change. Update the handling to return 1
when the value is changed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220628153409.3266932-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm5102.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 621598608bf0..fc3d4e1a9c55 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -680,12 +680,17 @@ static int wm5102_out_comp_coeff_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
+	uint16_t dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
+	int ret = 0;
 
 	mutex_lock(&arizona->dac_comp_lock);
-	arizona->dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
+	if (arizona->dac_comp_coeff != dac_comp_coeff) {
+		arizona->dac_comp_coeff = dac_comp_coeff;
+		ret = 1;
+	}
 	mutex_unlock(&arizona->dac_comp_lock);
 
-	return 0;
+	return ret;
 }
 
 static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
@@ -706,12 +711,20 @@ static int wm5102_out_comp_switch_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	int ret = 0;
+
+	if (ucontrol->value.integer.value[0] > mc->max)
+		return -EINVAL;
 
 	mutex_lock(&arizona->dac_comp_lock);
-	arizona->dac_comp_enabled = ucontrol->value.integer.value[0];
+	if (arizona->dac_comp_enabled != ucontrol->value.integer.value[0]) {
+		arizona->dac_comp_enabled = ucontrol->value.integer.value[0];
+		ret = 1;
+	}
 	mutex_unlock(&arizona->dac_comp_lock);
 
-	return 0;
+	return ret;
 }
 
 static const char * const wm5102_osr_text[] = {
-- 
2.35.1

