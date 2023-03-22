Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C06166C4469
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 08:52:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A973F846;
	Wed, 22 Mar 2023 08:51:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A973F846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679471560;
	bh=7a2GhfW7324e6g9+ok85VKCv04RxfgGwknInfHrga8Y=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bSKr9c2bsJgS3FNLY2PE0m6vA5S0PryMppAggLgzZ+c0W8QDHEDrVIQQinKJpwrP4
	 YbWv+ziZ7DxjS/xaSYjSQssTIG5C5t8jdb66HfmBPRDoMoEc4Rg95OkmFeDA8oJJrA
	 RWXnDSFMWcgaDsLOZ1F23J//QJv9F2Ihhvq18eSA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDCAFF8027B;
	Wed, 22 Mar 2023 08:51:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9943AF8024E; Wed, 22 Mar 2023 08:49:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D896F80105
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 08:49:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D896F80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K/hgZYzp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679471391; x=1711007391;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7a2GhfW7324e6g9+ok85VKCv04RxfgGwknInfHrga8Y=;
  b=K/hgZYzp1CbY25ZTkn5JkUtO/TSZ4NGgz6uYD6fgjqwOVoKu5CdDNADk
   9oAlo7z03h04wA+GNmZiUJxj9v1kXknK8ZQUBGflnPL4VqQg2gWE2HUzk
   d2nNzvrGG1BGrJk3odspSa/vz6TtETf9GHM/b+oe0bmjCQB1nnVKA2Ogl
   iTCcIxBeVWEtJ7h5j157vWeojH1yNTJfqi8CIdQ/3P8naJbBoBe/WlJhd
   9AbsNJzKcuecML+D/pb0ROhN0fceJhlvPe3hq0hRhgUOX+GRv1XVR9ban
   rkb5CxKV+lARxPytxQxvGEMw2NCi9n1cKNxPtZ1FHGpt4/NJXLDrq6jru
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="322990572"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="322990572"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 00:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792439608"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="792439608"
Received: from gjantea-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.222.2])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 00:49:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: Intel: sof_rt5682: Remove conditional dpcm_capture
 setting
Date: Wed, 22 Mar 2023 09:50:12 +0200
Message-Id: <20230322075012.23463-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WTRAE2LHEIZVIRBYCLCTCGMDU7YV2KA6
X-Message-ID-Hash: WTRAE2LHEIZVIRBYCLCTCGMDU7YV2KA6
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yong.zhi@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTRAE2LHEIZVIRBYCLCTCGMDU7YV2KA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Yong Zhi <yong.zhi@intel.com>

The dpcm_capture is set unconditionally, we can drop the conditional
setting of it.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 2eec32846078..76ee2e35e1ef 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -793,7 +793,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			}
 			links[id].init = max_98390_spk_codec_init;
 			links[id].ops = &max_98390_ops;
-			links[id].dpcm_capture = 1;
 
 		} else {
 			max_98357a_dai_link(&links[id]);
-- 
2.40.0

