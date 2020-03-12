Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1C0183A5F
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 21:10:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E06971752;
	Thu, 12 Mar 2020 21:09:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E06971752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584043850;
	bh=JWanmVboC7E7RoYUCrRlSzGwjfx+VMqLPo1vic6rUr0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vuwc0Rt76bkIJfeZ1ppWmCSQZJKhnQ1AeG3qHzYHIVPB5JmjtDa7jT/hmsKGOkYd7
	 3ziFEJeA7eQvlS/W3gT2eaR0XsJ021mNnuzaQJXtOiyC8kqQqo++NwUCG7w7DaTHhm
	 ZRLiH93Gl9769CKP06XAKkKd04sc1ZiiJqm9tjyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88E17F802A8;
	Thu, 12 Mar 2020 21:06:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8A8FF801D9; Thu, 12 Mar 2020 21:06:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27369F8020C
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 21:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27369F8020C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 13:06:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="444063064"
Received: from unknown (HELO pbossart-mobl3.amr.corp.intel.com)
 ([10.251.241.169])
 by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 13:06:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/6] ASoC: SOF: Intel: hda: remove unnecessary ROM IPC filter
 function
Date: Thu, 12 Mar 2020 15:06:20 -0500
Message-Id: <20200312200622.24477-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312200622.24477-1-pierre-louis.bossart@linux.intel.com>
References: <20200312200622.24477-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Amery Song <chao.song@intel.com>
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

From: Amery Song <chao.song@intel.com>

The HDA_DSP_IPC_PURGE_FW IPC from ROM is already handled in
cl_dsp_init(), and as IPC IRQ is disabled at this stage, this
IPC will be never received in the IRQ thread. The function
hda_dsp_ipc_is_sof for filtering the ROM IPC can be removed
safely.

Signed-off-by: Amery Song <chao.song@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Keyon <yang.jie@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ipc.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 922052883b0a..a60528495551 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -125,12 +125,6 @@ void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
 
 }
 
-static bool hda_dsp_ipc_is_sof(uint32_t msg)
-{
-	return (msg & (HDA_DSP_IPC_PURGE_FW | 0xf << 9)) != msg ||
-		(msg & HDA_DSP_IPC_PURGE_FW) != HDA_DSP_IPC_PURGE_FW;
-}
-
 /* IPC handler thread */
 irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 {
@@ -176,11 +170,9 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 		 */
 		spin_lock_irq(&sdev->ipc_lock);
 
-		/* handle immediate reply from DSP core - ignore ROM messages */
-		if (hda_dsp_ipc_is_sof(msg)) {
-			hda_dsp_ipc_get_reply(sdev);
-			snd_sof_ipc_reply(sdev, msg);
-		}
+		/* handle immediate reply from DSP core */
+		hda_dsp_ipc_get_reply(sdev);
+		snd_sof_ipc_reply(sdev, msg);
 
 		/* wake up sleeper if we are loading code */
 		if (sdev->code_loading)	{
-- 
2.20.1

