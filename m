Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FB3387469
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:51:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AEC216DF;
	Tue, 18 May 2021 10:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AEC216DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621327899;
	bh=V8iYAHSYT2UqsNPWEwYI38kIeQIErLi5AlLae55U6kI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MM4mQSBSM3g/v+NVzRwLW9PNHYsjYIfcS+Ap5HrSrOsgFC8HLw3E5b6+Pi4PxXt+Z
	 4PlS1Z35qsUzC3gi1+ZXxc55IEBrBt0A4MM2DFfZxwKQrTEHbPyonq0gOkD0OgM9zp
	 M8V2d3FYMCoEJuASJESXVqBldqafK+hbUDugjeg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FAC2F804FC;
	Tue, 18 May 2021 10:46:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42059F804B0; Tue, 18 May 2021 10:46:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A958FF8012C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 10:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A958FF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="29VqlLau"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VF0LeBx9"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D140B5C0062;
 Tue, 18 May 2021 04:46:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 18 May 2021 04:46:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=C7cNkgrcvyZEa
 3lOdIaUQIiB4Z4OchMJVFaoClM+ea4=; b=29VqlLau47LXcZTFdG1QFsokeJXgH
 SxpUPxdWDNkwwN8zorkX4yzSqKAe4LixKch2VKPNBICPzRtiPQ2AAqmzQNA2yzOw
 SWZRrkO+BIqPNovPeDZEJKlNnCK7hEo466CnSUru1i8DuV8PI4uAQfTtLZR8Hd0h
 7630Jrspn1xMnpi4BTShXWQwmAyCSX8laEWPBMsa4Yz6JY4T02+MLZFX0Pj7XZbh
 LwkRPyj36qMt/BZWZVEdAHbpQG0DpSg3jJUrIXMoNbVdxtNNqptnJiwfYjETBK3I
 gQEO1jSgxrkK0ZM7Xvq2BvWnHwGDkvA5njgd4aNMoKJSFBHjioCe5RQ4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=C7cNkgrcvyZEa3lOdIaUQIiB4Z4OchMJVFaoClM+ea4=; b=VF0LeBx9
 WSwynccx3pa6qgJUUAMDNqtkiMuCCvk8zp8rTl45Yx2BfH4EJswgrRgt2698cuog
 8CsG89u8MACeVok89KpEkyNq/xxw787N1h82uk0Wkun+IN8HbS00VUYxQ7nn0PgG
 LvedJLBmL/y3KxxN79cCQAkrQN7fZZoKMmIHyOzG1TwtExuRwB/dpV9L3Uf1WF/U
 DsKX9ANvwYiSs4t0s/HwmmbmhTilWHeq0rnrDXhki7uak8IBCLsjAkFt/4Afk/JH
 8K0D9RghY51SWGWX3e3OQsgkIsDCWsaYE388KQJYCN4kSzxsYxXmBjfCZYqp5K6S
 +CRcDQ0XOIkIpw==
X-ME-Sender: <xms:2H6jYE-QtFB9oZpFk0c4nRBES9YUAAEcb4aS3v9qK9XCQphSU9--Hg>
 <xme:2H6jYMuHUmk4ysgfMdcfWkDiN9Ww2eBY3bRSTs_isYILy4nZ9VZ9YiG59xEtVgxVn
 -oIlpkNqIMc9dmy0h0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:2H6jYKCLqC7MEK0G0IqcyBXYukfK8pg5D-fKKflGG794Z4dpKAmB-g>
 <xmx:2H6jYEefmAfLVvZXjIadXP7kiKzthldGcJFKo44DqTQ0nKGTwsffRw>
 <xmx:2H6jYJNfzf6JgvejwXcxeoRzN7CYL6M6uEJE5MBz8PMVTXtZDejVCQ>
 <xmx:2H6jYLV832jZMz1gL64cPGRiLCszLnC8RmnLWJYsu1hNyVLXgCJ1tw>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 04:46:15 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v4 11/11] ALSA: oxfw: add quirk flag for blocking transmission
 method
