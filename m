Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F531702792
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 10:52:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6268A208;
	Mon, 15 May 2023 10:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6268A208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684140727;
	bh=qPVTI9bLRh4CTLXFJW7vsaf9phkl/M+L/8q9XwSapwo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hL6VswaR1zGTDfRzmcC+M1US165krvX0OCnAIwkl8tSC2D5tTQJZYWn0gcjvquE0m
	 v72p/W91ZfsoCUDt5lxLyD6IjDuWNWCOHVPAfR2IqgXAfdoZYnnQqpIiHtyZDr19Qr
	 2zWW0xVsA4NU+01Mk07e5igS4zeUQlgJIp3YpQuI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCE55F8024E; Mon, 15 May 2023 10:51:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CCD3F8025A;
	Mon, 15 May 2023 10:51:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6379F80272; Mon, 15 May 2023 10:51:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0D08F8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 10:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0D08F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DMKzP6Ht
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684140670; x=1715676670;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qPVTI9bLRh4CTLXFJW7vsaf9phkl/M+L/8q9XwSapwo=;
  b=DMKzP6HtwmjYkNst8NI1nO6+2giWByEzHWhQ5082PBXbrBWNmR5T+xjW
   hv7VnpspMetaG8fFPEX5deAecfc0BM/fRCYy/l4DGAe+988OxoLfGjx9b
   0Ipp6NnG5E7Sq3jaJJVlmi87jgGvaslPiWPqDin5cbFRTrRjsdRxZDKqH
   R8SFLv2+Ue731FtyuNktv0RFc+7IhF5AnYjGWIZLxVew/CM8myBI3Auvt
   2HPeuGHhLwCbPuVB7q7aGi1RrKJi4aSgtSNQblWLiW4zhQZ78Q9YmWyP2
   6hYStax0yfr7WHYMYvSDQQBAfswizLXF+SBzPvvdUbxMFd0QRoIvb8jb6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="348642337"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="348642337"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 01:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="947344421"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="947344421"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.230])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 01:51:04 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: topology: Fix tuples array allocation
Date: Mon, 15 May 2023 11:52:00 +0300
Message-Id: <20230515085200.17094-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4SVGR6Q75A72YT7GIF3PJSKTIL2ETRSU
X-Message-ID-Hash: 4SVGR6Q75A72YT7GIF3PJSKTIL2ETRSU
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SVGR6Q75A72YT7GIF3PJSKTIL2ETRSU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The memory allocated for the tuples array assumes that there's 1
instance of all tokens already. So for those tokens that have multiple
instances in topology, we need to exclude the initial instance that has
already been accounted for.

Fixes: 4fdef47a44d6 ("ASoC: SOF: ipc4-topology: Add new tokens for input/output pin format count")
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b80566570512..f160dc454b44 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1265,7 +1265,7 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 		if (num_sets > 1) {
 			struct snd_sof_tuple *new_tuples;
 
-			num_tuples += token_list[object_token_list[i]].count * num_sets;
+			num_tuples += token_list[object_token_list[i]].count * (num_sets - 1);
 			new_tuples = krealloc(swidget->tuples,
 					      sizeof(*new_tuples) * num_tuples, GFP_KERNEL);
 			if (!new_tuples) {
-- 
2.40.1

