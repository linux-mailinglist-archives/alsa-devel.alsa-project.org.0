Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C4040CC4D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 20:05:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4537C1817;
	Wed, 15 Sep 2021 20:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4537C1817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631729150;
	bh=VUbIc4wQmXDkv8Ba2Pfw6hhvS9PQ0ey0AbpSS7jqsKs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n+YyfC8Y650StnBJsvGihdOre+wE0WxxW4QRmS201w3uZC+LikSp/pb7/PSWFuFR5
	 HGM2sTTvmByWoMhaVlieQ17ZgYBSjyK/s/sDaNn31G4rLmqLcSn2NHcV/zUuwhkSZ5
	 KYdYD6piLcK8yf5CJ41ztbm/N27cVB/tNQkLHjQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96D36F800EF;
	Wed, 15 Sep 2021 20:04:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43E61F8027C; Wed, 15 Sep 2021 20:04:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB7E8F800EF
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 20:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB7E8F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TU3cBfBr"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4EFD611C6;
 Wed, 15 Sep 2021 18:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631729063;
 bh=VUbIc4wQmXDkv8Ba2Pfw6hhvS9PQ0ey0AbpSS7jqsKs=;
 h=From:To:Cc:Subject:Date:From;
 b=TU3cBfBr7qkz4YeLHgv7IkPMQtPj24FUBWkFhc43C5sYKmK5gBNyX467cjeV84/BF
 7h5ee3I6o7qvWnEIZxUd5SzocMOq468LuIe5XGJe4h3Xbys0vAaFtjXwSTJUbaL2qv
 OEh4r9l4Bqmu7ftwfpP1hg5I97qXEk8IaRiP/BczXGpbQbb79wvwHPoLRepL94LwYB
 HBeB8NPNFwL3SlWLj2GaQ2PyTlpujUEU2LODW6CNTFzjhu97ZWVE8ep/sue6KEYFg1
 +MiD234/U+vagL2wKAShvqyFVFNOwNLNl33CqDaTftstb3klQqXNx3sb1O1zfU16Q2
 HwzbgLwGxNEXg==
From: Mark Brown <broonie@kernel.org>
To: Manuel Lauss <mano@roarinelk.homelinux.net>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: au1x: Convert to modern terminology for DAI clocking
Date: Wed, 15 Sep 2021 19:02:56 +0100
Message-Id: <20210915180256.39345-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2839; h=from:subject;
 bh=VUbIc4wQmXDkv8Ba2Pfw6hhvS9PQ0ey0AbpSS7jqsKs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhQjT+moUWo43tV17MKcsZNxypd8Szy2JHPKcPUdc7
 KgPOmHWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUI0/gAKCRAk1otyXVSH0K/hB/
 9utUg0aCqlOL2wizvCL+Of/mqUEE7E4TjCIWUaGrRNqTGoh707TaGbdbon9R3CR6RR4yB7p6pGVYZN
 axo085cEjpy20CgYQ2etkpgvXd/RJCHg5iYEn9/J8LrgfnvXrMOreu1Zmgs85gkRKzEVQqiX8YB0vq
 rl7g4C9xARUF2ZwO032O+MZpL23659YamoHeG+zUDJJHLnj3ib8D6WQMWr0VkgDBDr72uIHBbTQZH7
 BDPsLHaY9WBmhflPClE2f3pDmhHdcZutoM/NLZW3m81WMWDx7KvrZtTXRFfniiJqwoWbGMzIpGc9Kp
 csxufUXupcij/CB0fju9lsl4rZVlYI
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

As part of retiring the old macros defining the DAI clocking mode in the
DAI format update the au1x drivers to use the new style macros.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/au1x/db1200.c  | 6 +++---
 sound/soc/au1x/i2sc.c    | 4 ++--
 sound/soc/au1x/psc-i2s.c | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/au1x/db1200.c b/sound/soc/au1x/db1200.c
index 5f8baad37a40..400eaf9f8b14 100644
--- a/sound/soc/au1x/db1200.c
+++ b/sound/soc/au1x/db1200.c
@@ -117,7 +117,7 @@ static struct snd_soc_dai_link db1200_i2s_dai = {
 	.name		= "WM8731",
 	.stream_name	= "WM8731 PCM",
 	.dai_fmt	= SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_NB_NF |
-			  SND_SOC_DAIFMT_CBM_CFM,
+			  SND_SOC_DAIFMT_CBP_CFP,
 	.ops		= &db1200_i2s_wm8731_ops,
 	SND_SOC_DAILINK_REG(db1200_i2s),
 };
@@ -138,7 +138,7 @@ static struct snd_soc_dai_link db1300_i2s_dai = {
 	.name		= "WM8731",
 	.stream_name	= "WM8731 PCM",
 	.dai_fmt	= SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_NB_NF |
-			  SND_SOC_DAIFMT_CBM_CFM,
+			  SND_SOC_DAIFMT_CBP_CFP,
 	.ops		= &db1200_i2s_wm8731_ops,
 	SND_SOC_DAILINK_REG(db1300_i2s),
 };
@@ -159,7 +159,7 @@ static struct snd_soc_dai_link db1550_i2s_dai = {
 	.name		= "WM8731",
 	.stream_name	= "WM8731 PCM",
 	.dai_fmt	= SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_NB_NF |
-			  SND_SOC_DAIFMT_CBM_CFM,
+			  SND_SOC_DAIFMT_CBP_CFP,
 	.ops		= &db1200_i2s_wm8731_ops,
 	SND_SOC_DAILINK_REG(db1550_i2s),
 };
diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 65bd39f5032d..529284c1f4ad 100644
--- a/sound/soc/au1x/i2sc.c
+++ b/sound/soc/au1x/i2sc.c
@@ -119,9 +119,9 @@ static int au1xi2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		goto out;
 	}
 
-	/* I2S controller only supports master */
+	/* I2S controller only supports provider */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:	/* CODEC slave */
+	case SND_SOC_DAIFMT_CBC_CFC:	/* CODEC consumer */
 		break;
 	default:
 		goto out;
diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index 767ce950d0da..40bbf83c492f 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -91,11 +91,11 @@ static int au1xpsc_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:	/* CODEC master */
-		ct |= PSC_I2SCFG_MS;	/* PSC I2S slave mode */
+	case SND_SOC_DAIFMT_CBP_CFP:	/* CODEC provider */
+		ct |= PSC_I2SCFG_MS;	/* PSC I2S consumer mode */
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:	/* CODEC slave */
-		ct &= ~PSC_I2SCFG_MS;	/* PSC I2S Master mode */
+	case SND_SOC_DAIFMT_CBC_CFC:	/* CODEC consumer */
+		ct &= ~PSC_I2SCFG_MS;	/* PSC I2S provider mode */
 		break;
 	default:
 		goto out;
-- 
2.20.1

