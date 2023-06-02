Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C024A720A3A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:25:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41A9C1D9;
	Fri,  2 Jun 2023 22:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41A9C1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737555;
	bh=2YZ04moTsJmeoTiAF/tct/la9JlLVMwD3YOUVOAkf9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gP+SzCUjT/R3JZeqwkLwQGqnWPhgcMQ7K1v4h8zr3iAKhiH37hhcgmd+0Zi4niAAj
	 uBiOyqCWN5NJkzu20fo/qlTtq5VKLQDvWNkPP9PwHS/k7XkDZ+YnsOB6B1oJEdytz2
	 S138Fj+ZzeeGc7qZmlHteXvLqnkIWApCNQUKQq8k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33D10F805E8; Fri,  2 Jun 2023 22:23:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18460F805D8;
	Fri,  2 Jun 2023 22:23:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 961B1F8047D; Fri,  2 Jun 2023 22:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5325F804DA
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5325F804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bU6SJyJc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737390; x=1717273390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2YZ04moTsJmeoTiAF/tct/la9JlLVMwD3YOUVOAkf9A=;
  b=bU6SJyJc1zUySfUQKw+ZklKH6jG9buftHRbRS4X2Z3wW8fhJjwCJO+z5
   G9acNBSyLmCVhORl6DRMLGAZPcFvx5AF4dsb31EaU+GWlddYFNL0zP7QO
   AMF6T7ZenSGBszbdDcnJU33kx9Y7tcWdn585MnEO+IB/dzfQOUTwKuOzD
   8kinvUGa6ls2NqcYRfQlR7SzQMq+K1PY/4Ug3N/Cgpr9qncm17WJdXuhI
   t15/FzEe9SD42M4jjGUx1t8KnFAC31FUa73BTDr6WBk9ofy/XGjWtPp5Q
   cJ14rF4/WT4vNM+q7neGdgCEwUN91Pvv2+Gf4Rh9P/vZz6AhcJBX7nXSi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811230"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811230"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020014"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020014"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/28] ASoC: Intel: sof_sdw: rename SOF_RT711_JDSRC to
 SOF_JACK_JDSRC
Date: Fri,  2 Jun 2023 15:22:05 -0500
Message-Id: <20230602202225.249209-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PXIGOZ7XLOCELKXN7E76WXDDS2TASS5G
X-Message-ID-Hash: PXIGOZ7XLOCELKXN7E76WXDDS2TASS5G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXIGOZ7XLOCELKXN7E76WXDDS2TASS5G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Jack Detection source can be applied to all jacks, not only rt711.
No function changes.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c            | 4 ++--
 sound/soc/intel/boards/sof_sdw_common.h     | 2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c      | 4 ++--
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8405c3231448..d925e3005394 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -24,9 +24,9 @@ MODULE_PARM_DESC(quirk, "Board-specific quirk override");
 
 static void log_quirks(struct device *dev)
 {
-	if (SOF_RT711_JDSRC(sof_sdw_quirk))
+	if (SOF_JACK_JDSRC(sof_sdw_quirk))
 		dev_dbg(dev, "quirk realtek,jack-detect-source %ld\n",
-			SOF_RT711_JDSRC(sof_sdw_quirk));
+			SOF_JACK_JDSRC(sof_sdw_quirk));
 	if (sof_sdw_quirk & SOF_SDW_FOUR_SPK)
 		dev_dbg(dev, "quirk SOF_SDW_FOUR_SPK enabled\n");
 	if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 65b3f6eee924..9640fd6dbd12 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -41,7 +41,7 @@ enum {
 	SOF_I2S_SSP5 = BIT(5),
 };
 
-#define SOF_RT711_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
+#define SOF_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
 #define SOF_SDW_FOUR_SPK		BIT(4)
 #define SOF_SDW_TGL_HDMI		BIT(5)
 #define SOF_SDW_PCH_DMIC		BIT(6)
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 8291967f23f3..2b05e2a707de 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -27,9 +27,9 @@ static int rt711_add_codec_device_props(struct device *sdw_dev)
 	struct fwnode_handle *fwnode;
 	int ret;
 
-	if (!SOF_RT711_JDSRC(sof_sdw_quirk))
+	if (!SOF_JACK_JDSRC(sof_sdw_quirk))
 		return 0;
-	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src", SOF_RT711_JDSRC(sof_sdw_quirk));
+	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src", SOF_JACK_JDSRC(sof_sdw_quirk));
 
 	fwnode = fwnode_create_software_node(props, NULL);
 	if (IS_ERR(fwnode))
diff --git a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
index cf8b9793fe0e..a9ae0aa5ce0a 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
@@ -27,10 +27,10 @@ static int rt711_sdca_add_codec_device_props(struct device *sdw_dev)
 	struct fwnode_handle *fwnode;
 	int ret;
 
-	if (!SOF_RT711_JDSRC(sof_sdw_quirk))
+	if (!SOF_JACK_JDSRC(sof_sdw_quirk))
 		return 0;
 
-	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src", SOF_RT711_JDSRC(sof_sdw_quirk));
+	props[0] = PROPERTY_ENTRY_U32("realtek,jd-src", SOF_JACK_JDSRC(sof_sdw_quirk));
 
 	fwnode = fwnode_create_software_node(props, NULL);
 	if (IS_ERR(fwnode))
@@ -143,7 +143,7 @@ int sof_sdw_rt711_sdca_exit(struct snd_soc_card *card, struct snd_soc_dai_link *
 	if (!ctx->headset_codec_dev)
 		return 0;
 
-	if (!SOF_RT711_JDSRC(sof_sdw_quirk))
+	if (!SOF_JACK_JDSRC(sof_sdw_quirk))
 		return 0;
 
 	device_remove_software_node(ctx->headset_codec_dev);
-- 
2.37.2

