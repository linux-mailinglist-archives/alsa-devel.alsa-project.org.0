Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22589596F47
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 15:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAE8C1671;
	Wed, 17 Aug 2022 15:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAE8C1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660741993;
	bh=jN4kHoRUJSHbesemixiddrBAK3WzhEvbf8eObKfKwbU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o9oqUNIcNn7PqQdkDIog4wNHCLphtR5wbHiJPxDMzvcF7Jfx86kDZsI0BAuzrDGTg
	 PtW4VbFtZ2G60ooWKG1QSXYQxQtY2AILix426t/CdXRt2h3U2SgV2geqgqEaWYRfGS
	 Xc0GfNl5WNWR8VwLiGy7XcvfpQ6eu2IP0wV41bcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6165FF80552;
	Wed, 17 Aug 2022 15:11:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD4CAF8053E; Wed, 17 Aug 2022 15:11:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE6AAF80518
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 15:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE6AAF80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mUr8Rp7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660741878; x=1692277878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jN4kHoRUJSHbesemixiddrBAK3WzhEvbf8eObKfKwbU=;
 b=mUr8Rp7zyvp4AIBFSa5+pCL7PQBUhOSkKNosHXUia1nACMViejKQ9wK8
 iksVZpJTUkpvfHsXHAF7Oskwe/Gd8JF6WaeohzSNb5GhYPVFcdPPoy92L
 wDUHq8lvCuwZyz0E/pc32xsUDtW0cV/mqR35jc9CpL+rK9F45RYViGVmV
 eRL1gVsUiDLwiEMePIU+vV88lS5ZR4YkH4q4mK1/IS+6i+r/nXQlHT7Tr
 BCMRR2UxIKOEEqVml+PUt5nBUlTWOIbdMmRmlG9E9JhH3b+Shp6pKjxYm
 YIkOOKTycbZG+TcQy4x0oae5c4QQ8/wr0oiHNu6QMZQVkTzrdcUco4Xjk g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="318496089"
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="318496089"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 06:11:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="667609981"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2022 06:11:14 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ALSA: hda: Remove unused defines
Date: Wed, 17 Aug 2022 15:11:37 +0200
Message-Id: <20220817131137.3978523-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817131137.3978523-1-amadeuszx.slawinski@linux.intel.com>
References: <20220817131137.3978523-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, linux-kernel@vger.kernel.org,
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

