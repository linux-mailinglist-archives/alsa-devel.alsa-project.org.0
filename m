Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3844740DDE1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:21:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCD3718CD;
	Thu, 16 Sep 2021 17:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCD3718CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631805678;
	bh=1fPbhNGEhbIFx/+HnHGtY6R/Py/p+36DF/HypOidaOM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LyPA7pSIXUi3ukvgg6ulR9MmPzREthJEWOWFHDprD6iu0rkGVWNfe4g441VWrFAKD
	 eNAok6S89ReabDtP/6dn8KMdduL3sQMbCDfdxOJlhOpU1tZZpDuIgHdEA6B1M3k8I5
	 Mfgc1oZKgjUn/VdCRw8hKDvLyuj8lGpgjgCg2vUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5768FF804ED;
	Thu, 16 Sep 2021 17:19:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D09A2F804E7; Thu, 16 Sep 2021 17:19:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 156DCF804E5
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 156DCF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W1okENj2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14F8C6113E;
 Thu, 16 Sep 2021 15:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631805534;
 bh=1fPbhNGEhbIFx/+HnHGtY6R/Py/p+36DF/HypOidaOM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W1okENj2fMlPoKyC9UZ/n+/f9PS0iMSUJpLprei6U56QjjJsf8P+GGxVqGLyANVzg
 5JQhC7H+ykMIQZQexQtiDPRdZVjwN62t1i4ov3tRn1OPwjU6SwM3A5tG5lzQZIG1Ka
 p9PoB55gADfGFd2GppM7Cxxqh9FFgDUrcPZncJgaI5j12zlOqeq7xUAgUHV3lEZNpD
 Sve07/XVqXUzTvT5j28zARO7dTVWm8BsT06eg9lexe5CCPJmND+G75e2XKjR0zCYm1
 8FaXMcjabUrMHNKoYXvnkW+FnmZhdWGHH177XVDVOcCH3yawgDzI7ucq7zhQtdu4n3
 bVbpqHA/Ibmsg==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/6] ASoC: adau1373: Update to modern clocking terminology
Date: Thu, 16 Sep 2021 16:18:02 +0100
Message-Id: <20210916151806.20756-2-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916151806.20756-1-broonie@kernel.org>
References: <20210916151806.20756-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; h=from:subject;
 bh=1fPbhNGEhbIFx/+HnHGtY6R/Py/p+36DF/HypOidaOM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhQ1+pXnDMnKrHY6ZSA2XB4MqQEJ4PuVC0gJgZ9R5q
 qevKTUaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUNfqQAKCRAk1otyXVSH0E9oB/
 4gWEzSXoPerbcroJ2DDWWFu3lrloRjf1yKoAdfdfQ2cxLhOoy0FJssRsfs23BGj6UiEyc8mR+FejLy
 oeBfZDn2Gj8jtuoYn9tbeNGaFLShRHu1WHWbiEhWVe7QtM0juF7HcF3Onpy1GnATlt2raY9Pg0Ayb+
 n0XNLkaZojvxfYKCI7YeEbxHPDLTlzCHpVCs7EbR3ku7H4GZf6rEIeeecivv+E6iSOg5zizrI+Ohr8
 Wa0yozJPh1Ydaoxmau6HgRjeYA5V06RinVWcSNxPSAbjRgrPcyj92McuQg4GoLa0NTgbPkqmzDeXDu
 DjhQ6YjH+++pe0PfIO6VGbgLbhoWDY
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
the adau1373 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/adau1373.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index 9887aa6f0be5..46128aaceae9 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -28,7 +28,7 @@ struct adau1373_dai {
 	unsigned int clk_src;
 	unsigned int sysclk;
 	bool enable_src;
-	bool master;
+	bool clock_provider;
 };
 
 struct adau1373 {
@@ -827,7 +827,7 @@ static int adau1373_check_aif_clk(struct snd_soc_dapm_widget *source,
 
 	dai = sink->name[3] - '1';
 
-	if (!adau1373->dais[dai].master)
+	if (!adau1373->dais[dai].clock_provider)
 		return 0;
 
 	if (adau1373->dais[dai].clk_src == ADAU1373_CLK_SRC_PLL1)
@@ -1102,14 +1102,14 @@ static int adau1373_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct adau1373_dai *adau1373_dai = &adau1373->dais[dai->id];
 	unsigned int ctrl;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		ctrl = ADAU1373_DAI_MASTER;
-		adau1373_dai->master = true;
+		adau1373_dai->clock_provider = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		ctrl = 0;
-		adau1373_dai->master = false;
+		adau1373_dai->clock_provider = false;
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

