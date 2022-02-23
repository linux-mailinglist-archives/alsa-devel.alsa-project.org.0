Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD6E4C0625
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 01:30:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C712418F6;
	Wed, 23 Feb 2022 01:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C712418F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645576204;
	bh=lGDo+qEG1yuOj0y5qEztRn+2IMqkAqd/iU3NHKxSLn4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q+FHVEECWpOWxYDFLLu1Uhpr/7irKuqC/0x235cYiPu7vi7iTHDQu9IBJBH3OrbZp
	 pNIDrv5hkfjUXUhsjbElltvKJKNG2kI8l5w1q5o0g4P5jxvMsHb665xIGhOqa62imc
	 gc+7YKoto0UvWeAl7D5e8KWiA2YTLHsaHjNFHc9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69432F804F2;
	Wed, 23 Feb 2022 01:28:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45CDBF801EC; Wed, 23 Feb 2022 01:28:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66072F800D1
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 01:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66072F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DucZWD5S"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 68AA0B81D91;
 Wed, 23 Feb 2022 00:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C70FC340F1;
 Wed, 23 Feb 2022 00:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645576098;
 bh=lGDo+qEG1yuOj0y5qEztRn+2IMqkAqd/iU3NHKxSLn4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DucZWD5S9cRdNtFT3n0UcTQ8DerYd5y++iYcItop5E7TqvxrXa5kOvr+LVLzpFwOe
 6jP5n41FZzwLjqEkF9LnuqO5TsY0Ce8b91gbEaIpzVfLDXfkZD5fGePC3F6W8y9dHT
 w1sEZIldeiCgGpVeghcMt+S/XlbwtwHoynj3AWTTfSrc4KGpA0H2X7VcwWiOMxjcjO
 HP2KaZx3JIn6rB6DTcLK+/uC2sFdA+jbF7Y1s1maDMrwuzbMZpo9wyxXC/cA+9nzW4
 B9Qf4HpfRM0gUeH9AEOgMHlLU1Y52/SFJxYNp/O5iPryNuxz36y01pYjJVqrY8YBMH
 9sSmJW7lCqW1Q==
From: Mark Brown <broonie@kernel.org>
To: Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: tscs454: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 00:27:51 +0000
Message-Id: <20220223002751.1574345-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223002751.1574345-1-broonie@kernel.org>
References: <20220223002751.1574345-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3218; h=from:subject;
 bh=lGDo+qEG1yuOj0y5qEztRn+2IMqkAqd/iU3NHKxSLn4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFX9Qep92/la0ioknbDiiMM3WxUgyfes/xkOyJxv1
 CR91kXmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV/UAAKCRAk1otyXVSH0OeGB/
 sE0wo8IB+fiQoMPxT2mR+RZkMTMBezOwFSfMtb8SgGBHr9DxQ+yHUIzZ/gorMqsFoFqISdYPW1gv/F
 N4u6um45iEDiuOLdkC87S+EmHG/sOFbwVGi9JdGogmeP6KAhEMy7vgDpmdgQ824p7FENW0IsSgeATg
 5ftPvclxzimLwhVpvaocaaCMsQsAdUBSZbVuSTLvfyfW3hlTtIXjNm87Tc1DefP7hIdgisI6WfRXZV
 jaPXrDPjG9eyDiCbFjz9ACo0yguIv7EbZ2m7Fp6KmcVfR17YIQq0jJhlwi+JveKDot4V6bCE3+MwVW
 1yQ/LnmtdVjf3jINVwTlfANILMPxmn
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

As part of moving to remove the old style defines for the bus clocks update
the tscs454 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tscs454.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index 43220bb36701..7e1826d6f06f 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -57,7 +57,7 @@ struct internal_rate {
 
 struct aif {
 	unsigned int id;
-	bool master;
+	bool provider;
 	struct pll *pll;
 };
 
@@ -756,8 +756,8 @@ static int pll_power_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static inline int aif_set_master(struct snd_soc_component *component,
-		unsigned int aif_id, bool master)
+static inline int aif_set_provider(struct snd_soc_component *component,
+		unsigned int aif_id, bool provider)
 {
 	unsigned int reg;
 	unsigned int mask;
@@ -780,12 +780,12 @@ static inline int aif_set_master(struct snd_soc_component *component,
 		return ret;
 	}
 	mask = FM_I2SPCTL_PORTMS;
-	val = master ? FV_PORTMS_MASTER : FV_PORTMS_SLAVE;
+	val = provider ? FV_PORTMS_MASTER : FV_PORTMS_SLAVE;
 
 	ret = snd_soc_component_update_bits(component, reg, mask, val);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set DAI %d to %s (%d)\n",
-			aif_id, master ? "master" : "slave", ret);
+			aif_id, provider ? "provider" : "consumer", ret);
 		return ret;
 	}
 
@@ -797,7 +797,7 @@ int aif_prepare(struct snd_soc_component *component, struct aif *aif)
 {
 	int ret;
 
-	ret = aif_set_master(component, aif->id, aif->master);
+	ret = aif_set_provider(component, aif->id, aif->provider);
 	if (ret < 0)
 		return ret;
 
@@ -820,7 +820,7 @@ static inline int aif_free(struct snd_soc_component *component,
 
 	if (!aif_active(&tscs454->aifs_status, aif->id)) {
 		/* Do config in slave mode */
-		aif_set_master(component, aif->id, false);
+		aif_set_provider(component, aif->id, false);
 		dev_dbg(component->dev, "Freeing pll %d from aif %d\n",
 				aif->pll->id, aif->id);
 		free_pll(aif->pll);
@@ -2708,17 +2708,17 @@ static int tscs454_set_bclk_ratio(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static inline int set_aif_master_from_fmt(struct snd_soc_component *component,
+static inline int set_aif_provider_from_fmt(struct snd_soc_component *component,
 		struct aif *aif, unsigned int fmt)
 {
 	int ret;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-		aif->master = true;
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+		aif->provider = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
-		aif->master = false;
+	case SND_SOC_DAIFMT_CBC_CFC:
+		aif->provider = false;
 		break;
 	default:
 		ret = -EINVAL;
@@ -2888,7 +2888,7 @@ static int tscs454_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct aif *aif = &tscs454->aifs[dai->id];
 	int ret;
 
-	ret = set_aif_master_from_fmt(component, aif, fmt);
+	ret = set_aif_provider_from_fmt(component, aif, fmt);
 	if (ret < 0)
 		return ret;
 
-- 
2.30.2

