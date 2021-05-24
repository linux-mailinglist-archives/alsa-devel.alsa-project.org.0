Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DF838DFD4
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 05:17:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B1051688;
	Mon, 24 May 2021 05:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B1051688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621826223;
	bh=hRatnXg7jqCuPaLs6n449MH3ZPeX9RziChkj871bb7A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nRIpS4JhBfzzvIFx9d2HQA7Rqj3nozbqOig3jCBJU/Mx3W+ZlCRpFm26yDHUjigpV
	 SpLu5y6/3oZXbrR1ALnJyLnlrgHyVI6zieET7dWhYSCHcxrB3ok2QwiDcISVWkT+Ei
	 VPROfSdD1jdUKTRgYIEzCSVtHPnXOFz4tKE8E3IE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 858C0F804AA;
	Mon, 24 May 2021 05:14:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A5AFF80137; Mon, 24 May 2021 05:14:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71EE8F80260
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 05:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71EE8F80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="WkjZYZnS"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="vXLpxxiU"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B249B5C011B;
 Sun, 23 May 2021 23:13:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 23 May 2021 23:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=t1orP0CsnTksR
 Db98nAaKJLpKlhFXWDERsIQfcjRKl4=; b=WkjZYZnSAnA1T9sQQd5msLHn91i8J
 4JpFf2USMcupe77ODEFGkQwMy+ELklBuCgJdmH17893dtj+Nrw2FmqiebCIAitOp
 F0/iyvGDEvoTndmI64ed7i/ofRQvwoi+IOT9M5fL8WJf+mJumOGRpFJsEV5B64nE
 iPjokSdBngXsE9snpN8nnOfm8PXRlLo2zTM8FQmqluUYrswlK+cnnKxTXowSrFsx
 Mo2TDCeqbr6wJnJ3i+g3hGzdK9T7+JWaSH1wBniQ18F1jyrHaMpOMZ54ljSedtXk
 ZHtDUX0bbaqK+3tatwQr30/Yiq7SL1H9/rnmAtT0iNGnrWc9pmgl7gpyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=t1orP0CsnTksRDb98nAaKJLpKlhFXWDERsIQfcjRKl4=; b=vXLpxxiU
 nSQ/a83g2WjPU/JHsmWj8DYdP+Hj6OlOVSbh/pB3Z/2CmGn68R0rWORzpgi7Vd6C
 Y/pZvmcRKFMbSUfKllqPG4uuX/ZN2BJW2ifynbN6MH5YW43RUJCDYs16rjUGuMRZ
 7TXPvagF9D4HoUymB+kCBsm+aTfQ77w8WlP7KI5cbhy15fHRUikcUphCAgDn7jdc
 7s/mgGTCYd9V7TJ/fRiCu0nPXe3Lr0qTaH+EErF7Vjlmgs6kXHzBad1l7cS3dvxa
 Q4GB3TA2daZKMHi7eo85OZHJQCO+qAKcgxUow0Tqb4SJmJUsAZlL6CuVsGH+GuIw
 OfoKg7r4p9KPCw==
X-ME-Sender: <xms:9hmrYD9kOYyvA004GG4I8iSd-guTbSY4F115usQQF-Iseah_kWnjNA>
 <xme:9hmrYPtkiphTtBepgxGPXVt3ddnhbFb0OewiFP2cC8jI9tcjjmsq6vbc1mo1S2HlC
 rNFfi4z-F6JOWIED5M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejkedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:9hmrYBDZagL_AGWi5MmQm2uKQxyD7O7maQ3G9scn3WAllUVVXzaM_Q>
 <xmx:9hmrYPc3Jkb6BNuknSoMiZCSaLwnZppUfH-G672OIZll22A9f3Iybw>
 <xmx:9hmrYIOChTqNlBHZK8GLgzPJCtCB3huSQTs5y2aJPV8FdBE_TEYrrg>
 <xmx:9hmrYCUINCQVkvWVakHp7ZKk3N6Qry0DhuTizZnrhVFt7CjzcFwC0g>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sun, 23 May 2021 23:13:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 4/4] ALSA: bebob: distinguish M-Audio ProFire Lightbridge
 quirk
