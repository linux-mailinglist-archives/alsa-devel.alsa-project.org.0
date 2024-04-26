Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E20CD8B3B34
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:23:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E899A4B;
	Fri, 26 Apr 2024 17:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E899A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145032;
	bh=WAkH3Y7OhBZNoUz6Z4EeiC+ZSwLVt3vDR6DBrDXdPXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n71GxHyKc9aFmbga8+Q1jDgJoWNrn6kDx6+sg7GNhJVf8dliQojCP+g7BzPnSZ5sF
	 /b9ch5BjeIhYpGFAnWwu1n466ueLVZoFWmMkwu8PdfNKVpVQixaRxdxjM3Keex8SDW
	 OVHx5dWSUwdGYyZKPK7ZhzI9EinuMM2DTCBZT5Ds=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4323CF805B4; Fri, 26 Apr 2024 17:22:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C3F9F80652;
	Fri, 26 Apr 2024 17:22:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12E6EF805BE; Fri, 26 Apr 2024 17:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E46AEF8045D
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E46AEF8045D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Uj1fpX5Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144908; x=1745680908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WAkH3Y7OhBZNoUz6Z4EeiC+ZSwLVt3vDR6DBrDXdPXU=;
  b=Uj1fpX5Z0nW8R9fAtCqFU1b6GiCWxLZTlJ1gZngVHfYjMsH4fPfUGr7o
   0zEA0TZfyPciaJXa5cQ25pA0or0z6vmB7kD6UTVvCb9T4GVgpy9mb+cos
   KHdMq98szKMfNRhby4ZMS3PBP8kQEj83VEQFBLB0pfW/6pYzlXp7Rhc5t
   wDXqg7Kl5n/Z++sm+HZvhEWCmrZyo161MqQvzQ8APycUVUFgWtc79TAit
   4CuaPIbA2IgPhfl6VZl0R3a+K3T/eS5a/uR1P4N3WwxjH5xX9ikkgGpaS
   FKksowRWLL3LyDzxKVxn6YxfAeXeBKtVI6t8imAxfsn3qxXu3fOwVU3AI
   g==;
X-CSE-ConnectionGUID: O+aATNsmSnqDlEN7gPYngw==
X-CSE-MsgGUID: CcTPUn6cQ9+6GigWR/iPHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290608"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21290608"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:41 -0700
X-CSE-ConnectionGUID: xWcTo9aQQEKG8IJruxCmow==
X-CSE-MsgGUID: lMOG/s+wS8itmVGZTmk2bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259026"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 04/12] ASoC: Intel: soc-acpi: mtl: add support for Acer Swift
 Go 14
Date: Fri, 26 Apr 2024 10:21:15 -0500
Message-Id: <20240426152123.36284-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RUAQC2BLVS3VREEPMOBPAFDPP5TKHKVF
X-Message-ID-Hash: RUAQC2BLVS3VREEPMOBPAFDPP5TKHKVF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUAQC2BLVS3VREEPMOBPAFDPP5TKHKVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This device has an RT712 on link0, but does not rely on RT1712 for the
DMIC. PCH-attached DMICs are used instead.

Closes: https://github.com/thesofproject/linux/issues/4923
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 8c1c430f5482..4eeec0bc92dc 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -357,7 +357,7 @@ static const struct snd_soc_acpi_adr_device rt714_1_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_link_adr mtl_712_only[] = {
+static const struct snd_soc_acpi_link_adr mtl_712_l0_1712_l3[] = {
 	{
 		.mask = BIT(0),
 		.num_adr = ARRAY_SIZE(rt712_0_single_adr),
@@ -371,6 +371,15 @@ static const struct snd_soc_acpi_link_adr mtl_712_only[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_712_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt712_0_single_adr),
+		.adr_d = rt712_0_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 	{ /* Jack Playback Endpoint */
 		.num = 0,
@@ -769,10 +778,16 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 	},
 	{
 		.link_mask = BIT(3) | BIT(0),
-		.links = mtl_712_only,
+		.links = mtl_712_l0_1712_l3,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt712-l0-rt1712-l3.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = mtl_712_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt712-l0.tplg",
+	},
 	{
 		.link_mask = GENMASK(2, 0),
 		.links = mtl_sdw_rt1318_l12_rt714_l0,
-- 
2.40.1

