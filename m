Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E4219D368
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 11:22:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A967168C;
	Fri,  3 Apr 2020 11:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A967168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585905739;
	bh=HndsIeMbUnlgvKj9VoGwly/yM9fjQj+xriuxL6qj6vU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hG1XqUUT+tHxoV+Xi7Mu7aZ1RHKyLe9XNWULytkcHjG/AxZx2OYDE1uNZn+ouRm9i
	 D0kY4F6QRVo1MOAKxnLTK9zEeoZvNc4I2D9kKKWCPbKIfgmwsqK2VV9i3JXXekoltE
	 7yiW0nsQG6Pw4usqQb9gP53u+ZBeMFruhgknxiqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 781AFF80349;
	Fri,  3 Apr 2020 11:15:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62820F8014C; Fri,  3 Apr 2020 11:14:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12F2EF8014C;
 Fri,  3 Apr 2020 11:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12F2EF8014C
IronPort-SDR: xF9mCpD4zAviAbk7HhHOKgjUha9bLIPMNbxyLqIB3pAbiru0OajYYi58748r1JA9RNCAxgfFMv
 +rSRbgyU9BSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 02:14:14 -0700
IronPort-SDR: 7bfm3/t4ftj3vgGOUeOmYtTNpwiUwqrMxHulQI2vzMmJk4SpoKJeKC/RlwIBrq48jvP7V2cC1y
 /M0+D2YQm3PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="451234938"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.36.113])
 by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2020 02:14:13 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 03/12] [RESEND] ASoC: SOF: VirtIO: make a function global
Date: Fri,  3 Apr 2020 11:13:57 +0200
Message-Id: <20200403091406.22381-4-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
index a4b297c..922b671 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -493,6 +493,9 @@ int sof_ipc_tx_message(struct snd_sof_ipc *ipc, u32 header,
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

