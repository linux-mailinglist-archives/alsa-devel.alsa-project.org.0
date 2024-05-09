Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE3D8C1321
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:39:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17758F94;
	Thu,  9 May 2024 18:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17758F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272766;
	bh=vdUXvj31VRzGNcb2Reu0iGTWq+ST+xK5JQCgJuLhRpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DDgvDiCdk6rP2nLyzchfBBm+xSztfrdSL2YuuJAhtnkd4T6+CDEdT/1YTz+deQ+0O
	 7lCclWRFz8uPj0jauoURpPeWzgY9tNlxv66mon8XPbTpbZ4J8P9TaQ6kFga+i8RJj9
	 sYAQXDANH0oqKJEsIycH3/wCwxuj5X2wbze+gtj4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9B17F80C76; Thu,  9 May 2024 18:35:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 493DAF80796;
	Thu,  9 May 2024 18:35:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56BCAF80792; Thu,  9 May 2024 18:35:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94290F8057D
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94290F8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DfffBErV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272485; x=1746808485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vdUXvj31VRzGNcb2Reu0iGTWq+ST+xK5JQCgJuLhRpk=;
  b=DfffBErVGQEmU+OI4tmOtyE0TICf8PH979n7gjgdXFriPtkXnz+vxLus
   bR4dGQurheaoF5yQWkuPDJU92r/fPl60CgYqyYsgZpEFhe1dxGlyCDwCK
   PmE13g9H+Dwa/gokXApq3l932YGUyDedzpW3YPqqCCOK7SwVjiybCmpHq
   BJT1tgjrXwy9ZjNQKukfAW6pc0XOrTPZojhL7YCAsBO+dEym/glOWlHmK
   K6iaHwYRmbzSBL2NmGkfdx36I9gzhU8askuDL9Xc813Cd3A1F4OvD5tr6
   Oe83A6+QOvdtDQPpGp0hkp0thscUfosJPjgwyOZnb+vvJFtlg5ZCldhuX
   w==;
X-CSE-ConnectionGUID: hqGsWZVtRsSHqsZzrtCPkw==
X-CSE-MsgGUID: MQG96eYyQLydhDT6c56F6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017633"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017633"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:35 -0700
X-CSE-ConnectionGUID: K2pNm49VSN6Cj5ymkX0y5g==
X-CSE-MsgGUID: AHqY1zzgQ6Sxjo0DVZmxyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33761049"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 18/18] ASoC: Intel: sof_sdw_rt_amp: use dai parameter
Date: Thu,  9 May 2024 11:34:18 -0500
Message-Id: <20240509163418.67746-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JK462VSTJ6PWUGZDLX67WJ46AMDOAPVH
X-Message-ID-Hash: JK462VSTJ6PWUGZDLX67WJ46AMDOAPVH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JK462VSTJ6PWUGZDLX67WJ46AMDOAPVH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

get_codec_name_and_route() get dai name from the first codec dai in a dai
link. However, the dai may not always be the first codec dai. Use the
dai parameter to make sure get_codec_name_and_route() refers to the
correct dai.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt_amp.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index df03441ab364..797ea9ffa77a 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -158,15 +158,11 @@ static const struct snd_soc_dapm_route rt1318_map[] = {
 	{ "Speaker", NULL, "rt1318-2 SPOR" },
 };
 
-static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_pcm_runtime *rtd,
+static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_dai *dai,
 								 char *codec_name)
 {
-	const char *dai_name;
-
-	dai_name = rtd->dai_link->codecs->dai_name;
-
 	/* get the codec name */
-	snprintf(codec_name, CODEC_NAME_SIZE, "%s", dai_name);
+	snprintf(codec_name, CODEC_NAME_SIZE, "%s", dai->name);
 
 	/* choose the right codec's map  */
 	if (strcmp(codec_name, "rt1308") == 0)
@@ -186,7 +182,7 @@ int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai
 	int ret;
 	int i;
 
-	rt_amp_map = get_codec_name_and_route(rtd, codec_name);
+	rt_amp_map = get_codec_name_and_route(dai, codec_name);
 
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 					  "%s spk:%s",
-- 
2.40.1

