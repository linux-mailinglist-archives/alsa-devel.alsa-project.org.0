Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EB56C5593
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 20:59:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F327BECA;
	Wed, 22 Mar 2023 20:58:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F327BECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515172;
	bh=9hA8GOSLTaZsVHBMX+sww97sJaQFGvNAehI835JPCIY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D5s+TPMMIERWb92kkT6czeFEHglBO7g7QAGgWR0vh1G6ihOSIDJVSIYk0l0p16bZ6
	 JqsoN0ZT1si7bm4Z6Ok6fC3vQPb7LLzzUpIG8SagOWvTsKI9HwJnzE6yw7WHy+cSBv
	 g6WamC81oGD7qQjOu+N6fPeyDbHe3awomEV0N98A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B294F8024E;
	Wed, 22 Mar 2023 20:57:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4610F8024E; Wed, 22 Mar 2023 20:57:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BED87F80549
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 20:57:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BED87F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N9+pWuqc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 57506B81DC6;
	Wed, 22 Mar 2023 19:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4DDC433EF;
	Wed, 22 Mar 2023 19:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515067;
	bh=9hA8GOSLTaZsVHBMX+sww97sJaQFGvNAehI835JPCIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N9+pWuqcwzZvuTBX4PJjfcEVnudlyuDO0x9X3Fr+aU1l2wEYqFw6OolRy+pvzdN8F
	 Scfx2f/oGqbcIXfyziXJP2a7ZtSl0iy/kBPlzpNVy/kWTakLItWL94tPGUeqgw3ZOk
	 ctvzeHoLOBMYU2q7RzicDArazVAcSn3J2mh2mBNXA4fUOiTSX6jH2+AoItEL6vduCJ
	 hQpYy5iVmnXv1NZ/9o33wnH+KwKADuq4J7VkwEFEDrxX15QcQdv29jx1l+fC/MwkVa
	 wdAhdSySywy0OobE65k9ZCqDIl8LRaCMzV+cfsgT98yxvNX+sDF62cHwqTU/aOSBUt
	 930weKmWG3eOw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 07/45] ASoC: Intel: avs: nau8825: Adjust clock
 control
Date: Wed, 22 Mar 2023 15:56:01 -0400
Message-Id: <20230322195639.1995821-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195639.1995821-1-sashal@kernel.org>
References: <20230322195639.1995821-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G3PHMIAG5OTXVJ66UQFYCESQ2L6RD2VD
X-Message-ID-Hash: G3PHMIAG5OTXVJ66UQFYCESQ2L6RD2VD
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, tiwai@suse.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3PHMIAG5OTXVJ66UQFYCESQ2L6RD2VD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

[ Upstream commit 6206b2e787da2ed567922c37bb588a44f6fb6705 ]

Internal clock shall be adjusted also in cases when DAPM event other
than 'ON' is triggered.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Link: https://lore.kernel.org/r/20230303134854.2277146-6-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/avs/boards/nau8825.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 6731d8a490767..49438a67a77c6 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -33,15 +33,15 @@ avs_nau8825_clock_control(struct snd_soc_dapm_widget *w, struct snd_kcontrol *co
 		return -EINVAL;
 	}
 
-	if (!SND_SOC_DAPM_EVENT_ON(event)) {
+	if (SND_SOC_DAPM_EVENT_ON(event))
+		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_MCLK, 24000000,
+					     SND_SOC_CLOCK_IN);
+	else
 		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_INTERNAL, 0, SND_SOC_CLOCK_IN);
-		if (ret < 0) {
-			dev_err(card->dev, "set sysclk err = %d\n", ret);
-			return ret;
-		}
-	}
+	if (ret < 0)
+		dev_err(card->dev, "Set sysclk failed: %d\n", ret);
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_kcontrol_new card_controls[] = {
-- 
2.39.2

