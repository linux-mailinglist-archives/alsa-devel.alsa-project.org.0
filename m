Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B067440DD05
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 16:40:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42CFB1890;
	Thu, 16 Sep 2021 16:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42CFB1890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631803245;
	bh=0X3kpnizMEqpdAGwiy3i6bfLojY5A0w5gROUO13B+RE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FhDcHRGyfmpWLzk47/JsyY1HIY/8SxgNXy1hx15q5yTfQW0spN8GvoIVsz/xhr7ae
	 2FybUTQLwWBJ5sPdnQbyLCZGWILiCJlhrobUGmLDfiOthu3/ZmWU/akT8+J0TzTROs
	 c8lHGbYHpNNzGuviADH4CEQH5djNYuHFkMkfQSjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7C68F80271;
	Thu, 16 Sep 2021 16:39:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AF54F8025E; Thu, 16 Sep 2021 16:39:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D54CF80117
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 16:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D54CF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tdwJu+qw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFB53611F2;
 Thu, 16 Sep 2021 14:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631803161;
 bh=0X3kpnizMEqpdAGwiy3i6bfLojY5A0w5gROUO13B+RE=;
 h=From:To:Cc:Subject:Date:From;
 b=tdwJu+qwpNAAK3yUECc88nkXXaLqLKDKzPIFBc1xI1fRCe+iVP3fdDiuX5tlCuFQJ
 nFebeMao9C2ANYT/U9U1SkiyUGoy+5GbXoAZfoR8RiKe9g7MEc8OBVaT0WP7v7iTCT
 EdtUMUSS8bHqxATWpvbdMZTgNtDzVkBuNXf9cETtoqULhjgLr02NxZRPO9b8uZCLXI
 CISazn+Z+eqrg7OnVrKm/dQtteq6LJ88sR7/d0Xeu1DyZmqGr1t5dNrmmypWNbUMH6
 g/0DTKQ8MTe+xAf25rxQ6matPPfvPVuGWLqWkveLOdoXywgoR3zWEIr0bLLwnXvcFU
 qBpbTnKxQxSYg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ep93xx: Convert to modern clocking terminology
Date: Thu, 16 Sep 2021 15:38:28 +0100
Message-Id: <20210916143828.36215-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2116; h=from:subject;
 bh=0X3kpnizMEqpdAGwiy3i6bfLojY5A0w5gROUO13B+RE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhQ1YcMvWuIRFFbL5ZA7ccCvndS0uAnDejwNEqFxv6
 HXPDE/mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUNWHAAKCRAk1otyXVSH0BKkB/
 45E3Zf3godjmyaVcRHABUbBMVYeYaqiupUEenZFFGNZOfekqjSVkPNwpdTGHIvmdNP0hut3e7vWk6R
 j3w6jdwmohRSdkN7+Ld6HxX46K6QflQ0LxRHVJ+nunuFThNH1aE1tL1c+EXWNwl1D9+6uHgG90NSb/
 GNJiaAPxlhmXgx13TcFCDmADlJBe/K6IoNy6ukTx+fNQXc4rYZBA2Ut/Zeboiy7AjhP+3LYMEzAK+k
 M/5XNdZjsz7D1oWZoh7k0ET6+0cNzO8TBs8TrVsP6b/hu0L6W25ugrWgnx4aOcZZ3+b6GqpNvD/5FS
 1FQETfNbs4Uy79M1lIsYq0u6lZmiN+
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

As part of the effort to remove our old APIs based on outdated terminology
update the EP93xx drivers to use modern terminology.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/cirrus/edb93xx.c     |  2 +-
 sound/soc/cirrus/ep93xx-i2s.c  | 10 +++++-----
 sound/soc/cirrus/snappercl15.c |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/cirrus/edb93xx.c b/sound/soc/cirrus/edb93xx.c
index 7b6cdc9c8a23..385290202912 100644
--- a/sound/soc/cirrus/edb93xx.c
+++ b/sound/soc/cirrus/edb93xx.c
@@ -60,7 +60,7 @@ static struct snd_soc_dai_link edb93xx_dai = {
 	.name		= "CS4271",
 	.stream_name	= "CS4271 HiFi",
 	.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			  SND_SOC_DAIFMT_CBS_CFS,
+			  SND_SOC_DAIFMT_CBC_CFC,
 	.ops		= &edb93xx_ops,
 	SND_SOC_DAILINK_REG(hifi),
 };
diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 0d26550d0df8..06c315a4d20a 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -245,14 +245,14 @@ static int ep93xx_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-		/* CPU is master */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+		/* CPU is provider */
 		clk_cfg |= EP93XX_I2S_CLKCFG_MASTER;
 		break;
 
-	case SND_SOC_DAIFMT_CBM_CFM:
-		/* Codec is master */
+	case SND_SOC_DAIFMT_CBP_CFP:
+		/* Codec is provider */
 		clk_cfg &= ~EP93XX_I2S_CLKCFG_MASTER;
 		break;
 
diff --git a/sound/soc/cirrus/snappercl15.c b/sound/soc/cirrus/snappercl15.c
index c4b112921661..a286f5beeaeb 100644
--- a/sound/soc/cirrus/snappercl15.c
+++ b/sound/soc/cirrus/snappercl15.c
@@ -70,7 +70,7 @@ static struct snd_soc_dai_link snappercl15_dai = {
 	.name		= "tlv320aic23",
 	.stream_name	= "AIC23",
 	.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			  SND_SOC_DAIFMT_CBS_CFS,
+			  SND_SOC_DAIFMT_CBC_CFC,
 	.ops		= &snappercl15_ops,
 	SND_SOC_DAILINK_REG(aic23),
 };
-- 
2.20.1

