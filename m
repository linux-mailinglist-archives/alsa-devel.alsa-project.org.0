Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFD94D1A4C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 15:21:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED168174C;
	Tue,  8 Mar 2022 15:20:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED168174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646749309;
	bh=SUP6bQUVlfaJws4FWw2VzMhkRuhCDcFD/3nsgprWAAs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YwCD3Rs+IlelAWKV2j80suTtGR3ZVKi8gQRvf+EVEs4sAqo2/D76GJBHG/1s2xIz3
	 JUyU4eIod+iqaFH5U8LEEjbsmriZvxStfRrA5ASrA8O48Rvi8McDRlFXrBWL6R+PWo
	 UxaDfHCYW8y9QrFTWSYwQF5VXngoJIH6pOrI2Cn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2DD8F80279;
	Tue,  8 Mar 2022 15:20:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E00EF80272; Tue,  8 Mar 2022 15:20:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6270BF8026D
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 15:20:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6270BF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OOCemhQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646749228; x=1678285228;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SUP6bQUVlfaJws4FWw2VzMhkRuhCDcFD/3nsgprWAAs=;
 b=OOCemhQbyL+DA3jKbFIWq7ryFXu1PQ6IB/fHsRtHKCbbTamYoL/77uU+
 O/xWN+YDCVJ0TMsilXI+soei6pvUwt4VdxzaWrdNGCimTbSGuEd1RNOwR
 O44fyLOMFY2Tx/PsAYS1AMBomqA1oQw3PN9HJ+93/UiQEpupRcm9E0L6c
 D0n1/JtkXsvDRfIHWjI18/6I5MPCeh3QNxALVSrKN3Rhj5ai1GjDBzpgN
 9QZQ0I6oRmi8d8phB7H5kF2g8JgdSgcKGyW4+D4x0FmnvuoZxw5dUs+QL
 mmtiwyHhPR3Xfy1AITtg5HRj8pWbcX2xHq4GmhTU3/YpuoG6/tvGOMZm5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="279405301"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="279405301"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="510107616"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 08 Mar 2022 06:20:16 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/i915 - avoid hung task timeout in i915 wait
Date: Tue,  8 Mar 2022 16:11:12 +0200
Message-Id: <20220308141112.880662-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ramalingam C <ramalingam.c@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, kai.vehmanen@linux.intel.com
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

Split the 60sec wait into a loop of smaller waits to avoid this.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Co-developed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/hdac_i915.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 454474ac5716..6219de739b56 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -143,7 +143,8 @@ static bool i915_gfx_present(void)
 int snd_hdac_i915_init(struct hdac_bus *bus)
 {
 	struct drm_audio_component *acomp;
-	int err;
+	unsigned long wait = 0;
+	int err, i;
 
 	if (!i915_gfx_present())
 		return -ENODEV;
@@ -159,9 +160,10 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 	if (!acomp->ops) {
 		if (!IS_ENABLED(CONFIG_MODULES) ||
 		    !request_module("i915")) {
-			/* 60s timeout */
-			wait_for_completion_timeout(&acomp->master_bind_complete,
-						    msecs_to_jiffies(60 * 1000));
+			/* max 60s timeout */
+			for (i = 0; !wait && i < 60; i++)
+				wait = wait_for_completion_timeout(&acomp->master_bind_complete,
+								   msecs_to_jiffies(1000));
 		}
 	}
 	if (!acomp->ops) {

base-commit: fd7698cf0858f8c5e659b655109cd93c2f15cdd3
-- 
2.35.1

