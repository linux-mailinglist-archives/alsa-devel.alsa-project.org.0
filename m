Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA86340DDA0
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:10:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 466D41897;
	Thu, 16 Sep 2021 17:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 466D41897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631805016;
	bh=7ik/e25uzON0Js4Ojoci9rws5U8Y8jX5d+rGhB/WV1k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T+uMdbEqmXiw+2A93nA6nZzb08VN1igshtCtBEQ601BK2jpBcTuBLG6y9YJEn+Pzw
	 3Ei92P5myZDE421Ort9MiC2p+hmIZzNbdbmLHOEZc9Lgz6vWPMp2Q+AjM5KGkyMpd6
	 URugiv41oNHPeGHHB23qPejyss31ZSLPMpPEezDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94FAFF80113;
	Thu, 16 Sep 2021 17:08:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECA0AF8025E; Thu, 16 Sep 2021 17:08:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B257F80117
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B257F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qsS0VFCK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35BF161108;
 Thu, 16 Sep 2021 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631804927;
 bh=7ik/e25uzON0Js4Ojoci9rws5U8Y8jX5d+rGhB/WV1k=;
 h=From:To:Cc:Subject:Date:From;
 b=qsS0VFCKHhXqBKSOzbibEZVZnBPJH3Utg5czklAixioQo1IjboiR3JZ9cl6vmcGWR
 kQ9StKcGZ1G/g1BnWZvCsngom0MY5XR2Q6fMqGN2HLDdRWdviRl5t/ffGxMUhyu5Le
 qF6Bfg+0w0ejj7Zi4ZmfkFNglLdWf9gmj/i/0nXtQkJVKpIIwo9pRpIsCOtwtao/xk
 yMC9FjuSe53GXk/KDD8JSkWkgAkSu4q+etlnlQ/NrfxB+koFt0XbADT8Wqipej9XU8
 JQYD0Mye4h5bGJFFZ5zbfVl9mkG5/xpGXXw84BQXYFvVW6k5/jtvN82OKQPxwVlnOC
 rdUhZYpWQpcXQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ak4118: Update to modern clocking terminology
Date: Thu, 16 Sep 2021 16:08:04 +0100
Message-Id: <20210916150804.20058-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1808; h=from:subject;
 bh=7ik/e25uzON0Js4Ojoci9rws5U8Y8jX5d+rGhB/WV1k=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhQ11uJNeuxuUyvzyqrbegT6M//nvSz4ALuRjavl6y
 YGQ0ZwGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUNdbgAKCRAk1otyXVSH0FFSB/
 9+AIF6W6e7rvsG56dIGrupK+fiOCon6qvqYxCEhKTJRN+xuBMKgZZA9I1k72wX2epRBF8xIy/kcrDN
 fZQ92DtExySzeeS0FMmgiOzEVNdFFMChEvLQYRIlyxwL7hN1w4lmcgYqoIhY+/DnaSEPejvayfvGqT
 4+FEYOgHN4OH8ymWZ2vuDvqbr2jpeks8wZn35eqpko7FQlsxJu1VEMNYV7igzli6Mp4hJGNpmMePo1
 g8o6FuD+jKYleXdaHaejOpIr5132rRK6+fgKACCA6ERT27unv7x3YJBB0x5eacMaeeZ8X7cCdGXN6C
 XFKYFrne1eqrUObgwY8JEGXoWYLMmw
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
the ak4118 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ak4118.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
index 5d46ae85566c..e0a6451851e8 100644
--- a/sound/soc/codecs/ak4118.c
+++ b/sound/soc/codecs/ak4118.c
@@ -151,8 +151,8 @@ static const struct snd_soc_dapm_route ak4118_dapm_routes[] = {
 };
 
 
-static int ak4118_set_dai_fmt_master(struct ak4118_priv *ak4118,
-				     unsigned int format)
+static int ak4118_set_dai_fmt_provider(struct ak4118_priv *ak4118,
+				       unsigned int format)
 {
 	int dif;
 
@@ -173,8 +173,8 @@ static int ak4118_set_dai_fmt_master(struct ak4118_priv *ak4118,
 	return dif;
 }
 
-static int ak4118_set_dai_fmt_slave(struct ak4118_priv *ak4118,
-				    unsigned int format)
+static int ak4118_set_dai_fmt_consumer(struct ak4118_priv *ak4118,
+				       unsigned int format)
 {
 	int dif;
 
@@ -201,14 +201,12 @@ static int ak4118_set_dai_fmt(struct snd_soc_dai *dai,
 	int dif;
 	int ret = 0;
 
-	switch (format & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-		/* component is master */
-		dif = ak4118_set_dai_fmt_master(ak4118, format);
+	switch (format & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+		dif = ak4118_set_dai_fmt_provider(ak4118, format);
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
-		/*component is slave */
-		dif = ak4118_set_dai_fmt_slave(ak4118, format);
+	case SND_SOC_DAIFMT_CBC_CFC:
+		dif = ak4118_set_dai_fmt_consumer(ak4118, format);
 		break;
 	default:
 		ret = -ENOTSUPP;
-- 
2.20.1

