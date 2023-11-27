Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E046A7FA4D8
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:36:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9E9E83E;
	Mon, 27 Nov 2023 16:36:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9E9E83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099384;
	bh=c5zk7aGDfWbjNCLheBXZ2WEzSvhU+9BDv+s0EYGulng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p/AP1soMTtNLLsTPoJ6eda4QtpD9Wp3f1NIx3Y5V7VYpTAYy4m9JQ0LCNJmbJCK/M
	 BJqvIAiY7yH90nL066krrllHyoba41pBdRxDTGbSmzi7p14IkA7MNAnjbhbNIykGkw
	 uQFM/JSEnzz3IQLx/DnyltHbQV9h3Exw8omi0sOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1453F805CA; Mon, 27 Nov 2023 16:35:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B250F805C9;
	Mon, 27 Nov 2023 16:35:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 330B2F8055A; Mon, 27 Nov 2023 16:35:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6AFEF801D5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6AFEF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IAKCEr+3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099323; x=1732635323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c5zk7aGDfWbjNCLheBXZ2WEzSvhU+9BDv+s0EYGulng=;
  b=IAKCEr+3A+LJUPAtlmleRjTKDeI03rRD/nP9PV2vAEzbgeAjb3vtQ0c4
   cUp6pUqLKy6LzJhjHUAjN2yPMD5NF43afkuYUDQYscFBw8Yoz+5tFSSgF
   Kxva0JCYfxp7WRmAtq2o3sDjHpg9aTrtJx3RM6+07omZ4GRsvpFLGPjms
   wKg0Xff2GD6yv+kyKIKi6qY7ri3o547GGzJj11vXGpEIMGBQcnksVHMjJ
   eLu5xF22hlsfcWDQdTDSOKfidCi+qH1UbShju3Ed2mIxLO2HFoSAzPX+P
   gpEsOGIw1O+6OBG1lv5XMdfPmW8oh6C3Oq1UJTBZ5s7dWi+sPh1rD+Qo7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894380"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894380"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956210"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956210"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:24 -0800
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
Subject: [PATCH 02/27] ASoC: Intel: sof_maxim_common: add else between 2 if
 test
Date: Mon, 27 Nov 2023 17:26:29 +0200
Message-ID: <20231127152654.28204-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4RUR2GSPUO6BGEGHN3LEU4WJHOQ6ZUMC
X-Message-ID-Hash: 4RUR2GSPUO6BGEGHN3LEU4WJHOQ6ZUMC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RUR2GSPUO6BGEGHN3LEU4WJHOQ6ZUMC/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

if (!strcmp(codec_dai->component->name, MAX_98373_DEV0_NAME)) and
if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) can't be
true at the same time. Add an else to clarify it.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 3c00afc32805..f64124077ca7 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -67,8 +67,7 @@ static int max_98373_hw_params(struct snd_pcm_substream *substream,
 		if (!strcmp(codec_dai->component->name, MAX_98373_DEV0_NAME)) {
 			/* DEV0 tdm slot configuration */
 			snd_soc_dai_set_tdm_slot(codec_dai, 0x03, 3, 8, 32);
-		}
-		if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) {
+		} else if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) {
 			/* DEV1 tdm slot configuration */
 			snd_soc_dai_set_tdm_slot(codec_dai, 0x0C, 3, 8, 32);
 		}
-- 
2.43.0

