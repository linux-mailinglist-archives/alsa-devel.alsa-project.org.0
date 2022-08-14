Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955F5923BC
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:24:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B08C71634;
	Sun, 14 Aug 2022 18:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B08C71634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494269;
	bh=K+ir609JSd1Xoem7Z547dEqv671JPfbFvoqdmpiy38o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R+xlPiVGZ07KnkLpy2AUjsI1P+9Fe40lY0R5DOV/ie2zbiwSwtL6EIyClkBTQEs2G
	 MiYvBNEvaMxC4HPV2k1WNQwr4VtPq+/3F+aph35lkjPrK1HfqIOdOYh8FOQVZxL240
	 lpU6remGDysI/8B6nx7cZno3hHkxbHmR2BOYu/cE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 261B0F8053E;
	Sun, 14 Aug 2022 18:21:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A193F80563; Sun, 14 Aug 2022 18:21:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9831F804CC
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 18:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9831F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FHh57aW5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8BD260F70;
 Sun, 14 Aug 2022 16:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BB7C433C1;
 Sun, 14 Aug 2022 16:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494100;
 bh=K+ir609JSd1Xoem7Z547dEqv671JPfbFvoqdmpiy38o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FHh57aW53pVTqrtMQM238toN+5RF4Q67ThXms2KPLamDvZh4U3fk0+fAdJqZUcHFb
 ZS+PXpSIAz8pkZWQ21mK6q1eE0smjTAZHkmEKHdzOZeGS+d3tvQUnaUoZpgNemyxGw
 11WmazDg3YBiQmClXIAFkpuSpe83lMGruH7Xi45Hp+71+QJJjydyuHStenSGTndIjL
 0HnzQ/JIWNlqUZG+A6r5VVYpxh2DH3xpLWagzgJuxzCdrTrWgHhUW9+9WLPzwq3VYL
 LodHcjMBGx/ETopZJievwXw+Eg3b/jc2xPCLJLBMVHjfvCAZjxnyIjk0RndvgdSLti
 0t1mmIl3yFhDA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 26/48] ASoC: Intel: sof_es8336: ignore GpioInt
 when looking for speaker/headset GPIO lines
Date: Sun, 14 Aug 2022 12:19:19 -0400
Message-Id: <20220814161943.2394452-26-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814161943.2394452-1-sashal@kernel.org>
References: <20220814161943.2394452-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, cezary.rojewski@intel.com,
 mchehab@kernel.org, Andrey Turkin <andrey.turkin@gmail.com>,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 akihiko.odaki@gmail.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 peter.ujfalusi@linux.intel.com
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

From: Andrey Turkin <andrey.turkin@gmail.com>

[ Upstream commit 751e77011f7a43a204bf2a5d02fbf5f8219bc531 ]

This fixes speaker GPIO detection on machines those ACPI tables
list their jack detection GpioInt before output GpioIo.
GpioInt entry can never be the speaker/headphone amplifier control
so it makes sense to only look for GpioIo entries when looking for them.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andrey Turkin <andrey.turkin@gmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220725194909.145418-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_es8336.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 4d0c361fc277..d70d8255b8c7 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -57,23 +57,23 @@ static const struct acpi_gpio_params enable_gpio0 = { 0, 0, true };
 static const struct acpi_gpio_params enable_gpio1 = { 1, 0, true };
 
 static const struct acpi_gpio_mapping acpi_speakers_enable_gpio0[] = {
-	{ "speakers-enable-gpios", &enable_gpio0, 1 },
+	{ "speakers-enable-gpios", &enable_gpio0, 1, ACPI_GPIO_QUIRK_ONLY_GPIOIO },
 	{ }
 };
 
 static const struct acpi_gpio_mapping acpi_speakers_enable_gpio1[] = {
-	{ "speakers-enable-gpios", &enable_gpio1, 1 },
+	{ "speakers-enable-gpios", &enable_gpio1, 1, ACPI_GPIO_QUIRK_ONLY_GPIOIO },
 };
 
 static const struct acpi_gpio_mapping acpi_enable_both_gpios[] = {
-	{ "speakers-enable-gpios", &enable_gpio0, 1 },
-	{ "headphone-enable-gpios", &enable_gpio1, 1 },
+	{ "speakers-enable-gpios", &enable_gpio0, 1, ACPI_GPIO_QUIRK_ONLY_GPIOIO },
+	{ "headphone-enable-gpios", &enable_gpio1, 1, ACPI_GPIO_QUIRK_ONLY_GPIOIO },
 	{ }
 };
 
 static const struct acpi_gpio_mapping acpi_enable_both_gpios_rev_order[] = {
-	{ "speakers-enable-gpios", &enable_gpio1, 1 },
-	{ "headphone-enable-gpios", &enable_gpio0, 1 },
+	{ "speakers-enable-gpios", &enable_gpio1, 1, ACPI_GPIO_QUIRK_ONLY_GPIOIO },
+	{ "headphone-enable-gpios", &enable_gpio0, 1, ACPI_GPIO_QUIRK_ONLY_GPIOIO },
 	{ }
 };
 
-- 
2.35.1

