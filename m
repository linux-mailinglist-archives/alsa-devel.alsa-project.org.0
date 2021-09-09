Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A040404D5C
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 14:03:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 159E51747;
	Thu,  9 Sep 2021 14:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 159E51747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631188982;
	bh=GwWGm9WFdrC2XQPy9txcEwUY19vlnXcJNvKB8+v6fa0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O7vAnSe3Vhly3H7y60dhJznJRfg/wUzJK3o/UcxWoAkvJJD1XqTY14IH7QMIUKe7G
	 duWNE50eBleX03iFQ+nEY8Pfyzz1cCe+Sl55zKZQ8ftnC94Olq+BOniwITMxK1WOkY
	 /no5oIc6xD5px6LAU4nxxUmcFj0tKsXQEbe4p5EI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20990F80507;
	Thu,  9 Sep 2021 14:00:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A046F80510; Thu,  9 Sep 2021 14:00:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45B9CF804FB
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 14:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45B9CF804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BTivrnSB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C9AD6329F;
 Thu,  9 Sep 2021 12:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188807;
 bh=GwWGm9WFdrC2XQPy9txcEwUY19vlnXcJNvKB8+v6fa0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BTivrnSBFF7BIaA2++vGxHWiMkHl21UndMKpHnpkKsRNDBdxneWz63ICZoyyDpmnC
 rup/4+5/neMn5KYeh2RLWKonI0NNfbE+pvxzGzbFHPw8iiF7whH7BEiJkqF/77SUCP
 lPO3pUJmpva1dWWFpeTaMl/ETfxK8DPquIpq9IRc0twkpR36d63LwVE2JAq63tqfys
 oZb2diDJkYSuB/H9cHsbEtqdEkFjc7PNWAY6SIWeMoegLZhfi7nFfU5Pf/iXjeyJ4t
 Vsx3XxJ58+PGu7pbboQmryhbiqjSrH2gMZxrWXvrhHOvRLH/UVmippxHQFzC856+tw
 1fug+JJWrUdIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 53/59] ASoC: rockchip: i2s: Fix regmap_ops hang
Date: Thu,  9 Sep 2021 07:58:54 -0400
Message-Id: <20210909115900.149795-53-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115900.149795-1-sashal@kernel.org>
References: <20210909115900.149795-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Sugar Zhang <sugar.zhang@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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

From: Sugar Zhang <sugar.zhang@rock-chips.com>

[ Upstream commit 53ca9b9777b95cdd689181d7c547e38dc79adad0 ]

API 'set_fmt' maybe called when PD is off, in the situation,
any register access will hang the system. so, enable PD
before r/w register.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Link: https://lore.kernel.org/r/1629950520-14190-4-git-send-email-sugar.zhang@rock-chips.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/rockchip/rockchip_i2s.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 0e07e3dea7de..93a4829f80cc 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -188,7 +188,9 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 {
 	struct rk_i2s_dev *i2s = to_info(cpu_dai);
 	unsigned int mask = 0, val = 0;
+	int ret = 0;
 
+	pm_runtime_get_sync(cpu_dai->dev);
 	mask = I2S_CKR_MSS_MASK;
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
@@ -201,7 +203,8 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 		i2s->is_master_mode = false;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_pm_put;
 	}
 
 	regmap_update_bits(i2s->regmap, I2S_CKR, mask, val);
@@ -215,7 +218,8 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 		val = I2S_CKR_CKP_POS;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_pm_put;
 	}
 
 	regmap_update_bits(i2s->regmap, I2S_CKR, mask, val);
@@ -238,7 +242,8 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 		val = I2S_TXCR_TFS_PCM | I2S_TXCR_PBM_MODE(1);
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_pm_put;
 	}
 
 	regmap_update_bits(i2s->regmap, I2S_TXCR, mask, val);
@@ -261,12 +266,16 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 		val = I2S_RXCR_TFS_PCM | I2S_RXCR_PBM_MODE(1);
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_pm_put;
 	}
 
 	regmap_update_bits(i2s->regmap, I2S_RXCR, mask, val);
 
-	return 0;
+err_pm_put:
+	pm_runtime_put(cpu_dai->dev);
+
+	return ret;
 }
 
 static int rockchip_i2s_hw_params(struct snd_pcm_substream *substream,
-- 
2.30.2

