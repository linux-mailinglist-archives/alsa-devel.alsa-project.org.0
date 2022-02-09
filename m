Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8324AFA14
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 19:34:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1394318E9;
	Wed,  9 Feb 2022 19:34:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1394318E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644431695;
	bh=bFy7XXY2ACITulTCUKRC7dk/O8gBIpyeMZ3F7CKr/7s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BoVzb4Z50P89WFFJzcDbYaTX2p4Lcc0Gyo/19mW7peljSRDwEMU7TObLBm0uZA2s+
	 FeQLKoEYEDfY98CxKSBY7cDALUBxKLSF77saaFH7NmV5yGFIxcEsC5EW0LhYJPy+KR
	 Xdde+ZP1jDRsYFsPZBygOlZ4VLdOby5VZByCc0dQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62368F8016B;
	Wed,  9 Feb 2022 19:33:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49029F8016A; Wed,  9 Feb 2022 19:33:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6ADFF800A7
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 19:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6ADFF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LM5akZrX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10011B8237E;
 Wed,  9 Feb 2022 18:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEC4C340E7;
 Wed,  9 Feb 2022 18:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644431620;
 bh=bFy7XXY2ACITulTCUKRC7dk/O8gBIpyeMZ3F7CKr/7s=;
 h=From:To:Cc:Subject:Date:From;
 b=LM5akZrXHkGfyoqM4hv2SRCV7HhZHvzf62xiVBHchXCZqPnwd5f8o8ngdOUFo7y88
 rg4zM9YfQoDMw/+7X2C23aKSqHqst6wtIg+XPRrvsdOmLdqMLzZiLQHK3s2RD/v7tq
 /GhGKf+poi2xoCSBkSdbJ+Q0apl3UgnEQL5s0H14SM85FvDuL0Ucyxfl2ybMNGmmP1
 2tDKdAsQAVlYEgDKlBmmYOQpLI/mqYtZ4FArNoIFEuwMsK8PQFjx1lyAi264/YrsWq
 vR7XI8J5QEAyLlkrF2xPOOkJWHPEihsW+8vbjckFSuSUwNSks9/9adyJjflhZZkuq9
 Kzy5DS6QS3S1A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 01/42] ASoC: mediatek: fix unmet dependency on
 GPIOLIB for SND_SOC_DMIC
Date: Wed,  9 Feb 2022 13:32:33 -0500
Message-Id: <20220209183335.46545-1-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 rdunlap@infradead.org, geert+renesas@glider.be, tiwai@suse.com,
 lgirdwood@gmail.com, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, matthias.bgg@gmail.com,
 Julian Braha <julianbraha@gmail.com>, linux-arm-kernel@lists.infradead.org
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

From: Julian Braha <julianbraha@gmail.com>

[ Upstream commit 579b2c8f72d974f27d85bbd53846f34675ee3b01 ]

When SND_SOC_MT8195_MT6359_RT1011_RT5682 is selected,
and GPIOLIB is not selected,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for SND_SOC_DMIC
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
  Selected by [y]:
  - SND_SOC_MT8195_MT6359_RT1011_RT5682 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SND_SOC_MT8195 [=y] && MTK_PMIC_WRAP [=y]

This is because SND_SOC_MT8195_MT6359_RT1011_RT5682
selects SND_SOC_DMIC without selecting or depending on
GPIOLIB, depsite SND_SOC_DMIC depending on GPIOLIB.

This unmet dependency bug was detected by Kismet,
a static analysis tool for Kconfig. Please advise
if this is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20220117050324.68371-1-julianbraha@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 3b1ddea26a9ef..76f191ec7bf84 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -215,7 +215,7 @@ config SND_SOC_MT8195_MT6359_RT1019_RT5682
 
 config SND_SOC_MT8195_MT6359_RT1011_RT5682
 	tristate "ASoC Audio driver for MT8195 with MT6359 RT1011 RT5682 codec"
-	depends on I2C
+	depends on I2C && GPIOLIB
 	depends on SND_SOC_MT8195 && MTK_PMIC_WRAP
 	select SND_SOC_MT6359
 	select SND_SOC_RT1011
-- 
2.34.1