Date: Mon, 24 May 2021 12:13:46 +0900
Message-Id: <20210524031346.50539-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210524031346.50539-1-o-takashi@sakamocchi.jp>
References: <20210524031346.50539-1-o-takashi@sakamocchi.jp>
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

In former commit, ALSA IEC 61883-1/6 packet streaming engine drops
initial tx packets till the packet includes any event. This allows ALSA
bebob driver not to give option to skip initial packet since the engine
does drop the initial packet.

However, M-Audio ProFire Lightbridge has a quirk to stop packet
transmission after start multiplexing event to the packet. After several
thousands cycles, it restart packet transmission again.

This commit specializes the usage of initial skip option for the model.
Additionally, this commit expands timeout enough to wait processing
content of tx packet.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob.c        | 10 +++++++++-
 sound/firewire/bebob/bebob.h        |  1 +
 sound/firewire/bebob/bebob_stream.c | 12 +++++++-----
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 90e98a6d1546..5938aa325f5e 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -64,6 +64,7 @@ static DECLARE_BITMAP(devices_used, SNDRV_CARDS);
 #define MODEL_MAUDIO_AUDIOPHILE_BOTH	0x00010060
 #define MODEL_MAUDIO_FW1814		0x00010071
 #define MODEL_MAUDIO_PROJECTMIX		0x00010091
+#define MODEL_MAUDIO_PROFIRELIGHTBRIDGE	0x000100a1
 
 static int
 name_device(struct snd_bebob *bebob)
@@ -210,6 +211,13 @@ do_registration(struct work_struct *work)
 	if (err < 0)
 		goto error;
 
+	// M-Audio ProFire Lightbridge has a quirk to transfer packets with discontinuous cycle or
+	// data block counter in early stage of packet streaming. The cycle span from the first
+	// packet with event is variable.
+	if (bebob->entry->vendor_id == VEN_MAUDIO1 &&
+	    bebob->entry->model_id == MODEL_MAUDIO_PROFIRELIGHTBRIDGE)
+		bebob->discontinuity_quirk = true;
+
 	err = snd_bebob_stream_init_duplex(bebob);
 	if (err < 0)
 		goto error;
@@ -476,7 +484,7 @@ static const struct ieee1394_device_id bebob_id_table[] = {
 	/* M-Audio NRV10 */
 	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO1, 0x00010081, &maudio_nrv10_spec),
 	/* M-Audio, ProFireLightbridge */
-	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO1, 0x000100a1, &spec_normal),
+	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO1, MODEL_MAUDIO_PROFIRELIGHTBRIDGE, &spec_normal),
 	/* Firewire 1814 */
 	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO1, 0x00010070, NULL),	/* bootloader */
 	SND_BEBOB_DEV_ENTRY(VEN_MAUDIO1, MODEL_MAUDIO_FW1814,
diff --git a/sound/firewire/bebob/bebob.h b/sound/firewire/bebob/bebob.h
index 4e0ed84adbee..cba6793bfdb2 100644
--- a/sound/firewire/bebob/bebob.h
+++ b/sound/firewire/bebob/bebob.h
@@ -115,6 +115,7 @@ struct snd_bebob {
 
 	/* For BeBoB version quirk. */
 	unsigned int version;
+	bool discontinuity_quirk;
 
 	struct amdtp_domain domain;
 };
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 975670a29a72..91306da1bafe 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -7,7 +7,7 @@
 
 #include "./bebob.h"
 
-#define READY_TIMEOUT_MS	2500
+#define READY_TIMEOUT_MS	4000
 
 /*
  * NOTE;
@@ -644,12 +644,14 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 		if (err < 0)
 			goto error;
 
-		// Some devices transfer isoc packets with discontinuous counter in the beginning
-		// of packet streaming.
-		if (bebob->version < 2)
-			tx_init_skip_cycles = 3200;
+		if (!bebob->discontinuity_quirk)
+			tx_init_skip_cycles = 0;
 		else
 			tx_init_skip_cycles = 16000;
+
+		// MEMO: In the early stage of packet streaming, the device transfers NODATA packets.
+		// After several hundred cycles, it begins to multiplex event into the packet with
+		// syt information.
 		err = amdtp_domain_start(&bebob->domain, tx_init_skip_cycles);
 		if (err < 0)
 			goto error;
-- 
2.27.0

