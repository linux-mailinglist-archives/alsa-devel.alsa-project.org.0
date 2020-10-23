Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B394296823
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 02:40:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31179180E;
	Fri, 23 Oct 2020 02:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31179180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603413639;
	bh=S9f9z05h/SWf3fythVs9BIIf/V6mZBGSFYwBeVcooYk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kvH5Ak0ZHdmfXJWHSbh33om83v43z2tpx9ifOSByhgZPS0T48tfKskMdaQEMMyKnK
	 4BxaYRTnIjWrZuSyBquU8+Q/fbPqSB/+68xzd/HRlsJTpyt4nTn1G4Duwm3mSIgNEe
	 jKRZHIyJ/VicX8aCOLJ+n7LLYYZV4pvTMotIK4DU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB44F804FF;
	Fri, 23 Oct 2020 02:35:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DF0DF804D8; Fri, 23 Oct 2020 02:35:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AA09F804B2
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 02:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AA09F804B2
IronPort-SDR: ryHYvR+R3feiLSgl6m9U6/IKJD89fhfU0T+S6dp0OyGQUqLjkc8Lkvani/QRI/2wJN+2bjCztJ
 7DjY7Ub/rrPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="165020494"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="165020494"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 17:35:29 -0700
IronPort-SDR: AmNrptTHi/qxndARhN2/6LgX9EtDqEMC7c+p3z+rBNqomsEsGFcmp6cWKzFipvTpj3fv7+DjD3
 tghWbrJuAywg==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="302505834"
Received: from dmert-dev.jf.intel.com ([10.166.241.5])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 17:35:28 -0700
From: Dave Ertman <david.m.ertman@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 10/10] ASoC: SOF: Intel: CNL: register probes client
Date: Thu, 22 Oct 2020 17:33:38 -0700
Message-Id: <20201023003338.1285642-11-david.m.ertman@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023003338.1285642-1-david.m.ertman@intel.com>
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
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

Register the client device for probes support on the
CNL platform. Creating this client device alleviates the
need for modifying the sound card definitions in the existing
machine drivers to add support for the new probes feature in
the FW. This will result in the creation of a separate sound
card that can be used for audio data extraction from user
specified points in the audio pipeline.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
---
 sound/soc/sof/intel/cnl.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 20afb622c315..6d15b871dc17 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -19,6 +19,7 @@
 #include "hda.h"
 #include "hda-ipc.h"
 #include "../sof-audio.h"
+#include "../sof-client.h"
 #include "intel-client.h"
 
 static const struct snd_sof_debugfs_map cnl_dsp_debugfs[] = {
@@ -233,12 +234,26 @@ void cnl_ipc_dump(struct snd_sof_dev *sdev)
 
 static int cnl_register_clients(struct snd_sof_dev *sdev)
 {
-	return intel_register_ipc_test_clients(sdev);
+	int ret;
+
+	ret = intel_register_ipc_test_clients(sdev);
+	if (ret < 0)
+		return ret;
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
+	return sof_client_dev_register(sdev, "probes", 0);
+#endif
+
+	return 0;
 }
 
 static void cnl_unregister_clients(struct snd_sof_dev *sdev)
 {
 	intel_unregister_ipc_test_clients(sdev);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
+	sof_client_dev_unregister(sdev, "probes", 0);
+#endif
 }
 
 /* cannonlake ops */
@@ -409,3 +424,4 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 };
 EXPORT_SYMBOL_NS(jsl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_CLIENT);
+MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
-- 
2.26.2

