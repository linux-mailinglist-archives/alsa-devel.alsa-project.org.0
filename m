Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C96882726DE
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 16:22:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F44B16CE;
	Mon, 21 Sep 2020 16:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F44B16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600698176;
	bh=yTZjtUhX6S/j1BwlxoQoSeoi/+CbLFEl08RMbCQPLxE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RY/Q4HKMunF1Iy1TmzYWlUgL9WGvGjjJ4rIDg1qPtyJ+UTMbkuEj5PDmgGdPHegwz
	 jGms2PhtnTy6fLcUm9tdX2fsgeU/dITQa4XyaQmglwnZegbR2gdN0O0oIqGJsYqTkA
	 1IseeUwdOPntG82BVckbYTXn2Wf6NiURvmE84Lgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6203F802DD;
	Mon, 21 Sep 2020 16:19:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84A8BF802C4; Mon, 21 Sep 2020 16:19:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23BC3F80171
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 16:19:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23BC3F80171
IronPort-SDR: seXjejW2lVSnbmKJkN+evCT8TK0C8YAgf/JmdhmLVl6q4omjl9PO1gtSawxlGLwW82X7jawjcS
 krbiyEhZo1Mg==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="140394098"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="140394098"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 07:19:20 -0700
IronPort-SDR: AnQIFzodJzGq0glIEhqy7zSQK9BIn8qY6mx5bN5HHy1oo9iYpM3E70a/qJkDki43C71PkOfjhU
 Hhs5jj5HAO8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="485495429"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 21 Sep 2020 07:19:19 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 4/4] ALSA: hda - fix CONTROLLER_IN_GPU macro name
Date: Mon, 21 Sep 2020 17:17:41 +0300
Message-Id: <20200921141741.2983072-5-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200921141741.2983072-1-kai.vehmanen@linux.intel.com>
References: <20200921141741.2983072-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com
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

The CONTROLLER_IN_GPU() macro has different semantics than
the similarly named macro in hda_intel.c. The name is also
misleading as the macro is used to apply a Intel HSW/BDW
programming logic for HDA controller clock configuration.
Rename macro to reflect the actual implementation.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/hdac_i915.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 50b2c1db429b..d236e497435d 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -13,7 +13,7 @@
 
 static struct completion bind_complete;
 
-#define CONTROLLER_IN_GPU(pci) (((pci)->device == 0x0a0c) || \
+#define IS_HSW_CONTROLLER(pci) (((pci)->device == 0x0a0c) || \
 				((pci)->device == 0x0c0c) || \
 				((pci)->device == 0x0d0c) || \
 				((pci)->device == 0x160c))
@@ -41,7 +41,7 @@ void snd_hdac_i915_set_bclk(struct hdac_bus *bus)
 
 	if (!acomp || !acomp->ops || !acomp->ops->get_cdclk_freq)
 		return; /* only for i915 binding */
-	if (!CONTROLLER_IN_GPU(pci))
+	if (!IS_HSW_CONTROLLER(pci))
 		return; /* only HSW/BDW */
 
 	cdclk_freq = acomp->ops->get_cdclk_freq(acomp->dev);
-- 
2.27.0

