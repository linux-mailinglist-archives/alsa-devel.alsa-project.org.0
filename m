Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B23720A47
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:28:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7162D825;
	Fri,  2 Jun 2023 22:27:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7162D825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737712;
	bh=x11QVuYK+u0pkN91FphTj6BIhUi+uCETtdcFBMfBWls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sFtoe4PmZWfmAITLcxOgosZZkj9PwiOcVVzsJ+IYvX9zISDK/h9ZUqBzflY7jFUM4
	 jFI0NuLOEI6p3qXoLsU4lJC6ltffic6CJKcf8djDjH45Jn5unBmarN+Ez1lzJlaUJB
	 gvLf9QoyPPNX5QLYOgyVTIPddeE/piz+H4iEVEck=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D15F6F8062D; Fri,  2 Jun 2023 22:24:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57C5CF80568;
	Fri,  2 Jun 2023 22:24:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BE5FF805FD; Fri,  2 Jun 2023 22:23:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33415F80149
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33415F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DCzN5E7V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737394; x=1717273394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x11QVuYK+u0pkN91FphTj6BIhUi+uCETtdcFBMfBWls=;
  b=DCzN5E7Vqy2J5y2jpL0SlzQkwhZeQsIAyavT+YwguFmVJ9wxRGwrlq2U
   V9zxP68/Qw52oFcMQdjZeFL1YbKdfCDnM8REStubbkasQEvvuubr0D/fr
   H5jhIyGxcL7KKFisOjgHwqrFbMooKb7MLa8f9BvfQIW1g48Wk7PCUlncK
   L/XQkZGt8q62u8pHVvPgH6SPXOqWMiK7IE4l4VTqqTnqWT9ek28I4Y0a4
   JYnpmR2FL3u3AVEUsCukyDQpHIfx6UQUhdGOVPE8XOWGI56AqpzUcNuZj
   Ej64aGjKtDi8nhPQk3mhoZibz0ModFVylMl8aqT6sOn/Fypue6xQvh7Qp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811271"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811271"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020026"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020026"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 14/28] ASoC: Intel: sof_sdw: increase sdw pin index for each
 sdw link
Date: Fri,  2 Jun 2023 15:22:11 -0500
Message-Id: <20230602202225.249209-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PA2M2NP6JUNTLCFSAPBN4NKZ6CIIJBXJ
X-Message-ID-Hash: PA2M2NP6JUNTLCFSAPBN4NKZ6CIIJBXJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PA2M2NP6JUNTLCFSAPBN4NKZ6CIIJBXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

To support multiple codecs per SoundWire link, we have to assign multiple
CPU DAIs to different DAI links sharing the same physical link. This is
not possible with the existing code since we assume that only 'Pin2' is
used for playback and 'Pin3' used for capture - additional DAIs cannot
be handled.

This patch enables more CPU DAIs to be used, e.g. "SDW0 Pin2",
"SDW0 Pin3", and "SDW0 Pin4" for SDW0-Playback-SimpleJack,
SDW0-Capture-SimpleJack, and SDW0-Playback-SmartAmp DAI links on physical
link #0.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 73e5a6aed776..a032628f8925 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -22,6 +22,11 @@ MODULE_PARM_DESC(quirk, "Board-specific quirk override");
 
 #define INC_ID(BE, CPU, LINK)	do { (BE)++; (CPU)++; (LINK)++; } while (0)
 
+#define SDW_MAX_LINKS		4
+
+/* To store SDW Pin index for each SoundWire link */
+static unsigned int sdw_pin_index[SDW_MAX_LINKS];
+
 static void log_quirks(struct device *dev)
 {
 	if (SOF_JACK_JDSRC(sof_sdw_quirk))
@@ -1247,10 +1252,10 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	int cpu_dai_num, cpu_dai_index;
 	unsigned int group_id;
 	int codec_idx = 0;
-	int i = 0, j = 0;
 	int codec_index;
 	int codec_num;
 	int stream;
+	int i = 0;
 	int ret;
 	int k;
 
@@ -1336,7 +1341,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		for (k = 0; k < cpu_dai_num; k++) {
 			cpu_name = devm_kasprintf(dev, GFP_KERNEL,
 						  "SDW%d Pin%d", cpu_dai_id[k],
-						  j + SDW_INTEL_BIDIR_PDI_BASE);
+						  sdw_pin_index[cpu_dai_id[k]]++);
 			if (!cpu_name)
 				return -ENOMEM;
 
@@ -1385,7 +1390,6 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		}
 
 		*cpu_id += cpu_dai_num;
-		j++;
 	}
 
 	return 0;
@@ -1538,6 +1542,9 @@ static int sof_card_dai_links_create(struct device *dev,
 	for (i = 0; i < SDW_MAX_GROUPS; i++)
 		group_generated[i] = false;
 
+	for (i = 0; i < SDW_MAX_LINKS; i++)
+		sdw_pin_index[i] = SDW_INTEL_BIDIR_PDI_BASE;
+
 	for (; adr_link->num_adr; adr_link++) {
 		/*
 		 * If there are two or more different devices on the same sdw link, we have to
-- 
2.37.2

