Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BFE39540F
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 04:52:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B6EB86F;
	Mon, 31 May 2021 04:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B6EB86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622429573;
	bh=sH7VjiFJnt7frLhmqb6rRJ0sFJj7UrZ+z7sRe8E70AU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N/ZcX5plbTlXBPzzVSPLBEEjCC9jDYrhPsV+Jj4kXxtPsq8wxDdDv5Qe4FGEXgo/n
	 pgsPpYMIGT8YnlV1CPJ4jfIofUxEeMHnJhychCGwCJ8KeKrncIH7tJ+9zIpso3GR5/
	 sWXmGccfIv1S4CNr8QTUljvNuOzqLyl1OUkiqPjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23815F80168;
	Mon, 31 May 2021 04:51:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0822F804B4; Mon, 31 May 2021 04:51:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCF5FF80253
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 04:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCF5FF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="QYmD1LFV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="eHeFrYMq"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id F148A5C00AC;
 Sun, 30 May 2021 22:51:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sun, 30 May 2021 22:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=df0b7zxwdgFOC
 KtZ66ix4yddB6k6qyFrdEtH3PB4J0U=; b=QYmD1LFVpB9e/HP4LmsWQLyPZN277
 L/7x9nsnrTmbTapAqgLWYh0g+KwMyRClI/DfMFoDxky6JDMQDlOQyUui8LUTONtY
 6QrYt5clMqmtcx4aTmeJiva2g04Z/nwNPQCX9YjLUSxr9T5lkh2mfmq+GjFJmPsl
 211tINCn5b7z+zAh3CuMbfUTwPNcZ/DDL1azYqYR3Hj18EV7AsYxc6xLZY9U97ng
 lGsgr0S3VBPVLm6wDQW34/KIjWO16v9CFnSZlGFNkvpaLlQhcneMjqXdCQdUrTNS
 ylM67XONz0CsdvWPgq5UcVlNb0ke4PWFC8TEHBqXa+FIkFMBeUDnVd17w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=df0b7zxwdgFOCKtZ66ix4yddB6k6qyFrdEtH3PB4J0U=; b=eHeFrYMq
 N5nR1T0lhyYkdip/xDPyMFPcUh1JvbUwj3O9Kg+o9H+huql0BZQ00bp5C7PGlHy9
 xva5/8dxkhMRBYvy3jAhGQ5+DXDLcyEOvLA5toFW771rNgD47fg4HyCpIieGkHsl
 j68jZ3xD6Ou7/sEEvaRqLxeaK9cPCZEFhmv6v7iEaGjbbN03P9e1/wZDZ0VeDOoo
 5o6eFs4mA/AtjpQ8pObk3YJpMbYpAc1lfVrtbE2YfzK3m2uUG8okS1cpocoZgd4W
 OvL2KIvyAdpHPmOc/x8mrmfhwClJOIhSlJEhTTZxSd4t/6ifSkOM7bpVDn5GTAzj
 oOhanRjmZti4kw==
X-ME-Sender: <xms:Hk-0YBlt7yt3C8MXhoPwegV2L-MCMwBkG_M7zR1juJUuYvIO_FuzbQ>
 <xme:Hk-0YM0F-FlGWPnACFLBd0slJPaQZua1clrmeMDLmKqBDaSzU51snnBPtg_RgVg6i
 lXqeEmvDrSu1CXaYt8>
X-ME-Received: <xmr:Hk-0YHr-LDp-P-eLrNActoseGBNFa6xNEd1eYES14nHY9AN6w8f3sysXafyX8Fx0cvd0EefD1DNQXCG2Ab4qtSX3xuZ_-7xHG7w4g_g9hsEm0vpx5nPX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelvddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Hk-0YBliJdtnX4Ln5GJRdA3y6F3CuPOSqC7qbLQniajGGpUW_vyKfg>
 <xmx:Hk-0YP3-XD7pL4IpUUXKCWHQcAE5CPDQhP2lHVWe5aScPkwt92GYfw>
 <xmx:Hk-0YAt80hIgbSJDOfQR99UkouR715YNKX4OosScoFOFLGgbb2Tb3w>
 <xmx:Hk-0YI83s0damCH39ZgH6XCeKsAutr4sGdO65Z0dsGo7OJFHjktDQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 May 2021 22:51:09 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/6] ALSA: fireworks: perform sequence replay for media clock
 recovery
Date: Mon, 31 May 2021 11:50:59 +0900
Message-Id: <20210531025103.17880-3-o-takashi@sakamocchi.jp>
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

Echo Digital Audio Corporation had US patent US7599388B2 titled as
'System and method for high-bandwidth serial bus data transfer'. In the
patent, dual-banked shared memory is used to deliver data between
serial bus transmission and processor in FIFO way. The patent seems to be
used for Fireworks board module. The mechanism is not compliant to
synchronization based on presentation time expressed in syt field
of CIP header. Fireworks board module takes care of the sequence of
the number of data blocks per packet and just ignores the value of syt
field.

This commit takes fireworks driver to performs sequence replay for media
clock recovery. As long as I tested, Audiofire 2 and 4 have a quirk to
skip an isochronous cycle several thousands after starting packet
transmission.

The sequence replay is tested with below models:
 * Loud Technology Mackie 400f
 * Echo Audio Audiofire 12 (DSP model)
 * Echo Audio Audiofire 12 (FPGA model)
 * Echo Audio Audiofire 8 (DSP model)
 * Echo Audio Audiofire 8 (FPGA model)
 * Echo Audio Audiofire Pre8
 * Echo Audio Audiofire 4
 * Echo Audio Audiofire 2

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks_stream.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 6fc117c3a068..ac66f08acd6b 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -6,7 +6,7 @@
  */
 #include "./fireworks.h"
 
-#define READY_TIMEOUT_MS	100
+#define READY_TIMEOUT_MS	1000
 
 static int init_stream(struct snd_efw *efw, struct amdtp_stream *stream)
 {
@@ -29,7 +29,7 @@ static int init_stream(struct snd_efw *efw, struct amdtp_stream *stream)
 	if (err < 0)
 		return err;
 
-	err = amdtp_am824_init(stream, efw->unit, s_dir, CIP_BLOCKING);
+	err = amdtp_am824_init(stream, efw->unit, s_dir, CIP_BLOCKING | CIP_UNAWARE_SYT);
 	if (err < 0) {
 		amdtp_stream_destroy(stream);
 		cmp_connection_destroy(conn);
@@ -264,6 +264,15 @@ int snd_efw_stream_start_duplex(struct snd_efw *efw)
 		return err;
 
 	if (!amdtp_stream_running(&efw->rx_stream)) {
+		unsigned int tx_init_skip_cycles;
+
+		// Audiofire 2/4 skip an isochronous cycle several thousands after starting
+		// packet transmission.
+		if (efw->is_fireworks3 && !efw->is_af9)
+			tx_init_skip_cycles = 6000;
+		else
+			tx_init_skip_cycles = 0;
+
 		err = start_stream(efw, &efw->rx_stream, rate);
 		if (err < 0)
 			goto error;
@@ -272,7 +281,10 @@ int snd_efw_stream_start_duplex(struct snd_efw *efw)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&efw->domain, 0, false, false);
+		// NOTE: The device ignores presentation time expressed by the value of syt field
+		// of CIP header in received packets. The sequence of the number of data blocks per
+		// packet is important for media clock recovery.
+		err = amdtp_domain_start(&efw->domain, tx_init_skip_cycles, true, false);
 		if (err < 0)
 			goto error;
 
-- 
2.27.0

