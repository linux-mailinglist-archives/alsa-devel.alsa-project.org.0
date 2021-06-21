Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E513AF4B4
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:15:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 168EC16BD;
	Mon, 21 Jun 2021 20:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 168EC16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299333;
	bh=TFr6PP1aQjamQGYv+WkBAeDTH8G52dkepUoM6Z8wwvg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mOwKOBoQObI6Hz+MFGm2EMQ8JtzXmBIQQ51NWouktnL1nxXOpIpsH0lnF9+CDklhM
	 aw9z6DEg0E6hy2VIaVbmGriovsxQVD9pr3Q6RAMywcvNnn7d7LBrI+kWZeV6Abh08a
	 mFjjFodQU/IaRgId1Ie1lv7VAdjh6SluI2L4Mqa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FCCBF80543;
	Mon, 21 Jun 2021 20:09:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AE47F80538; Mon, 21 Jun 2021 20:09:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 413F4F80526
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:09:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 413F4F80526
Received: by m.b4.vu (Postfix, from userid 1000)
 id C3A4361E286F; Tue, 22 Jun 2021 03:39:41 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:39:41 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 13/31] ALSA: usb-audio: scarlett2: Allow arbitrary ordering
 of mux entries
Message-ID: <08e8d784d78262cb57496d28ef1ad7b6213a90ab.1624294591.git.g@b4.vu>
References: <cover.1624294591.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624294591.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

Some Gen 3 devices do not put all of the mux entries for the same port
types together in order in the "set mux" message data. To prepare for
this, replace the struct scarlett2_ports num[] array and the
assignment_order[] array with mux_assignment[], a list of port types
and ranges that is defined in the struct scarlett2_device_info.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 222 ++++++++++++++++++++++----------
 1 file changed, 154 insertions(+), 68 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index d30f15d580b5..b874c0c922d3 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -184,14 +184,11 @@ enum {
 	SCARLETT2_PORT_TYPE_COUNT    = 6,
 };
 
-/* Count of total I/O and number available at each sample rate */
+/* I/O count of each port type kept in struct scarlett2_ports */
 enum {
-	SCARLETT2_PORT_IN      = 0,
-	SCARLETT2_PORT_OUT     = 1,
-	SCARLETT2_PORT_OUT_44  = 2,
-	SCARLETT2_PORT_OUT_88  = 3,
-	SCARLETT2_PORT_OUT_176 = 4,
-	SCARLETT2_PORT_DIRNS   = 5,
+	SCARLETT2_PORT_IN    = 0,
+	SCARLETT2_PORT_OUT   = 1,
+	SCARLETT2_PORT_DIRNS = 2,
 };
 
 /* Dim/Mute buttons on the 18i20 */
@@ -220,6 +217,24 @@ struct scarlett2_ports {
 	const char * const dst_descr;
 };
 
