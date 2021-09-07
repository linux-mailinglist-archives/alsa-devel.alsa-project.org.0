Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF9A402E83
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 20:46:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7062B1727;
	Tue,  7 Sep 2021 20:45:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7062B1727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631040387;
	bh=qomrGpQS6oAP+YEN/lQlB96tblBIAQh6Yzteg+/IR9Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sy9FQ431pKTqYV6UeK2mIcEWgEzpVpsibIQzyD2QF9oiY0a4Ud732J5ATv3iVsPpr
	 MSXC5FN6ywAbI0GhxJhFYHuAK+iNKtWrRi8vyZFKAJod2zBvjTv+m/anmxlJrUQ35j
	 niM+9Kbdn+WtyrPTm4hchVxDsgW16pDbL8/v8WJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7FFBF80217;
	Tue,  7 Sep 2021 20:45:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C5C2F80224; Tue,  7 Sep 2021 20:45:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C256F800C7
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 20:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C256F800C7
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="207515438"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="207515438"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 11:44:59 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="503191793"
Received: from fdiasmor-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.186.104])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 11:44:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_sdw: tag SoundWire BEs as non-atomic
Date: Tue,  7 Sep 2021 13:44:36 -0500
Message-Id: <20210907184436.33152-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>,
 Bard Liao <bard.liao@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The SoundWire BEs make use of 'stream' functions for .prepare and
.trigger. These functions will in turn force a Bank Switch, which
implies a wait operation.

Mark SoundWire BEs as nonatomic for consistency, but keep all other
types of BEs as is. The initialization of .nonatomic is done outside
of the create_sdw_dailink helper to avoid adding more parameters to
deal with a single exception to the rule that BEs are atomic.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6602eda89e8e..6b06248a9327 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -929,6 +929,11 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      cpus + *cpu_id, cpu_dai_num,
 			      codecs, codec_num,
 			      NULL, &sdw_ops);
+		/*
+		 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
+		 * based on wait_for_completion(), tag them as 'nonatomic'.
+		 */
+		dai_links[*be_index].nonatomic = true;
 
 		ret = set_codec_init_func(card, link, dai_links + (*be_index)++,
 					  playback, group_id);
-- 
2.25.1

