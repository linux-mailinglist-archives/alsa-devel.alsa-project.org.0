Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E068A53BA27
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 840FF177E;
	Thu,  2 Jun 2022 15:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 840FF177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178099;
	bh=gqA2E3bevuaMWCPF3ghbWhTvmdOWnlf2YCeARAOeCms=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LbCO4wgtzMVh7a3ZPS4J89eMDBIJ7ekUTPIffwqCe7uvQi8/H0ConlfKhr6FhX+bh
	 EW5rZUaLU7K/4Wp6F4ybE4hZxkvwT4ODMo8ls8lcMfXXJY1tYbWQD6bQABectUyUJc
	 3g+RAEuV1EuE8homH5qfu9ajtJeMZxn+QwWiFB8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2299F80525;
	Thu,  2 Jun 2022 15:53:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49820F80236; Thu,  2 Jun 2022 15:53:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAD85F80089
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAD85F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ohQATgwV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A6F7B81ED5;
 Thu,  2 Jun 2022 13:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C85AC36AE3;
 Thu,  2 Jun 2022 13:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178003;
 bh=gqA2E3bevuaMWCPF3ghbWhTvmdOWnlf2YCeARAOeCms=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ohQATgwVmxAMNzELiUrc1v2mbU63sYPAiAZ0r8jabhaHR7yrlsnj0W/hs2DNg1JNg
 jIqUFZSeyIzX6QhdYWuu7xoohObu+u6s+mOOl1wmUcvVrT+rBuu4MMIBywmkMbalgB
 mh1wv+57hc0YqyieV2JrY9HSc9HiOepPpDJSeMwH6a4Fubkr15nZOpnjEi6kUX1UqS
 doRsEvwxar8cv+QdfrDDwoO5n7rjDzj3Ssxw7Z9geMlfikzDUvRAhRo9pj5VvEPRgE
 UZEl9TlftyXoQA5m+l0l3/Es0UkTMamADzqzAX9KOLVQ2Kpuv8xF7MYMhDpt1rgBMc
 8RLjUM1SR8Lgg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 01/20] ASoC: cx2072x: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:52:57 +0200
Message-Id: <20220602135316.3554400-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649; h=from:subject;
 bh=gqA2E3bevuaMWCPF3ghbWhTvmdOWnlf2YCeARAOeCms=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCPys1+J1z1pKmrMbIMrJO9LFOwk/DLnky+iQsv
 1mQPsxOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAjwAKCRAk1otyXVSH0MjTB/
 9UH6jD/bu1BZ/yOSjk36OHSmja58hpBT1dmlrO+MRgF/3a3PmYYzm4vxJW3J1F9QpmK0jG/kCTnyGf
 MfERsMDrD1p4N0CdwACmRu27Omemtcv/ySmP2XQsPScMaRqS7AVzPHEeZfq9VHCP5z0CHvMP3xT2Sn
 szPbtNciPfXFEyxwb92NI7q2MOBd3q+2H/8I/0ARpLa7oR+g7bO/Ua0EKcF3LEyVrGusmCB86SIZ5L
 2P8jiSmtonqEA44iKpI444xzOZi/0VOp5YfcjqtCEbF3ll3Pg636tgND2sRIG1UB8e4QiA5rhfXCzG
 RNd0/ht82slpcSuVwGIXx6cN6VtBYk
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
the cx2072x driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cx2072x.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index b35debb5818d..b6667e8a6099 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -710,22 +710,19 @@ static int cx2072x_config_i2spcm(struct cx2072x_priv *cx2072x)
 
 	regdbt2.ulval = 0xac;
 
-	/* set master/slave */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		reg2.r.tx_master = 1;
 		reg3.r.rx_master = 1;
-		dev_dbg(dev, "Sets Master mode\n");
 		break;
 
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg2.r.tx_master = 0;
 		reg3.r.rx_master = 0;
-		dev_dbg(dev, "Sets Slave mode\n");
 		break;
 
 	default:
-		dev_err(dev, "Unsupported DAI master mode\n");
+		dev_err(dev, "Unsupported DAI clocking mode\n");
 		return -EINVAL;
 	}
 
@@ -1009,9 +1006,9 @@ static int cx2072x_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	dev_dbg(dev, "set_dai_fmt- %08x\n", fmt);
 	/* set master/slave */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 
 	default:
-- 
2.30.2

