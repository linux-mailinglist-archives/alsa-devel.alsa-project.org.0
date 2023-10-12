Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54D7C766D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:10:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15536A4D;
	Thu, 12 Oct 2023 21:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15536A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697137853;
	bh=8EujTobaAE8ww0dHS5VSD5+tWKguWfBgrzqswiPk180=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SpcySJv28U5oNiE4bOljHKITJ24jJlVqSfpfvPSekBRQ7VofaCosHHQAl05TdI83E
	 lLv1RIj+Cx6h35opB4uh7eV+1j32bVvI7c5Ko0ji6DJpnQsba9Kqb3XbfhwdkuZfWB
	 lwrvYZKkIvJLhUfcCO9HHNJzQ1dbDzb9SIWY1jaI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8955CF805B0; Thu, 12 Oct 2023 21:09:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E68DCF805AB;
	Thu, 12 Oct 2023 21:09:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50AA1F8027B; Thu, 12 Oct 2023 21:09:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C8BCF8027B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C8BCF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S+eVGWdn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137738; x=1728673738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8EujTobaAE8ww0dHS5VSD5+tWKguWfBgrzqswiPk180=;
  b=S+eVGWdnPDxmYxLBXhTryz/CIOTDB3RkD80lDitZEsX2GgCWyeiKxN8m
   sl3uE12I2Jma/5GD0o1Jio/bvsW06+s36sAe4r+5M8M2T1GHZT28BfCuO
   R5l6FIBq6qIP9RBGB+ZZieSWllpLpwibdkl7TeH1w01I5u4o4/2yeUmGL
   eFFtggbyZrTIvviGMt0XLHs3lXrLk98vp58+QWgTKvzdZacVdWjKQS6Aw
   kKc1zTqNS/yfBywF2bcUcwLHOBAUDnyjYvNtJTwDKxVc5ZbePFZPeOvoc
   B+uUEzQRj1znS1aFhcqbxJY5U0IyDNkT1XGipmdduI9ZLW1a3qd7nKsR1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060169"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060169"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108044"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108044"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/23] ASoC: Intel: soc-acpi-intel-rpl-match: add
 rt711-l0-rt1316-l12 support
Date: Thu, 12 Oct 2023 15:08:05 -0400
Message-Id: <20231012190826.142619-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QD5MUVEZPYU6IFNHWO4FT6DGCDGTD2YK
X-Message-ID-Hash: QD5MUVEZPYU6IFNHWO4FT6DGCDGTD2YK
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QD5MUVEZPYU6IFNHWO4FT6DGCDGTD2YK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Another configuration that doesn't support DMIC.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-rpl-match.c   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index b0ffade5bb08..19cfdcdbfdf7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -246,6 +246,25 @@ static const struct snd_soc_acpi_link_adr rpl_sdw_rt711_link2_rt1316_link01[] =
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr rpl_sdw_rt711_link0_rt1316_link12[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1316_1_group1_adr),
+		.adr_d = rt1316_1_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1316_2_group1_adr),
+		.adr_d = rt1316_2_group1_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr rpl_sdw_rt711_link0_rt1318_link12_rt714_link3[] = {
 	{
 		.mask = BIT(0),
@@ -459,6 +478,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-rpl-rt711-l0-rt1318-l12-rt714-l3.tplg",
 	},
+	{
+		.link_mask = 0x7, /* rt711 on link0 & two rt1316s on link1 and link2 */
+		.links = rpl_sdw_rt711_link0_rt1316_link12,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-rpl-rt711-l0-rt1316-l12.tplg",
+	},
 	{
 		.link_mask = 0x7, /* rt711 on link0 & two rt1318s on link1 and link2 */
 		.links = rpl_sdw_rt711_link0_rt1318_link12,
-- 
2.39.2

