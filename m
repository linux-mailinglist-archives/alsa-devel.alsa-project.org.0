Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F19153BA4E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:59:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E420517EC;
	Thu,  2 Jun 2022 15:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E420517EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178371;
	bh=dQmE76xeD7Ja2uR/DswiWe6qKs6uOmzj+r+Eg8l1LtQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nhqjyOLHrelulRNYvzbspTS+wf/+zaaIOnAYnCenh/vfrBLWxTQ8aTZpatt0R7QK1
	 5w0Dbvn0gIns9URBZ+bKy68j8zBoQUUJDuPRO23hvwcLTiAHDW3OunZLP8QdY3dyam
	 fdSlW4g9iaBzOlbv+aLg/2cxs9aEyLY3znyhNGX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A94FF805C4;
	Thu,  2 Jun 2022 15:53:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB396F805B0; Thu,  2 Jun 2022 15:53:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C003F8057C
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C003F8057C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XlzJ2G1w"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 01F7AB81ED6;
 Thu,  2 Jun 2022 13:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23EBC34119;
 Thu,  2 Jun 2022 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178022;
 bh=dQmE76xeD7Ja2uR/DswiWe6qKs6uOmzj+r+Eg8l1LtQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XlzJ2G1wdu+UohV41/AiGfsfHNlmuXr7sgy8WXkUkhlHOWOG9eYeV1Qrt+VNj2Gix
 H5+NSJxWzx0yQ7HCblPXDizU9fGwlaCShXHnc6pun34jXHpUyPZBpm6++CoIkP0Ak/
 wa4wfxxCsUgwOh/NZkQ4LOgDGWH1nWPad1ul9+HetZ/4+B3rssFIRe3APBojJgq5H8
 eEJa13pRbvr3d0uFu4869CasYWYZnrakbzq0S3NlJEF8v9p3ipNN2po5kofd7v4255
 EkS2iRTX2dMmyzp7BBmClSas/XxGMS0W5rqsE98JS2kKc8BtVWXnqp55TN5IqDGX3n
 lagvq6Yjxn8nQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 18/20] ASoC: tlv320aic32x4: Use modern ASoC DAI format
 terminology
Date: Thu,  2 Jun 2022 15:53:14 +0200
Message-Id: <20220602135316.3554400-19-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194; h=from:subject;
 bh=dQmE76xeD7Ja2uR/DswiWe6qKs6uOmzj+r+Eg8l1LtQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCc7jX8V33FW7gX3/Rr0Lj6l4TMZ3klUa1gcnWC
 gO6PLhKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAnAAKCRAk1otyXVSH0Bq9B/
 45pPNEz8dYfP3qtbslxBLDUlzp1uoNtO+FfFxO9XhAqTAKuoLmypoQPsfZKm/ukeYOQ71Qmq56hKfU
 AAGXtcQ1/J1ZkEwDkzA/v7E3WlSVz3SSpgVcfXb1M5v/uUtPz8XDSUDdSqBoGzc8kmeiINfEk+DA2z
 B1mj+1jp8IQDW6FIz1zng2oz6l5c9FoIfr0brGkGkJzzg4LUroV/qP9J0V9aA4U0aWnkor5CQ7A0fe
 d8xjWog+agruQWhW917MyF+goVJe+wvhriQGvZJdaAcr3gORyel9NTBcDEgPCSdRPn15bB2dCS96Ga
 3LRwVwnX9vpYwytdaBC9XCtUU3G78P
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
the tlv320aic32x4 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic32x4.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 8f42fd7bc053..a8e6adf62ac8 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -615,15 +615,14 @@ static int aic32x4_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	u8 iface_reg_2 = 0;
 	u8 iface_reg_3 = 0;
 
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		iface_reg_1 |= AIC32X4_BCLKMASTER | AIC32X4_WCLKMASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
-		printk(KERN_ERR "aic32x4: invalid DAI master/slave interface\n");
+		printk(KERN_ERR "aic32x4: invalid clock provider\n");
 		return -EINVAL;
 	}
 
-- 
2.30.2

