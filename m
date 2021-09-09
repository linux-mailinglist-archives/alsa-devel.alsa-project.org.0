Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25974404CEF
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 14:01:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE25B1779;
	Thu,  9 Sep 2021 14:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE25B1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631188898;
	bh=AsS5IWO2I9ueUInU05sg4o6O+dRha59amT68ELM+6WQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hUHCd/fUrKUXo7cVAGAK77liFMWv0eRy+7Tui0GJV4GbXEjHfVWc5hDuqIGW+mIX2
	 mvU6aB7iRvRZGW4gcFFFbkLL9oEplVKLdqzY3lYVJmnLnOOQBz6xJPxl8WggRb6K5h
	 n1IsQZfsgC0OcZbpBjr6f1ocve4xjjimPZhX4OAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68EFBF804E6;
	Thu,  9 Sep 2021 13:59:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72C8BF804E6; Thu,  9 Sep 2021 13:59:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 116F5F802DF
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 13:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 116F5F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KeQO7icV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8531C6326F;
 Thu,  9 Sep 2021 11:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188731;
 bh=AsS5IWO2I9ueUInU05sg4o6O+dRha59amT68ELM+6WQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KeQO7icV1LFuTGpSYRtRQS2Bh+jWCMq3JBHjKt3vQmyRLUwOj6eSw5FppkabXli/d
 +AkZZ7jiUJQL/nc7zRfJkBTivXZgskhAfxXYTwnasdA3n/+JcVERKgK5d5NhP2Trrc
 sNcMEE3tdJUw+YPwQB+749dp9Hz6zBVCEhANMS5TSSbugl1HJxavWIKJvCljAma5O3
 vaQLcU3M0UsVVyvd9HS6yQFwisEsTmApzEyHhvH61jjVEU7Oi1Ex5gHLEpyEs8ZMFD
 k2t28m/TIrs/CjOAOZDfIXgvRwXdZyVUcEXHL5H/mNoL+jx6KywsIeupcfH1OmHeUD
 M/DB/989f1vLQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 68/74] ASoC: rockchip: i2s: Fix regmap_ops hang
Date: Thu,  9 Sep 2021 07:57:20 -0400
Message-Id: <20210909115726.149004-68-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115726.149004-1-sashal@kernel.org>
References: <20210909115726.149004-1-sashal@kernel.org>
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
index b86f76c3598c..cab381c9dea1 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -189,7 +189,9 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 {
 	struct rk_i2s_dev *i2s = to_info(cpu_dai);
 	unsigned int mask = 0, val = 0;
+	int ret = 0;
 
+	pm_runtime_get_sync(cpu_dai->dev);
 	mask = I2S_CKR_MSS_MASK;
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
@@ -202,7 +204,8 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 		i2s->is_master_mode = false;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_pm_put;
 	}
 
 	regmap_update_bits(i2s->regmap, I2S_CKR, mask, val);
@@ -216,7 +219,8 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 		val = I2S_CKR_CKP_POS;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_pm_put;
 	}
 
 	regmap_update_bits(i2s->regmap, I2S_CKR, mask, val);
@@ -239,7 +243,8 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 		val = I2S_TXCR_TFS_PCM | I2S_TXCR_PBM_MODE(1);
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_pm_put;
 	}
 
 	regmap_update_bits(i2s->regmap, I2S_TXCR, mask, val);
@@ -262,12 +267,16 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
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

