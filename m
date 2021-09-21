Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D704A413C1B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:13:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E3021662;
	Tue, 21 Sep 2021 23:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E3021662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632258797;
	bh=5FoglGhrG3Np/tp5bGtEm2iCfzLwPDQrLEC6Huv2RHY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dY6pHS2J8DvsToGKCHablMNZ0o5v4QsI7M78c1euKLJeMiF7LRft74XVX77oXKLbP
	 nWTsi9TgYOdh6wexY8cWoKU0eFyAnKW3PoQ1WmMKM/6upNgqn7ftQCg1gdEn4Aphg8
	 8RNSdWbEEyL3Ny3NkKm0c/8US9sAmJZnwvpaQsm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 847A7F804C1;
	Tue, 21 Sep 2021 23:11:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7CAEF804D8; Tue, 21 Sep 2021 23:11:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAA0FF80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA0FF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RmBgOWyf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0179361215;
 Tue, 21 Sep 2021 21:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258690;
 bh=5FoglGhrG3Np/tp5bGtEm2iCfzLwPDQrLEC6Huv2RHY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RmBgOWyflzYLjFGfZBDb6XVFMvQxzAFE7AQZ+FhZ0lW0I1Agw56Jtx6zBUzFsaGJA
 b1NnwoIq57i2AtD2HBDeXIu9w83HS/eUL1r3mEiyi2U23r51Pcd7irypzkvnoVIspX
 oUDTUUTHh3wZYayLb4aTbgEe+O7MDIXuVxO5Y7/2E8UcuTCeZgbS9+O0BwEnaD1C5t
 /Yijj619Rn7e6iEeWjL4539lYcvq4kvnjCAMsk9//2y0iVg9VANCGEz/n7bRMiMP8y
 GY+yrClVAlg72wFlGE0cVKpzMXYBIwozOjX8rEKnXcnTL5cFfX6u59qB5W0/GYseVI
 x8LMG/n/KOHUQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 03/16] ASoC: fsl-audmix: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:27 +0100
Message-Id: <20210921211040.11624-3-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; h=from:subject;
 bh=5FoglGhrG3Np/tp5bGtEm2iCfzLwPDQrLEC6Huv2RHY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknd/nDDWkKlcZIUp3rJHsMJKCA8o1OHJI7wny+f
 erTk/ceJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ3QAKCRAk1otyXVSH0B6eB/
 0RDqcKKslsghXE069hqe+132vQcWoxOiBRTpK4jOm/YHG75MBJm10NhfVNv0QQQph9n1P53oXS+gmn
 zlHq805vFwufjJQ9V58LynYbkvBfgQO8qzor0iG/ldBs4YdMVpBU+O42D+n9I+I0nZ+IvhRlMoT4YT
 exAkZlkz0n6/SP1sZDs0NHjdr4AAS0mTwICqS+z5NV657zJY+NO9KvA4VJLh+BxZuXUnTHDfgDm7MN
 oV7LkHEtDU1dRA+nIkA1yBhxEB7/fYRVeWc6N832cVUYoOimojqqZjuYWx8oiJucAHZ+dXP7wMSyra
 GxoIa9DI2+suEzQy+d+Si5MyQ7rQUt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
the fsl-audmix driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_audmix.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index f931288e256c..db2dde597edc 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -257,10 +257,10 @@ static int fsl_audmix_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	/* For playback the AUDMIX is slave, and for record is master */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBS_CFS:
+	/* For playback the AUDMIX is provider, and for record is consumer */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

