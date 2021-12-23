Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C43BE47E264
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:38:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BD9717C0;
	Thu, 23 Dec 2021 12:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BD9717C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259513;
	bh=84tANAwaci9fOct4dRZrbogwqVXaKFDkSqT4hZajzhU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XrAFDtevn0KEJYnD3KqxoNkj7llggdtOEeNqX5UUAXBHRRkx7jMe5kkjnSUskRolw
	 P6KtOdE4jccBrLu2y+RVsjlHf67WqzupZ8YrQ1hY37qXf1pjYhjK5Pi+vfJwcOTZ08
	 qruzWpIkPXaH+JAWnvhvQlOapz9ADxIUJJnzHweU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C65BF8050F;
	Thu, 23 Dec 2021 12:36:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2528EF804F2; Thu, 23 Dec 2021 12:36:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A469F80115
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A469F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AVJOOcXa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259382; x=1671795382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=84tANAwaci9fOct4dRZrbogwqVXaKFDkSqT4hZajzhU=;
 b=AVJOOcXaVGAH9Azv9XYLhEHQTcdrZIZxysMMm5+eKcQSlQVVVt2X6DhX
 PLqfuqZanZ3GzvnK491EYKlw8I/2F94xri0v5jsHExLcSb7LfqrPnJF+o
 +9T7HjSVk+BnCOX7HYLYufjoluMUv88Nmv8aBxzWz9YF4MeEOuSl+k0J6
 5Ig7ck8kePKevLQnrrh6bK7zuohi2wHy6+32JZPf1g+R/LsXIH/6QOcdP
 byIIx42eNGpkV9BCGlwZ/Q6gHMd97qbeTgxFUgqg5vzBKFH2F1+edDacA
 6Dw9xD3lxfpCzl88ldDdcQKZaqc79rlIA8oQY/HOQX2BffPUFgJDUI4SD Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180787"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180787"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065049"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:11 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 02/20] ASoC: SOF: Intel: hda-loader: Avoid re-defining the
 HDA_FW_BOOT_ATTEMPTS
Date: Thu, 23 Dec 2021 13:36:10 +0200
Message-Id: <20211223113628.18582-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

HDA_FW_BOOT_ATTEMPTS is defined in hda.h, do not define it again locally
in hda-loader.c

At the same time correct the indentation for the define in hda.h

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 1 -
 sound/soc/sof/intel/hda.h        | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index bfb0e374ebab..5f5f396f4fb8 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -23,7 +23,6 @@
 #include "../ops.h"
 #include "hda.h"
 
-#define HDA_FW_BOOT_ATTEMPTS	3
 #define HDA_CL_STREAM_FORMAT 0x40
 
 static struct hdac_ext_stream *cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 5b4d59647a1d..03a6bb7a165c 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -273,7 +273,7 @@
 #define BXT_D0I3_DELAY 5000
 
 #define FW_CL_STREAM_NUMBER		0x1
-#define HDA_FW_BOOT_ATTEMPTS	3
+#define HDA_FW_BOOT_ATTEMPTS		3
 
 /* ADSPCS - Audio DSP Control & Status */
 
-- 
2.34.1