+/* Number of mux tables: one for each band of sample rates
+ * (44.1/48kHz, 88.2/96kHz, and 176.4/176kHz)
+ */
+#define SCARLETT2_MUX_TABLES 3
+
+/* Maximum number of entries in a mux table */
+#define SCARLETT2_MAX_MUX_ENTRIES 7
+
+/* One entry within mux_assignment defines the port type and range of
+ * ports to add to the set_mux message. The end of the list is marked
+ * with count == 0.
+ */
+struct scarlett2_mux_entry {
+	u8 port_type;
+	u8 start;
+	u8 count;
+};
+
 struct scarlett2_device_info {
 	u32 usb_id; /* USB device identifier */
 
@@ -241,6 +256,10 @@ struct scarlett2_device_info {
 
 	/* port count and type data */
 	struct scarlett2_ports ports[SCARLETT2_PORT_TYPE_COUNT];
+
+	/* layout/order of the entries in the set_mux message */
+	struct scarlett2_mux_entry mux_assignment[SCARLETT2_MUX_TABLES]
+						 [SCARLETT2_MAX_MUX_ENTRIES];
 };
 
 struct scarlett2_data {
@@ -293,38 +312,61 @@ static const struct scarlett2_device_info s6i6_gen2_info = {
 	.ports = {
 		[SCARLETT2_PORT_TYPE_NONE] = {
 			.id = 0x000,
-			.num = { 1, 0, 8, 8, 8 },
+			.num = { 1, 0 },
 			.src_descr = "Off",
 		},
 		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
 			.id = 0x080,
-			.num = { 4, 4, 4, 4, 4 },
+			.num = { 4, 4 },
 			.src_descr = "Analogue %d",
 			.src_num_offset = 1,
 			.dst_descr = "Analogue Output %02d Playback"
 		},
 		[SCARLETT2_PORT_TYPE_SPDIF] = {
 			.id = 0x180,
-			.num = { 2, 2, 2, 2, 2 },
+			.num = { 2, 2 },
 			.src_descr = "S/PDIF %d",
 			.src_num_offset = 1,
 			.dst_descr = "S/PDIF Output %d Playback"
 		},
 		[SCARLETT2_PORT_TYPE_MIX] = {
 			.id = 0x300,
-			.num = { 10, 18, 18, 18, 18 },
+			.num = { 10, 18 },
 			.src_descr = "Mix %c",
 			.src_num_offset = 65,
 			.dst_descr = "Mixer Input %02d Capture"
 		},
 		[SCARLETT2_PORT_TYPE_PCM] = {
 			.id = 0x600,
-			.num = { 6, 6, 6, 6, 6 },
+			.num = { 6, 6 },
 			.src_descr = "PCM %d",
 			.src_num_offset = 1,
 			.dst_descr = "PCM %02d Capture"
 		},
 	},
+
+	.mux_assignment = { {
+		{ SCARLETT2_PORT_TYPE_PCM,      0,  6 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  4 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  8 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0,  6 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  4 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  8 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0,  6 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  4 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  8 },
+		{ 0,                            0,  0 },
+	} },
 };
 
 static const struct scarlett2_device_info s18i8_gen2_info = {
@@ -345,44 +387,67 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 	.ports = {
 		[SCARLETT2_PORT_TYPE_NONE] = {
 			.id = 0x000,
-			.num = { 1, 0, 8, 8, 4 },
+			.num = { 1, 0 },
 			.src_descr = "Off",
 		},
 		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
 			.id = 0x080,
-			.num = { 8, 6, 6, 6, 6 },
+			.num = { 8, 6 },
 			.src_descr = "Analogue %d",
 			.src_num_offset = 1,
 			.dst_descr = "Analogue Output %02d Playback"
 		},
 		[SCARLETT2_PORT_TYPE_SPDIF] = {
 			.id = 0x180,
-			.num = { 2, 2, 2, 2, 2 },
+			.num = { 2, 2 },
 			.src_descr = "S/PDIF %d",
 			.src_num_offset = 1,
 			.dst_descr = "S/PDIF Output %d Playback"
 		},
 		[SCARLETT2_PORT_TYPE_ADAT] = {
 			.id = 0x200,
-			.num = { 8, 0, 0, 0, 0 },
+			.num = { 8, 0 },
 			.src_descr = "ADAT %d",
 			.src_num_offset = 1,
 		},
 		[SCARLETT2_PORT_TYPE_MIX] = {
 			.id = 0x300,
-			.num = { 10, 18, 18, 18, 18 },
+			.num = { 10, 18 },
 			.src_descr = "Mix %c",
 			.src_num_offset = 65,
 			.dst_descr = "Mixer Input %02d Capture"
 		},
 		[SCARLETT2_PORT_TYPE_PCM] = {
 			.id = 0x600,
-			.num = { 8, 18, 18, 14, 10 },
+			.num = { 8, 18 },
 			.src_descr = "PCM %d",
 			.src_num_offset = 1,
 			.dst_descr = "PCM %02d Capture"
 		},
 	},
+
+	.mux_assignment = { {
+		{ SCARLETT2_PORT_TYPE_PCM,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  6 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  8 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0, 14 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  6 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  8 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0, 10 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  6 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  4 },
+		{ 0,                            0,  0 },
+	} },
 };
 
 static const struct scarlett2_device_info s18i20_gen2_info = {
@@ -406,12 +471,12 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 	.ports = {
 		[SCARLETT2_PORT_TYPE_NONE] = {
 			.id = 0x000,
-			.num = { 1, 0, 8, 8, 6 },
+			.num = { 1, 0 },
 			.src_descr = "Off",
 		},
 		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
 			.id = 0x080,
-			.num = { 8, 10, 10, 10, 10 },
+			.num = { 8, 10 },
 			.src_descr = "Analogue %d",
 			.src_num_offset = 1,
 			.dst_descr = "Analogue Output %02d Playback"
@@ -422,33 +487,58 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 			 * assignment message anyway
 			 */
 			.id = 0x180,
-			.num = { 2, 2, 2, 2, 2 },
+			.num = { 2, 2 },
 			.src_descr = "S/PDIF %d",
 			.src_num_offset = 1,
 			.dst_descr = "S/PDIF Output %d Playback"
 		},
 		[SCARLETT2_PORT_TYPE_ADAT] = {
 			.id = 0x200,
-			.num = { 8, 8, 8, 4, 0 },
+			.num = { 8, 8 },
 			.src_descr = "ADAT %d",
 			.src_num_offset = 1,
 			.dst_descr = "ADAT Output %d Playback"
 		},
 		[SCARLETT2_PORT_TYPE_MIX] = {
 			.id = 0x300,
-			.num = { 10, 18, 18, 18, 18 },
+			.num = { 10, 18 },
 			.src_descr = "Mix %c",
 			.src_num_offset = 65,
 			.dst_descr = "Mixer Input %02d Capture"
 		},
 		[SCARLETT2_PORT_TYPE_PCM] = {
 			.id = 0x600,
-			.num = { 20, 18, 18, 14, 10 },
+			.num = { 20, 18 },
 			.src_descr = "PCM %d",
 			.src_num_offset = 1,
 			.dst_descr = "PCM %02d Capture"
 		},
 	},
