Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A6D2FB2C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 13:53:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52EAB86E;
	Thu, 30 May 2019 13:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52EAB86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559217186;
	bh=ThQghePiXCzOAYCD/tKrUyxiYGZG6kFiIi6SLgr3oq8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q6OrA1JwaSKMxd8S3RAWFpLXH8doxNvTFrOfLOtvCkXedTcHeMxeJ2dnYYTFermJO
	 7VXWHrZsNHC/ldzXvRNLqzKKvLNO8hlC7A/AIhoDrhVyCQsRAttsTDhnOxtunjTOaR
	 VDb35F3Ui+YcVYyXltFu7Bnkx6K6grLMZWtcVhnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A217DF896EB;
	Thu, 30 May 2019 13:50:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D497DF8972A; Thu, 30 May 2019 13:50:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACDACF896F8
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 13:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACDACF896F8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 04:50:37 -0700
X-ExtLoop1: 1
Received: from rjcavan-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.141.25])
 by FMSMGA003.fm.intel.com with ESMTP; 30 May 2019 04:50:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 30 May 2019 06:50:13 -0500
Message-Id: <20190530115015.5677-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190530115015.5677-1-pierre-louis.bossart@linux.intel.com>
References: <20190530115015.5677-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/5] ASoC: Intel: boards: remove dependency on
	asm/platform_sst_audio.h
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is not needed. Probably a copy/paste that was never removed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_cx2072x.c | 1 -
 sound/soc/intel/boards/bytcht_da7213.c  | 1 -
 sound/soc/intel/boards/bytcht_es8316.c  | 1 -
 3 files changed, 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index b21b0e7f981a..4b985b393dae 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <asm/platform_sst_audio.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/jack.h>
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index 4decba338156..9091ee697fbe 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -23,7 +23,6 @@
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <asm/platform_sst_audio.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index d08715ac3945..1f319b2a835f 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -30,7 +30,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <asm/platform_sst_audio.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
