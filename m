Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B47527A2017
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 15:46:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D97CEFA;
	Fri, 15 Sep 2023 15:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D97CEFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694785611;
	bh=IgkKMVo44SXkghwQg/qFe2xD4nr6Z2EAedZzXqCo/+g=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fkmxtwLeFkR1ps/WyD5jgixlVVqQnLYCZRvXxBa4v1s9mhKFTzVuD8g39VgyAzaKx
	 z/qOV1iO3gFqg5RXhIWgX9vLj4ikHXoKG4oS0vP8mDEReBT7pH1EkbLryqLOFff4QR
	 D1uT8ip6ve+Ln3D/rAL6kVs1IWRllhDmZmiTcIWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAC0BF80549; Fri, 15 Sep 2023 15:45:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6602AF80246;
	Fri, 15 Sep 2023 15:45:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A32FF80425; Fri, 15 Sep 2023 15:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE24EF80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 15:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE24EF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Vr5CU1Xm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694785528; x=1726321528;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IgkKMVo44SXkghwQg/qFe2xD4nr6Z2EAedZzXqCo/+g=;
  b=Vr5CU1XmXkOmzG6WByLdGmQT7zaYnAll4A+C1463crbQ5mXqumUvFACO
   SzqlarQFDNojHDhSC8ZBROX0Fi4KKQlfg82xu4JJs9PmRK3/1KFN099Of
   z0ldIQIyecSuprW8tvLAQ2liM97xCykMviKu+UuRyqCliTVTZnczRW7Cp
   1DvkrDAdKfxHs0Prsuw8iVSiL78t7UNMiDAxRqO8XCTpKcRUyAQ+wh838
   dgzKZ1FOKx4LG5GHzceNULGWWDNFcEzIhf3HCfu1rO6FBux2pgFp3pXxG
   Cj6wh2d2omNhyqvHgxfyFTLnQY/X5mnIBJIP2hAm6pwIORvqSveRF50G4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="465613411"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="465613411"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:45:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="780098894"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="780098894"
Received: from brhacker-mobl26.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.34])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:45:21 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	fred.oh@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH] ALSA: hda: hdac-i915: make i915 timeout configurable
Date: Fri, 15 Sep 2023 16:45:27 +0300
Message-ID: <20230915134527.16679-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WZGDRTOAKOSNQP6IMYNSXMIMFA7C76KA
X-Message-ID-Hash: WZGDRTOAKOSNQP6IMYNSXMIMFA7C76KA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZGDRTOAKOSNQP6IMYNSXMIMFA7C76KA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fred Oh <fred.oh@linux.intel.com>

When enabling new platforms, missing dependencies on i915 driver
updates cause i915 timeouts. Rather than wait 60s for no good reason,
this patch adds a kernel parameter so that developers can cut to the
chase and skip a known problem.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/hda/hdac_i915.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index b428537f284c..5927d5200785 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -11,6 +11,10 @@
 #include <sound/hda_i915.h>
 #include <sound/hda_register.h>
 
+static int hdac_i915_timeout_ms = 60000;
+module_param(hdac_i915_timeout_ms, int, 0444);
+MODULE_PARM_DESC(hdac_i915_timeout_ms, "i915 initialization timeout in msec");
+
 /**
  * snd_hdac_i915_set_bclk - Reprogram BCLK for HSW/BDW
  * @bus: HDA core bus
@@ -165,9 +169,8 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 	if (!acomp->ops) {
 		if (!IS_ENABLED(CONFIG_MODULES) ||
 		    !request_module("i915")) {
-			/* 60s timeout */
 			wait_for_completion_killable_timeout(&acomp->master_bind_complete,
-							     msecs_to_jiffies(60 * 1000));
+						     msecs_to_jiffies(hdac_i915_timeout_ms));
 		}
 	}
 	if (!acomp->ops) {
-- 
2.42.0

