Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC259858F
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 16:16:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFFC3168F;
	Thu, 18 Aug 2022 16:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFFC3168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660832208;
	bh=+Jw2sCqhFjrjd0ogBdcPM4xUu9vU/3VB2S/clQ7Sul0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+XIS5DXI2F5OU+SnOmUzYKjNd1x88wixAQw/iZfk+xqhvG12+OZRnG/RbVErOK0L
	 dNOyb6PuVCubKPW4j/2ySGxv6Jw1UbrWG/MTfh/u2r1Dystk5dAu9K8MiUlNHeR694
	 g3fi3PEUNrFf9JgrxlwcpKjK44lgRF7rxBQR/9QQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB875F80525;
	Thu, 18 Aug 2022 16:15:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BDC4F804E5; Thu, 18 Aug 2022 16:15:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F044EF804CB
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 16:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F044EF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OAveoJvq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660832113; x=1692368113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Jw2sCqhFjrjd0ogBdcPM4xUu9vU/3VB2S/clQ7Sul0=;
 b=OAveoJvq5MUqqBvduEc2vqRV2JqbJPzOza6M7Xf44YvmNPzgsWwPc7fc
 eF6jB29o4jalrq1ysG0S5gClKiN+R2t0TVQP0+KamO+SZ5cFD5R6tvhts
 5Y47udx79NIdzkNo093hdwV9HZCYUuuoXmIr5uZUqKfEx5AOh2CKJx6iY
 rwxBtTrKwxE1obBrZNTu3IMwgzF8lToSs0qD68sRnkS/Gk2iDSwhyef/m
 1AMnIOwu2wrky8/oy6GHpqxoMOJizqaXaE9fcCqMFTEfvfOGjAEW0x5SS
 bIeI0OSVsY5wz4ryIlR7hKjUBfsIsyh/uTdjCCZ1ra64Gxq+WQ2vMqakp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="292764772"
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="292764772"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 07:14:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="584222264"
Received: from dev2.igk.intel.com ([10.237.148.94])
 by orsmga006.jf.intel.com with ESMTP; 18 Aug 2022 07:14:49 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 4/4] ALSA: hda: Remove unused defines
Date: Thu, 18 Aug 2022 16:15:17 +0200
Message-Id: <20220818141517.109280-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818141517.109280-1-amadeuszx.slawinski@linux.intel.com>
References: <20220818141517.109280-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

There is no need to keep unused defines in file.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/pci/hda/hda_intel.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index a77165bd92a9..7720978dc132 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -86,9 +86,6 @@ enum {
 #define INTEL_SCH_HDA_DEVC      0x78
 #define INTEL_SCH_HDA_DEVC_NOSNOOP       (0x1<<11)
 
-/* Define VIA HD Audio Device ID*/
-#define VIA_HDAC_DEVICE_ID		0x3288
-
 /* max number of SDs */
 /* ICH, ATI and VIA have 4 playback and 4 capture */
 #define ICH6_NUM_CAPTURE	4
@@ -102,10 +99,6 @@ enum {
 #define ATIHDMI_NUM_CAPTURE	0
 #define ATIHDMI_NUM_PLAYBACK	8
 
-/* TERA has 4 playback and 3 capture */
-#define TERA_NUM_CAPTURE	3
-#define TERA_NUM_PLAYBACK	4
-
 
 static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
 static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;
-- 
2.25.1

