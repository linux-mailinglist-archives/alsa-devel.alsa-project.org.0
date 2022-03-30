Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 529A64EC1EC
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:58:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B8318A8;
	Wed, 30 Mar 2022 13:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B8318A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641534;
	bh=hpbWX8YBC6s4oo45QHF2m7r8EsVxECiMVkMLp+Qwi3A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lx0nI6OT6WfGf1gGBwRgrhA0RTwTtRiZ9FhflcPgkUilli/UKoFWr7Q40FJEfs+sM
	 HZ6cDBsmGPQwdXNCPMhvWZs5s6MF4cZc6IomFBQXfl7HsKhYjhGpvCe73e+wC0E1me
	 yDa7e1ukjjolrDY2TLqFZsI90t/ncFcq+7nKcXgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 158BFF80604;
	Wed, 30 Mar 2022 13:50:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D78FFF80605; Wed, 30 Mar 2022 13:50:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48056F80253
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48056F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d1iFFCPo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06AC6615F5;
 Wed, 30 Mar 2022 11:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6EBC340F3;
 Wed, 30 Mar 2022 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640996;
 bh=hpbWX8YBC6s4oo45QHF2m7r8EsVxECiMVkMLp+Qwi3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d1iFFCPoe2DgXdrAcj+vuxwuNTBbpRRx3ykzASXrNoty4fKcNKW3gLTgghiZmIRRn
 fMMtS0ZAqv3D9CVNaA7mBekoOesmUnlRHdXXXvbDkB1kH4qwWCIz01Yi7468ZiaYxQ
 JPB4Jh0wU5I2gCTnaCBA/svNXMnrB1vn/ea23HGFN6xy8jgZL0U824QIMVZTX3+Txb
 MEwyMZvl1A7Xvsak2fN5cWEV+e5UxLuWhJUXb7+Gzkj9+edk9i2uCrJMXe5r5H/MDh
 TANxC5BF7taFjA+DZHLKi7JngmggaqHbFyKU5K/YUICfw86jWGn62pffyLdiq2FxoI
 JWo/XkBqFXkow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 54/59] ASoC: Intel: sof_es8336: log all quirks
Date: Wed, 30 Mar 2022 07:48:26 -0400
Message-Id: <20220330114831.1670235-54-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 9c818d849192491a8799b1cb14ca0f7aead4fb09 ]

We only logged the SSP quirk, make sure the GPIO and DMIC quirks are
exposed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20220308192610.392950-16-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_es8336.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 46e453915f82..764560439d46 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -63,7 +63,12 @@ static const struct acpi_gpio_mapping *gpio_mapping = acpi_es8336_gpios;
 
 static void log_quirks(struct device *dev)
 {
-	dev_info(dev, "quirk SSP%ld",  SOF_ES8336_SSP_CODEC(quirk));
+	dev_info(dev, "quirk mask %#lx\n", quirk);
+	dev_info(dev, "quirk SSP%ld\n",  SOF_ES8336_SSP_CODEC(quirk));
+	if (quirk & SOF_ES8336_ENABLE_DMIC)
+		dev_info(dev, "quirk DMIC enabled\n");
+	if (quirk & SOF_ES8336_TGL_GPIO_QUIRK)
+		dev_info(dev, "quirk TGL GPIO enabled\n");
 }
 
 static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
-- 
2.34.1

