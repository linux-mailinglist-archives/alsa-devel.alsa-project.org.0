Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A56E047D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 04:39:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7796FF91;
	Thu, 13 Apr 2023 04:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7796FF91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681353560;
	bh=Veoh3nbT/FHO+RMJ4ObqE8nXFs9uC17/9N8Wr6a95qI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OBRKfb7Cq6ngGxYru/uc296xbgE86CkO9tPB3hTwWSUO0rnvIylBS5lAQPocFL6Ip
	 2kdj1xSdr/WL4++8UojpCZA+H9cMVm6pt92DfhkxErC6upS+3mndMbUOPASZ9KlaEq
	 dfC23tn8uDi31xuEYaTECAOocyf6uKI/KMbjXckA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D95F80568;
	Thu, 13 Apr 2023 04:37:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7639DF80570; Thu, 13 Apr 2023 04:36:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A51B3F80563
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 04:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A51B3F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d2TRxAgA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A32863AA9;
	Thu, 13 Apr 2023 02:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDA5C433EF;
	Thu, 13 Apr 2023 02:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681353414;
	bh=Veoh3nbT/FHO+RMJ4ObqE8nXFs9uC17/9N8Wr6a95qI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d2TRxAgAqPFUM1/K9EOdsPXkwnMwseqhRP2IYVFxhrn1NRpJZpoc1tZo0FE8eHfes
	 VFfnb/hOdCduIRB2DF/fW7zF81/fWx5N9M7IpXxADkPKuuEdT5NkF2H4IuNgmwlyM1
	 tE/yfvIgkg6Wjlik4E1VC5BHq06XW8NORquhPiL/xM4Rv8XjOzdJZajoXg8xuD/X89
	 IjW6VpSolS1r72nPjWyBxg4a0WfONA4hILdMR1nF6EB0PeY9DoJltSnJ3osDI/TF5m
	 PitIpgMtDez7iUgP3RXlJG1lFeHQdHrrbYGBPXHP+Z2ePZAhrDnz71jAGIs1I7Fq9W
	 0B577MnfsSQ0w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 02/17] ASoC: Intel: soc-acpi: add table for Intel
 'Rooks County' NUC M15
Date: Wed, 12 Apr 2023 22:36:30 -0400
Message-Id: <20230413023647.74661-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413023647.74661-1-sashal@kernel.org>
References: <20230413023647.74661-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QUM2IRIBUS5GJNNL4IYR3XACRFYZ2GA7
X-Message-ID-Hash: QUM2IRIBUS5GJNNL4IYR3XACRFYZ2GA7
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
 muralidhar.reddy@intel.com, ajye_huang@compal.corp-partner.google.com,
 arnd@arndb.de, CTLIN0@nuvoton.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUM2IRIBUS5GJNNL4IYR3XACRFYZ2GA7/>
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

