Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D7953BA39
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:57:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8D4A17E0;
	Thu,  2 Jun 2022 15:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8D4A17E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178243;
	bh=UV4KLVXEt3csZ4I0hhI3jLBRmZFWgvdIqhB74FxI2ts=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=usOjj4T4ZiY6E///4g1UmaUpCdXdvE/G5IVT9nz+lwZFUO1yCGEZJV2sWP9RiDTyy
	 rKiZR/EQUDM6+PX/YmnjIzcd0RAPUn+HC9+tfeXjx2kw3E5YAMDuQ2YNtChQH/hYwo
	 WX+pTATb9MQwKd7smcX6fEVkfPH2Potd+3jmTJjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 323A3F8057B;
	Thu,  2 Jun 2022 15:53:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37EC3F8055A; Thu,  2 Jun 2022 15:53:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E52CEF80542
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E52CEF80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s4It3ktf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 99872617C8;
 Thu,  2 Jun 2022 13:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B099FC3411E;
 Thu,  2 Jun 2022 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178010;
 bh=UV4KLVXEt3csZ4I0hhI3jLBRmZFWgvdIqhB74FxI2ts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s4It3ktfFAV5+JQc+gVat2lQNMIfPd8Mh2kwi1tBkCE9Xmcpz7zdoxZnBT1QXBt6C
 rR7RrsT3s9zT0ESS4pKbIzopeLT3P08uiIt071N5/oWUXyfsKU7rIFJtS3uzdESQdj
 /iJGNNP0ewtD/fhxbqtNzeiegp6hSYK2g//x33QX+ImGk6eeDm8bXMhrYnZtUB8CPB
 wRgFvS6/KJvSfD7i8ScI9SMW8RYTRIKEsiH62kYUKvx/5uZRyHjdCL5RTvVUEYwQJO
 14Nhwog47BiB8CWnvUH44Ev6Fshtnf7yUjfZ0Dm3dN7NlrM/qUSCQASsz/Vc23Lq6I
 u2xy395JcXcgw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 07/20] ASoC: tas2552: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:53:03 +0200
Message-Id: <20220602135316.3554400-8-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245; h=from:subject;
 bh=UV4KLVXEt3csZ4I0hhI3jLBRmZFWgvdIqhB74FxI2ts=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCTUz5Ds4tI7A5V1us79mT1aCreuzPKcaPPAPOn
 b9IMtQOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAkwAKCRAk1otyXVSH0CjYB/
 4/zTUANI+EdJlybmejVvHo72wnhsklMVvYeYvcMakdV4HHX3H8K2C5NJTXUDMKiZwp+qd2clHgEJVq
 n6u99pePWV7iNx3kiRkH4nPemCVU6QoXR4wSqetHXm5DHMpI28CFkdu3p3zQNIvVcZi++p3encruJw
 g6GYEAQxcTJC0ufRFos27XQbbh96j94P6eS2q4lXzkzuYnidD5HJzj5gbt5jKtMs8SIhl/58DV9xxo
 2rIYfvYsFF733uJoX7eS6Wa9fxDu8uZXfZ9oA3S9TYbapm3y+frBFJUuNlYh+vEq3qN+If7RhNznMB
 pFCtwhvIGoxfpvC5QNz5E7XhBYpV2r
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
the tas2552 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2552.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index b5c9c61ff5a8..c98a9332dcc0 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -347,17 +347,17 @@ static int tas2552_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct tas2552_data *tas2552 = dev_get_drvdata(component->dev);
 	u8 serial_format;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		serial_format = 0x00;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		serial_format = TAS2552_WCLKDIR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		serial_format = TAS2552_BCLKDIR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		serial_format = (TAS2552_BCLKDIR | TAS2552_WCLKDIR);
 		break;
 	default:
-- 
2.30.2

