Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9CF387462
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:50:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C23DF16DE;
	Tue, 18 May 2021 10:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C23DF16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621327854;
	bh=XyOh7chtLLsMZmzhNOcr2AwbbkdMPYUQSen4I/CvxGA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ls8iaifMJHxM7XDCmihyVdK9ftPLWXxZWGTAxsBN0BVCtdyao7kepNa4b/uRUfdar
	 gIu3Ldbh9i5FjYPQUFjtGOympp6FMPivBwek4UE12dMpmnQD5Kau8uv5a58a5pb1xU
	 KsdTo6xxRkXhaAdh61gp/2b5qx8Ei4udoh0nJrFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BF36F804E6;
	Tue, 18 May 2021 10:46:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20039F804AA; Tue, 18 May 2021 10:46:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4055F80272
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 10:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4055F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="FNm2QdPQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="t90li5k6"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D675F5C0131;
 Tue, 18 May 2021 04:46:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 18 May 2021 04:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=7Hjq0nvKmzw8U
 X/+U1ImDdTQyPhDOBQPKqlcPg+8ayE=; b=FNm2QdPQtizzfXe+mjA7fDEswDLs0
 VuIYJoJZc85AEoXSMgiiKGvDa8DxFUOCc6kNW5rpmUHufQ9B8eat2g4vH2ZGLxHh
 Tjnyc4UMDrfB5BPNFiQykxtIgmgPbS12OPepSg1MtUbk3vJRwRN1GE7Ch8TdZRFS
 ZRMai7Mg7zc8pFl9tQ0kHC97vFxHv0p0rCDtFqxjMsbLqBfzDsnSF9k7N5DpQy4i
 JSTLQ2oescVgbpWL/NZVYJZf8YuqaIG5qCYi4Xp4EdWowlaG556NTJ7Qogdap8mV
 i6FI5dnGUjrlejqepZjL2EZK9J8IyJIljUxYmC20vwgUweldITJuSuIQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=7Hjq0nvKmzw8UX/+U1ImDdTQyPhDOBQPKqlcPg+8ayE=; b=t90li5k6
 vBou3PVY4u6Otg5IRhEX7kQOXRBVzULReZuLJa8WtiLvqyMIo+JcdNjEEc1i5YyB
 rKGGqNtio0m0+PCaJq8Kmer4QLzxJffu/FWfDNrAlpiLYRB7u16svLQUJ0J53tY4
 qsU0lE90unWJD4YCh5YSmyUZxlVoIAvyePbtn9mzxEeOktWSRhYTMXQIosbouAwF
 AdBW9oDGXIF4Odg8cFaXNdoaC55yg2wzsD0IACCGa1+xXbCwq+KdLZX5wxzDHrRX
 VBaeCzP3QRM/HqvDquVmHRtw1GMLqqTLuNgXsf7AGyr8Zi1yA8lLkfGZ976ifbbT
 RtGKZw8nPf89ig==
X-ME-Sender: <xms:1H6jYCvf3-l7GbDnQB2sAHV_7d91bQwzfZUGoFS4KVLDIlPP37BBnA>
 <xme:1H6jYHfDbAQuTk1VNu4adMkff4XTYkdF8QwomDAdseeJg1wXQ_zjxoiwqp2iX7dEy
 _mg8UERFqTkmx4iBi0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:1H6jYNx7APUm5Gm0L8uCz71eOalYcSV6LfJoh4_88j3BsD_3XXPlTw>
 <xmx:1H6jYNPQL_zPyghuuckGxizn1si8vxeQ-XYGZ99hm5xO8YMVt7O4TA>
 <xmx:1H6jYC9AwQ6f1hBza799fKA1cWuNGp1fwQLsirMdQoFiGKqq6Q_YOg>
 <xmx:1H6jYHG4FpUKIc-YxDpwbMSvi7RiV3fSYA9oCmn9peZEnibRp4cOSw>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 04:46:11 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v4 08/11] ALSA: oxfw: code refactoring for jumbo-payload quirk
 in OXFW970
