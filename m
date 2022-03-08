Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 834604D1F5E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:47:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25B9418A7;
	Tue,  8 Mar 2022 18:46:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25B9418A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646761632;
	bh=kRUgUYX7nSK1Pz7datAgqAM8AShHcJ606PqwoOaNhhU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JSD/3rZNKYAGTc4xsdGlgRXp3Ce57w/CWYmm5iYhbGDhAeAkf3WdffbIFAZDBbTr3
	 1q0KDEA/oWCD6D7qWJgl7bz/Zal8SPEKAvOXSLNL78WF9uEHqyo+W1zBgVnLt1MMWt
	 41RlpS7oCENgaOez53p6QHmiKLIY9eR5FEkudSzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCDA2F80121;
	Tue,  8 Mar 2022 18:46:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0C9BF8026A; Tue,  8 Mar 2022 18:46:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F438F80121
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F438F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XAWNXEWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646761561; x=1678297561;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kRUgUYX7nSK1Pz7datAgqAM8AShHcJ606PqwoOaNhhU=;
 b=XAWNXEWNTDV34uEjR2QXKyEw8PYe4ecL12qwF+tT4OfUP7RZ/GKHRyG2
 XnVrN/WJ315aws8tm+/Opim3NUTIocsptjPv5VZoufsynnKYuAqTkUinE
 VRqXWGKgWUkWvccbLXZiPl+VgMX2gf3rJm3kBkEZMq748n/i72iGzZitk
 ikU2BL9iGqmSXPboFLvlXs1QFKUioiJQFztzBlcUS4hYcoLJS7lIaFicE
 V6wVGsbluMSGL2YH1VyiqdB/9hIf734Ik++QLVSy5WNCz2rGzvP16cr20
 SnLYjtrwrZCVQxPmBJDhxGuhdmHLzsQxNEA8dmZj4EbH1ws+Vf0tiJtIr w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="317990073"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="317990073"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 09:37:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="513196477"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006.jf.intel.com with ESMTP; 08 Mar 2022 09:37:00 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: hda/i915 - avoid hung task timeout in i915 wait
Date: Tue,  8 Mar 2022 19:27:59 +0200
Message-Id: <20220308172759.920551-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ramalingam C <ramalingam.c@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, kai.vehmanen@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com
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

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Co-developed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/hdac_i915.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

Changes V1->V2:
 - address local variable naming issue raised by Amadeusz
   and use Takashi's proposal

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 454474ac5716..aa48bed7baf7 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -143,7 +143,7 @@ static bool i915_gfx_present(void)
 int snd_hdac_i915_init(struct hdac_bus *bus)
 {
 	struct drm_audio_component *acomp;
-	int err;
+	int err, i;
 
 	if (!i915_gfx_present())
 		return -ENODEV;
@@ -159,9 +159,11 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 	if (!acomp->ops) {
 		if (!IS_ENABLED(CONFIG_MODULES) ||
 		    !request_module("i915")) {
-			/* 60s timeout */
-			wait_for_completion_timeout(&acomp->master_bind_complete,
-						    msecs_to_jiffies(60 * 1000));
+			/* max 60s timeout */
+			for (i = 0; i < 60; i++)
+				if (wait_for_completion_timeout(&acomp->master_bind_complete,
+								msecs_to_jiffies(1000)))
+					break;
 		}
 	}
 	if (!acomp->ops) {

base-commit: fd7698cf0858f8c5e659b655109cd93c2f15cdd3
-- 
2.35.1

