Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E59F91FDC80
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:20:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C25D169E;
	Thu, 18 Jun 2020 03:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C25D169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592443201;
	bh=ZYAJ00KFqyy/tvH5dMqM3Tjkm+Yhg3s3YaLpmyGJbto=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d+ju6/3YnxOxlJ6pAshSMroZE9giNKYjbY4PXEAnBdJ7VsStIDdHOt9USlyxymLYY
	 iUQn2wD9La+yuPrJH/S5owD4vTx2ZPlOsepFXi+9MYSrd/kHJxcSO/JrQ+8Yhs5wrw
	 kv0PAExksQrXxvkwlBxikGdI64N+hUeL74zTF+l0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79A8BF80344;
	Thu, 18 Jun 2020 03:11:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF470F80341; Thu, 18 Jun 2020 03:11:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01F10F80338
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01F10F80338
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KESwxvfT"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A19D820B1F;
 Thu, 18 Jun 2020 01:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442692;
 bh=ZYAJ00KFqyy/tvH5dMqM3Tjkm+Yhg3s3YaLpmyGJbto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KESwxvfTZmm/vtKve9biDYZHrYPEdeqPRLfwTyMRdNzG1VffTo2UX8BfKyjHsA6MA
 HqbR2AadqymL8kvSEwIw2FWRAL5oaRqCMgVdf8vMPk4g331BQO9MAmFu9UeOB+je8z
 ac1scu7ZBnwWME1yqLaTPe/TpWjP1mhooWTeGXYo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 157/388] ASoC: rt5682: fix I2C/Soundwire
 dependencies
Date: Wed, 17 Jun 2020 21:04:14 -0400
Message-Id: <20200618010805.600873-157-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>
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

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit fd443a20c2f0950f3c31765a08f7dd49b3bc69cb ]

If one of the two is a loadable module, the combined driver must
not be built-in:

aarch64-linux-ld: sound/soc/codecs/rt5682.o: in function `rt5682_sdw_hw_free':
rt5682.c:(.text+0xb34): undefined reference to `sdw_stream_remove_slave'
aarch64-linux-ld: sound/soc/codecs/rt5682.o: in function `rt5682_sdw_hw_params':
rt5682.c:(.text+0xe78): undefined reference to `sdw_stream_add_slave'

In particular, the soundwire driver must not be built-in if
CONFIG_I2C=m.

Fixes: 5549ea647997 ("ASoC: rt5682: fix unmet dependencies")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/r/20200428214642.3925004-1-arnd@arndb.de
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 7d2cbed55a9d..4c643d2e6d6b 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1136,10 +1136,13 @@ config SND_SOC_RT5677_SPI
 config SND_SOC_RT5682
 	tristate
 	depends on I2C || SOUNDWIRE
+	depends on SOUNDWIRE || !SOUNDWIRE
+	depends on I2C || !I2C
 
 config SND_SOC_RT5682_SDW
 	tristate "Realtek RT5682 Codec - SDW"
 	depends on SOUNDWIRE
+	depends on I2C || !I2C
 	select SND_SOC_RT5682
 	select REGMAP_SOUNDWIRE
 
-- 
2.25.1