Date: Tue, 18 May 2021 17:45:57 +0900
Message-Id: <20210518084557.102681-12-o-takashi@sakamocchi.jp>
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

Stanton SCS.1m and Apogee Duet FireWire use blocking transmission method
unlike the other models.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c |  7 ++++++-
 sound/firewire/oxfw/oxfw.c        | 14 +++++++++++---
 sound/firewire/oxfw/oxfw.h        |  2 ++
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 5771ff44dd5d..e9b6a9f171bf 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -153,9 +153,14 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	struct cmp_connection *conn;
 	enum cmp_direction c_dir;
 	enum amdtp_stream_direction s_dir;
-	unsigned int flags = CIP_NONBLOCKING;
+	unsigned int flags;
 	int err;
 
+	if (!(oxfw->quirks & SND_OXFW_QUIRK_BLOCKING_TRANSMISSION))
+		flags = CIP_NONBLOCKING;
+	else
+		flags = CIP_BLOCKING;
+
 	if (stream == &oxfw->tx_stream) {
 		conn = &oxfw->out_conn;
 		c_dir = CMP_OUTPUT;
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 966697dace47..59bffa32636c 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -23,6 +23,8 @@
 #define OUI_APOGEE		0x0003db
 
 #define MODEL_SATELLITE		0x00200f
+#define MODEL_SCS1M		0x001000
+#define MODEL_DUET_FW		0x01dddd
 
 #define SPECIFIER_1394TA	0x00a02d
 #define VERSION_AVC		0x010001
@@ -144,13 +146,19 @@ static int detect_quirks(struct snd_oxfw *oxfw)
 	 * messages.
 	 */
 	if (oxfw->entry->vendor_id == OUI_STANTON) {
-		/* No physical MIDI ports. */
+		if (oxfw->entry->model_id == MODEL_SCS1M)
+			oxfw->quirks |= SND_OXFW_QUIRK_BLOCKING_TRANSMISSION;
+
+		// No physical MIDI ports.
 		oxfw->midi_input_ports = 0;
 		oxfw->midi_output_ports = 0;
 
 		return snd_oxfw_scs1x_add(oxfw);
 	}
 
+	if (oxfw->entry->vendor_id == OUI_APOGEE && oxfw->entry->model_id == MODEL_DUET_FW)
+		oxfw->quirks |= SND_OXFW_QUIRK_BLOCKING_TRANSMISSION;
+
 	/*
 	 * TASCAM FireOne has physical control and requires a pair of additional
 	 * MIDI ports.
@@ -377,11 +385,11 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 	// TASCAM, FireOne.
 	OXFW_DEV_ENTRY(VENDOR_TASCAM, 0x800007, NULL),
 	// Stanton, Stanton Controllers & Systems 1 Mixer (SCS.1m).
-	OXFW_DEV_ENTRY(OUI_STANTON, 0x001000, NULL),
+	OXFW_DEV_ENTRY(OUI_STANTON, MODEL_SCS1M, NULL),
 	// Stanton, Stanton Controllers & Systems 1 Deck (SCS.1d).
 	OXFW_DEV_ENTRY(OUI_STANTON, 0x002000, NULL),
 	// APOGEE, duet FireWire.
-	OXFW_DEV_ENTRY(OUI_APOGEE, 0x01dddd, NULL),
+	OXFW_DEV_ENTRY(OUI_APOGEE, MODEL_DUET_FW, NULL),
 	{ }
 };
 MODULE_DEVICE_TABLE(ieee1394, oxfw_id_table);
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index 4002998d41e8..853135b5002d 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -38,6 +38,8 @@ enum snd_oxfw_quirk {
 	SND_OXFW_QUIRK_JUMBO_PAYLOAD = 0x01,
 	// The dbs field of CIP header in tx packet is wrong.
 	SND_OXFW_QUIRK_WRONG_DBS = 0x02,
+	// Blocking transmission mode is used.
+	SND_OXFW_QUIRK_BLOCKING_TRANSMISSION = 0x04,
 };
 
 /* This is an arbitrary number for convinience. */
-- 
2.27.0

