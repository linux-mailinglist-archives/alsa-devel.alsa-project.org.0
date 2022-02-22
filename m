Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C03D94C0577
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 00:44:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6745D18B2;
	Wed, 23 Feb 2022 00:43:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6745D18B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645573449;
	bh=9w/GiS24uie492Fc9eeqIvYAbmBxWWrK3xRh3ax/B3M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J/RC9RgLC/LNCaxyNIKQK4U+Mc9zaB8K2M7h89HXRZ6+3NI+ldRR3oRWymG0l4m+J
	 wwWtsLIVDmpk8HWLijTYCpu63UreX3zzZWgY2eECeSdXioYNwPKVqXok/MbP061u2L
	 yMBXm6NyABeQBb6+qiUydp03P3p0UTFS6gqsOQoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06BC9F80528;
	Wed, 23 Feb 2022 00:40:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0394F8053A; Wed, 23 Feb 2022 00:40:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C68BDF80528
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 00:40:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C68BDF80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G4rLWjHd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D4F360DE0;
 Tue, 22 Feb 2022 23:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20DEC340F4;
 Tue, 22 Feb 2022 23:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645573245;
 bh=9w/GiS24uie492Fc9eeqIvYAbmBxWWrK3xRh3ax/B3M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G4rLWjHdsk5JqHwVx+Mo1+ORohk+eD44msu063TMvHchRTTfuf78PLXcHGeaWR7Hd
 GGIcp4LbUw0HG9xixCTLjKme41WcNRbtZ7aLcqpu/10jLK0Vk0fyM/ezbVxHIgp9/G
 fUG8Ns3tTGGP0EUJSGJYcemaBO6zkVMBeaJx9NaDxx3THhfUoojVgJLB9s4eaKZeXY
 v41n5dF+PxYhzW3L5TRwBN3xs8vIumKzKGtNrb1BF/y0nHvAdkBKaCFqaNJZODAy40
 yVcbxusur4NEi5N/3bBMsB98MRfkDg9nO+6fuY34RKKZ7x36Bom61iEo2VkWxw+Wao
 3lJvpeX5VH9Iw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 10/10] ASoC: max98927: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 23:40:26 +0000
Message-Id: <20220222234026.712070-10-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222234026.712070-1-broonie@kernel.org>
References: <20220222234026.712070-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1872; h=from:subject;
 bh=9w/GiS24uie492Fc9eeqIvYAbmBxWWrK3xRh3ax/B3M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFXQsXBHFyoNldem+KXSn4BxljnmNS27UHdTilA25
 uqIDRSmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV0LAAKCRAk1otyXVSH0H+OB/
 9wOWdJK73piBfI+Nth0n6nUZFbKd7M6hIgkGORbdNfPOG8OmVzt6sRAuupxfEoTDUZ1j/3DuLGkYB1
 hHuDTtklCcX3/quIPzqeLuynOzl2+7adk5+3bpv+jLiDtFZlqDT0zIDR2cgeVZB6mCh6OsAkVMTFWF
 WASw//yM03pSqwnlj6+VT9yw5FvoFDvvHmobJkWIa1gHjz0qvce8DPtBPWYahfCJ+70nvxCSnbmqb3
 wHyjRNYuxIweNSqVa3wVAeJXS3j2LnawlwxCMP52goW1+2zaw6nqjkgaqyjkB9IEoGJuvdSI+CeA3j
 dJ2TKvJqJG5gNOi3HQNWCZyJRoHvVR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Peter Rosin <peda@axentia.se>
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
the max98927 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98927.c | 11 ++++++-----
 sound/soc/codecs/max98927.h |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index fd84780bf689..bf78d3c98514 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -148,12 +148,13 @@ static int max98927_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 
 	dev_dbg(component->dev, "%s: fmt 0x%08X\n", __func__, fmt);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+		max98927->provider = false;
 		mode = MAX98927_PCM_MASTER_MODE_SLAVE;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
-		max98927->master = true;
+	case SND_SOC_DAIFMT_CBP_CFP:
+		max98927->provider = true;
 		mode = MAX98927_PCM_MASTER_MODE_MASTER;
 		break;
 	default:
@@ -270,7 +271,7 @@ static int max98927_set_clock(struct max98927_priv *max98927,
 	int blr_clk_ratio = params_channels(params) * max98927->ch_size;
 	int value;
 
-	if (max98927->master) {
+	if (max98927->provider) {
 		int i;
 		/* match rate to closest value */
 		for (i = 0; i < ARRAY_SIZE(rate_table); i++) {
diff --git a/sound/soc/codecs/max98927.h b/sound/soc/codecs/max98927.h
index 13f5066d7419..2353910f5f17 100644
--- a/sound/soc/codecs/max98927.h
+++ b/sound/soc/codecs/max98927.h
@@ -264,7 +264,7 @@ struct max98927_priv {
 	unsigned int ch_size;
 	unsigned int rate;
 	unsigned int iface;
-	unsigned int master;
+	unsigned int provider;
 	unsigned int digital_gain;
 	bool tdm_mode;
 };
-- 
2.30.2

