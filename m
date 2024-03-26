Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 321BA88C88E
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:07:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C996A2BC0;
	Tue, 26 Mar 2024 17:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C996A2BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469243;
	bh=U4OtHoNqJ+4hCKh/I0uepPXi2zqFsbV/bIV5qmonHx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sPyRDIoCR39EmCprw7KmgtKqoRUh1sAxGmcJ0yf5lgOSsyzlYLqt2+vVHGJi8CdCR
	 +F+AYbtWrU1fR5simtUBsnAKby+zOWk4C/6d4JOdBvBGht+sWhfJTERRuQJ91Zl5un
	 o8enb26K6NpoGLag5IBtj97uOfXwKN5BcAxZqpY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19E1EF80639; Tue, 26 Mar 2024 17:06:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2615BF8064C;
	Tue, 26 Mar 2024 17:06:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A84FF801D5; Tue, 26 Mar 2024 17:05:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87F68F802DB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87F68F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GOA9uH1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469130; x=1743005130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U4OtHoNqJ+4hCKh/I0uepPXi2zqFsbV/bIV5qmonHx0=;
  b=GOA9uH1AeqT1K50h4LN6BNcqXibA692hH1u64/Z+xMLfKwpIrWqURGyu
   E7LN96NK4fuoozx9Eva03+e6oMYpicKRxjCfQU3OaWpnffb3jncce3zct
   9lnlDz3icpoqjZvI3t7l/uOERo3AV+Ugd/Q5sLhJVCKhtdE/y3cH1w7Eo
   tyzxampli1X5rbSDKdeLoRp5fIy2Jz4lHwJRTNe1hoL2GkCQFLJ02dPQl
   vFRbrVpkioQGfGICUch7xQrCokpXAP9ll5xcCLXavFN1zBThRFkvNrBLl
   sFLsW0e1MwQKQr1mb7hHygRin4c43toFRfr/QNeaqsaukTxF3DZ12U+K0
   w==;
X-CSE-ConnectionGUID: TilQZllISuSsexKk9OIdqw==
X-CSE-MsgGUID: zKCi2zC7Sv66M+INhck6xQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260357"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260357"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482158"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:45 -0700
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
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/34] ASoC: intel: sof_sdw: Set channel map directly from
 endpoints
Date: Tue, 26 Mar 2024 11:04:00 -0500
Message-Id: <20240326160429.13560-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZTNT5V4W6YIQHER332GU2HVTTWLNW4NA
X-Message-ID-Hash: ZTNT5V4W6YIQHER332GU2HVTTWLNW4NA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZTNT5V4W6YIQHER332GU2HVTTWLNW4NA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

The current code evenly distributes the CODEC DAIs across the CPU
DAIs in the DAI link, but this is just an assumption about how the
devices are connected to the host. All the information about which
CODEC is connected to which CPU DAI is contained in the endpoints
datastructures and those structures are already parsed to work out
which CODECs to include in the DAI link. Simply fill in the mapping
from CPUs -> CODECs as we parse through the endpoints structures,
this will ensure that mapping matches the physical layout.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 7b61d45df5da..e2c1822b185f 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1407,19 +1407,6 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	return 0;
 }
 
-static void set_dailink_map(struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps,
-			    int codec_num, int cpu_num)
-{
-	int step;
-	int i;
-
-	step = codec_num / cpu_num;
-	for (i = 0; i < codec_num; i++) {
-		sdw_codec_ch_maps[i].cpu	= i / step;
-		sdw_codec_ch_maps[i].codec	= i;
-	}
-}
-
 static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_sdw_codec_info *codec_info;
@@ -1466,6 +1453,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *dev = card->dev;
 	const struct snd_soc_acpi_link_adr *adr_link_next;
+	struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
 	struct snd_soc_dai_link_component *codecs;
 	struct snd_soc_dai_link_component *cpus;
 	struct sof_sdw_codec_info *codec_info;
@@ -1488,6 +1476,11 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	if (!codecs)
 		return -ENOMEM;
 
+	sdw_codec_ch_maps = devm_kcalloc(dev, codec_num,
+					 sizeof(*sdw_codec_ch_maps), GFP_KERNEL);
+	if (!sdw_codec_ch_maps)
+		return -ENOMEM;
+
 	/* generate codec name on different links in the same group */
 	j = adr_index;
 	for (adr_link_next = adr_link; adr_link_next && adr_link_next->num_adr &&
@@ -1521,6 +1514,9 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			(*codec_conf)->dlc = codecs[codec_dlc_index];
 			(*codec_conf)->name_prefix = adr_link_next->adr_d[j].name_prefix;
 
+			sdw_codec_ch_maps[codec_dlc_index].cpu = i;
+			sdw_codec_ch_maps[codec_dlc_index].codec = codec_dlc_index;
+
 			codec_dlc_index++;
 			(*codec_conf)++;
 		}
@@ -1539,7 +1535,6 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		*ignore_pch_dmic = true;
 
 	for_each_pcm_streams(stream) {
-		struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
 		char *name, *cpu_name;
 		int playback, capture;
 		static const char * const sdw_stream_name[] = {
@@ -1558,11 +1553,6 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			return -EINVAL;
 		}
 
-		sdw_codec_ch_maps = devm_kcalloc(dev, codec_num,
-						 sizeof(*sdw_codec_ch_maps), GFP_KERNEL);
-		if (!sdw_codec_ch_maps)
-			return -ENOMEM;
-
 		/* create stream name according to first link id */
 		if (append_dai_type) {
 			name = devm_kasprintf(dev, GFP_KERNEL,
@@ -1614,9 +1604,8 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		 * based on wait_for_completion(), tag them as 'nonatomic'.
 		 */
 		dai_links[*link_index].nonatomic = true;
-
-		set_dailink_map(sdw_codec_ch_maps, codec_num, cpu_dai_num);
 		dai_links[*link_index].ch_maps = sdw_codec_ch_maps;
+
 		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
-- 
2.40.1

