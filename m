Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B768D06F4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 17:56:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46F1B845;
	Mon, 27 May 2024 17:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46F1B845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716825406;
	bh=fAv49FxfjPWBFgHN2MTZQbQIwbW2xRZNMLpxxefCvXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g6o8pyxto8dooE0mN5uYg2SJPOwNLounzK94U867EcZWIckpdzhb2pl67f/nvsRkl
	 H5K5kkRVyGBWUWTZwQmGtLU+sQJKacDbiAov+BcU9bIztdglwGSKBMvTC49+zo1NGR
	 dY6DxwadDjWKSBlCg3fsho+b2Ty/3LmZSE7YD/Hk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D812F805A8; Mon, 27 May 2024 17:56:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62177F80496;
	Mon, 27 May 2024 17:56:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3E04F8026D; Mon, 27 May 2024 17:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2AF4F800AC
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 17:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2AF4F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=layX1l3O
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1EAF561972;
	Mon, 27 May 2024 15:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D20C4AF07;
	Mon, 27 May 2024 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825366;
	bh=fAv49FxfjPWBFgHN2MTZQbQIwbW2xRZNMLpxxefCvXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=layX1l3OptzEDVYVonhTcZUCyJwSNjOcCDYCqvGkAofzZZSNCAPHaLyOKiZxpLF00
	 JknGIs1PDCr59b8IYJQ1H+KJjlx/qACv9/4lA1eWhIdUvJk7uNmS5pEYg/C5T0QLpr
	 6EAu7PZWWiMLbUj+kSES0Hce3OiOckrSxWK+Vv95SluPrwqgxWXKN7w93cizsVsOE3
	 7cqUlx7qqDYEChFhOSdFOLe87Adspr6H7iqgSKBnGJDHws5uopiZj8C1tUYceDTZmI
	 QkBQ8O1lXsGA3aiNv5Ayw7WCKde9zqkoxeb492juu8VUFyD+gyQIqSNC7YkXh9aZED
	 vw2CKWOKnQcwQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 05/16] ASoC: Intel: sof_sdw: add quirk for Dell
 SKU 0C0F
Date: Mon, 27 May 2024 11:54:56 -0400
Message-ID: <20240527155541.3865428-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155541.3865428-1-sashal@kernel.org>
References: <20240527155541.3865428-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.32
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PBABMIBUXLPKN7ESASNGD44OEKFG4Y3R
X-Message-ID-Hash: PBABMIBUXLPKN7ESASNGD44OEKFG4Y3R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBABMIBUXLPKN7ESASNGD44OEKFG4Y3R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit b10cb955c6c0b8dbd9a768166d71cc12680b7fdf ]

The JD1 jack detection doesn't seem to work, use JD2.
Also use the 4 speaker configuration.

Link: https://github.com/thesofproject/linux/issues/4900
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20240411220347.131267-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 59621a9c389c7..91098d7922bef 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -436,6 +436,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					RT711_JD2 |
 					SOF_SDW_FOUR_SPK),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C0F")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2 |
+					SOF_SDW_FOUR_SPK),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.43.0

