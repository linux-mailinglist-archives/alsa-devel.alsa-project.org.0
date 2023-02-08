Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C468ED32
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 11:45:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C4C382E;
	Wed,  8 Feb 2023 11:44:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C4C382E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675853102;
	bh=bI3lkPA4DYmfFeGycZNodZSMzCNaCi6FG0OCdE4gS0M=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=N6TC9fqirX2eIz91Jv197LbXo7Hq2n8gWj3rdR+GVo/6B676wnda6rE4+z8vQJ76m
	 dXq1rqRVCOLTnfrGx+d+pmrqAeZo4TQbRhW6WM0Ea7qIpQrhEec8/5wcSptkkvgzhT
	 B7UPtOHyDuaSdc4xRc5dmejigwUdIAVxwk/l/7oU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A601F800AF;
	Wed,  8 Feb 2023 11:44:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57A03F8012B; Wed,  8 Feb 2023 11:44:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96E1DF80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 11:43:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96E1DF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KDEz/9W+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675853040; x=1707389040;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bI3lkPA4DYmfFeGycZNodZSMzCNaCi6FG0OCdE4gS0M=;
  b=KDEz/9W+TjHDFAkcidiQv5ovYu862ExMewbKGofIDplUGR7DQadOLDpr
   2ijsFqAdIQ8SewQaZyxdIYIdf10zOZEvAK+luTUG3M0OMwzR5ZqKaHDqj
   U4L+0wOIPwsvpgJ3bKRP1spJh9KtANNW5BGBETIRH4xI9UO9wpiXw5C20
   ky2J81bQvSEclhXf80ZLpJ6sgPme1U1ZI+6rLygxxCImyXuDiMqNaeGc0
   IwjlqyVxarQn3+3b7nOesgXOr1qt4t6iyxvMOC/CuF+WGPOBZ/uZ3x7jE
   50MQ98VR+1rSrKyAwSLXxE2rnQWBbvt9xZaabwroAE1PgEmJI6OhKstTW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="313405608"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000";
   d="scan'208";a="313405608"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 02:43:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="644819929"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000";
   d="scan'208";a="644819929"
Received: from jkiern1x-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.16.137])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 02:43:53 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ops: refine parameters order in function
 snd_sof_dsp_update8
Date: Wed,  8 Feb 2023 12:44:04 +0200
Message-Id: <20230208104404.20554-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OWUB2BQW6JHTEFUYJTBXQ5P6ZANRONGD
X-Message-ID-Hash: OWUB2BQW6JHTEFUYJTBXQ5P6ZANRONGD
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com,
 chao.song@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OWUB2BQW6JHTEFUYJTBXQ5P6ZANRONGD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

SOF driver calls snd_sof_dsp_update8 with parameters mask and value but
the snd_sof_dsp_update8 declares these two parameters in reverse order.
This causes some issues such as d0i3 register can't be set correctly
Now change function definition according to common SOF usage.

Fixes: c28a36b012f1 ("ASoC: SOF: ops: add snd_sof_dsp_updateb() helper")
Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi Mark,

Can you take this one for the next 6.2-rc? Commit c28a36b012f1 is introduced in
6.2-rc1.

Thank you,
Peter

 sound/soc/sof/ops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 03752c8405ca..9ab7b9be765b 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -357,7 +357,7 @@ static inline u64 snd_sof_dsp_read64(struct snd_sof_dev *sdev, u32 bar,
 }
 
 static inline void snd_sof_dsp_update8(struct snd_sof_dev *sdev, u32 bar,
-				       u32 offset, u8 value, u8 mask)
+				       u32 offset, u8 mask, u8 value)
 {
 	u8 reg;
 
-- 
2.39.1

