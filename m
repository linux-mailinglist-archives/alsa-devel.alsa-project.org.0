Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D757FA4F4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:41:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD633EA6;
	Mon, 27 Nov 2023 16:40:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD633EA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099668;
	bh=a83TGR9cxwTYFUmliBUOyFb+HW5wdDEx/eSq53BFAXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pX4KNecmqW8BbjYjTOvcnkwcqp9Ohj0YxIRVdNXxREaSdQ/R0dcOCCs50NcuKGSIV
	 YXHEh4TbmSBzMBqOho9GUuB4/sIXDeAd5KZEvEJWRe2k0jMZkQVPMvMJSQSUlZ0QQ0
	 IHdntqtsmpLTpiOP1CUUiDpRVtZ3iiKUiaa53Mqg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 122BFF89673; Mon, 27 Nov 2023 16:36:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4208F805B4;
	Mon, 27 Nov 2023 16:36:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91B0EF805B0; Mon, 27 Nov 2023 16:36:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AC75F806AF
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AC75F806AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SUFEdlOB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099349; x=1732635349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a83TGR9cxwTYFUmliBUOyFb+HW5wdDEx/eSq53BFAXM=;
  b=SUFEdlOBwUQx0n5j2sHrCy6U9pk5GYEeYfXoTaIVdf3yMkDUSenYrpnV
   1IyxX3iiPxLnIhyn2fEwg07erY8mfSvFj/2aozJM5HsEscTQbRA/AmQqY
   R0IvGh+uoElepVM91ZwXTnVQytqGiFbAeGB+QpYTl+P0DzWU0mHG0nKhK
   KEaeb6hIp9j+StudCXC6NFa6Pg1+9e2ySyKm6nKp3nVWyamUvYobRj4Nz
   Hb5NtInHSuCLVF9Lcc/yc5jmSA5zVywMUoJL/YbeQ8qVcvDVcGnCkNRLP
   2Etuq/329aqRIHlgc4cner42ppvKCWshRdYc8Frwc1BzRvsJhrjVO0aP9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894643"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894643"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771957083"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771957083"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:20 -0800
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
Subject: [PATCH 22/27] ASoC: Intel: board_helpers: support HDMI-In link
 initialization
Date: Mon, 27 Nov 2023 17:26:49 +0200
Message-ID: <20231127152654.28204-23-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NFNBTZZQJZN5VNCHXZZZWTNDLEO3TV6J
X-Message-ID-Hash: NFNBTZZQJZN5VNCHXZZZWTNDLEO3TV6J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NFNBTZZQJZN5VNCHXZZZWTNDLEO3TV6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a helper function for machine drivers to initialize HDMI-In DAI
link.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 42 ++++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |  5 +++
 2 files changed, 47 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 335c660561d5..a1dba1f45669 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -333,6 +333,48 @@ int sof_intel_board_set_bt_link(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sof_intel_board_set_bt_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
+int sof_intel_board_set_hdmi_in_link(struct device *dev,
+				     struct snd_soc_dai_link *link, int be_id,
+				     int ssp_hdmi)
+{
+	struct snd_soc_dai_link_component *cpus;
+
+	dev_dbg(dev, "link %d: hdmi-in, ssp %d\n", be_id, ssp_hdmi);
+
+	/* link name */
+	link->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-HDMI", ssp_hdmi);
+	if (!link->name)
+		return -ENOMEM;
+
+	/* cpus */
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component),
+			    GFP_KERNEL);
+	if (!cpus)
+		return -ENOMEM;
+
+	cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_hdmi);
+	if (!cpus->dai_name)
+		return -ENOMEM;
+
+	link->cpus = cpus;
+	link->num_cpus = 1;
+
+	/* codecs */
+	link->codecs = &snd_soc_dummy_dlc;
+	link->num_codecs = 1;
+
+	/* platforms */
+	link->platforms = platform_component;
+	link->num_platforms = ARRAY_SIZE(platform_component);
+
+	link->id = be_id;
+	link->no_pcm = 1;
+	link->dpcm_capture = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sof_intel_board_set_hdmi_in_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 49a7bfa12a6d..a4bae62a4ed5 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -33,6 +33,7 @@ struct sof_rt5682_private {
  * @ssp_codec: ssp port number of headphone BE link
  * @ssp_amp: ssp port number of speaker BE link
  * @ssp_bt: ssp port number of BT offload BE link
+ * @ssp_mask_hdmi_in: ssp port mask of HDMI-IN BE link
  * @bt_offload_present: true to create BT offload BE link
  * @rt5682: private data for rt5682 machine driver
  */
@@ -49,6 +50,7 @@ struct sof_card_private {
 	int ssp_codec;
 	int ssp_amp;
 	int ssp_bt;
+	unsigned long ssp_mask_hdmi_in;
 
 	bool bt_offload_present;
 
@@ -79,5 +81,8 @@ int sof_intel_board_set_ssp_amp_link(struct device *dev,
 int sof_intel_board_set_bt_link(struct device *dev,
 				struct snd_soc_dai_link *link, int be_id,
 				int ssp_bt);
+int sof_intel_board_set_hdmi_in_link(struct device *dev,
+				     struct snd_soc_dai_link *link, int be_id,
+				     int ssp_hdmi);
 
 #endif /* __SOF_INTEL_BOARD_HELPERS_H */
-- 
2.43.0

