Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFE3395415
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 04:54:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F401F84B;
	Mon, 31 May 2021 04:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F401F84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622429678;
	bh=4gRZ4qRqPkHvvZRFWJDfXPgUMUt0tzz8L8Pdb+OPI8o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nFtcLol1dD0fQ5UqcNrplv6qgcmW+nYty+sUnZ9tmDnckUDhkNLRAYKX3VVxYpmLA
	 V89qihhEPf+F1fzp1WT65QvkJkGb3JVfntlZPaZ5QlP2ryrnMp/iBS873UBQb7rtVe
	 TGIDcE03Ua7IDHumUzWFK4GD0di4rFua7DjbqRxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99D64F804D0;
	Mon, 31 May 2021 04:51:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C706F80161; Mon, 31 May 2021 04:51:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87A61F80161
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 04:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87A61F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="yFiB8Jhp"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Xh917GLK"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B2DB85C007A;
 Sun, 30 May 2021 22:51:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 30 May 2021 22:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=qHbSruROp/+oa
 9Tcoi0XwY2p7XRXm6YocMyxo7fIxqY=; b=yFiB8Jhpnd/sDh8QieDWDrljBxeL0
 teg6APT2nrWi8bp9Wml38MxBfmDuM26lqfvxjsUf7kCXZ2FUhKpjVut09pLXzGJa
 eEnsDrw+bW+HZkLaunm7BpadVCiMeQ9SSS/6VinDSlNEqpuB7+4r/bZq2HGW+5Qu
 JJ+bqItHGqd/EqlHdcwvIuu3SZSOWzmV93FALrTd0Z1UyrJFTqtZ1J8OL5cKKD3a
 BJHBGwRQmH3AY5eRgR6YX0k++dGLDK72ZnyU2nxx/3pKmzPE6jjVfjkqF+CgaJQq
 FqPj5ZZgqQRAd7LDLvPTfc4rCp4JgoO1mFcKsIpIIJ45k//Q9IBs0j0AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=qHbSruROp/+oa9Tcoi0XwY2p7XRXm6YocMyxo7fIxqY=; b=Xh917GLK
 EnEhXjrmmrg4aXEuSdfQd02ji4+xvmuyigt6YqneYAx0gTl9MlibdBh58TJklwpm
 sicm/6CkTVaqmB9uvTTuvPPZw8kjqetSqu62aR5+IrDXkFwuSBsh2v1pBPxMEFfS
 euhOBFEyK1Hsp77D5Qm13pGMQA6U3yrnkREzKHL+gTw4o6NDgcoXYHXaP5gHuzu7
 ms46CyExCQQ+UC6HO5Oemdl4/22qQUXD2XU6rrC8nvBS8MqGCzmY7noWW5AxtkJ/
 iHtT0D7VuFTuYQNB/t65zd9hpZdwv97B+2eudADAi80AX+cVD3rECFB9Bhc8FSZq
 TIFYbSSCs0G2Zg==
X-ME-Sender: <xms:IU-0YGjREvnxjv3GKxgp3dgvVhzm4FdCHmDXV0xCfVeHASt-jHTm1w>
 <xme:IU-0YHC1_HhmjpjK-w_xQ-1BX3nqLN0WzUOZGf5mDP3Kqt7nhHIVd0iSlldP1YEb_
 beZqt9ndt8JVoD6BsY>
X-ME-Received: <xmr:IU-0YOE4POnleg7EIOURDs6yCvsq1bRvqzX-6iy9l9So6EwkNUFhbyqqCMR7DT_EjMdJ-ooFGZD3NtMGqlhPyJ8Y-gnf9wsPYh1p6S4hKSK7hPeDD8XB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelvddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:IU-0YPTJDTyN5DFhZIjM9X5FJtWZKnkot_Z0ozr9tzB-jsc3IAR2fQ>
 <xmx:IU-0YDz5g_bcowUI0RN8QFq6wmRkWmxlNunydOOCmJhS1ndZ1cpwJA>
 <xmx:IU-0YN6iU9T81CCG-U72_J4UwFSsiPS_2mjLW2pa5M_3Tr2YTAQTNQ>
 <xmx:IU-0YMqf0CXWaaptEfkRJtGl87eiW9uFOr2XMQ3fHnUHby2HJ6e9rA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 May 2021 22:51:12 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 4/6] ALSA: firewire-digi00x: perform sequence replay for media
 clock recovery
Date: Mon, 31 May 2021 11:51:01 +0900
Message-Id: <20210531025103.17880-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210531025103.17880-1-o-takashi@sakamocchi.jp>
References: <20210531025103.17880-1-o-takashi@sakamocchi.jp>
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

This commit takes ALSA firewire-digi00x driver to perform sequence replay
for media clock recovery.

All of models in Digidesign digi00x family don't transfer isochronous
packets till receiving isochronous packets. The on-the-fly mode is used
for the purpose. They don't interpret presentation time expressed in syt
field of received CIP, therefore the sequence of the number of data blocks
per packet is important for media clock recovery.

The sequence replay is tested with below models:

* Digidesign Digi 002
* Digidesign Digi 002 Rack
* Digidesign Digi 003
* Digidesign Digi 003 Rack

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/amdtp-dot.c      | 9 +++------
 sound/firewire/digi00x/digi00x-stream.c | 8 ++++++--
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/firewire/digi00x/amdtp-dot.c b/sound/firewire/digi00x/amdtp-dot.c
index 398c57a6fb43..59b86c8d89e1 100644
--- a/sound/firewire/digi00x/amdtp-dot.c
+++ b/sound/firewire/digi00x/amdtp-dot.c
@@ -396,16 +396,13 @@ int amdtp_dot_init(struct amdtp_stream *s, struct fw_unit *unit,
 		 enum amdtp_stream_direction dir)
 {
 	amdtp_stream_process_ctx_payloads_t process_ctx_payloads;
-	unsigned int flags;
+	unsigned int flags = CIP_NONBLOCKING | CIP_UNAWARE_SYT;
 
 	// Use different mode between incoming/outgoing.
-	if (dir == AMDTP_IN_STREAM) {
-		flags = CIP_NONBLOCKING;
+	if (dir == AMDTP_IN_STREAM)
 		process_ctx_payloads = process_ir_ctx_payloads;
-	} else {
-		flags = CIP_BLOCKING;
+	else
 		process_ctx_payloads = process_it_ctx_payloads;
-	}
 
 	return amdtp_stream_init(s, unit, dir, flags, CIP_FMT_AM,
 				process_ctx_payloads, sizeof(struct amdtp_dot));
diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index 2019f6533477..a15f55b0dce3 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -7,7 +7,7 @@
 
 #include "digi00x.h"
 
-#define READY_TIMEOUT_MS	500
+#define READY_TIMEOUT_MS	200
 
 const unsigned int snd_dg00x_stream_rates[SND_DG00X_RATE_COUNT] = {
 	[SND_DG00X_RATE_44100] = 44100,
@@ -375,7 +375,11 @@ int snd_dg00x_stream_start_duplex(struct snd_dg00x *dg00x)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&dg00x->domain, 0, false, false);
+		// NOTE: The device doesn't start packet transmission till receiving any packet.
+		// It ignores presentation time expressed by the value of syt field of CIP header
+		// in received packets. The sequence of the number of data blocks per packet is
+		// important for media clock recovery.
+		err = amdtp_domain_start(&dg00x->domain, 0, true, true);
 		if (err < 0)
 			goto error;
 
-- 
2.27.0

