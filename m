Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CBC3AF4C0
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:15:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDEC416DA;
	Mon, 21 Jun 2021 20:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDEC416DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299355;
	bh=JCK0YUQeGEeLS83MNZzOJqBxhALzogKSm7dqVx8NglI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sqhQ5XN6CO6jDYiwTYGS1gsYZ8Nm6tspPJgnfhRHoUY/X6MTsPp7LHOrffwFFIw3i
	 MfKzO60Aan2eNBQmrsaGLZ3PGalAfV+boD6Q4yqC02ufNvJzx+FGxsX8M+ttKinnXG
	 /5OEfUw2465Lv1C8T/bJrriTnRA8yTd65Ah4ybsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26FF2F8054A;
	Mon, 21 Jun 2021 20:09:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3430F80548; Mon, 21 Jun 2021 20:09:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 672EEF80528
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:09:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 672EEF80528
Received: by m.b4.vu (Postfix, from userid 1000)
 id E567C61E287D; Tue, 22 Jun 2021 03:39:43 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:39:43 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 14/31] ALSA: usb-audio: scarlett2: Split struct scarlett2_ports
Message-ID: <7a9e57e4e55a482390c692a9e60731d72b664a15.1624294591.git.g@b4.vu>
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

The scarlett2_ports struct contains both generic (hardware IDs and
descriptions) and model-specific (port count) data. Remove the generic
data from the scarlett2_device_info struct so it is not repeated for
every model.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 303 +++++++++++++-------------------
 1 file changed, 124 insertions(+), 179 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index b874c0c922d3..7647b3428093 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -203,20 +203,55 @@ static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
 };
 
 /* Description of each hardware port type:
- * - id: hardware ID for this port type
- * - num: number of sources/destinations of this port type
+ * - id: hardware ID of this port type
  * - src_descr: printf format string for mux input selections
  * - src_num_offset: added to channel number for the fprintf
  * - dst_descr: printf format string for mixer controls
  */
