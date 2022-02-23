Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F84C075D
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 02:48:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F105418FA;
	Wed, 23 Feb 2022 02:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F105418FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645580934;
	bh=5CAjIKC0VMu1R3E3C8NcG583ClrD6tSIBkhg5E5cSx8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eTJnmpvm4LmqA/ZcTm5AHrsswXpsZ+ZFduVIutD/2rTUu3hYfMbQVm0PnDVwWayg5
	 tFbwUlCRChodLKZTKbazpEnCl8ClVhZfPe2HKfpTfIi48vbqFFqRB6Nbjzt/2SXgR3
	 3BbF6mTTkT6ti116Ncr71W5O6p038xqQXlP8oipk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D9DAF8012C;
	Wed, 23 Feb 2022 02:47:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 484BFF801EC; Wed, 23 Feb 2022 02:47:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A027AF800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 02:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A027AF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TsAO35Go"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 612E7B81E00;
 Wed, 23 Feb 2022 01:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D30AC340F1;
 Wed, 23 Feb 2022 01:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645580857;
 bh=5CAjIKC0VMu1R3E3C8NcG583ClrD6tSIBkhg5E5cSx8=;
 h=From:To:Cc:Subject:Date:From;
 b=TsAO35GoK9ONBkcoF8s49d8RvJ/Q6Ra0gRLYK1KujDnBvOuhZd+Uqw7rSbAKH+2RL
 syPMp5dfWtvkfirhCRcTy9h1XCrg74cMy021sJBiQMIxtGrrYXxBWdxhqcaIIf9cRK
 +XHl/r9Z7ijJTWrw1b5IPTZLjHWic+783ON/kwX0rQ2Xd9PT5PZ617Aph+O+CfRUgz
 43QKy7H6FggDYFM5kCaaZzNZn+RNndfZkiHwP5r5U3LFJmNZj1wiJ2PBmP3Q7Dzz8a
 i7qHF6pBQttsqj/DvwHz5m6yVKzy57FmWWzya08+2uIzWeEFAcHFeACRFdKTJq0kRP
 44BVb0k5QJoiw==
From: Mark Brown <broonie@kernel.org>
To: Kirill Marinushkin <kmarinushkin@birdec.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: pcm3060: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 01:47:31 +0000
Message-Id: <20220223014731.2765283-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885; h=from:subject;
 bh=5CAjIKC0VMu1R3E3C8NcG583ClrD6tSIBkhg5E5cSx8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFZIdGIkZRO82OgMkjJUuZnvOBlsviBJd6JLL92q8
 PGFE6yuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhWSHQAKCRAk1otyXVSH0Oq/B/
 kBUTzqOll0muc2vF3qp+HQa2yL+Piv99zg7k5ZlBwY/HRv5uR2uo2WWb19ZbsgLyQslIaiWlPVlc25
 mTF3SWUGYY+7da4lhDDfr1w989Z+AwZ0Gn3Ax8dbF0L2dw8qSSIVrtH3Tootkq/hdEJdPShlhxSWV4
 eHWbPzpyD8HXZWAkaSRTtlCovWuudeoQ0g15+MEu/H9i8n8xsydQt3oCr00DAVh4pd4sf8ysTy3rJ+
 RJUVmHM2FuFnKsq3FICU/7k3fmr+g68djK4KeUScU+5oxFmDCcyHZAEtwIR6MzvpQ4uFb/QP5sYOjD
 k+tiBCgX2RiNb1fCjdO0bHZchzrYU6
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
the pcm3060 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm3060.c | 14 +++++++-------
 sound/soc/codecs/pcm3060.h |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/pcm3060.c b/sound/soc/codecs/pcm3060.c
index b2358069cf9b..4e3bfb9fa444 100644
--- a/sound/soc/codecs/pcm3060.c
+++ b/sound/soc/codecs/pcm3060.c
@@ -68,15 +68,15 @@ static int pcm3060_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-		priv->dai[dai->id].is_master = true;
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+		priv->dai[dai->id].is_provider = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
-		priv->dai[dai->id].is_master = false;
+	case SND_SOC_DAIFMT_CBC_CFC:
+		priv->dai[dai->id].is_provider = false;
 		break;
 	default:
-		dev_err(comp->dev, "unsupported DAI master mode: 0x%x\n", fmt);
+		dev_err(comp->dev, "unsupported DAI mode: 0x%x\n", fmt);
 		return -EINVAL;
 	}
 
@@ -116,7 +116,7 @@ static int pcm3060_hw_params(struct snd_pcm_substream *substream,
 	unsigned int reg;
 	unsigned int val;
 
-	if (!priv->dai[dai->id].is_master) {
+	if (!priv->dai[dai->id].is_provider) {
 		val = PCM3060_REG_MS_S;
 		goto val_ready;
 	}
diff --git a/sound/soc/codecs/pcm3060.h b/sound/soc/codecs/pcm3060.h
index 18d51e5dac2c..5e1185e7b03d 100644
--- a/sound/soc/codecs/pcm3060.h
+++ b/sound/soc/codecs/pcm3060.h
@@ -23,7 +23,7 @@ extern const struct regmap_config pcm3060_regmap;
 #define PCM3060_CLK2		2
 
 struct pcm3060_priv_dai {
-	bool is_master;
+	bool is_provider;
 	unsigned int sclk_freq;
 };
 
-- 
2.30.2

