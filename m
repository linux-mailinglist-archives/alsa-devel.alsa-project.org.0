Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DED4D4EC2F4
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 14:05:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8114F1A8E;
	Wed, 30 Mar 2022 14:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8114F1A8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641903;
	bh=Xf6RKwKJr0X6eS2HT3oif7GlIDa6DBuZr8xzMrXw190=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BFoVIvPTTjJpkBEEoNohxo5g504mrTmTDC7K41Y9uNQhIYWb5jpMtOIAltt/lHG+j
	 YsQd5/6HKCgpt+SKfFX4/qCyeq4r2xZySEGj2tUPm5SGasxc5s5am8lKzMIT7+XFLK
	 jWdGfJupRNZYNqbavxhMzbHb52YDmX4ffMUq0qRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1477F80642;
	Wed, 30 Mar 2022 13:52:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67CB6F8065B; Wed, 30 Mar 2022 13:52:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E67CFF80642
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E67CFF80642
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jXG2Re0D"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82600B81C23;
 Wed, 30 Mar 2022 11:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F716C34112;
 Wed, 30 Mar 2022 11:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648641159;
 bh=Xf6RKwKJr0X6eS2HT3oif7GlIDa6DBuZr8xzMrXw190=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jXG2Re0DpH0pgtn0WnONJW0EbaQLESQ1+vaVeHNDn8SFHYkDTzw2tz3uuXyWnP3Gy
 O8zEDyW6/56WEcBPvZI1pZoJH8L240rfe1oVGmJD2yxLq4MogWIqAObloTpQWYFnCx
 ipaPUm4uGl65kuFGjvK6FiEJMcMv4aAfzSmayBhyLOAByoRlbp674fFxp+4pfP5AiI
 Hv6gUCGBJX+sNmIJGsXX2mOp4TsLACwTXh7v7dXa1lFisGSPYsL9OPg7pmDbgIy97t
 uRB/c6Q+VwTiDyhXhNpH/03zS5Uxog0FyFT8hVoqgStXah566pdz9L0G++MWDPSEYw
 w0cxf9PateiqQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 08/25] ASoC: madera: Add dependencies on MFD
Date: Wed, 30 Mar 2022 07:52:08 -0400
Message-Id: <20220330115225.1672278-8-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330115225.1672278-1-sashal@kernel.org>
References: <20220330115225.1672278-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit ec29170c724ca30305fc3a19ba2ee73ecac65509 ]

The Madera CODECs use regmap_irq functions but nothing ensures that
regmap_irq is built into the kernel. Add dependencies on the ASoC
symbols for the relevant MFD component. There is no point in building
the ASoC driver if the MFD doesn't support it and the MFD part contains
the necessary dependencies to ensure everything is built into the
kernel.

Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220203115025.16464-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 229cc89f8c5a..466dc67799f4 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -586,21 +586,26 @@ config SND_SOC_CS4349
 
 config SND_SOC_CS47L15
 	tristate
+	depends on MFD_CS47L15
 
 config SND_SOC_CS47L24
 	tristate
 
 config SND_SOC_CS47L35
 	tristate
+	depends on MFD_CS47L35
 
 config SND_SOC_CS47L85
 	tristate
+	depends on MFD_CS47L85
 
 config SND_SOC_CS47L90
 	tristate
+	depends on MFD_CS47L90
 
 config SND_SOC_CS47L92
 	tristate
+	depends on MFD_CS47L92
 
 # Cirrus Logic Quad-Channel ADC
 config SND_SOC_CS53L30
-- 
2.34.1

