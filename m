Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E74184E5F3
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 18:03:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7FC514F2;
	Thu,  8 Feb 2024 18:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7FC514F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411798;
	bh=dv1QKYSjp5u7NiTRb5oRIKW0CUksjklA3x5VLpf1kng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZCd3kt/GofqNHhSKbwgor3Uip0zS7Rj9o7wfvoC+3xdfNK0ZD03aVnHXSvM30PfVm
	 Owe8TGzQHuTb0hbRyMq1UEVUu8XWEWt+jruuAqEPXTCjQ6M86Jpc+UrtpoEz/QX/93
	 UaIVpwtYJniP0ubGnL3gqDNBNFjzihK2B1G8/5wo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DC35F8971B; Thu,  8 Feb 2024 17:57:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A887F8970F;
	Thu,  8 Feb 2024 17:57:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB131F806E2; Thu,  8 Feb 2024 17:56:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9260AF8060F
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9260AF8060F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J2TSe8IX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411378; x=1738947378;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dv1QKYSjp5u7NiTRb5oRIKW0CUksjklA3x5VLpf1kng=;
  b=J2TSe8IXMvOrxCMf2pN1QqjFcZnhaWwnV+rsy8Pz6tuPxBIfznLm5rgt
   MMH1WIU3CeaGuPN9O7wxjQPFhSw2pIm6eOaEAJnkybUoWsSSZ38E5mIbw
   awZtWB1QCYvE9bJx1rJGcX6BmGa7b3CanfA5sOLxaYxy5nS4tf4xNxQgk
   I/kiA7VJNuAxaPg38QW3X/Aa02WWgqA6Xr+2vPrxERBM1eTR8klBnuOtx
   t0JSjVQ9s3DxericjxtcOxW6B01gYsBNXrmaobYfpFnEQsDjthKQFQ0Lr
   K/xiRwPuQiOeAz/abt0dDP2TFRqTzgYEofxMNIIvXMb4Peyoj09pAPL+S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675453"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675453"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690288"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 24/24] ASoC: Intel: sof_sdw: starts non sdw BE id with the
 highest sdw BE id
Date: Thu,  8 Feb 2024 10:55:45 -0600
Message-Id: <20240208165545.93811-25-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FVW5BLFWWIPIXQHK6CRNLSE4IRKJHONQ
X-Message-ID-Hash: FVW5BLFWWIPIXQHK6CRNLSE4IRKJHONQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVW5BLFWWIPIXQHK6CRNLSE4IRKJHONQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The soundwire links do not have their IDs as consecutive numbers, thus
the last link might have lower be_id than the previous one and this
leads to id collision with non SDW links.

For example,
create dai link SDW0-Playback-SimpleJack, id 0
create dai link SDW0-Capture-SmartMic, id 4
create dai link SDW0-Capture-SimpleJack, id 1
create dai link SDW2-Playback-SmartAmp, id 2
create dai link SDW2-Capture-SmartAmp, id 3
create dai link iDisp1, id 4
create dai link iDisp2, id 5
create dai link iDisp3, id 6

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Co-developed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e4b9f4d1ec06..08f330ed5c2e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1767,15 +1767,21 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 				return codec_index;
 
 			for (j = 0; j < codec_info_list[codec_index].dai_num ; j++) {
+				int current_be_id;
+
 				ret = create_sdw_dailink(card, &link_index, dai_links,
 							 sdw_be_num, adr_link,
 							 codec_conf, codec_conf_num,
-							 &be_id, &codec_conf_index,
+							 &current_be_id, &codec_conf_index,
 							 &ignore_pch_dmic, append_dai_type, i, j);
 				if (ret < 0) {
 					dev_err(dev, "failed to create dai link %d\n", link_index);
 					return ret;
 				}
+
+				/* Update the be_id to match the highest ID used for SDW link */
+				if (be_id < current_be_id)
+					be_id = current_be_id;
 			}
 
 			if (aggregation && endpoint->aggregated)
-- 
2.40.1

