Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E30F456875C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6EA169D;
	Wed,  6 Jul 2022 13:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6EA169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657108465;
	bh=amzOSwAOX4foyC+9TNzVuqyMV+SNxwJmMBmYPdPI7oI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ky+nkebYlts+Loh0+bOX5ll1YDiiZOgWqRORP3EVB/yUT+1sRj9b7sVOABEwyy9lR
	 z9nTbQLZfV1ylibGzTWdpDvzf7vBXqJaOCFDdlheFw6bSX1mxzL1+1XDSeyju3MGi6
	 swzLXz5dGphO/hKDV/MIbdBJcvmALZiOvVwtFtpI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0AA8F8053B;
	Wed,  6 Jul 2022 13:52:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A4C2F804ED; Wed,  6 Jul 2022 13:52:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D68DF8023A
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D68DF8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LKGEL3LR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657108363; x=1688644363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=amzOSwAOX4foyC+9TNzVuqyMV+SNxwJmMBmYPdPI7oI=;
 b=LKGEL3LRtzJJSB0e8dwTlpmnx19slUI1Euuq3dHP3EGbzehXy2nzHpSq
 VBth3OHlnhSrUa1I3VVJrmsUciM4zTsww8TsW5a2CRi2mo0DjPeNQc7Wk
 TLErshxYSJAG62KAf6zVaxk+eXBrJ21YP5kraEIfnP2CVWuIZiq5KYs/i
 ti7wYKUIbhaofz8oNdj3B0R9uR65ABM1gC6rh6CFAKYQ2rSCOp6cd2My+
 8jVsfn5klvAZPprXvWbXlYnC4pnCvMXNNwgdUrc3pHvJMvl4Dt95RfyJq
 AKrqIDm9Q7F95FIzSIdiFyjCJ7IWi5APGz2+LvTrusoBWJyfP54RFl1vj w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="370042620"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="370042620"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 04:52:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="920136268"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2022 04:52:37 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH 3/9] ALSA: hda: Make device usage_count consistent across
 subsequent probing
Date: Wed,  6 Jul 2022 14:02:24 +0200
Message-Id: <20220706120230.427296-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706120230.427296-1-cezary.rojewski@intel.com>
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
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

AVS HDAudio bus driver does not tie with codec drivers tighly and
snd_hda_codec_device_new() can be called after codec's module reload. In
such case, rpm is forbidden and invoking pm_runtime_forbid()
unconditionally causes device's usage_count to become unbalanced. This
is later caught by WARN_ON() found in sound/soc/hda.c. Detect such
circumstance and bump the usage_count instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/pci/hda/hda_codec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 9ceb642ac819..83d954ab056f 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -1044,8 +1044,14 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 			goto error;
 	}
 
+#ifdef CONFIG_PM
 	/* PM runtime needs to be enabled later after binding codec */
-	pm_runtime_forbid(&codec->core.dev);
+	if (codec->core.dev.power.runtime_auto)
+		pm_runtime_forbid(&codec->core.dev);
+	else
+		/* Keep the usage_count consistent across subsequent probing */
+		pm_runtime_get_noresume(&codec->core.dev);
+#endif
 
 	return 0;
 
-- 
2.25.1

