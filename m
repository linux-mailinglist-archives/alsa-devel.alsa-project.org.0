Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E65AE413BD2
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 22:55:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52EC81614;
	Tue, 21 Sep 2021 22:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52EC81614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632257702;
	bh=dGjvfvSTWTNQNBliIU7w7FiM7JiBmz5XNydMTw5hfLg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qXl3b1Y12JSAjK80ua7oJDEnIwEkUcIZ28Xpj0ckvvd3WtiM/gUxnpG/qvweTtQcJ
	 pFwYMOez9Ah9PCccNLeEcsZ1FqZPcfRjB2y8IuHzTLU/XptqTAszNgmhjOgIvO+/gE
	 /JHmOfbu7dufjHp7EBu0i1R/YAi1evMWQlifx9PQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EBB4F8026A;
	Tue, 21 Sep 2021 22:54:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3FC5F804A9; Tue, 21 Sep 2021 22:54:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3691BF8016E
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 22:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3691BF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jLwGsQ/B"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7866561165;
 Tue, 21 Sep 2021 20:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632257639;
 bh=dGjvfvSTWTNQNBliIU7w7FiM7JiBmz5XNydMTw5hfLg=;
 h=From:To:Cc:Subject:Date:From;
 b=jLwGsQ/BfxDPYnrrLclQT+X4U//TCkOMwbwizz/mcy+E6QB26GOkKvs6zkhq+1C5o
 Mtu8F2aCAvE4CANevUPXMiNqYZTvjIyUhUCjYEJK77z170PeLjpXeXCo5iSL7zco35
 GiDqEvRNBF17kP4zjcANfqvT3vSQ7iT44RFRzMJ4mIViVirrPy1NbvqFvbqTGpJZBA
 /FB9y8QCH0pM2q0a4JH/ev9nftTdPB27FxsAZSNi7WXlvWmcWOfFmSTRLhWyaWudux
 rrkXNJ2MeeirHc3nps9y8y2BIsmv9uavW8pOm2HaXPLb1uZ/K8vwdEF0ephayV4dXN
 H/otD/sPIjGFQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: dwc-i2s: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 21:53:13 +0100
Message-Id: <20210921205313.46710-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400; h=from:subject;
 bh=dGjvfvSTWTNQNBliIU7w7FiM7JiBmz5XNydMTw5hfLg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSkYh06rMIgBqLV20/Jp6KHS2Ji5GKDNeRliVp+rr
 RNyEx56JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpGIQAKCRAk1otyXVSH0EtkB/
 4t4LZm2KofIQzuv27PX35TuCBFfN5M5WMDg9PmJe1ZliuXY9ETKTLiMpU5Sjm/Fw6CAbjrg4uAq1nd
 k+l0Iuc/Pu5q1mY6Zu2mr+P0z/TJtieZ5lWuiYiuuJ0TCFgGgIYLfcpPp7SzWOMMhAO63zHBI4PDGp
 C3iJ/D+k+sSEuIxWEsy+zrxPmzITAmFm6dQ4HQpVvZFYrhLSBQfpXbMMnb3STFjQk/0LpangSfbj92
 TMuARKf83vIgaMNsMBOOHH2QAltfTzggbVw24duVNMNaYLHGtNYV/jGalXbyGs2HikVGx6E9/QYhVi
 QD4/vNHaIe6BAARZXNl5H7PJuKvmNc
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
the dwc-i2s driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/dwc/dwc-i2s.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 33ce257ae198..5cb58929090d 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -356,25 +356,25 @@ static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(cpu_dai);
 	int ret = 0;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		if (dev->capability & DW_I2S_SLAVE)
 			ret = 0;
 		else
 			ret = -EINVAL;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		if (dev->capability & DW_I2S_MASTER)
 			ret = 0;
 		else
 			ret = -EINVAL;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		ret = -EINVAL;
 		break;
 	default:
-		dev_dbg(dev->dev, "dwc : Invalid master/slave format\n");
+		dev_dbg(dev->dev, "dwc : Invalid clock provider format\n");
 		ret = -EINVAL;
 		break;
 	}
-- 
2.20.1

