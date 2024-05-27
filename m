Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4314D8D0E55
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:42:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FF4184D;
	Mon, 27 May 2024 21:42:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FF4184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838934;
	bh=Axobvno4BTD+B4nQOHHdbjjD+fECyO9OmJP/teh7esw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OPPK5Cl5hBSQtPDCA38rwdLjzXZWJVDcLyhyjhZ1CYZvrhZ064X59Zvactl38PVck
	 8TCOOy8uMWd/RggK33zdUcARLal604+4IFAxUuT/Ve5uDQa6Vbo7PAC02q45CGI2EC
	 1FJl5xrU0nViKjfN0emKRFh63f0gn7wpKN8hGCS4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80A01F8069E; Mon, 27 May 2024 21:38:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D851DF806A8;
	Mon, 27 May 2024 21:38:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E33E7F80634; Mon, 27 May 2024 21:38:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A63D2F804E5
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A63D2F804E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SiXrRSiI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838580; x=1748374580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Axobvno4BTD+B4nQOHHdbjjD+fECyO9OmJP/teh7esw=;
  b=SiXrRSiIuC1SDEOdZCZL+J3s5qqnFllPHmueENUbZPGh3wLEFayZbfZk
   7qxoKpJDkdyddRkCIq2HDUxlj/UNO4eWYjxNeN2HiCKjU21zBCIQB6w7E
   pcNaJUUfnE1P7TcR7AYf6GPKfT6J3ar0Mr8EX2MdkF2joS2owyfH7dYPm
   neeO5j2vdetMcqo6Pw+t0wSFs8Upw1lzmwfvsdvA7bLWoE0c5rpM9rwKx
   OUPK1lNu/sKQMomDo8CEcacPIiPN0b7EVEflyxvp1larJL3Hfd9i56fBg
   5qUc4g0HBlfSrHDWRCpw13F2SAwtjUmi3dI7zf6LbhPQzu2zyQCbItBEt
   Q==;
X-CSE-ConnectionGUID: SKCs47R4R1WvgLhxZz+Nsg==
X-CSE-MsgGUID: CyV7+pqBQ++jN6cPvCD/cQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339344"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13339344"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:14 -0700
X-CSE-ConnectionGUID: Xi4Y4G8QQb29T7kYrDfaUw==
X-CSE-MsgGUID: mfMnBCuJS0SH6BcIovSiYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="58029763"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/18] ASoC: Intel: sof_sdw: remove get_codec_dai_by_name
Date: Mon, 27 May 2024 14:35:41 -0500
Message-ID: <20240527193552.165567-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VCCSWDSCQV2BTSDIS5UGWPKVWA4GXPCJ
X-Message-ID-Hash: VCCSWDSCQV2BTSDIS5UGWPKVWA4GXPCJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCCSWDSCQV2BTSDIS5UGWPKVWA4GXPCJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

get_codec_dai_by_name() is not used anymore. Remove it.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 18 ------------------
 sound/soc/intel/boards/sof_sdw_common.h |  4 ----
 2 files changed, 22 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e41b0d95e0ff..9dc50a6d5301 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -559,24 +559,6 @@ static const struct snd_kcontrol_new rt700_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
-struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
-					  const char * const dai_name[],
-					  int num_dais)
-{
-	struct snd_soc_dai *dai;
-	int index;
-	int i;
-
-	for (index = 0; index < num_dais; index++)
-		for_each_rtd_codec_dais(rtd, i, dai)
-			if (strstr(dai->name, dai_name[index])) {
-				dev_dbg(rtd->card->dev, "get dai %s\n", dai->name);
-				return dai;
-			}
-
-	return NULL;
-}
-
 /* these wrappers are only needed to avoid typecast compilation errors */
 int sdw_startup(struct snd_pcm_substream *substream)
 {
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 3dfba6f6b95d..4e92ff65b537 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -134,10 +134,6 @@ struct mc_private {
 
 extern unsigned long sof_sdw_quirk;
 
-struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
-					  const char * const dai_name[],
-					  int num_dais);
-
 int sdw_startup(struct snd_pcm_substream *substream);
 int sdw_prepare(struct snd_pcm_substream *substream);
 int sdw_trigger(struct snd_pcm_substream *substream, int cmd);
-- 
2.43.0

