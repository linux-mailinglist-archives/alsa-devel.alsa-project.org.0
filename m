Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF732B205B
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 17:25:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8513D1881;
	Fri, 13 Nov 2020 17:25:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8513D1881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605284756;
	bh=zH086E0SPHDVKj7rTRVLRQr93m7r/VE02z/BZ3j2M2Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CCvcFwLejeE07nmPsy1toM222FF5oABtWAlGrjm6lv3As252kp+En9rxxUXgqy0FM
	 SilmAf5uR4xVd48iQmPAQ02h/m7MggOOwsaQh9fRcgd9mCMiVGylf73kVvCEz3X0Ve
	 3Zg9kTaFizDjl2pKjSuZB9ZnW4bEA4OK6zghfl8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E4B2F802C4;
	Fri, 13 Nov 2020 17:22:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C1CFF804D2; Fri, 13 Nov 2020 17:22:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BCEBF800E9
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 17:21:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BCEBF800E9
IronPort-SDR: Zfh2EkPqqD2l4wWXlzsS1pfNP21Ul72wGK7/Hhemn7VVOdBtsvWksaGotqt4Sp2ne4lDUxauGJ
 3y3ijuqj+EbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9804"; a="150344711"
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="150344711"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 08:21:46 -0800
IronPort-SDR: 2MmFdMtT6yYVz5FGgQEOiMIJxYV3KwnInv6dptNlGOcfEbOKoPk17rAu4QxF4iFLNi5Pm4sCMq
 fQVOEHgT3gSA==
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="366767254"
Received: from dmert-dev.jf.intel.com ([10.166.241.5])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 08:21:45 -0800
From: Dave Ertman <david.m.ertman@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 08/10] ASoC: SOF: compress: move and export
 sof_probe_compr_ops
Date: Fri, 13 Nov 2020 08:18:57 -0800
Message-Id: <20201113161859.1775473-9-david.m.ertman@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201113161859.1775473-1-david.m.ertman@intel.com>
References: <20201113161859.1775473-1-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: parav@mellanox.com, tiwai@suse.de, netdev@vger.kernel.org,
 leonro@nvidia.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, fred.oh@linux.intel.com,
 linux-rdma@vger.kernel.org, dledford@redhat.com, broonie@kernel.org,
 jgg@nvidia.com, gregkh@linuxfoundation.org, kuba@kernel.org,
 dan.j.williams@intel.com, shiraz.saleem@intel.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org, kiran.patil@intel.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

sof_probe_compr_ops are not platform-specific. So move
it to common compress code and export the symbol. The
compilation of the common compress code is already dependent
on the selection of CONFIG_SND_SOC_SOF_DEBUG_PROBES, so no
need to check the Kconfig section for defining sof_probe_compr_ops
again.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
---
 sound/soc/sof/compress.c      |  9 +++++++++
 sound/soc/sof/compress.h      |  1 +
 sound/soc/sof/intel/hda-dai.c | 12 ------------
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 2d4969c705a4..0443f171b4e7 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -13,6 +13,15 @@
 #include "ops.h"
 #include "probe.h"
 
+struct snd_soc_cdai_ops sof_probe_compr_ops = {
+	.startup	= sof_probe_compr_open,
+	.shutdown	= sof_probe_compr_free,
+	.set_params	= sof_probe_compr_set_params,
+	.trigger	= sof_probe_compr_trigger,
+	.pointer	= sof_probe_compr_pointer,
+};
+EXPORT_SYMBOL(sof_probe_compr_ops);
+
 struct snd_compress_ops sof_probe_compressed_ops = {
 	.copy		= sof_probe_compr_copy,
 };
diff --git a/sound/soc/sof/compress.h b/sound/soc/sof/compress.h
index ca8790bd4b13..689c83ac8ffc 100644
--- a/sound/soc/sof/compress.h
+++ b/sound/soc/sof/compress.h
@@ -13,6 +13,7 @@
 
 #include <sound/compress_driver.h>
 
+extern struct snd_soc_cdai_ops sof_probe_compr_ops;
 extern struct snd_compress_ops sof_probe_compressed_ops;
 
 int sof_probe_compr_open(struct snd_compr_stream *cstream,
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index c6cb8c212eca..1acec1176986 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -400,18 +400,6 @@ static const struct snd_soc_dai_ops hda_link_dai_ops = {
 	.prepare = hda_link_pcm_prepare,
 };
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
-#include "../compress.h"
-
-static struct snd_soc_cdai_ops sof_probe_compr_ops = {
-	.startup	= sof_probe_compr_open,
-	.shutdown	= sof_probe_compr_free,
-	.set_params	= sof_probe_compr_set_params,
-	.trigger	= sof_probe_compr_trigger,
-	.pointer	= sof_probe_compr_pointer,
-};
-
-#endif
 #endif
 
 /*
-- 
2.26.2

