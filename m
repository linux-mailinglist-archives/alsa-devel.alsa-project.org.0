Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 388855F9E58
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 14:07:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B73B42974;
	Mon, 10 Oct 2022 14:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B73B42974
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403631;
	bh=H3vw6OArTHDdlxEgCq3Huqo/FgnDEZvJlpqeOHEjNZE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sIzmF7cYt0bXKtkeJyC2Tl4nYxyzagxw14UYheX3B666c6wVAYBiaY1ETes0RwZAk
	 by940evpusm4W302EYsivMleF/h4TqVFlZnMsgVhLC1g+hJ3EAJu8Fk8WQN0PtnFhl
	 qVW63Kmd4h0scWW7taa72gZ34Gc+9SZ6SKVBo5RU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0477CF8057B;
	Mon, 10 Oct 2022 14:04:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85578F80566; Mon, 10 Oct 2022 14:04:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DD31F80568
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 14:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD31F80568
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VeDmuRTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665403447; x=1696939447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H3vw6OArTHDdlxEgCq3Huqo/FgnDEZvJlpqeOHEjNZE=;
 b=VeDmuRTUYJJ505aVlZhn7r5CuT5zg1lLDktfRy5qha1S6+leff47S1Pf
 ZOpaM3xEpISWEaXIwzHZYOIbtqlO70CzRuDpeRTnMrdzoqvMF8l6dtWdB
 tA9P0MeTWwVvxvFHfSzD6pVmfj7IN0Yk9qOeB+eAyFsUSVt9yJ2Ssc0IZ
 KfF4PSI3mzmux4FlLRJ3/IaI5OgdBd65LRsYkN5xbfajso10TcF3THbUj
 XRqVYN5FBTq1hSVbXpPSK6NA3UugWyu3beeYI0bM7bOEwj0AXuDsLEdWF
 lXgJrQ7SVI/zbWNyrZtVNvW1muKlsT3t+I8YEb0rym20w3fchh7OMGezI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="368346100"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="368346100"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 05:04:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="871078928"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="871078928"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2022 05:04:04 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 09/15] ASoC: Intel: avs: Add missing include to HDA board
Date: Mon, 10 Oct 2022 14:19:49 +0200
Message-Id: <20221010121955.718168-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010121955.718168-1-cezary.rojewski@intel.com>
References: <20221010121955.718168-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

In some configurations board fails to compile due to missing header. Add
it to fix build.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/hdaudio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 073663ba140d..e68c4c7aa2ba 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -6,6 +6,7 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <sound/hda_codec.h>
 #include <sound/hda_i915.h>
-- 
2.25.1