Date: Tue, 18 May 2021 17:45:54 +0900
Message-Id: <20210518084557.102681-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518084557.102681-1-o-takashi@sakamocchi.jp>
References: <20210518084557.102681-1-o-takashi@sakamocchi.jp>
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

This commit adds enumeration to describe quirks of OXFW ASICs.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 20 +++++++-------------
 sound/firewire/oxfw/oxfw.c        |  3 +++
 sound/firewire/oxfw/oxfw.h        |  8 ++++++++
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 80c9dc13f1b5..c06173fd247d 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -153,12 +153,18 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	struct cmp_connection *conn;
 	enum cmp_direction c_dir;
 	enum amdtp_stream_direction s_dir;
+	unsigned int flags = CIP_NONBLOCKING;
 	int err;
 
 	if (stream == &oxfw->tx_stream) {
 		conn = &oxfw->out_conn;
 		c_dir = CMP_OUTPUT;
 		s_dir = AMDTP_IN_STREAM;
+
+		if (oxfw->quirks & SND_OXFW_QUIRK_JUMBO_PAYLOAD)
+			flags |= CIP_JUMBO_PAYLOAD;
+		if (oxfw->wrong_dbs)
+			flags |= CIP_WRONG_DBS;
 	} else {
 		conn = &oxfw->in_conn;
 		c_dir = CMP_INPUT;
@@ -169,24 +175,12 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	if (err < 0)
 		return err;
 
-	err = amdtp_am824_init(stream, oxfw->unit, s_dir, CIP_NONBLOCKING);
+	err = amdtp_am824_init(stream, oxfw->unit, s_dir, flags);
 	if (err < 0) {
 		cmp_connection_destroy(conn);
 		return err;
 	}
 
-	/*
-	 * OXFW starts to transmit packets with non-zero dbc.
-	 * OXFW postpone transferring packets till handling any asynchronous
-	 * packets. As a result, next isochronous packet includes more data
-	 * blocks than IEC 61883-6 defines.
-	 */
-	if (stream == &oxfw->tx_stream) {
-		oxfw->tx_stream.flags |= CIP_JUMBO_PAYLOAD;
-		if (oxfw->wrong_dbs)
-			oxfw->tx_stream.flags |= CIP_WRONG_DBS;
-	}
-
 	return 0;
 }
 
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 9a9c84bc811a..90a66e1312fe 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -86,6 +86,9 @@ static int name_card(struct snd_oxfw *oxfw)
 		goto end;
 	be32_to_cpus(&firmware);
 
+	if (firmware >> 20 == 0x970)
+		oxfw->quirks |= SND_OXFW_QUIRK_JUMBO_PAYLOAD;
+
 	/* to apply card definitions */
 	if (oxfw->entry->vendor_id == VENDOR_GRIFFIN ||
 	    oxfw->entry->vendor_id == VENDOR_LACIE) {
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index fa2d7f9e2dc3..07aa0d25e100 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -32,6 +32,12 @@
 #include "../amdtp-am824.h"
 #include "../cmp.h"
 
+enum snd_oxfw_quirk {
+	// Postpone transferring packets during handling asynchronous transaction. As a result,
+	// next isochronous packet includes more events than one packet can include.
+	SND_OXFW_QUIRK_JUMBO_PAYLOAD = 0x01,
+};
+
 /* This is an arbitrary number for convinience. */
 #define	SND_OXFW_STREAM_FORMAT_ENTRIES	10
 struct snd_oxfw {
@@ -43,6 +49,8 @@ struct snd_oxfw {
 	bool registered;
 	struct delayed_work dwork;
 
+	// The combination of snd_oxfw_quirk enumeration-constants.
+	unsigned int quirks;
 	bool wrong_dbs;
 	bool has_output;
 	bool has_input;
-- 
2.27.0

