Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 285C38D06B1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 17:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 614C3AE8;
	Mon, 27 May 2024 17:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 614C3AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716825162;
	bh=2cLx1RTnLIZnsam3m/uMcFJB/9IKs3dw7YoYr5Yf46k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fkpvG+tnW/CZA6Y57pZUkaBd7h/3D/TLBUL8lUGKwJjmNaz2BykKpdFW+osHIgqDW
	 27koAXylY/4Bp9QJK5HwAUXvAJu7qfnzRH0Xsp3EX5JPhLJjc8yg9U6ScxtEi8zCct
	 nUdAejaTsEpA92ONGM+3LoxZ/QgEtJTI+uTW9gc4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DF38F805BA; Mon, 27 May 2024 17:52:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83950F80149;
	Mon, 27 May 2024 17:52:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E6AFF8051F; Mon, 27 May 2024 17:52:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CB9AF80149
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 17:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CB9AF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XQhTrfRs
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4850C61B1C;
	Mon, 27 May 2024 15:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6584FC4AF08;
	Mon, 27 May 2024 15:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825128;
	bh=2cLx1RTnLIZnsam3m/uMcFJB/9IKs3dw7YoYr5Yf46k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XQhTrfRslkJjPbNnEn1XmIuo9RlCJqoRqp71BSlUALfNy33GryknV+/cojNKVUGU2
	 yQX5pm9zsiC0Z7GbgeziIsx7MEH3ODSdOXgu4Wb2m03lz3E/WveDrz1iD83JaL03j+
	 otiPOm8zSgYemkVYkhTow3RTBsrh9W29uTQEwqhGtERH2xZqt8tSNqdC2Ye1TaqcPC
	 fbYj44OsRFCHF4YJuG+XvydVwC/GC1KYd9HMarKwbiku50xToC7fuKAi5GlEz7Z4RA
	 XYq4Uaib5q5LoQvaV5RLSa0g219fj6IzK5YLMgeh/5JcQUzsz4CUrHuFaFwgW8lv87
	 3v2InRlsKFoyg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 08/23] ASoC: Intel: sof_sdw: add JD2 quirk for HP
 Omen 14
Date: Mon, 27 May 2024 11:50:09 -0400
Message-ID: <20240527155123.3863983-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155123.3863983-1-sashal@kernel.org>
References: <20240527155123.3863983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MIOAGCZA6KGJG4JPO6B75GHVZXFFRHZC
X-Message-ID-Hash: MIOAGCZA6KGJG4JPO6B75GHVZXFFRHZC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MIOAGCZA6KGJG4JPO6B75GHVZXFFRHZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 4fee07fbf47d2a5f1065d985459e5ce7bf7969f0 ]

The default JD1 does not seem to work, use JD2 instead.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20240411220347.131267-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 08f330ed5c2ea..f4f08e9031506 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -495,6 +495,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_BT_OFFLOAD_SSP(1) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN Transcend Gaming Laptop"),
+		},
+		.driver_data = (void *)(RT711_JD2),
+	},
+
 	/* LunarLake devices */
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.43.0