+
+	.mux_assignment = { {
+		{ SCARLETT2_PORT_TYPE_PCM,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0, 10 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_ADAT,     0,  8 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  8 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0, 14 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0, 10 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_ADAT,     0,  4 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  8 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0, 10 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0, 10 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0, 18 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0,  6 },
+		{ 0,                            0,  0 },
+	} },
 };
 
 static const struct scarlett2_device_info *scarlett2_devices[] = {
@@ -1009,16 +1099,7 @@ static int scarlett2_usb_set_mux(struct usb_mixer_interface *mixer)
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
 	const struct scarlett2_ports *ports = info->ports;
-	int rate, port_dir_rate;
-
-	static const int assignment_order[SCARLETT2_PORT_TYPE_COUNT] = {
-		SCARLETT2_PORT_TYPE_PCM,
-		SCARLETT2_PORT_TYPE_ANALOGUE,
-		SCARLETT2_PORT_TYPE_SPDIF,
-		SCARLETT2_PORT_TYPE_ADAT,
-		SCARLETT2_PORT_TYPE_MIX,
-		SCARLETT2_PORT_TYPE_NONE,
-	};
+	int table;
 
 	struct {
 		__le16 pad;
@@ -1028,39 +1109,44 @@ static int scarlett2_usb_set_mux(struct usb_mixer_interface *mixer)
 
 	req.pad = 0;
 
-	/* mux settings for each rate */
-	for (rate = 0, port_dir_rate = SCARLETT2_PORT_OUT_44;
-	     port_dir_rate <= SCARLETT2_PORT_OUT_176;
-	     rate++, port_dir_rate++) {
-		int order_num, i, err;
-
-		req.num = cpu_to_le16(rate);
-
-		for (order_num = 0, i = 0;
-		     order_num < SCARLETT2_PORT_TYPE_COUNT;
-		     order_num++) {
-			int port_type = assignment_order[order_num];
-			int j = scarlett2_get_port_start_num(ports,
-							     SCARLETT2_PORT_OUT,
-							     port_type);
-			int port_id = ports[port_type].id;
-			int channel;
-
-			for (channel = 0;
-			     channel < ports[port_type].num[port_dir_rate];
-			     channel++, i++, j++)
-				/* lower 12 bits for the destination and
-				 * next 12 bits for the source
-				 */
-				req.data[i] = !port_id
-					? 0
-					: cpu_to_le32(
-						port_id |
-						channel |
-						scarlett2_mux_src_num_to_id(
-							ports, private->mux[j]
-						) << 12
-					  );
+	/* set mux settings for each rate */
+	for (table = 0; table < SCARLETT2_MUX_TABLES; table++) {
+		const struct scarlett2_mux_entry *entry;
+
+		/* i counts over the output array */
+		int i = 0, err;
+
+		req.num = cpu_to_le16(table);
+
+		/* loop through each entry */
+		for (entry = info->mux_assignment[table];
+		     entry->count;
+		     entry++) {
+			int j;
+			int port_type = entry->port_type;
+			int port_idx = entry->start;
+			int mux_idx = scarlett2_get_port_start_num(ports,
+				SCARLETT2_PORT_OUT, port_type) + port_idx;
+			int dst_id = ports[port_type].id + port_idx;
+
+			/* Empty slots */
+			if (!dst_id) {
+				for (j = 0; j < entry->count; j++)
+					req.data[i++] = 0;
+				continue;
+			}
+
+			/* Non-empty mux slots use the lower 12 bits
+			 * for the destination and next 12 bits for
+			 * the source
+			 */
+			for (j = 0; j < entry->count; j++) {
+				int src_id = scarlett2_mux_src_num_to_id(
+					ports, private->mux[mux_idx++]);
+				req.data[i++] = cpu_to_le32(dst_id |
+							    src_id << 12);
+				dst_id++;
+			}
 		}
 
 		err = scarlett2_usb(mixer, SCARLETT2_USB_SET_MUX,
@@ -2081,7 +2167,7 @@ static void scarlett2_count_mux_io(struct scarlett2_data *private)
 	     port_type < SCARLETT2_PORT_TYPE_COUNT;
 	     port_type++) {
 		srcs += ports[port_type].num[SCARLETT2_PORT_IN];
-		dsts += ports[port_type].num[SCARLETT2_PORT_OUT_44];
+		dsts += ports[port_type].num[SCARLETT2_PORT_OUT];
 	}
 
 	private->num_mux_srcs = srcs;
-- 
2.31.1

