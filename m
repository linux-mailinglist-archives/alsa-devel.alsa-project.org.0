Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0B088C8A4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:10:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73FA22BFD;
	Tue, 26 Mar 2024 17:10:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73FA22BFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469429;
	bh=mDzSkoz5dkqO6+iiJ4uoAI2nRZkxqWOmEeXtWfmUyek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GvD7IbGrC8kaK4LLmMCUCpEAw62Avm8Qd+UVIeqJv23qq+ONDpQFZ6X/vSe8pxohm
	 tJk0nXzbXgTCN1bc4uXOrSB59pIvZkXbVbIkxY8vizuhCoWvwcQmWTF+h0SdMx5NIO
	 a9pybJ560d0vJsFAUjBgXzhbZIi//FHosORTXL8U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0946F80C52; Tue, 26 Mar 2024 17:06:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB6C8F80C16;
	Tue, 26 Mar 2024 17:06:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E7AEF80675; Tue, 26 Mar 2024 17:06:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36D21F805CA
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36D21F805CA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nQRE+2rz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469145; x=1743005145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mDzSkoz5dkqO6+iiJ4uoAI2nRZkxqWOmEeXtWfmUyek=;
  b=nQRE+2rzv8Xf7Ud/5IloZFOM01KbINTRCWKqFd2HKGEEMUnxbY+NDryJ
   oWQqAPjzW/0EzTAurv+V/CSkwSK1OudF/IJ3UneVOr5mmHbjkZElz77ID
   1L05Ek3u1nc+uoh0k+3Jsdf9+uLxOmldnRFmENidFDSrweCEuI6S5ZTVZ
   bsvFAeXjZPiuS5OC65R6FVklApDioyOJ1mbI2kLyT5rvzOfQCvL+TRQeK
   sFnWTd5K2hcQJR3WPMsq8Qv5uapECiULPmEBiNheZlbut+50kwYLsMZXQ
   w2s8RZhksG+Gt52PQr1CN3W/e948sMnS06IffwVp31NPWjHgu/L73Ivqd
   Q==;
X-CSE-ConnectionGUID: tIMSiSn+SgGYIJ2i9CkvUQ==
X-CSE-MsgGUID: 1px6EKKNRWONytP66nwuIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260472"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260472"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482333"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:56 -0700
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
Subject: [PATCH 20/34] ASoC: Intel: sof_sdw: Move ignore_pch_dmic to new
 parsing
Date: Tue, 26 Mar 2024 11:04:15 -0500
Message-Id: <20240326160429.13560-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RFS2WNTPYRHZS7TWD5I5SCBDZXV2SB7Y
X-Message-ID-Hash: RFS2WNTPYRHZS7TWD5I5SCBDZXV2SB7Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RFS2WNTPYRHZS7TWD5I5SCBDZXV2SB7Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Trivial move of the handling of ignore_pch_dmic over to the new parsing
code.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0566ab843c2e..cda759ee6345 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1453,6 +1453,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 			       struct sof_sdw_endpoint *sof_ends)
 {
 	struct device *dev = card->dev;
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	struct snd_soc_codec_conf *codec_conf = card->codec_conf;
@@ -1483,6 +1484,8 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 			if (!codec_info)
 				return -EINVAL;
 
+			ctx->ignore_pch_dmic |= codec_info->ignore_pch_dmic;
+
 			codec_name = get_codec_name(dev, codec_info, adr_link, i);
 			if (!codec_name)
 				return -ENOMEM;
@@ -1630,8 +1633,6 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	if (!codec_info)
 		return -EINVAL;
 
-	ctx->ignore_pch_dmic |= codec_info->ignore_pch_dmic;
-
 	for_each_pcm_streams(stream) {
 		char *name, *cpu_name;
 		int playback, capture;
-- 
2.40.1

