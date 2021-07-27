Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D463D7605
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 15:22:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A437F1F1E;
	Tue, 27 Jul 2021 15:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A437F1F1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627392162;
	bh=B9xYAL/8m8xchTS/11Noy/LV1czP1hU/TtmNdYqMCos=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X9gx1H/udDcFiQzG4EoGGTYM5Zo4ydBXhAnHDAIopazEJfvNUtdAT3FEzWibWO7qG
	 1b0sOCYQn4Qg6YOJFuRxNpmrjjbLP9q0c8T23rHc5jfbyqkMTKCTdL5+CCU9pS8bAO
	 xs+NNBLA/YLvdk1bwLKyDCTYC47o6/mAyC+SB1kI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F75BF804EC;
	Tue, 27 Jul 2021 15:19:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8C26F804F2; Tue, 27 Jul 2021 15:19:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F7D6F804EB
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 15:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F7D6F804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UHgXEZHn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 664BB61ACF;
 Tue, 27 Jul 2021 13:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627391989;
 bh=B9xYAL/8m8xchTS/11Noy/LV1czP1hU/TtmNdYqMCos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UHgXEZHnUf6zsxk6YafnlO8N1n4Z9JN2PewHMnDkr9ByTNnnSXxrowRMeHNM/YIkc
 9rYa7nQ+ygd5DEVl1KXiCm7/KUtdaXhkSelbgnJRAezKVky9Xj+HaS8EPry+5YGADC
 Oena2ZWQpwYsjg96dd3lBu6wKAx5lz7m4hmi5BqO8GxCW1c1nt3MhpK8CABQQ1wCYG
 RrdvmShvLKlrEsNEOipg2zi8Ep2Sm6HgsEka+I1y/Y502ev7/oJn39L1aXTps1DcFQ
 l7aCBclxQRJZjrReuFPpTk0/nWP1GkX/QDt3UJO9UA8vCW/WA3rvHDu3i4ErCFL5mZ
 6q4xCxZvkpZtA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 08/17] ASoC: rt5682: Fix the issue of garbled
 recording after powerd_dbus_suspend
Date: Tue, 27 Jul 2021 09:19:29 -0400
Message-Id: <20210727131938.834920-8-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727131938.834920-1-sashal@kernel.org>
References: <20210727131938.834920-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

From: Oder Chiou <oder_chiou@realtek.com>

[ Upstream commit 6a503e1c455316fd0bfd8188c0a62cce7c5525ca ]

While using the DMIC recording, the garbled data will be captured by the
DMIC. It is caused by the critical power of PLL closed in the jack detect
function.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
Link: https://lore.kernel.org/r/20210716085853.20170-1-oder_chiou@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5682.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index d9878173ff89..2e41b8c169e5 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -971,10 +971,14 @@ int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 		rt5682_enable_push_button_irq(component, false);
 		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
 			RT5682_TRIG_JD_MASK, RT5682_TRIG_JD_LOW);
-		if (!snd_soc_dapm_get_pin_status(dapm, "MICBIAS"))
+		if (!snd_soc_dapm_get_pin_status(dapm, "MICBIAS") &&
+			!snd_soc_dapm_get_pin_status(dapm, "PLL1") &&
+			!snd_soc_dapm_get_pin_status(dapm, "PLL2B"))
 			snd_soc_component_update_bits(component,
 				RT5682_PWR_ANLG_1, RT5682_PWR_MB, 0);
-		if (!snd_soc_dapm_get_pin_status(dapm, "Vref2"))
+		if (!snd_soc_dapm_get_pin_status(dapm, "Vref2") &&
+			!snd_soc_dapm_get_pin_status(dapm, "PLL1") &&
+			!snd_soc_dapm_get_pin_status(dapm, "PLL2B"))
 			snd_soc_component_update_bits(component,
 				RT5682_PWR_ANLG_1, RT5682_PWR_VREF2, 0);
 		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_3,
-- 
2.30.2

