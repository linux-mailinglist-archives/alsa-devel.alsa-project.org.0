Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A855288C8A1
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:09:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23B3A2BEE;
	Tue, 26 Mar 2024 17:09:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23B3A2BEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469397;
	bh=NdCG1hXCdJ2Yk3G4mstPgE3sClduDXEn2se54Xajods=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CW3U7NnW5f+FrhkdtaasZm7J1wCMfjZ6aWZzR9WSmHpkf1BhkcD/wl8MxYkZE8nCc
	 WoeCi8oOMO5klbb/0W/ZQpxjtBYiHbHfgXM0P1l16hOyAEE4rmQIK9/3lgvdRu2Kpz
	 OehKkULBQYHD0ZiAYDe0QY3riBIFOFMPBGDGXqik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4FD0F8080C; Tue, 26 Mar 2024 17:06:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0787FF805EE;
	Tue, 26 Mar 2024 17:06:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D92CF80611; Tue, 26 Mar 2024 17:06:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 812B0F801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 812B0F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AuYBoKHQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469143; x=1743005143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NdCG1hXCdJ2Yk3G4mstPgE3sClduDXEn2se54Xajods=;
  b=AuYBoKHQR2zGWv8WDukA3kJSpVYC8uQktQoO/pRiRmVhg3JBxb2RUlfZ
   upf1Z1jY9QJ4B82Z33GrNn3ewQwTOHlUfXWVuhObzNNP+d48wAxKY7QEC
   ioHUNhKB12cwsbGLJ75Jgynsj+16fkq3v+SFi6QsYzSHXOxqve1MlHG20
   lknHYoHGuNuDhb9WhTQqmhPA620LiR8kHqjZjv1r1rWsy/4LmkSrNZW4m
   CIcdPop+RiiqRw72ww0CIMOWayYyvzWbF/Eh1Q+S3QDwdUXuJeRmSKEB3
   OBP12MBjwl4ZR2A3Rgv+HDBkUBScDLPZ4BVCyMR+mYOEvplJJ+io7Ru+Q
   g==;
X-CSE-ConnectionGUID: sNZvpXF5ToWooCp92Tx+WQ==
X-CSE-MsgGUID: 7TRd3yfMR0utJFj5rfmmDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260430"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260430"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482274"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Balamurugan C <balamurugan.c@intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 15/34] ASoC: Intel: soc-acpi-intel-arl-match: Add rt711 sdca
 codec support
Date: Tue, 26 Mar 2024 11:04:10 -0500
Message-Id: <20240326160429.13560-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ACQLG6ZWCYFQVMDARO3IDPHYR7ZHDJJ7
X-Message-ID-Hash: ACQLG6ZWCYFQVMDARO3IDPHYR7ZHDJJ7
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ACQLG6ZWCYFQVMDARO3IDPHYR7ZHDJJ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Balamurugan C <balamurugan.c@intel.com>

Adding rt711 sdca codec support for arl boards.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index e52797aae6e6..79d26e0f2c28 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -24,6 +24,15 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
+	{
+		.adr = 0x000030025D071101ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr arl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -33,6 +42,15 @@ static const struct snd_soc_acpi_link_adr arl_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr arl_sdca_rvp[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_machines[] = {
 	{},
 };
@@ -46,6 +64,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-rt711.tplg",
 	},
+	{
+		.link_mask = 0x1, /* link0 required */
+		.links = arl_sdca_rvp,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-rt711-l0.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_sdw_machines);
-- 
2.40.1

