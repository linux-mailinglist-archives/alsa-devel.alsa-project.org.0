Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9897912373C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 21:26:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F04C165E;
	Tue, 17 Dec 2019 21:25:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F04C165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576614373;
	bh=dZKK19m/mEhGzBSHfHQyhkJi6K2/6r0Wb6oQGPCZVQo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QeO9s2Atl/d2rbOUolJyPBjveDi2QipnyJJGT74cqICyT+8z4kFw/FE+jP8+BUOuq
	 rDScu9H8iKgJIs4pxGiTpLALMCe3+Rr2VOrPwIgZXTDAC9Zya02qdmHBOtF6u+QLmD
	 YWrLuuDfeJimqBWT1F70uSvRMoWqcQ7GyvahUg9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0B08F80276;
	Tue, 17 Dec 2019 21:23:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06113F80272; Tue, 17 Dec 2019 21:23:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DC7EF80234
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 21:22:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DC7EF80234
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 12:22:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="266679225"
Received: from smcdonal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.83.42])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2019 12:22:49 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 14:22:24 -0600
Message-Id: <20191217202231.18259-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191217202231.18259-1-pierre-louis.bossart@linux.intel.com>
References: <20191217202231.18259-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/8] ASoC: SOF: Intel: add module namespace for
	legacy IPC
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

The legacy IPC routines are only used by broadwell and baytrail
modules, import them as needed and make sure other modules cannot load
them.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/bdw.c       | 1 +
 sound/soc/sof/intel/byt.c       | 1 +
 sound/soc/sof/intel/intel-ipc.c | 8 ++++----
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index c09885c0eb7d..39d1c8c7cddf 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -642,3 +642,4 @@ const struct sof_intel_dsp_desc bdw_chip_info = {
 EXPORT_SYMBOL(bdw_chip_info);
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index d43098a962c0..b214b12fdcda 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -877,3 +877,4 @@ EXPORT_SYMBOL(cht_chip_info);
 #endif /* CONFIG_SND_SOC_SOF_BAYTRAIL */
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
diff --git a/sound/soc/sof/intel/intel-ipc.c b/sound/soc/sof/intel/intel-ipc.c
index 4edd92151fd5..e935f70d611b 100644
--- a/sound/soc/sof/intel/intel-ipc.c
+++ b/sound/soc/sof/intel/intel-ipc.c
@@ -39,7 +39,7 @@ void intel_ipc_msg_data(struct snd_sof_dev *sdev,
 			sof_mailbox_read(sdev, stream->posn_offset, p, sz);
 	}
 }
-EXPORT_SYMBOL(intel_ipc_msg_data);
+EXPORT_SYMBOL_NS(intel_ipc_msg_data, SND_SOC_SOF_INTEL_HIFI_EP_IPC);
 
 int intel_ipc_pcm_params(struct snd_sof_dev *sdev,
 			 struct snd_pcm_substream *substream,
@@ -60,7 +60,7 @@ int intel_ipc_pcm_params(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-EXPORT_SYMBOL(intel_ipc_pcm_params);
+EXPORT_SYMBOL_NS(intel_ipc_pcm_params, SND_SOC_SOF_INTEL_HIFI_EP_IPC);
 
 int intel_pcm_open(struct snd_sof_dev *sdev,
 		   struct snd_pcm_substream *substream)
@@ -75,7 +75,7 @@ int intel_pcm_open(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-EXPORT_SYMBOL(intel_pcm_open);
+EXPORT_SYMBOL_NS(intel_pcm_open, SND_SOC_SOF_INTEL_HIFI_EP_IPC);
 
 int intel_pcm_close(struct snd_sof_dev *sdev,
 		    struct snd_pcm_substream *substream)
@@ -87,6 +87,6 @@ int intel_pcm_close(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-EXPORT_SYMBOL(intel_pcm_close);
+EXPORT_SYMBOL_NS(intel_pcm_close, SND_SOC_SOF_INTEL_HIFI_EP_IPC);
 
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