-struct scarlett2_ports {
+struct scarlett2_port {
 	u16 id;
-	int num[SCARLETT2_PORT_DIRNS];
 	const char * const src_descr;
 	int src_num_offset;
 	const char * const dst_descr;
 };
 
+static const struct scarlett2_port scarlett2_ports[SCARLETT2_PORT_TYPE_COUNT] = {
+	[SCARLETT2_PORT_TYPE_NONE] = {
+		.id = 0x000,
+		.src_descr = "Off"
+	},
+	[SCARLETT2_PORT_TYPE_ANALOGUE] = {
+		.id = 0x080,
+		.src_descr = "Analogue %d",
+		.src_num_offset = 1,
+		.dst_descr = "Analogue Output %02d Playback"
+	},
+	[SCARLETT2_PORT_TYPE_SPDIF] = {
+		.id = 0x180,
+		.src_descr = "S/PDIF %d",
+		.src_num_offset = 1,
+		.dst_descr = "S/PDIF Output %d Playback"
+	},
+	[SCARLETT2_PORT_TYPE_ADAT] = {
+		.id = 0x200,
+		.src_descr = "ADAT %d",
+		.src_num_offset = 1,
+		.dst_descr = "ADAT Output %d Playback"
+	},
+	[SCARLETT2_PORT_TYPE_MIX] = {
+		.id = 0x300,
+		.src_descr = "Mix %c",
+		.src_num_offset = 'A',
+		.dst_descr = "Mixer Input %02d Capture"
+	},
+	[SCARLETT2_PORT_TYPE_PCM] = {
+		.id = 0x600,
+		.src_descr = "PCM %d",
+		.src_num_offset = 1,
+		.dst_descr = "PCM %02d Capture"
+	},
+};
+
 /* Number of mux tables: one for each band of sample rates
  * (44.1/48kHz, 88.2/96kHz, and 176.4/176kHz)
  */
@@ -254,8 +289,8 @@ struct scarlett2_device_info {
 	/* additional description for the line out volume controls */
 	const char * const line_out_descrs[SCARLETT2_ANALOGUE_MAX];
 
-	/* port count and type data */
-	struct scarlett2_ports ports[SCARLETT2_PORT_TYPE_COUNT];
+	/* number of sources/destinations of each port type */
+	const int port_count[SCARLETT2_PORT_TYPE_COUNT][SCARLETT2_PORT_DIRNS];
 
 	/* layout/order of the entries in the set_mux message */
 	struct scarlett2_mux_entry mux_assignment[SCARLETT2_MUX_TABLES]
@@ -309,40 +344,12 @@ static const struct scarlett2_device_info s6i6_gen2_info = {
 		"Headphones 2 R",
 	},
 
-	.ports = {
-		[SCARLETT2_PORT_TYPE_NONE] = {
-			.id = 0x000,
-			.num = { 1, 0 },
-			.src_descr = "Off",
-		},
-		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
-			.id = 0x080,
-			.num = { 4, 4 },
-			.src_descr = "Analogue %d",
-			.src_num_offset = 1,
-			.dst_descr = "Analogue Output %02d Playback"
-		},
-		[SCARLETT2_PORT_TYPE_SPDIF] = {
-			.id = 0x180,
-			.num = { 2, 2 },
-			.src_descr = "S/PDIF %d",
-			.src_num_offset = 1,
-			.dst_descr = "S/PDIF Output %d Playback"
-		},
-		[SCARLETT2_PORT_TYPE_MIX] = {
-			.id = 0x300,
-			.num = { 10, 18 },
-			.src_descr = "Mix %c",
-			.src_num_offset = 65,
-			.dst_descr = "Mixer Input %02d Capture"
-		},
-		[SCARLETT2_PORT_TYPE_PCM] = {
-			.id = 0x600,
-			.num = { 6, 6 },
-			.src_descr = "PCM %d",
-			.src_num_offset = 1,
-			.dst_descr = "PCM %02d Capture"
-		},
+	.port_count = {
+		[SCARLETT2_PORT_TYPE_NONE]     = {  1,  0 },
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = {  4,  4 },
+		[SCARLETT2_PORT_TYPE_SPDIF]    = {  2,  2 },
+		[SCARLETT2_PORT_TYPE_MIX]      = { 10, 18 },
+		[SCARLETT2_PORT_TYPE_PCM]      = {  6,  6 },
 	},
 
 	.mux_assignment = { {
@@ -384,46 +391,13 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 		"Headphones 2 R",
 	},
 
-	.ports = {
-		[SCARLETT2_PORT_TYPE_NONE] = {
-			.id = 0x000,
-			.num = { 1, 0 },
-			.src_descr = "Off",
-		},
-		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
-			.id = 0x080,
-			.num = { 8, 6 },
-			.src_descr = "Analogue %d",
-			.src_num_offset = 1,
-			.dst_descr = "Analogue Output %02d Playback"
-		},
-		[SCARLETT2_PORT_TYPE_SPDIF] = {
-			.id = 0x180,
-			.num = { 2, 2 },
-			.src_descr = "S/PDIF %d",
-			.src_num_offset = 1,
-			.dst_descr = "S/PDIF Output %d Playback"
-		},
-		[SCARLETT2_PORT_TYPE_ADAT] = {
-			.id = 0x200,
-			.num = { 8, 0 },
-			.src_descr = "ADAT %d",
-			.src_num_offset = 1,
-		},
-		[SCARLETT2_PORT_TYPE_MIX] = {
-			.id = 0x300,
-			.num = { 10, 18 },
-			.src_descr = "Mix %c",
-			.src_num_offset = 65,
-			.dst_descr = "Mixer Input %02d Capture"
-		},
-		[SCARLETT2_PORT_TYPE_PCM] = {
-			.id = 0x600,
-			.num = { 8, 18 },
-			.src_descr = "PCM %d",
-			.src_num_offset = 1,
-			.dst_descr = "PCM %02d Capture"
-		},
+	.port_count = {
+		[SCARLETT2_PORT_TYPE_NONE]     = {  1,  0 },
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = {  8,  6 },
+		[SCARLETT2_PORT_TYPE_SPDIF]    = {  2,  2 },
+		[SCARLETT2_PORT_TYPE_ADAT]     = {  8,  0 },
+		[SCARLETT2_PORT_TYPE_MIX]      = { 10, 18 },
+		[SCARLETT2_PORT_TYPE_PCM]      = {  8, 18 },
 	},
 
 	.mux_assignment = { {
@@ -468,51 +442,13 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 		"Headphones 2 R",
 	},
 
-	.ports = {
-		[SCARLETT2_PORT_TYPE_NONE] = {
-			.id = 0x000,
-			.num = { 1, 0 },
-			.src_descr = "Off",
-		},
-		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
-			.id = 0x080,
-			.num = { 8, 10 },
-			.src_descr = "Analogue %d",
-			.src_num_offset = 1,
-			.dst_descr = "Analogue Output %02d Playback"
-		},
-		[SCARLETT2_PORT_TYPE_SPDIF] = {
-			/* S/PDIF outputs aren't available at 192kHz
-			 * but are included in the USB mux I/O
-			 * assignment message anyway
-			 */
-			.id = 0x180,
-			.num = { 2, 2 },
-			.src_descr = "S/PDIF %d",
-			.src_num_offset = 1,
-			.dst_descr = "S/PDIF Output %d Playback"
-		},
-		[SCARLETT2_PORT_TYPE_ADAT] = {
-			.id = 0x200,
-			.num = { 8, 8 },
-			.src_descr = "ADAT %d",
-			.src_num_offset = 1,
-			.dst_descr = "ADAT Output %d Playback"
-		},
-		[SCARLETT2_PORT_TYPE_MIX] = {
-			.id = 0x300,
-			.num = { 10, 18 },
-			.src_descr = "Mix %c",
-			.src_num_offset = 65,
-			.dst_descr = "Mixer Input %02d Capture"
-		},
-		[SCARLETT2_PORT_TYPE_PCM] = {
-			.id = 0x600,
-			.num = { 20, 18 },
-			.src_descr = "PCM %d",
-			.src_num_offset = 1,
-			.dst_descr = "PCM %02d Capture"
-		},
+	.port_count = {
+		[SCARLETT2_PORT_TYPE_NONE]     = {  1,  0 },
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = {  8, 10 },
+		[SCARLETT2_PORT_TYPE_SPDIF]    = {  2,  2 },
+		[SCARLETT2_PORT_TYPE_ADAT]     = {  8,  8 },
+		[SCARLETT2_PORT_TYPE_MIX]      = { 10, 18 },
+		[SCARLETT2_PORT_TYPE_PCM]      = { 20, 18 },
 	},
 
 	.mux_assignment = { {
@@ -552,13 +488,14 @@ static const struct scarlett2_device_info *scarlett2_devices[] = {
 };
 
 /* get the starting port index number for a given port type/direction */
-static int scarlett2_get_port_start_num(const struct scarlett2_ports *ports,
-					int direction, int port_type)
+static int scarlett2_get_port_start_num(
+	const int port_count[][SCARLETT2_PORT_DIRNS],
+	int direction, int port_type)
 {
 	int i, num = 0;
 
 	for (i = 0; i < port_type; i++)
-		num += ports[i].num[direction];
+		num += port_count[i][direction];
 
 	return num;
 }
@@ -924,7 +861,7 @@ static int scarlett2_usb_get_mix(struct usb_mixer_interface *mixer,
 	const struct scarlett2_device_info *info = private->info;
 
 	int num_mixer_in =
-		info->ports[SCARLETT2_PORT_TYPE_MIX].num[SCARLETT2_PORT_OUT];
+		info->port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_OUT];
 	int err, i, j, k;
 
 	struct {
@@ -973,7 +910,7 @@ static int scarlett2_usb_set_mix(struct usb_mixer_interface *mixer,
 
 	int i, j;
 	int num_mixer_in =
-		info->ports[SCARLETT2_PORT_TYPE_MIX].num[SCARLETT2_PORT_OUT];
+		info->port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_OUT];
 
 	req.mix_num = cpu_to_le16(mix_num);
 
@@ -987,18 +924,18 @@ static int scarlett2_usb_set_mix(struct usb_mixer_interface *mixer,
 			     NULL, 0);
 }
 
-/* Convert a port number index (per info->ports) to a hardware ID */
-static u32 scarlett2_mux_src_num_to_id(const struct scarlett2_ports *ports,
-				       int num)
+/* Convert a port number index (per info->port_count) to a hardware ID */
+static u32 scarlett2_mux_src_num_to_id(
+	const int port_count[][SCARLETT2_PORT_DIRNS], int num)
 {
 	int port_type;
 
 	for (port_type = 0;
 	     port_type < SCARLETT2_PORT_TYPE_COUNT;
 	     port_type++) {
-		if (num < ports[port_type].num[SCARLETT2_PORT_IN])
-			return ports[port_type].id | num;
-		num -= ports[port_type].num[SCARLETT2_PORT_IN];
+		if (num < port_count[port_type][SCARLETT2_PORT_IN])
+			return scarlett2_ports[port_type].id | num;
+		num -= port_count[port_type][SCARLETT2_PORT_IN];
 	}
 
 	/* Oops */
@@ -1006,9 +943,8 @@ static u32 scarlett2_mux_src_num_to_id(const struct scarlett2_ports *ports,
 }
 
 /* Convert a hardware ID to a port number index */
-static u32 scarlett2_mux_id_to_num(const struct scarlett2_ports *ports,
-				   int direction,
-				   u32 id)
+static u32 scarlett2_mux_id_to_num(
+	const int port_count[][SCARLETT2_PORT_DIRNS], int direction, u32 id)
 {
 	int port_type;
 	int port_num = 0;
@@ -1016,11 +952,11 @@ static u32 scarlett2_mux_id_to_num(const struct scarlett2_ports *ports,
 	for (port_type = 0;
 	     port_type < SCARLETT2_PORT_TYPE_COUNT;
 	     port_type++) {
-		struct scarlett2_ports port = ports[port_type];
-		int count = port.num[direction];
+		int base = scarlett2_ports[port_type].id;
+		int count = port_count[port_type][direction];
 
-		if (id >= port.id && id < port.id + count)
-			return port_num + id - port.id;
+		if (id >= base && id < base + count)
+			return port_num + id - base;
 		port_num += count;
 	}
 
@@ -1033,11 +969,11 @@ static void scarlett2_usb_populate_mux(struct scarlett2_data *private,
 				       u32 mux_entry)
 {
 	const struct scarlett2_device_info *info = private->info;
-	const struct scarlett2_ports *ports = info->ports;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 
 	int dst_idx, src_idx;
 
-	dst_idx = scarlett2_mux_id_to_num(ports, SCARLETT2_PORT_OUT,
+	dst_idx = scarlett2_mux_id_to_num(port_count, SCARLETT2_PORT_OUT,
 					  mux_entry & 0xFFF);
 	if (dst_idx < 0)
 		return;
@@ -1049,7 +985,7 @@ static void scarlett2_usb_populate_mux(struct scarlett2_data *private,
 		return;
 	}
 
-	src_idx = scarlett2_mux_id_to_num(ports, SCARLETT2_PORT_IN,
+	src_idx = scarlett2_mux_id_to_num(port_count, SCARLETT2_PORT_IN,
 					  mux_entry >> 12);
 	if (src_idx < 0)
 		return;
@@ -1098,7 +1034,7 @@ static int scarlett2_usb_set_mux(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const struct scarlett2_ports *ports = info->ports;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int table;
 
 	struct {
@@ -1125,9 +1061,9 @@ static int scarlett2_usb_set_mux(struct usb_mixer_interface *mixer)
 			int j;
 			int port_type = entry->port_type;
 			int port_idx = entry->start;
-			int mux_idx = scarlett2_get_port_start_num(ports,
+			int mux_idx = scarlett2_get_port_start_num(port_count,
 				SCARLETT2_PORT_OUT, port_type) + port_idx;
-			int dst_id = ports[port_type].id + port_idx;
+			int dst_id = scarlett2_ports[port_type].id + port_idx;
 
 			/* Empty slots */
 			if (!dst_id) {
@@ -1142,7 +1078,7 @@ static int scarlett2_usb_set_mux(struct usb_mixer_interface *mixer)
 			 */
 			for (j = 0; j < entry->count; j++) {
 				int src_id = scarlett2_mux_src_num_to_id(
-					ports, private->mux[mux_idx++]);
+					port_count, private->mux[mux_idx++]);
 				req.data[i++] = cpu_to_le32(dst_id |
 							    src_id << 12);
 				dst_id++;
@@ -1289,10 +1225,10 @@ static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const struct scarlett2_ports *ports = info->ports;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	struct scarlett2_usb_volume_status volume_status;
 	int num_line_out =
-		ports[SCARLETT2_PORT_TYPE_ANALOGUE].num[SCARLETT2_PORT_OUT];
+		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 	int err, i;
 	int mute;
 
@@ -1721,9 +1657,9 @@ static int scarlett2_dim_mute_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const struct scarlett2_ports *ports = info->ports;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int num_line_out =
-		ports[SCARLETT2_PORT_TYPE_ANALOGUE].num[SCARLETT2_PORT_OUT];
+		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 
 	int index = elem->control;
 	int oval, val, err = 0, i;
@@ -1772,9 +1708,9 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const struct scarlett2_ports *ports = info->ports;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int num_line_out =
-		ports[SCARLETT2_PORT_TYPE_ANALOGUE].num[SCARLETT2_PORT_OUT];
+		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 	int err, i;
 	char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 
@@ -1913,7 +1849,7 @@ static int scarlett2_mixer_ctl_put(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const struct scarlett2_ports *ports = info->ports;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int oval, val, num_mixer_in, mix_num, err = 0;
 	int index = elem->control;
 
@@ -1921,7 +1857,7 @@ static int scarlett2_mixer_ctl_put(struct snd_kcontrol *kctl,
 
 	oval = private->mix[index];
 	val = ucontrol->value.integer.value[0];
-	num_mixer_in = ports[SCARLETT2_PORT_TYPE_MIX].num[SCARLETT2_PORT_OUT];
+	num_mixer_in = port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_OUT];
 	mix_num = index / num_mixer_in;
 
 	if (oval == val)
@@ -1958,13 +1894,16 @@ static const struct snd_kcontrol_new scarlett2_mixer_ctl = {
 static int scarlett2_add_mixer_ctls(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_ports *ports = private->info->ports;
+	const struct scarlett2_device_info *info = private->info;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int err, i, j;
 	int index;
 	char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 
-	int num_inputs = ports[SCARLETT2_PORT_TYPE_MIX].num[SCARLETT2_PORT_OUT];
-	int num_outputs = ports[SCARLETT2_PORT_TYPE_MIX].num[SCARLETT2_PORT_IN];
+	int num_inputs =
+		port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_OUT];
+	int num_outputs =
+		port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_IN];
 
 	for (i = 0, index = 0; i < num_outputs; i++)
 		for (j = 0; j < num_inputs; j++, index++) {
@@ -1987,7 +1926,8 @@ static int scarlett2_mux_src_enum_ctl_info(struct snd_kcontrol *kctl,
 {
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct scarlett2_data *private = elem->head.mixer->private_data;
-	const struct scarlett2_ports *ports = private->info->ports;
+	const struct scarlett2_device_info *info = private->info;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	unsigned int item = uinfo->value.enumerated.item;
 	int items = private->num_mux_srcs;
 	int port_type;
@@ -2002,13 +1942,15 @@ static int scarlett2_mux_src_enum_ctl_info(struct snd_kcontrol *kctl,
 	for (port_type = 0;
 	     port_type < SCARLETT2_PORT_TYPE_COUNT;
 	     port_type++) {
-		if (item < ports[port_type].num[SCARLETT2_PORT_IN]) {
+		if (item < port_count[port_type][SCARLETT2_PORT_IN]) {
+			const struct scarlett2_port *port =
+				&scarlett2_ports[port_type];
+
 			sprintf(uinfo->value.enumerated.name,
-				ports[port_type].src_descr,
-				item + ports[port_type].src_num_offset);
+				port->src_descr, item + port->src_num_offset);
 			return 0;
 		}
-		item -= ports[port_type].num[SCARLETT2_PORT_IN];
+		item -= port_count[port_type][SCARLETT2_PORT_IN];
 	}
 
 	return -EINVAL;
@@ -2063,18 +2005,20 @@ static const struct snd_kcontrol_new scarlett2_mux_src_enum_ctl = {
 static int scarlett2_add_mux_enums(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
-	const struct scarlett2_ports *ports = private->info->ports;
+	const struct scarlett2_device_info *info = private->info;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int port_type, channel, i;
 
 	for (i = 0, port_type = 0;
 	     port_type < SCARLETT2_PORT_TYPE_COUNT;
 	     port_type++) {
 		for (channel = 0;
-		     channel < ports[port_type].num[SCARLETT2_PORT_OUT];
+		     channel < port_count[port_type][SCARLETT2_PORT_OUT];
 		     channel++, i++) {
 			int err;
 			char s[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-			const char *const descr = ports[port_type].dst_descr;
+			const char *const descr =
+				scarlett2_ports[port_type].dst_descr;
 
 			snprintf(s, sizeof(s) - 5, descr, channel + 1);
 			strcat(s, " Enum");
@@ -2160,14 +2104,15 @@ static void scarlett2_private_suspend(struct usb_mixer_interface *mixer)
 
 static void scarlett2_count_mux_io(struct scarlett2_data *private)
 {
-	const struct scarlett2_ports *ports = private->info->ports;
+	const struct scarlett2_device_info *info = private->info;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int port_type, srcs = 0, dsts = 0;
 
 	for (port_type = 0;
 	     port_type < SCARLETT2_PORT_TYPE_COUNT;
 	     port_type++) {
-		srcs += ports[port_type].num[SCARLETT2_PORT_IN];
-		dsts += ports[port_type].num[SCARLETT2_PORT_OUT];
+		srcs += port_count[port_type][SCARLETT2_PORT_IN];
+		dsts += port_count[port_type][SCARLETT2_PORT_OUT];
 	}
 
 	private->num_mux_srcs = srcs;
@@ -2265,11 +2210,11 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const struct scarlett2_ports *ports = info->ports;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int num_line_out =
-		ports[SCARLETT2_PORT_TYPE_ANALOGUE].num[SCARLETT2_PORT_OUT];
+		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 	int num_mixer_out =
-		ports[SCARLETT2_PORT_TYPE_MIX].num[SCARLETT2_PORT_IN];
+		port_count[SCARLETT2_PORT_TYPE_MIX][SCARLETT2_PORT_IN];
 	struct scarlett2_usb_volume_status volume_status;
 	int err, i;
 
@@ -2356,9 +2301,9 @@ static void scarlett2_notify_monitor(
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const struct scarlett2_ports *ports = info->ports;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int num_line_out =
-		ports[SCARLETT2_PORT_TYPE_ANALOGUE].num[SCARLETT2_PORT_OUT];
+		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 	int i;
 
 	/* if line_out_hw_vol is 0, there are no controls to update */
@@ -2385,9 +2330,9 @@ static void scarlett2_notify_dim_mute(
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
-	const struct scarlett2_ports *ports = info->ports;
+	const int (*port_count)[SCARLETT2_PORT_DIRNS] = info->port_count;
 	int num_line_out =
-		ports[SCARLETT2_PORT_TYPE_ANALOGUE].num[SCARLETT2_PORT_OUT];
+		port_count[SCARLETT2_PORT_TYPE_ANALOGUE][SCARLETT2_PORT_OUT];
 	int i;
 
 	private->vol_updated = 1;
-- 
2.31.1

