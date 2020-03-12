Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5318339A
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 15:48:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1DE91716;
	Thu, 12 Mar 2020 15:47:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1DE91716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584024491;
	bh=ybpbr5GXHeRySoqZY2JCTcxqJ1VX8O4ghBXPZea7xHI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JPuvw33Zc38sAOMRd0Jwe1SR/YZu9TtkEa+obCN/8voYkYybPPjvIbex8OqT4QQ7w
	 p3K6lUXnntHLcTg7j2f796eq3GYwzj02nQXrHZxCLgCmVsssucQEMgsGQmeen01OND
	 po/HbNau4UlRUhz0fZO/HJa3P7VrOf3SnHqJ1xgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB11FF802DC;
	Thu, 12 Mar 2020 15:45:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38F20F8029A; Thu, 12 Mar 2020 15:44:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EA62F80086;
 Thu, 12 Mar 2020 15:44:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EA62F80086
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 07:44:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="443957478"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.40.3])
 by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 07:44:36 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/14] ASoC: SOF: VirtIO: make a function global
Date: Thu, 12 Mar 2020 15:44:18 +0100
Message-Id: <20200312144429.17959-4-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
References: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 sound-open-firmware@alsa-project.org
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

sof_ipc_tx_message_unlocked() will be needed for VirtIO code, make
it global.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/ipc.c      | 7 ++++---
 sound/soc/sof/sof-priv.h | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 1c67949..cf57085 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -231,9 +231,9 @@ static int tx_wait_done(struct snd_sof_ipc *ipc, struct snd_sof_ipc_msg *msg,
 }
 
 /* send IPC message from host to DSP */
-static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
-				       void *msg_data, size_t msg_bytes,
-				       void *reply_data, size_t reply_bytes)
+int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
+				void *msg_data, size_t msg_bytes,
+				void *reply_data, size_t reply_bytes)
 {
 	struct snd_sof_dev *sdev = ipc->sdev;
 	struct snd_sof_ipc_msg *msg;
@@ -284,6 +284,7 @@ static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
 
 	return ret;
 }
+EXPORT_SYMBOL(sof_ipc_tx_message_unlocked);
 
 /* send IPC message from host to DSP */
 int sof_ipc_tx_message(struct snd_sof_ipc *ipc, u32 header,
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 5d16f66..e029640 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -498,6 +498,9 @@ int sof_ipc_tx_message(struct snd_sof_ipc *ipc, u32 header,
 int sof_ipc_tx_message_no_pm(struct snd_sof_ipc *ipc, u32 header,
 			     void *msg_data, size_t msg_bytes,
 			     void *reply_data, size_t reply_bytes);
+int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
+				void *msg_data, size_t msg_bytes,
+				void *reply_data, size_t reply_bytes);
 
 /*
  * Trace/debug
-- 
1.9.3

