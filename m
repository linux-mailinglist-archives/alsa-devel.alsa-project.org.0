Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B9F272894
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 16:44:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEB22825;
	Mon, 21 Sep 2020 16:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEB22825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600699485;
	bh=xKwK4VVr8AV5yC/oLAUA5xeJzkBb0gxAD1j2udeCWws=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lR5v7xDqMkpwZnSkWKO7gjZzZ7uvIvvj7bUsgRNisDpRFOlh24MEQ8/SI2nJ174Wh
	 wFaK0JIFw27z49w80fl2uz3hdhcaVZzuo9A+c9UOrGdmuRlX4Saxu3yEMBuO6fy1tL
	 6RvQVSJBvDuijiZmjFk3qFidbvTdOrMZnPNWkDGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F8DF802EB;
	Mon, 21 Sep 2020 16:41:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 403D5F802F8; Mon, 21 Sep 2020 16:41:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 584F3F802E9
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 16:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 584F3F802E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SJE4+yv8"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 097E423447;
 Mon, 21 Sep 2020 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600699259;
 bh=xKwK4VVr8AV5yC/oLAUA5xeJzkBb0gxAD1j2udeCWws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SJE4+yv8F2XiperXDK479BhEBN4YH53raHQi7DCPAgIMHbkvH2hSdjfuKwIEp1vrL
 SMk6i3osLkDMmMA8a/kE7O6LfAxCHiPqmJvpGAUcKmAMvQwljPnYQ+rzmzGlUK1AEc
 c7QiRbVyX5i49OtRljbyC5EPHtjBgkZrbC4IbTIo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 03/15] ASoC: wm8994: Skip setting of the
 WM8994_MICBIAS register for WM1811
Date: Mon, 21 Sep 2020 10:40:42 -0400
Message-Id: <20200921144054.2135602-3-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921144054.2135602-1-sashal@kernel.org>
References: <20200921144054.2135602-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>
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

From: Sylwester Nawrocki <s.nawrocki@samsung.com>

[ Upstream commit 811c5494436789e7149487c06e0602b507ce274b ]

The WM8994_MICBIAS register is not available in the WM1811 CODEC so skip
initialization of that register for that device.
This suppresses an error during boot:
"wm8994-codec: ASoC: error at snd_soc_component_update_bits on wm8994-codec"

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20200827173357.31891-1-s.nawrocki@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm8994.c  | 2 ++
 sound/soc/codecs/wm_hubs.c | 3 +++
 sound/soc/codecs/wm_hubs.h | 1 +
 3 files changed, 6 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index d5fb7f5dd551c..64635f9cdae65 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4047,11 +4047,13 @@ static int wm8994_component_probe(struct snd_soc_component *component)
 			wm8994->hubs.dcs_readback_mode = 2;
 			break;
 		}
+		wm8994->hubs.micd_scthr = true;
 		break;
 
 	case WM8958:
 		wm8994->hubs.dcs_readback_mode = 1;
 		wm8994->hubs.hp_startup_mode = 1;
+		wm8994->hubs.micd_scthr = true;
 
 		switch (control->revision) {
 		case 0:
diff --git a/sound/soc/codecs/wm_hubs.c b/sound/soc/codecs/wm_hubs.c
index e93af7edd8f75..dd421e2fe7b21 100644
--- a/sound/soc/codecs/wm_hubs.c
+++ b/sound/soc/codecs/wm_hubs.c
@@ -1223,6 +1223,9 @@ int wm_hubs_handle_analogue_pdata(struct snd_soc_component *component,
 		snd_soc_component_update_bits(component, WM8993_ADDITIONAL_CONTROL,
 				    WM8993_LINEOUT2_FB, WM8993_LINEOUT2_FB);
 
+	if (!hubs->micd_scthr)
+		return 0;
+
 	snd_soc_component_update_bits(component, WM8993_MICBIAS,
 			    WM8993_JD_SCTHR_MASK | WM8993_JD_THR_MASK |
 			    WM8993_MICB1_LVL | WM8993_MICB2_LVL,
diff --git a/sound/soc/codecs/wm_hubs.h b/sound/soc/codecs/wm_hubs.h
index 4b8e5f0d6e32d..988b29e630607 100644
--- a/sound/soc/codecs/wm_hubs.h
+++ b/sound/soc/codecs/wm_hubs.h
@@ -27,6 +27,7 @@ struct wm_hubs_data {
 	int hp_startup_mode;
 	int series_startup;
 	int no_series_update;
+	bool micd_scthr;
 
 	bool no_cache_dac_hp_direct;
 	struct list_head dcs_cache;
-- 
2.25.1

