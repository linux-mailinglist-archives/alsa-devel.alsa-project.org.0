Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2E188C8C3
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:14:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DF402BF3;
	Tue, 26 Mar 2024 17:14:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DF402BF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469683;
	bh=YMFANXByotTvz7ZAP+9o35CxIDW0uJSAVkZ2qrDO9cg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I7wuGkROCFC8j6oVeJXE2hEB7lRZzEhN5rsKA5Yj+c68/lGy4fR6mFxonCsOn05WF
	 cAXb/eq3anX35kFrDdwz3G9D17BYi3rjK84cqsqCnX9rC/ydP/YrHtEOvMrtE642FM
	 SLNX6n2DKytdmXjUCdW6SDV1m1uoJiWRGt9A33dc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DABDF805B0; Tue, 26 Mar 2024 17:07:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7621F897FB;
	Tue, 26 Mar 2024 17:07:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5165AF80614; Tue, 26 Mar 2024 17:06:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2554FF80564
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2554FF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nV9rWKjD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469160; x=1743005160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YMFANXByotTvz7ZAP+9o35CxIDW0uJSAVkZ2qrDO9cg=;
  b=nV9rWKjD1XOnYm3opDecA2mjKTz0M27De1ps7PB+qOYhqYfB81R9ygy5
   4P9jJrvzUo5vxd+zvkm68v7zEGVD3tzD6dk6nHL13Tg/9kkZDgGiXNMPT
   8bmFmWQdyWt0iIwg058bgtJdUUPuilK3iTjWUizu/zsyxXEwtRR0fyD0a
   mNjAPdQC1flt1fzVwVm67y+7JDMJJ22aL7O1xZbsFeLJgho3kSFUBHWYW
   T7yrR3dfWkj/ibknvbwciPnG5OLQBdIBHqPB334K4czaPQ2T++sAvVVcV
   RD6t0SVKwDXPenoWwIeNMrkAbXQdVsSIZOTiboNBg2xNynExbtCo0oGsk
   g==;
X-CSE-ConnectionGUID: flxlTrLiTf69YPixQifwSw==
X-CSE-MsgGUID: 2J6svyDJQYq20qmVGGMEAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260542"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260542"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482452"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:03 -0700
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
	Chao Song <chao.song@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 29/34] ASoC: Intel: sof_sdw: change rt715-sdca dai name
Date: Tue, 26 Mar 2024 11:04:24 -0500
Message-Id: <20240326160429.13560-30-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 544R6XZDQATVJ2MUOP3CNFTU5KM4KSBP
X-Message-ID-Hash: 544R6XZDQATVJ2MUOP3CNFTU5KM4KSBP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/544R6XZDQATVJ2MUOP3CNFTU5KM4KSBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

As rt715-sdca dai name has been changed in codec driver, we should
change it in machine driver, too. Changing the dai name in
codec_info_list[] also help sof_sdw_rtd_init() to run .rtd_init()
from the same codec.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c         | 4 ++--
 sound/soc/intel/boards/sof_sdw_rt_dmic.c | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 3874da8d7fe4..1816ec5dd580 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -838,7 +838,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dais = {
 			{
 				.direction = {false, true},
-				.dai_name = "rt715-aif2",
+				.dai_name = "rt715-sdca-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.rtd_init = rt_dmic_rtd_init,
@@ -853,7 +853,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dais = {
 			{
 				.direction = {false, true},
-				.dai_name = "rt715-aif2",
+				.dai_name = "rt715-sdca-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.rtd_init = rt_dmic_rtd_init,
diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
index 5aec8422656c..2f7ed9b31e79 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
@@ -14,6 +14,7 @@
 
 static const char * const dmics[] = {
 	"rt715",
+	"rt715-sdca",
 	"rt712-sdca-dmic",
 	"rt722-sdca",
 };
-- 
2.40.1

