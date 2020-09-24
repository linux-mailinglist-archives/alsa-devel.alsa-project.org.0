Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 490212775A7
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 17:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5359A17ED;
	Thu, 24 Sep 2020 17:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5359A17ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600962257;
	bh=y9VkIlxkaztbUQB84Q/LTS9/wfwSgxioeFtYSEpKZlg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qziVyWDsYbaDn9X79ONhPQxyJNej4uzKwjHzJiXBiVdO9eXXcu3LAUZGMQ5K4q0Ia
	 8YLfi4Ad30DTCXAu62ZtqEYpr1QLLvAqhtnlzE66nURPZ3HklrCd5V/SyaRjlxBHHa
	 x8LYybkJmrra/S5t48XhGPR8Mvy1x4e/lethJd3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46B0CF8015F;
	Thu, 24 Sep 2020 17:42:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59C3AF80232; Thu, 24 Sep 2020 17:42:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01D33F8015F
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 17:42:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D33F8015F
IronPort-SDR: 7pLdupSp/rVC6qmCKNlnLKw3BwpV/fb2MVnybnishwyzVbQS+ZcgKEvPEW7qyEHhFQenDINqL7
 Sgtle7eah7HQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="222838209"
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; d="scan'208";a="222838209"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 08:42:17 -0700
IronPort-SDR: u8HZktdRrZUwDeq5G/ezWgHyclZvoM3LS1td9d1V+2Bq1JJWvHlwUbB1B8T4tlDn77QO7JsWl3
 1ux81ocGziHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,298,1596524400"; d="scan'208";a="336032623"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 24 Sep 2020 08:42:16 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda - add missing documentation to hdac_i915
Date: Thu, 24 Sep 2020 18:40:43 +0300
Message-Id: <20200924154043.3392898-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
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

Document missing function arguments and fix make W=1
warning:

sound/hda/hdac_i915.c:80: warning: Function parameter or member 'i915' not described in 'connectivity_check'
sound/hda/hdac_i915.c:80: warning: Function parameter or member 'hdac' not described in 'connectivity_check'

Fixes: 7b882fe3e3e8 ('ALSA: hda - handle multiple i915 device instances')
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/hdac_i915.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index d236e497435d..9592d0c0c254 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -75,6 +75,8 @@ EXPORT_SYMBOL_GPL(snd_hdac_i915_set_bclk);
 
 /**
  * Returns true if the devices can be connected for audio.
+ * @i915: i915 PCI device
+ * @hdac: HDA audio controller PCI device
  */
 static bool connectivity_check(struct pci_dev *i915, struct pci_dev *hdac)
 {
-- 
2.27.0

