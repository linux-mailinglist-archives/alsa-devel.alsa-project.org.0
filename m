Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1C27A17C7
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 09:50:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EFB29F6;
	Fri, 15 Sep 2023 09:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EFB29F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694764257;
	bh=DdmxDVNxkNkomWAzWGolHZ8v9RgscSRPaL+6KFrWRNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nYF1GXdKDkbva0XbCQfnLNUHhT2xWwKLiBnR+jYl+sF+jfhQHgZ7BnNhDilnDj7lh
	 ccsC9++x9Pmcy/X/HBDjdWwNccw/ixJ3N/lc/33gUvzMFTlbDbL7JWFRrAL94XlUyP
	 wfb3Ut4nz9njWI7Lw09y1FXzv8THsf/btJbMkHBw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A758F8057B; Fri, 15 Sep 2023 09:49:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B52FF80563;
	Fri, 15 Sep 2023 09:49:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E363F80537; Fri, 15 Sep 2023 09:49:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54149F801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 09:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54149F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dyBTMR1H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694764144; x=1726300144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DdmxDVNxkNkomWAzWGolHZ8v9RgscSRPaL+6KFrWRNM=;
  b=dyBTMR1HdEQAmSaDIJ45R+Dky0XcWyW5YrjwrYko34f02yc5swpjZdS5
   eolKvFo6L0NCxucFEPQVY9lXPrMhDyvEVakK0hpuRXiElTPqxxTBC9eLv
   QA8lqeEmE/VDoIA7B8PoFODDo+pAd9QL5fLfGxJzUGiaf+70mFMkWGIKv
   ZZg+/mbdcshvCl5L6JMrkT7P6URfATE7Vy7WoM04wfrpMtgshXcxS/Clp
   inQKeSoilUVpsBrO5QDtgDPLxCzeeN06dJiY9QiJE7xw8VElT04heAKO6
   8ITbcO7nSbsQiwZke4MgPsgeQ/1jitAuNs4LpKwHNSYSSl4iin2iXpojT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376527531"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="376527531"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779998371"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="779998371"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:47:35 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	ckeepax@opensource.cirrus.com
Subject: [PATCH 1/4] ASoC: intel: sof_sdw: Move sdw_pin_index into private
 struct
Date: Fri, 15 Sep 2023 15:56:08 +0800
Message-Id: <20230915075611.1619548-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915075611.1619548-1-yung-chuan.liao@linux.intel.com>
References: <20230915075611.1619548-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NONVSW2J3GW5LZTYMTSK2I4SA7MQYQFD
X-Message-ID-Hash: NONVSW2J3GW5LZTYMTSK2I4SA7MQYQFD
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NONVSW2J3GW5LZTYMTSK2I4SA7MQYQFD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Whilst it should not cause any issues as only a single instance of the
machine will be instantiated, it is still slightly better practice to
keep working data in the private data structure, rather than a global
variable. Move sdw_pin_index into the mc_private structure.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 10 +++-------
 sound/soc/intel/boards/sof_sdw_common.h |  4 ++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 961241100012..eaecdb75686c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -22,11 +22,6 @@ MODULE_PARM_DESC(quirk, "Board-specific quirk override");
 
 #define INC_ID(BE, CPU, LINK)	do { (BE)++; (CPU)++; (LINK)++; } while (0)
 
-#define SDW_MAX_LINKS		4
-
-/* To store SDW Pin index for each SoundWire link */
-static unsigned int sdw_pin_index[SDW_MAX_LINKS];
-
 static void log_quirks(struct device *dev)
 {
 	if (SOF_JACK_JDSRC(sof_sdw_quirk))
@@ -1331,6 +1326,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			      int adr_index,
 			      int dai_index)
 {
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *dev = card->dev;
 	const struct snd_soc_acpi_link_adr *adr_link_next;
 	struct snd_soc_dai_link_component *codecs;
@@ -1452,7 +1448,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		for (k = 0; k < cpu_dai_num; k++) {
 			cpu_name = devm_kasprintf(dev, GFP_KERNEL,
 						  "SDW%d Pin%d", cpu_dai_id[k],
-						  sdw_pin_index[cpu_dai_id[k]]++);
+						  ctx->sdw_pin_index[cpu_dai_id[k]]++);
 			if (!cpu_name)
 				return -ENOMEM;
 
@@ -1600,7 +1596,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto SSP;
 
 	for (i = 0; i < SDW_MAX_LINKS; i++)
-		sdw_pin_index[i] = SDW_INTEL_BIDIR_PDI_BASE;
+		ctx->sdw_pin_index[i] = SDW_INTEL_BIDIR_PDI_BASE;
 
 	for (; adr_link->num_adr; adr_link++) {
 		/*
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 2f4fe6bc3d5d..270aded488e1 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -24,6 +24,8 @@
 #define SDW_MAX_CPU_DAIS 16
 #define SDW_INTEL_BIDIR_PDI_BASE 2
 
+#define SDW_MAX_LINKS		4
+
 /* 8 combinations with 4 links + unused group 0 */
 #define SDW_MAX_GROUPS 9
 
@@ -97,6 +99,8 @@ struct mc_private {
 	struct snd_soc_jack sdw_headset;
 	struct device *headset_codec_dev; /* only one headset per card */
 	struct device *amp_dev1, *amp_dev2;
+	/* To store SDW Pin index for each SoundWire link */
+	unsigned int sdw_pin_index[SDW_MAX_LINKS];
 };
 
 extern unsigned long sof_sdw_quirk;
-- 
2.25.1

