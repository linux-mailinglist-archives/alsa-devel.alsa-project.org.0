Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B075E6C5
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:23:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71C7C847;
	Mon, 24 Jul 2023 03:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71C7C847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690161790;
	bh=o6qX34nlqMIz0BTkisqGMTe9KWeD/CNmwcKAly21D1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XSdXqFoMfg7TUARVRazzCV+wfCuVb3zUYW0Fel1TWpJ6yFArZrw1Dgu/8iI81+MC0
	 9TjDSmGo0zgIT4NCGw8oZF7zt6y4EbTj/xqCQFKX6qSavgPAcekar9t/lsETMDlUaJ
	 VtMrIZu88zN4YvAmSDm0+7zyHGpzPmx4bz4YVmOs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15962F80570; Mon, 24 Jul 2023 03:21:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9911F8056F;
	Mon, 24 Jul 2023 03:21:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DD5FF80520; Mon, 24 Jul 2023 03:21:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F2560F80548
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2560F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B/t4C8dI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B246D60F30;
	Mon, 24 Jul 2023 01:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760E6C433C7;
	Mon, 24 Jul 2023 01:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161707;
	bh=o6qX34nlqMIz0BTkisqGMTe9KWeD/CNmwcKAly21D1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B/t4C8dIkvsmUG8vtZCmzlz0K6ZVm8ws3owZ9MBUxsiBdny0jN3YdEGAzFFUyJx1k
	 FwZOGJiEDKFhWT4+rUIdmYpln+mKguXJwQRY4H2t3YkDBIe4kzBB2Ak0P2c/m3oQbz
	 xDg/GLdtUQNuO5thQNUVVO2mINOil4V/bO8iprHPkGIHAJOdMMXAFqYNVdKwr1PQcO
	 nez7d5e6iptbdqh5tfpd3DWuO2NHAMuKqGgb9ewPdheU/ho8KFlteWvLfPzwSFZXB4
	 btDYhOGDv5yIdBhdtEhyDf0l/NA8YocbXZWMaBvYFp2nW4TEUyY40pO2DFDhpEFRxY
	 gaiOpFJay8Mtw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	gongjun.song@intel.com,
	shumingf@realtek.com,
	yong.zhi@intel.com,
	u.kleine-koenig@pengutronix.de,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 08/41] ASoC: Intel: sof_sdw: add quirk for LNL RVP
Date: Sun, 23 Jul 2023 21:20:41 -0400
Message-Id: <20230724012118.2316073-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012118.2316073-1-sashal@kernel.org>
References: <20230724012118.2316073-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GWDWXLSAJLM3OOBEZGTEJEJLPFOEFOXN
X-Message-ID-Hash: GWDWXLSAJLM3OOBEZGTEJEJLPFOEFOXN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWDWXLSAJLM3OOBEZGTEJEJLPFOEFOXN/>
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
index a06693827ae5b..da19bfdac1ea7 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -382,6 +382,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
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

