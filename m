Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4E381687
	for <lists+alsa-devel@lfdr.de>; Sat, 15 May 2021 09:16:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C0B81738;
	Sat, 15 May 2021 09:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C0B81738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621062994;
	bh=UtwetzGqAXxFi+BrzKFEFgKLck+pQR+V9DccQPOni3g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jhjh8giw0iQ9iaYoJMK7OMReGFhN9CxOVFQiWwDonjei2sM+yXnTtNFSK6TBkWqIo
	 TXiJSdjtLNjUC5IZtV8Seg+i5o4ppRyZSiPDF63a+9YwwaLP4JjBRaw7mnEpsHNRoF
	 1Sa+QYlVJYVKhSwRwxUyIj1+lTQcx25GvwtIMCdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B4EAF804FE;
	Sat, 15 May 2021 09:11:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88387F80245; Sat, 15 May 2021 09:11:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B9E7F8049C
 for <alsa-devel@alsa-project.org>; Sat, 15 May 2021 09:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B9E7F8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="tQMK6IjO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FLaXTyZf"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D8F55C0124;
 Sat, 15 May 2021 03:11:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 15 May 2021 03:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=XszyOS9GwRUgt
 b7HmYKwuCsoOzRRIt8slN0/HJdPKA0=; b=tQMK6IjOSSt2TXrM+vFWLxujHMjw+
 FAXeD0kaZDcsUKzOlXgwqtodZWudnsNlkaExTuYh01SoepVZzSr+yUPq0Qsvnc+S
 xU6kolAJSAytPCr8wgS9iX4W58uLD2NOt6i067MZOEv1W53pw7D+Oq1XtdEGkyNt
 wB4aQVqDyB92uNbEom+kyWgSYdlMFHm6CH92pkj58cvGExEWtr9hRdHdOza5UqC1
 b4JqG6OncxQ8Twe0fGF7JQ6I4Xs8vr+3+B3ISpy4/Bh8NLJ2WH6NbbxE0a2cbBfv
 GgbN1lqR8xk56u0AE1aGZ0ShnOD5VWAv7nNRUaMt2OCrPn3Oxh4+c70Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=XszyOS9GwRUgtb7HmYKwuCsoOzRRIt8slN0/HJdPKA0=; b=FLaXTyZf
 F7rRZBhrFMJa+09tEj3/Cl9QqkhYWxbee+PvxB82AyvwsxXVIYudKdYgGSuRFfOj
 PPG72N5LDwAYY7yA5gE5SzD9GscIVyKNzgSelV/G31lckWKy+Q6neEw2m/zP4CMW
 omAsPI0Uyi+EgXRmBuF5FU2zQQxLd6hO9XCdb2JOdWslazVHYU8atPIB8FDMcIAC
 F8Ufg8RmG73zErYsITy3PLpNG6K6ThDwCc6rFVLDPrE7UPFa2ffdXAt+6oPnnEQ7
 ovToh5DvicQMtwu2+qQ5af3biJpWMgHo9Wp8wr1NxzO88PixqsquiLLMuc3Rvw6I
 Mo2tjKANdh4xOA==
X-ME-Sender: <xms:InSfYOeVpQhU-ypAqeFIy4ibsfSlFTPgCIsqVly0uxBz0jQKftMo3A>
 <xme:InSfYIN5GD6JT2KHtmLHye5mLQNsKPQ6Kn589fyRRQuxFlwbGJbLXyXq6WByduubY
 xaoIcxh3aKY7Qfoqtk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehledguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:InSfYPjGuwOWvb9SzZOHvvzpe8uSrzS9X24bq3ax3CAOiSR3bhMyrA>
 <xmx:InSfYL_zOQ1etvGXH2ZVn9G52tvQDs20WvojveB-YPvTrekuU9Ll3Q>
 <xmx:InSfYKsmAkWoZ43sarFdduBdjEF4KhSCw9FM8ZLs5pPEOotWCH3OYA>
 <xmx:InSfYA3L7Q2-C6UUkK8zXEVhFkSCoITcZGTva-r1Sktudg53luHLMw>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sat, 15 May 2021 03:11:29 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 10/10] ALSA: oxfw: add quirk flag for blocking transmission
 method
Date: Sat, 15 May 2021 16:11:12 +0900
Message-Id: <20210515071112.101535-11-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210515071112.101535-1-o-takashi@sakamocchi.jp>
References: <20210515071112.101535-1-o-takashi@sakamocchi.jp>
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
index 9edd8515f586..b17ebf09fbf9 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -153,9 +153,14 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	struct cmp_connection *conn;
 	enum cmp_direction c_dir;
 	enum amdtp_stream_direction s_dir;
-	enum cip_flags flags = CIP_NONBLOCKING;
+	enum cip_flags flags;
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
index 1b0c53802569..6a0fe0fa2f1a 100644
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

