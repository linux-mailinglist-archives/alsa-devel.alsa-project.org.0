Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8793338700A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 04:49:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07E58169A;
	Tue, 18 May 2021 04:48:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07E58169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621306141;
	bh=8ERM7xE9fc4U5n79WPRLHZZtl+MEkvRECZU6p+cb450=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F3kRjfEp2+PbqAK6/tKIqcrZfldP7Kdzk7WzO7OzkkawCt4r2EJZN/2xGKTEaIXGh
	 2GP0vm0CW3V5WBsmcDSX1uQqXxxrIHfJHMFZnr1G/N1dk6thMGwsoKOomeKiNdte6X
	 PnpE38zSRpbDST6lkgPqjQ46MiPY1UBzodWft2Q0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41C6DF804EC;
	Tue, 18 May 2021 04:44:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0316EF804AF; Tue, 18 May 2021 04:43:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 858F8F80139
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 04:43:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 858F8F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pooH3PB6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Btsk4AX6"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id B26055C00A2;
 Mon, 17 May 2021 22:43:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 17 May 2021 22:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=RrwufYIfILEPI
 LQoKbDBQsFvuKNysHrw19mtSXCJlvk=; b=pooH3PB6BwrULgnp/GbuhaQzM10ij
 As86fy4HcM0Zupz+qcXazVoahnrUxReFmaE5vw84a65XfktHn5vCNQZxVweKsx+6
 HJD3GfYBhjJKW9WRfCb5By8/orMmeElomxfoR6oXmHHLZFCLNY8oVh2xuVeW0XOL
 BoT0q36w4oo+M1ZLBnE+v/ob7GZrCHg31LAcoHIIMXA8nMpjQr8aAiEGFvIQGDA+
 jCZLfz/LCohqvBVlh0OvmbXXAvKj8ISvfVEIoeExsn/xHdDsbxhfLThbk68c4At4
 XI5Sz+iWD9VR5FGltjEQw/WR86pPJdlyMWuIBcZbOkPgHOqkq1NTnIFew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=RrwufYIfILEPILQoKbDBQsFvuKNysHrw19mtSXCJlvk=; b=Btsk4AX6
 h/b7DKB7Hw67D9Xq4WBYR0YE3i+uJQfRCH03nwiYUcJ8mepzDAaOYEpj2rjDssNJ
 IpZQeSq0PIxoYodA33spx1m9rtqKZy+y9KmABxhDudD6VFf3AyP5jwpXmAU03a4y
 7GOOsO6/SGMNKAnUQ/DpCc+kBDZNUt+hgW41qMeJB/Ib5kmeH4jQVTVcH7umf7Be
 duX4mCkPwzv3m2jChNeKWRLvEFFV+j+agtyOy200/RYunr/B9HA/56lKX/lz/JmZ
 FK2y/+H9j/iHgouOKxrKdenBKtZeVSnQB/PYHafcHStsIL0z5do9depXoxReflXR
 Z9K8wjZw3KpKrw==
X-ME-Sender: <xms:3imjYI-AnTFeEfo-00sipBW5LaXFik6YCnDLaTvTSV8BWSE5E-oNOw>
 <xme:3imjYAtTWm8zYUmtTCZ-MyQWhwzAjb7dWfKjNTxfwePkEbOelZjgkXS-UugReZ5L9
 CUB42duSvfRXCKfQfo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeiiedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:3imjYOCVlZ_Az7k1tWV6C80KmAUW5BNmgf_vH1FHd7KHowMlVlRmNg>
 <xmx:3imjYId8uwb-44dyC2VILpFdl4yRt3LaKQVro7yJ0nFMiNcLDjf4Hw>
 <xmx:3imjYNMTbWoav4QFvFZj1sATqaGuj1OEMhY7Tk8bry53H1-c2-D_8w>
 <xmx:3imjYPWOC2yC582eRYjnRafejE287RWoiE-yfOtV8XXJN8T_mbZGzw>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 22:43:41 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 08/11] ALSA: oxfw: code refactoring for jumbo-payload quirk
 in OXFW970
Date: Tue, 18 May 2021 11:43:23 +0900
Message-Id: <20210518024326.67576-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518024326.67576-1-o-takashi@sakamocchi.jp>
References: <20210518024326.67576-1-o-takashi@sakamocchi.jp>
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
index 80c9dc13f1b5..65b458da2796 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -153,12 +153,18 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	struct cmp_connection *conn;
 	enum cmp_direction c_dir;
 	enum amdtp_stream_direction s_dir;
+	int flags = CIP_NONBLOCKING;
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
index fa2d7f9e2dc3..bc6706984fbb 100644
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
+	int quirks;
 	bool wrong_dbs;
 	bool has_output;
 	bool has_input;
-- 
2.27.0

