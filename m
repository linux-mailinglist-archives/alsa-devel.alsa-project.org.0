Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E5E93E783
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jul 2024 18:10:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 443CFE68;
	Sun, 28 Jul 2024 18:10:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 443CFE68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722183048;
	bh=o3fxRJr198nUOke7XZL7AlpthTh23DFZLzphgYmF8Vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rOyMu1Ug1h07Iv8499BCV5wV0s3PvXrvX8isZ6EcelqO80dzetPBkg/x8wFtrXjoT
	 BoiJqBx/yoBdJN/MYpmHHIUfiToRYN4Odq28rbZbtbdAjnqhN1tOzKtt3xu4pO5lJE
	 KbVoa3KWkPJpuia/tGhFn9L26hKkGx+vPU1vaY2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 412A3F8065E; Sun, 28 Jul 2024 18:09:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86609F80649;
	Sun, 28 Jul 2024 18:09:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C15F2F802DB; Sun, 28 Jul 2024 18:07:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB95DF8007E
	for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2024 18:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB95DF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t+fKLKeA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 110B0CE0937;
	Sun, 28 Jul 2024 16:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9F1C4AF0B;
	Sun, 28 Jul 2024 16:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722182860;
	bh=o3fxRJr198nUOke7XZL7AlpthTh23DFZLzphgYmF8Vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t+fKLKeAnA81sM01qnr9xnCSl7NbAFv9MM5zQGiU+JL98Yv79HIygMmYwEWJr7eUw
	 uiWiFgtmbrQCEz88bI/LTJgRA55s5tqT6/9Or37IbbYr4iQRvFoD1wKdoFJUiaBhqq
	 QQ6/4Icp0rr2mSWjiKfbALT87pSuNEpejw63jd5nakn5epzPKm/To3uxBVKxtFFUiL
	 GZO6MNq0pa12n34pgnYKma1WtGlnZFLtwMw+2Wwo/LPT2rEQMs5aWqDcUDZ2q8R4gL
	 w1ljP/4B9r29K3TrVrS8wrFTLWBiOxQVOFxJUNUEyzOa1MeW71Q0xVyoYxaleb2gW/
	 xRdZexxmXLvOw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 11/17] ASoC: Intel: sof_sdw: add quirk for Dell
 SKU 0B8C
Date: Sun, 28 Jul 2024 12:06:47 -0400
Message-ID: <20240728160709.2052627-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728160709.2052627-1-sashal@kernel.org>
References: <20240728160709.2052627-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F23JROJYQ2BM7UBFQYBRCLLR37ANHO4D
X-Message-ID-Hash: F23JROJYQ2BM7UBFQYBRCLLR37ANHO4D
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F23JROJYQ2BM7UBFQYBRCLLR37ANHO4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 92d5b5930e7d55ca07b483490d6298eee828bbe4 ]

Jack detection needs to rely on JD2, as most other Dell
AlderLake-based devices.

Closes: https://github.com/thesofproject/linux/issues/5021
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://patch.msgid.link/20240624121119.91552-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index dc144cd7e0e3b..db1dcb9d70466 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -425,6 +425,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		/* No Jack */
 		.driver_data = (void *)SOF_SDW_TGL_HDMI,
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B8C"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.43.0

