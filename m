Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96211387005
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 04:48:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D4ED16B6;
	Tue, 18 May 2021 04:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D4ED16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621306098;
	bh=l4dgw+3xRPoFKUMbN+4NiBSr1wVlV4zvBEyxz6HFSgI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nhT+p2IFzjp8n463d1tCBGcj0D1qeRt4zMVTQAeK+LS3KJF5EoxdH80WF8/KfPu0V
	 K5eoDWm/hLsQETibJV1oiIIhtqZZE0nLeFsaYp5eCDbTJIenQKIUjlCTnaQZYL9DFx
	 lvay1VZ7mr92ZaKmpoMJxYQFUAHOQnh/vrId6DAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7FB6F804E2;
	Tue, 18 May 2021 04:44:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EA66F804B0; Tue, 18 May 2021 04:43:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EA5CF80430
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 04:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA5CF80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="KvvsTshT"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GLwcas+k"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AB0175C00A2;
 Mon, 17 May 2021 22:43:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 17 May 2021 22:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=oOGPXe9o5FMVV
 DJKbTEdxSomdUfzGAM+wDxxz536mUc=; b=KvvsTshTfBZOwaf9IrFPUiE5XbjUf
 jwqsgdV2FZEKMoVEoFuPVjnrjqpkwpZBbzXPWYJHGYgFeKy6cvf1jea81Wvf1j6G
 H5s0sRfDtAZumxvPQnPQaUVQrG+nmwWTkcgy/nNbxQyaeJb69DozqZZ/umYErSN0
 GDXzsMEw6s8Q8D2x/ibtWoMgKVI+Gv/PG6IBxnSVt4gTIBPlFSXKsPFiHhJiQG2O
 SZRRhcl2HpYWzGJbSvBox+tNyQJRlkvepVmDd6fEoFA9l70ZZqfz3bzWRnQh/mfm
 t5fi6NP+LjyZ9E8Ui16Ce5q2Wwg9TWmEcCQzH56c/AGQlM5CGvEHfXUSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=oOGPXe9o5FMVVDJKbTEdxSomdUfzGAM+wDxxz536mUc=; b=GLwcas+k
 kS4XjnD1uSVqQVO6NqRYZ2vmCtIAh+reWRZRJZWz/yq+T+IMDn57roHujev9veau
 fV/oqW9Uzv5pcS0JqZUT09+cp5ym3BKbfZ02RhwRbCF/S6gjMzaQvhCGqrykQpu8
 ApRtJGqOiVpVGpeMsd1cA3A+mR6wQ/5FvNK4e5qzBZZufkc+BBL64yIKTdXWujFG
 Mr881lPw71xL/Fz+R/0obhRovM8FqioiXCSuiIV7eUDqEmTBXHUiLgU/I+d4vgtJ
 1W8z7KfNFpcY5xvF51hYXXvjippeQ/W9EyBIfjIsXdkb0jU9IUSWkummdz1Zp9DB
 VjSIPValxq+jVw==
X-ME-Sender: <xms:4imjYDHagIMDQyhq8l_n_ZoHUyJGTFfLdJrH68a9EuuVw75H3fV4Gw>
 <xme:4imjYAUJB61xavl5eEpAx0YvNH9KNjqnJb5bVM3HG-FaH98osNMj0hMFL1PPoc0iv
 UTbmDFYrTkrrRLBq9o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeiiedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:4imjYFKtFZw5gDOkDXqvLa6i-td8SrQavLqCgF_VkVjLYwShmaFWJA>
 <xmx:4imjYBHkbRfYaFesJhd97870kSHWR-sT73NZ7Pvpk1BZE1AYGrQNyA>
 <xmx:4imjYJUloe4mauFY6N517odCv-8Qc--TFFaVKf3ENDagULVmHZjmiQ>
 <xmx:4imjYKdimLguKrL7CvaQSGwa0XSup5CsNJkf4mbKCAm5DYeaCvYBww>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 22:43:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 11/11] ALSA: oxfw: add quirk flag for blocking transmission
 method
Date: Tue, 18 May 2021 11:43:26 +0900
Message-Id: <20210518024326.67576-12-o-takashi@sakamocchi.jp>
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

Stanton SCS.1m and Apogee Duet FireWire use blocking transmission method
unlike the other models.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c |  7 ++++++-
 sound/firewire/oxfw/oxfw.c        | 14 +++++++++++---
 sound/firewire/oxfw/oxfw.h        |  2 ++
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index de6b40c04810..1119de12d56a 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -153,9 +153,14 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	struct cmp_connection *conn;
 	enum cmp_direction c_dir;
 	enum amdtp_stream_direction s_dir;
-	int flags = CIP_NONBLOCKING;
+	int flags;
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
index daac38d046db..66e8d58bb81d 100644
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

