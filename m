Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0523A392E10
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 14:34:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94F6A170E;
	Thu, 27 May 2021 14:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94F6A170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622118880;
	bh=R7MMLXIjfT/68BW2TxlBHirKNmf2GR1zJxHgDtJcOk8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LZS+OJ7QZnyLhiErp7vSOFrNdRRSZfC5FRvr4AjwCLdKDyLx2sssgPvoB6GX+aCE2
	 fsO3clcl5u+B7uZXxXO9trn2znEmTF+gnX3NdydvZ+KE9iTn7l0xbtzvG+BDb1+9eI
	 zE5TP1ZsefSepL3MsKlVbmxOAN8oAFz2Q1xnogKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03163F80149;
	Thu, 27 May 2021 14:33:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D161F80147; Thu, 27 May 2021 14:33:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 554FEF800EA
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 14:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 554FEF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="zqSiWJOl"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="KEGpA4IL"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9E4EF6DC;
 Thu, 27 May 2021 08:32:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 27 May 2021 08:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=9FGNKz+Vm9myUhmzb3m2hJebRJ
 ti/oPenAX8rqUTJbc=; b=zqSiWJOlvdHQaqO12HE1QvZwhYuHVvkqGB+mkdDpgF
 Sq04sxRCNEGnzvhO+n/UMz+S0HMSLXyjDlg7OFMxWPExOK2eJ5n+f2biPD9iRYor
 NZB8ZP33qM0rMMYw7iHMiU2Q6dbz1oW+W2/KLXY/NlyT+YY1+9MuhKiR5ZMnXIZC
 lWmLfIHw9Ixbu69MuKODmyocx5uo08V5IWn+dafzJ8z7xWfXfd8KGQ8YuypnCtb2
 6X38FgLFzp9yqf8s2Ie1J3QUG71jK+kYfnAF5Gp4QoLgfb1c5nxKa2tUslt+F6jh
 M5cQCDkyDdvi4Nj+99Q/Cs8OmADHu+61g15aH3S6+fTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9FGNKz+Vm9myUhmzb
 3m2hJebRJti/oPenAX8rqUTJbc=; b=KEGpA4ILTdTPqNfWJONwiJb+sPc1RppCc
 D/T4mYhVCPBCOXyByUjitfkYJM4J22EzIPBucpe8OR2Vo4zkiiT1OHTKe9hjDe3i
 UJqaEmxEIVvA86kT9pPh480mkqP86PJZHKyOrZbEvAFe6rS9flz2vFo6HqXFK9yA
 usks3b748EkXjAKF3jRYoCwGzjzkcUJd/BCbeTUg4mlpY5blvUftBgbqg4q53XyR
 2V5e4DGHs30uitg73SDvYZPqXV8/0G9Q3OLOS/zsB00NgBhkYYPSEMbw1SrYTftY
 V9tm4uUMXbkApb31aLvfgcz4F/6/723ATnXoIIK6c4WGb4gTNSkpg==
X-ME-Sender: <xms:epGvYNIwPuTJxge36FnsSc79eNrMIcqvH0hRNlkNWuo8jdEXCnwgDw>
 <xme:epGvYJKR5XNaDTV8gK1na_COpFlPSc7Ab5ive9cOSvV_tyERQtkYl6WQsTGkZu4G7
 pmHNJHU53YXQE-1w_E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekhedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepteeiuefhjeekke
 efheetieekvdegfefhgffgvdeiheehhfehiedvhffgjeejuddunecuffhomhgrihhnpehk
 vghrnhgvlhdrohhrghenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghk
 rghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:epGvYFt_gF9MeDTPSEEPWC-WfhHUnO7Q_Aif3rTwzenaciGmwGyNaQ>
 <xmx:epGvYOZn6bJX7-gd7xeDnGs6xq8M361XNG5b94ZU5N_WC6wbtLhohw>
 <xmx:epGvYEalBVk_CkHdwxnY205nZvBMpStMVj44qlviuio97aSCZhgZNg>
 <xmx:e5GvYNAMHjTkDfUIvkB5GzI096NFJJPJ429IVqqsPe9tmUor2mWl7Q>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 27 May 2021 08:32:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-lib: support NO_PERIOD_WAKEUP in ALSA PCM
 runtime
Date: Thu, 27 May 2021 21:32:53 +0900
Message-Id: <20210527123253.174315-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

