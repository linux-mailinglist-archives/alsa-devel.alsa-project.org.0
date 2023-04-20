Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 209996E9193
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 13:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FF46EEC;
	Thu, 20 Apr 2023 13:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FF46EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681988716;
	bh=Veoh3nbT/FHO+RMJ4ObqE8nXFs9uC17/9N8Wr6a95qI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FTTDL7shR8Dfy9NGvsIRltpkBpJ91YQjhnOxXVA91LYiBAQ17GlclH6iuATNoflY0
	 VwoVB64XsjZQZL50orfHVGyzoATKrL8B8iQ6kNo/f7kH1/pLC59Kw6Y9G4I627LeP+
	 KjhIprkFXCXsA8GzftgmAHpLVw6d5PQpREuAi/WU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62591F80578;
	Thu, 20 Apr 2023 13:02:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EFFCF8056F; Thu, 20 Apr 2023 13:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C422F80567
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 13:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C422F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hopq04De
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 644DE647C8;
	Thu, 20 Apr 2023 11:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85DDC433D2;
	Thu, 20 Apr 2023 11:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681988558;
	bh=Veoh3nbT/FHO+RMJ4ObqE8nXFs9uC17/9N8Wr6a95qI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hopq04DeS8XYRy5mGJ0pOwzA8YbhQOFKaZAMxC0cBR0S8MxtdZXWkCgpHTcfgz3Ge
	 mhlF4eX3N/u2A0G63PpEw7MvwLvEawQ7gvC/XDNNGcIQ36L+I4GEbNXtFsA2ACGJJc
	 peTRuR7Rs3oX4m1zfXzMyQVfqWZ2CUBjkFjWnUSINy8hJo5anBRQAC5PGdqRXYlVS7
	 nbjYaO2m5PibrLHHKjSSJGZEWwfO6enFL8HUCvHdITf4wkEYAohMO3pqC6iL8xuCxo
	 gG292HC63BRr6yZwlOAXm1NOHAAm/ndKOpqiJO7bxKWPM1j/ZRLICbxNjdgsdxoiU+
	 rKfugZg2IM/mA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 02/15] ASoC: Intel: soc-acpi: add table for Intel
 'Rooks County' NUC M15
Date: Thu, 20 Apr 2023 07:02:16 -0400
Message-Id: <20230420110231.505992-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420110231.505992-1-sashal@kernel.org>
References: <20230420110231.505992-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2EIRUOTILYLN3ZADBEF2TGOTVWIJTU2K
X-Message-ID-Hash: 2EIRUOTILYLN3ZADBEF2TGOTVWIJTU2K
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Eugene Huang <eugene.huang99@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, tiwai@suse.com, brent.lu@intel.com,
 ajye_huang@compal.corp-partner.google.com, muralidhar.reddy@intel.com,
 arnd@arndb.de, CTLIN0@nuvoton.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2EIRUOTILYLN3ZADBEF2TGOTVWIJTU2K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Eugene Huang <eugene.huang99@gmail.com>

[ Upstream commit 9c691a42b8926c8966561265cdae3ddc7464d3a2 ]

Same topology as the HP Omen 16-k0005TX, except with the rt1316 amp
on link2.

Link: https://github.com/thesofproject/linux/issues/4088
Signed-off-by: Eugene Huang <eugene.huang99@gmail.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20230314090553.498664-3-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 0102574025e90..6e21e1640acfa 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -354,6 +354,20 @@ static const struct snd_soc_acpi_link_adr adl_sdw_rt711_link0_rt1316_link3[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr adl_sdw_rt711_link0_rt1316_link2[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1316_2_single_adr),
+		.adr_d = rt1316_2_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device mx8373_2_adr[] = {
 	{
 		.adr = 0x000223019F837300ull,
@@ -612,6 +626,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-rt711-l0-rt1316-l3.tplg",
 	},
+	{
+		.link_mask = 0x5, /* 2 active links required */
+		.links = adl_sdw_rt711_link0_rt1316_link2,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-adl-rt711-l0-rt1316-l2.tplg",
+	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = adl_rvp,
-- 
2.39.2

