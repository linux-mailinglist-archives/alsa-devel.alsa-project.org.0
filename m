Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3C3411A09
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 18:44:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94F0742;
	Mon, 20 Sep 2021 18:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94F0742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632156243;
	bh=qABpphb2XaKL2vEON0wjhBQKVu0Ezte3/vPLGKgwXFM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N5HRlhPaeTUH8OuONb6vFU7NLEkCabMhrUlkouQDNmeTR6fq3/5vhEvZ7wi2MpRXV
	 O+BudxXttALTIbflqVy3OR9SRyedyWu7z13j987k43hWZEaE2feZVqnKoiWvfoh3v8
	 E+gWhXBu2EPkaaPUawpp2kZ3dB8FgMHSwv3mvIqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C6E6F80279;
	Mon, 20 Sep 2021 18:43:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57D39F804B1; Mon, 20 Sep 2021 18:43:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E74A1F80246
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 18:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E74A1F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WGZz9pMX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 179C360F38;
 Mon, 20 Sep 2021 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632156175;
 bh=qABpphb2XaKL2vEON0wjhBQKVu0Ezte3/vPLGKgwXFM=;
 h=From:To:Cc:Subject:Date:From;
 b=WGZz9pMXccE1hLvILSXgt++sPSeHAp0LwhvE0UpSJJ66OuLrfn2WJwvEWTJqXvCIk
 O1WNNJuHFtX45s6evBeJ03UEwU3onwDCTEXWkB0c1lsjy9tS86CWJFB+m22h4SI0Qi
 IjRMK3/CHoYob3YPo8tjhCPSNt73Ed9V88KHuofUEXSEY6Yz7YdjvVOI6HPHV5m+nQ
 oSpmFBaOySbwYkD1fC5p2XLwmYvl0jEj8sj/Bt8/8fxnLKJw4gp3bESm4d94kqWZFo
 dOPVrnj1o+uY7QzWTvkZ5/Lk16VxtAPVgS/Y1S8OGZXXDp5tseJ1DQM13QnA6XLo3b
 X7wQ9sIcaX1dw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ak4671: Use modern ASoC DAI format terminology
Date: Mon, 20 Sep 2021 17:42:11 +0100
Message-Id: <20210920164211.16718-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001; h=from:subject;
 bh=qABpphb2XaKL2vEON0wjhBQKVu0Ezte3/vPLGKgwXFM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSLmqkGqsnsDHF2XJw1FhSM61PH6U5k/KLrEsctZH
 GPobpXOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUi5qgAKCRAk1otyXVSH0KrnB/
 0UKowX7oOkIL79ZOyWHpNpkYJdsqV1ozp4f07+E6J+hhBohEucYxnFkjibp6QdrzsdZPE8dzZtl7/6
 NVghGl2EY35YSNxtXLzUeXi1MJmZmX3ZO5uvmf8l9H0NOhiOZmejA4d2hDdaYBXpNSA/z18sXEcULF
 d651DDo/fH18bwpNLPqjhpjbPlqTjqA0I8OKdvUl85bpuGukpo4bye7Q2J0a/qZwIbwS2Snvjqx26G
 guW71iDGMJCnPcy7z91jDyLGbJWYlF8MjR32RcM0QHn8Jlq7nCl8GEYvUJ9mVwipJ9eXew6bNigiH0
 Fj/SVY2HhruDdcSxCuboW3bcGgfFqE
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
the ak4671 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ak4671.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ak4671.c b/sound/soc/codecs/ak4671.c
index eb435235b5a3..e9d1251c4265 100644
--- a/sound/soc/codecs/ak4671.c
+++ b/sound/soc/codecs/ak4671.c
@@ -520,11 +520,11 @@ static int ak4671_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	/* set master/slave audio interface */
 	mode = snd_soc_component_read(component, AK4671_PLL_MODE_SELECT1);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		mode |= AK4671_M_S;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		mode &= ~(AK4671_M_S);
 		break;
 	default:
-- 
2.20.1