Drivers of ALSA firewire stack can process packets for IT/IR context in
process context when the process operates ALSA PCM character device by
calling ioctl(2) with some requests. The ioctl requests are:

 * SNDRV_PCM_IOCTL_HWSYNC
 * SNDRV_PCM_IOCTL_SYNC_PTR
 * SNDRV_PCM_IOCTL_REWIND
 * SNDRV_PCM_IOCTL_FORWARD
 * SNDRV_PCM_IOCTL_WRITEI_FRAMES
 * SNDRV_PCM_IOCTL_READI_FRAMES
 * SNDRV_PCM_IOCTL_WRITEN_FRAMES
 * SNDRV_PCM_IOCTL_READN_FRAMES

This means that general application can process PCM frames apart from
hardware IRQ invocation, even if they are programmed by either IRQ-based
scheduling model or Timer-based scheduling model.

This commit add support for Timer-based scheduling model by allowing
PCM runtime to suppress both process wakeup per period and scheduling
hardware IRQ.

SNDRV_PCM_INFO_BATCH is obsoleted since ALSA IEC 61883-1/6 packet streaming
engine can report the number of transferred PCM frames within PCM period
boundary. The granularity equals to SYT_INTERVAL in blocking transmission.
In non-blocking transmission, it doesn't equal to SYT_INTERVAL but doesn't
exceed.

This patch is tested with PulseAudio, and --sched-model option of axfer
with fix against the issue reported at:

 * https://lore.kernel.org/alsa-devel/687f9871-7484-1370-04d1-9c968e86f72b@linux.intel.com/#r

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 68ffbc33f692..8e72e7f4c082 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -191,14 +191,13 @@ int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 	unsigned int maximum_usec_per_period;
 	int err;
 
-	hw->info = SNDRV_PCM_INFO_BATCH |
-		   SNDRV_PCM_INFO_BLOCK_TRANSFER |
+	hw->info = SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		   SNDRV_PCM_INFO_INTERLEAVED |
 		   SNDRV_PCM_INFO_JOINT_DUPLEX |
 		   SNDRV_PCM_INFO_MMAP |
-		   SNDRV_PCM_INFO_MMAP_VALID;
+		   SNDRV_PCM_INFO_MMAP_VALID |
+		   SNDRV_PCM_INFO_NO_PERIOD_WAKEUP;
 
-	/* SNDRV_PCM_INFO_BATCH */
 	hw->periods_min = 2;
 	hw->periods_max = UINT_MAX;
 
@@ -503,7 +502,12 @@ static void update_pcm_pointers(struct amdtp_stream *s,
 	s->pcm_period_pointer += frames;
 	if (s->pcm_period_pointer >= pcm->runtime->period_size) {
 		s->pcm_period_pointer -= pcm->runtime->period_size;
-		queue_work(system_highpri_wq, &s->period_work);
+
+		// The program in user process should periodically check the status of intermediate
+		// buffer associated to PCM substream to process PCM frames in the buffer, instead
+		// of receiving notification of period elapsed by poll wait.
+		if (!pcm->runtime->no_period_wakeup)
+			queue_work(system_highpri_wq, &s->period_work);
 	}
 }
 
@@ -949,6 +953,7 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	unsigned int event_count = s->ctx_data.rx.event_count;
 	unsigned int pkt_header_length;
 	unsigned int packets;
+	bool need_hw_irq;
 	int i;
 
 	if (s->packet_index < 0)
@@ -968,6 +973,16 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 	else
 		pkt_header_length = 0;
 
+	if (s == d->irq_target) {
+		// At NO_PERIOD_WAKEUP mode, the packets for all IT/IR contexts are processed by
+		// the tasks of user process operating ALSA PCM character device by calling ioctl(2)
+		// with some requests, instead of scheduled hardware IRQ of an IT context.
+		struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
+		need_hw_irq = !pcm || !pcm->runtime->no_period_wakeup;
+	} else {
+		need_hw_irq = false;
+	}
+
 	for (i = 0; i < packets; ++i) {
 		const struct pkt_desc *desc = s->pkt_descs + i;
 		struct {
@@ -984,7 +999,7 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
 			event_count += desc->data_blocks;
 			if (event_count >= events_per_period) {
 				event_count -= events_per_period;
-				sched_irq = true;
+				sched_irq = need_hw_irq;
 			}
 		}
 
-- 
2.27.0

