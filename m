Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F002728DF2
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 01:43:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 708D61677;
	Fri, 24 May 2019 01:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 708D61677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558654984;
	bh=8CADKq71hqVeAS71fEarTzn7yb96+KlVxgs6wZkR2R4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ep+IXByyhuI5RJs1N+PgDJwpqSLsZHKzPBBjDuOj1EC4vyTLPP4r/qAkcSnf8IwGA
	 ApY9tAUEIem1TKiCm5+zLE7tJ7oxih5aU8Jn0OFI5lb91+0okq/HGYT3ITw/226wCv
	 E1aJNZiwKTFsIFEogpvYlI/3WFQ/S9k1hqTqZnK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19532F89718;
	Fri, 24 May 2019 01:40:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B23CCF89715; Fri, 24 May 2019 01:40:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 528F6F89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 01:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 528F6F89625
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 16:40:32 -0700
X-ExtLoop1: 1
Received: from mgastonx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.128.35])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2019 16:40:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 23 May 2019 18:39:46 -0500
Message-Id: <20190523233951.31122-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [RFC PATCH 1/6] ASoC: Intel: boards: remove
	unnecessary inclusion of skl.h
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

We've used a standard interface for machine drivers for some time now,
there is no need for this dependency on a Skylake-specific header

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 1 -
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 1 -
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 1 -
 sound/soc/intel/boards/skl_hda_dsp_common.c   | 1 -
 4 files changed, 4 deletions(-)

diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index 6b677b5bcdcd..7180100a9084 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -17,7 +17,6 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
-#include "../skylake/skl.h"
 #include "../../codecs/rt5682.h"
 #include "../../codecs/hdac_hdmi.h"
 
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 07491a0f8fb8..4e5db2241fb9 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -19,7 +19,6 @@
 #include <sound/soc.h>
 #include "../../codecs/da7219.h"
 #include "../../codecs/hdac_hdmi.h"
-#include "../skylake/skl.h"
 #include "../../codecs/da7219-aad.h"
 
 #define KBL_DIALOG_CODEC_DAI "da7219-hifi"
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index 1efe7fdad2cb..d6765c359449 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -19,7 +19,6 @@
 #include <sound/soc.h>
 #include "../../codecs/da7219.h"
 #include "../../codecs/hdac_hdmi.h"
-#include "../skylake/skl.h"
 #include "../../codecs/da7219-aad.h"
 
 #define KBL_DIALOG_CODEC_DAI	"da7219-hifi"
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index 8b68f41a5b88..82f10bf2abb2 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -12,7 +12,6 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "../../codecs/hdac_hdmi.h"
-#include "../skylake/skl.h"
 #include "skl_hda_dsp_common.h"
 
 #define NAME_SIZE	32
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
