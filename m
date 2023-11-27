Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D874B7FA4DD
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:37:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86DA0DEB;
	Mon, 27 Nov 2023 16:37:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86DA0DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099469;
	bh=CsgVmzy10sUA4+sS8qVpp0cu3BZcQFs0eIDUOpL+pfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BKex+g7ZhIp+a13Ug/Oo8eb8DNTyxOa/sRU3jspgj1nfNnSOGwLzbzn11i7qKfQ9u
	 8/WWc+0ZR1HB/+6XvBweZsjTKbj+4deuHe/rXo/CYxd3/Vpg48/FmsINAqwOii753K
	 B5a0056CCHPnXdVuB9YNXMZwALJlatHf1gOqsReg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBE7BF806D1; Mon, 27 Nov 2023 16:35:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DE4AF806A1;
	Mon, 27 Nov 2023 16:35:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61997F805B5; Mon, 27 Nov 2023 16:35:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B1E7F80568
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B1E7F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ILXW9zqL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099329; x=1732635329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CsgVmzy10sUA4+sS8qVpp0cu3BZcQFs0eIDUOpL+pfs=;
  b=ILXW9zqLn0gtMJI9+6fOIaWj6UmB4fW3S+LOKkquUDgumAFVE5qubJNm
   5vz97acraQlENB/UxidKH0Lu5oiad6u+5EfxAQnChnC9o5jMIITSJqgQv
   9jGGAr9P+OBtpw/lWJWtdWbYMJTzA/CCQ6JX8XDFZJMy8cbwgHmGukiqB
   i043TcxLdLjo30n57dZ9w+PyH8BZsiMb5hfewQCyLGOQLDFIWlXXX24Es
   x+f6vEPDzyU4LRPBFipO5vHXnUQIHMrGPaG3vv2ZP+uyP33Kn+kn+YIal
   z9n3ti52Rqe3VUkuxWT+A97IdnjTbRKcnOw2d/umJgCT3KSSrRUyM5RO5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894479"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894479"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956586"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956586"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:47 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 10/27] ASoC: Intel: board_helpers: support amp link
 initialization
Date: Mon, 27 Nov 2023 17:26:37 +0200
Message-ID: <20231127152654.28204-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6724U3LDE6MD36OHENEZ6IKHU3MDMHJ4
X-Message-ID-Hash: 6724U3LDE6MD36OHENEZ6IKHU3MDMHJ4
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6724U3LDE6MD36OHENEZ6IKHU3MDMHJ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a helper function for machine drivers to initialize speaker
amplifier DAI link. The function will initialize common fields and let
caller to initialize codec-specific fields like codec, init, exit, and
ops fields.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 42 ++++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |  5 +++
 2 files changed, 47 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 5ee53c781b37..515634db0a4d 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -248,6 +248,48 @@ int sof_intel_board_set_intel_hdmi_link(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sof_intel_board_set_intel_hdmi_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
+int sof_intel_board_set_ssp_amp_link(struct device *dev,
+				     struct snd_soc_dai_link *link, int be_id,
+				     enum sof_ssp_codec amp_type, int ssp_amp)
+{
+	struct snd_soc_dai_link_component *cpus;
+
+	dev_dbg(dev, "link %d: ssp amp %s, ssp %d\n", be_id,
+		sof_ssp_get_codec_name(amp_type), ssp_amp);
+
+	/* link name */
+	link->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_amp);
+	if (!link->name)
+		return -ENOMEM;
+
+	/* cpus */
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component),
+			    GFP_KERNEL);
+	if (!cpus)
+		return -ENOMEM;
+
+	cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_amp);
+	if (!cpus->dai_name)
+		return -ENOMEM;
+
+	link->cpus = cpus;
+	link->num_cpus = 1;
+
+	/* codecs - caller to handle */
+
+	/* platforms */
+	link->platforms = platform_component;
+	link->num_platforms = ARRAY_SIZE(platform_component);
+
+	link->id = be_id;
+	link->no_pcm = 1;
+	link->dpcm_capture = 1; /* feedback stream or firmware-generated echo reference */
+	link->dpcm_playback = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sof_intel_board_set_ssp_amp_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 7392d639672d..17922f3e17a5 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -31,6 +31,7 @@ struct sof_rt5682_private {
  * @dmic_be_num: number of Intel PCH DMIC BE link
  * @hdmi_num: number of Intel HDMI BE link
  * @ssp_codec: ssp port number of headphone BE link
+ * @ssp_amp: ssp port number of speaker BE link
  * @rt5682: private data for rt5682 machine driver
  */
 struct sof_card_private {
@@ -44,6 +45,7 @@ struct sof_card_private {
 	int hdmi_num;
 
 	int ssp_codec;
+	int ssp_amp;
 
 	union {
 		struct sof_rt5682_private rt5682;
@@ -66,5 +68,8 @@ int sof_intel_board_set_dmic_link(struct device *dev,
 int sof_intel_board_set_intel_hdmi_link(struct device *dev,
 					struct snd_soc_dai_link *link, int be_id,
 					int hdmi_id, bool idisp_codec);
+int sof_intel_board_set_ssp_amp_link(struct device *dev,
+				     struct snd_soc_dai_link *link, int be_id,
+				     enum sof_ssp_codec amp_type, int ssp_amp);
 
 #endif /* __SOF_INTEL_BOARD_HELPERS_H */
-- 
2.43.0

