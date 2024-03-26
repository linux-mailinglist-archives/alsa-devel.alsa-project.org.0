Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D30D88C8A8
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:10:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF2762C06;
	Tue, 26 Mar 2024 17:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF2762C06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469455;
	bh=dKIIrBR+5IlIW8PfUvHWuroIi9TvHZfaA9fL/TlXcjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RhonhzeBpmq37/oPJIXPMhhloLxSswzii+/3uEjILBJCP1uf25TuGJIQu8ts2qIuq
	 ONiTMouIm4S4sQ3pJ80jm/90RQiWxnfBFYPPxJ/Ay2eqVrPby1zLhzjJKXkK7O2y6X
	 C+dg8x7r193f+eIECIIoD9qFMweNH82H9l+wsUcA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C32B3F80C88; Tue, 26 Mar 2024 17:06:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E87CF80C6D;
	Tue, 26 Mar 2024 17:06:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C801F8067F; Tue, 26 Mar 2024 17:06:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88019F8057D
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88019F8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=m18+BWI5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469143; x=1743005143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dKIIrBR+5IlIW8PfUvHWuroIi9TvHZfaA9fL/TlXcjE=;
  b=m18+BWI5OzCXgQFVABORJu2EgwmFWJ7gbLr+dkCLeaNIzxrh/V5/nEsM
   pQnmMmLeh19dwmGVOQ5HVUdR83J1bHnKGtfKXDUlCugsAXb1LB5gkZTlx
   yOjmcJ92c0xmyDaNHgTK+++semIoaoO0rr3tOfh7mU1j+VudraQhlU+R7
   MNuCHu0vfm3krkL10I2wKlCaWBErD4eaT1SSnekqIK/KUhsrwOd0gRmO2
   hg7xWznzd2gCMZvPimEOLCJnfyy9AUuXbPjRMmBFT6sCppDmFoIp3DLDm
   XKOqM0fpLRIbyooeHSg3VF9m0yumm6jkYhc7mEPBRyblqssu5IvgPBteO
   A==;
X-CSE-ConnectionGUID: pSvdDOLER7qvVOSWxwmeyw==
X-CSE-MsgGUID: s0FJOV/dQeqzDgUdU9U5UA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260424"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260424"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482244"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:51 -0700
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
Subject: [PATCH 14/34] ASoC: Intel: sof_sdw: Factor out codec name generation
Date: Tue, 26 Mar 2024 11:04:09 -0500
Message-Id: <20240326160429.13560-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GPCIIQLV63C3IORCKIWVWUIV4HYIBW43
X-Message-ID-Hash: GPCIIQLV63C3IORCKIWVWUIV4HYIBW43
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPCIIQLV63C3IORCKIWVWUIV4HYIBW43/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

In preparation for future refactoring pull out a helper specifically for
generating the codec name.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 47 ++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6e2e934e1246..1253a2dc33d2 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1283,12 +1283,37 @@ static bool is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
 	return true;
 }
 
+static const char *get_codec_name(struct device *dev,
+				  const struct sof_sdw_codec_info *codec_info,
+				  const struct snd_soc_acpi_link_adr *adr_link,
+				  int adr_index)
+{
+	u64 adr = adr_link->adr_d[adr_index].adr;
+	unsigned int sdw_version = SDW_VERSION(adr);
+	unsigned int link_id = SDW_DISCO_LINK_ID(adr);
+	unsigned int unique_id = SDW_UNIQUE_ID(adr);
+	unsigned int mfg_id = SDW_MFG_ID(adr);
+	unsigned int part_id = SDW_PART_ID(adr);
+	unsigned int class_id = SDW_CLASS_ID(adr);
+
+	if (codec_info->codec_name)
+		return devm_kstrdup(dev, codec_info->codec_name, GFP_KERNEL);
+	else if (is_unique_device(adr_link, sdw_version, mfg_id, part_id,
+				  class_id, adr_index))
+		return devm_kasprintf(dev, GFP_KERNEL, "sdw:0:%01x:%04x:%04x:%02x",
+				      link_id, mfg_id, part_id, class_id);
+	else
+		return devm_kasprintf(dev, GFP_KERNEL, "sdw:0:%01x:%04x:%04x:%02x:%01x",
+				      link_id, mfg_id, part_id, class_id, unique_id);
+
+	return NULL;
+}
+
 static int fill_sdw_codec_dlc(struct device *dev,
 			      const struct snd_soc_acpi_link_adr *adr_link,
 			      struct snd_soc_dai_link_component *codec,
 			      int adr_index, int dai_index)
 {
-	unsigned int sdw_version, unique_id, mfg_id, link_id, part_id, class_id;
 	u64 adr = adr_link->adr_d[adr_index].adr;
 	struct sof_sdw_codec_info *codec_info;
 
@@ -1296,25 +1321,7 @@ static int fill_sdw_codec_dlc(struct device *dev,
 	if (!codec_info)
 		return -EINVAL;
 
-	sdw_version = SDW_VERSION(adr);
-	link_id = SDW_DISCO_LINK_ID(adr);
-	unique_id = SDW_UNIQUE_ID(adr);
-	mfg_id = SDW_MFG_ID(adr);
-	part_id = SDW_PART_ID(adr);
-	class_id = SDW_CLASS_ID(adr);
-
-	if (codec_info->codec_name)
-		codec->name = devm_kstrdup(dev, codec_info->codec_name, GFP_KERNEL);
-	else if (is_unique_device(adr_link, sdw_version, mfg_id, part_id,
-				  class_id, adr_index))
-		codec->name = devm_kasprintf(dev, GFP_KERNEL,
-					     "sdw:0:%01x:%04x:%04x:%02x", link_id,
-					     mfg_id, part_id, class_id);
-	else
-		codec->name = devm_kasprintf(dev, GFP_KERNEL,
-					     "sdw:0:%01x:%04x:%04x:%02x:%01x", link_id,
-					     mfg_id, part_id, class_id, unique_id);
-
+	codec->name = get_codec_name(dev, codec_info, adr_link, adr_index);
 	if (!codec->name)
 		return -ENOMEM;
 
-- 
2.40.1

