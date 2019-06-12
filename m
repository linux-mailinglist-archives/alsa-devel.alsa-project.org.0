Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B6A42CF2
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:04:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E32F017B5;
	Wed, 12 Jun 2019 19:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E32F017B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560359083;
	bh=LZuxnsPzlcukukZDV6NFz6Pbx38HgqKk9crVMjKJFa0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T2QO5eid4dddurK8lXU5bcEzfjTxI9lX606C3dai+BEBq98hfCnkrcsMh2HkcLwqB
	 hRKFhPoQSofbxme4zfaQAPybDW4n/+6FZbpx2k83uvzTIY6kpNVnzEL25smp8iqYi6
	 JIVb/3jADi+LdDOB/hgcJAgBHOKuV62qv5kXdHeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 990A5F8973A;
	Wed, 12 Jun 2019 19:02:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBF4FF89730; Wed, 12 Jun 2019 19:02:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24E6BF896E0
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24E6BF896E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:02:04 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2019 10:02:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:01:47 -0500
Message-Id: <20190612170148.15327-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612170148.15327-1-pierre-louis.bossart@linux.intel.com>
References: <20190612170148.15327-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/4] ASoC: SOF: Add DMIC token for unmute gain
	ramp time
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

From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>

The settling time of DMIC DC level is both platform and used
microphone model specific. The unmute gain ramp is used to conceal
most of the large DC level seen in beginning of capture. This patch
adds into the DMIC DAI IPC struct a new field called unmute_ramp_time
and a new token SOF_TKN_INTEL_DMIC_UNMUTE_RAMP_TIME. The value is the
ramp length in milliseconds (ms).

The ABI minor version is incremented for this backwards compatible
change.

Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/dai-intel.h   | 3 ++-
 include/uapi/sound/sof/abi.h    | 2 +-
 include/uapi/sound/sof/tokens.h | 1 +
 sound/soc/sof/topology.c        | 4 ++++
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
index 4bd83f7adddf..4bb8ee138ba7 100644
--- a/include/sound/sof/dai-intel.h
+++ b/include/sound/sof/dai-intel.h
@@ -167,9 +167,10 @@ struct sof_ipc_dai_dmic_params {
 
 	uint32_t wake_up_time;      /**< Time from clock start to data (us) */
 	uint32_t min_clock_on_time; /**< Min. time that clk is kept on (us) */
+	uint32_t unmute_ramp_time;  /**< Length of logarithmic gain ramp (ms) */
 
 	/* reserved for future use */
-	uint32_t reserved[6];
+	uint32_t reserved[5];
 
 	/**< variable number of pdm controller config */
 	struct sof_ipc_dai_dmic_pdm_ctrl pdm[0];
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index 92eee681bc62..4a9c24434f42 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 7
+#define SOF_ABI_MINOR 8
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 53ea94bf1c08..dc1b27daaac6 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -85,6 +85,7 @@
 #define SOF_TKN_INTEL_DMIC_NUM_PDM_ACTIVE	605
 #define SOF_TKN_INTEL_DMIC_SAMPLE_RATE		608
 #define SOF_TKN_INTEL_DMIC_FIFO_WORD_LENGTH	609
+#define SOF_TKN_INTEL_DMIC_UNMUTE_RAMP_TIME_MS  610
 
 /* DMIC PDM */
 #define SOF_TKN_INTEL_DMIC_PDM_CTRL_ID		700
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index bbad8053b1bc..8e00f829bfdb 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -779,6 +779,10 @@ static const struct sof_topology_token dmic_tokens[] = {
 	{SOF_TKN_INTEL_DMIC_FIFO_WORD_LENGTH,
 		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
 		offsetof(struct sof_ipc_dai_dmic_params, fifo_bits), 0},
+	{SOF_TKN_INTEL_DMIC_UNMUTE_RAMP_TIME_MS,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_dmic_params, unmute_ramp_time), 0},
+
 };
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
