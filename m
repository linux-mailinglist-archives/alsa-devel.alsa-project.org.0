Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1C44D38E4
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 19:35:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9549173C;
	Wed,  9 Mar 2022 19:34:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9549173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646850900;
	bh=90C0XMiBh5Aansh7SM7+956445sMRVpYsh7vpnMc/RM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bqe+Qzop2KvLVmqHIGJ55M/nNeF+NceXUVpUjaz7cCz6OsOd3L+evG1QKz4xvojti
	 KcZCZCDJVIEIWgO2bp7qrvtNtroQxKnkcjhm1OMe6eVxFKFOCqcffDHnrndoZ8bRQ9
	 K+YZ8DBXL0ne201b4v05VjlDhIwa+Ogo10vktJ74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26D86F800D2;
	Wed,  9 Mar 2022 19:33:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE34DF8016C; Wed,  9 Mar 2022 19:33:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CD1FF800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 19:33:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CD1FF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Hyq4418z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646850829; x=1678386829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=90C0XMiBh5Aansh7SM7+956445sMRVpYsh7vpnMc/RM=;
 b=Hyq4418zBbVjW9GliUDxjED+ydEya5y1Zid3U9olMJyjWPZrIqSblcBC
 Mo0lJ73Yjt2Z/PXDlUL8V5LFlth17F9KDXjJS2LbPT7QdMKQUPXiouui5
 ipnOprLLQckcgYrJt2GOHV+uwUSwJyXZesD2TO1iyXvRLx9hIsaPs36YZ
 nkoZ1nGTtF0kTXSKdEF06mbK8PwRgmzyzDMZkM4RyN7BdTZAsEevas9lk
 U7cTZz/KO5+63OkkCJAAGOv+Y8wOa+9JR9/hMBGxXpv6IWka5eEvOJDpa
 bACR4pmEQwT/wMfhgshI/pDq92EC2Udk2WLxgxcHq9+oubigWM23G+qTh A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="242502982"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="242502982"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 10:33:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="596372230"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 09 Mar 2022 10:33:43 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v3] ALSA: hda/i915 - avoid hung task timeout in i915 wait
Date: Wed,  9 Mar 2022 20:24:39 +0200
Message-Id: <20220309182439.1053856-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tvrtko.ursulin@linux.intel.com, kai.vehmanen@linux.intel.com,
 Ramalingam C <ramalingam.c@intel.com>, intel-gfx@lists.freedesktop.org,
 lucas.demarchi@intel.com, amadeuszx.slawinski@linux.intel.com
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

If kernel is built with hung task detection enabled and
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT set to less than 60 seconds,
snd_hdac_i915_init() will trigger the hung task timeout in case i915 is
not available and taint the kernel.

Use wait_for_completion_killable_timeout() for the wait to
avoid this problem.

Co-developed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/hdac_i915.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Changes V2->V3:
 - drop the loop and just use 
   wait_for_completion_killable_timeout() (feedback from Tvrtko Ursulin)
 - new approach, so dropped the previous reviewed-by tags

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 454474ac5716..efe810af28c5 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -160,8 +160,8 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 		if (!IS_ENABLED(CONFIG_MODULES) ||
 		    !request_module("i915")) {
 			/* 60s timeout */
-			wait_for_completion_timeout(&acomp->master_bind_complete,
-						    msecs_to_jiffies(60 * 1000));
+			wait_for_completion_killable_timeout(&acomp->master_bind_complete,
+							     msecs_to_jiffies(60 * 1000));
 		}
 	}
 	if (!acomp->ops) {

base-commit: 3a0099a1909dea6022690b0ae496938dd2e5771c
-- 
2.35.1

