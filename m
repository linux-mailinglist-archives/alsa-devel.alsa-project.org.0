Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ADB75E765
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2345DFA;
	Mon, 24 Jul 2023 03:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2345DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690162061;
	bh=2KANAftaD78TguohAtEcbgQmDSJotr6QWfpIsNWzpxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MbKbkXnv385s35v/EEM8Y83GRwOdiw/wQJiM2W/H2C+rlgaX/j6FCTL1MOuHbxVku
	 mzqcRubr0LbnVDbgRSO0Yhlo/1Ha9ZrDNlgKUYX4CR/E6TfhDHea9wuQvSwZLmmtOz
	 MMsnbe3U4IwuFq0gP2d4/FGBpGPCAXoGIlnkZmM8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B304F805EF; Mon, 24 Jul 2023 03:24:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31257F805EF;
	Mon, 24 Jul 2023 03:24:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49C1DF805C3; Mon, 24 Jul 2023 03:24:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06F50F8057C
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F50F8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u6nepXz8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E085260F2D;
	Mon, 24 Jul 2023 01:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67945C433CB;
	Mon, 24 Jul 2023 01:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161866;
	bh=2KANAftaD78TguohAtEcbgQmDSJotr6QWfpIsNWzpxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u6nepXz8JepxC4TpPzVZoc6UJYNbKvlFZk+7GN7ZKDiHFW8yV7oVcD7et+9NWzDbO
	 73m1Gv00wCR1wCRdsJ464fwEBZWhMabL2rJMrsjqi/528FGJcs6F+LiLHY6PRXW7iL
	 L+lXms8E2b1et/+2dF5Kd1t91sMKi3LNN2E51wxyPFOk+hAhuzHGtcVAl97F+ddCVS
	 phRuK7Bu3ncYUgWOMiDa4t0vFL+SxPO8eyUP3/EjOK/FxyFmZVYRe2V4ddn1+b7JBu
	 EYdqPSTxGbKNcTV82mNpqcok3Sxfcb71BoIKHNrPCbPqSo2sECnpalfAUP/N7e70t2
	 z/ox9E9oCdsNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.10 04/22] ASoC: Intel: sof_sdw: add quirk for LNL
 RVP
Date: Sun, 23 Jul 2023 21:24:01 -0400
Message-Id: <20230724012419.2317649-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012419.2317649-1-sashal@kernel.org>
References: <20230724012419.2317649-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.186
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TI6J7JEFNDIVC7KADEXLX6X4XLXX2Q3X
X-Message-ID-Hash: TI6J7JEFNDIVC7KADEXLX6X4XLXX2Q3X
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TI6J7JEFNDIVC7KADEXLX6X4XLXX2Q3X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

[ Upstream commit dfe25fea968dc4884e12d471c8263f0f611b380a ]

We should use RT711_JD2_100K for on board rt711

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com
Link: https://lore.kernel.org/r/20230512173305.65399-9-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 91a7cb33042d8..30cc8bbceb79b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -207,6 +207,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(RT711_JD2_100K),
 	},
+	/* LunarLake devices */
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lunar Lake Client Platform"),
+		},
+		.driver_data = (void *)(RT711_JD2_100K),
+	},
 	{}
 };
 
-- 
2.39.2

