Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6064E39E74E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 21:15:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E35801671;
	Mon,  7 Jun 2021 21:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E35801671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623093352;
	bh=gaf+cvMlQJCHDT7w5kwjDw4UJyLVaj+YDlLgbXnLPTI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YulIy8NFm0ZuEGFTicVDO7VWF/UajRGwYStQLKZ9seRFGy3RfxtJydFyMi1O2SlEG
	 7/2nwofsaWnhpPiPf+yx0cUIIUHl1/m9Ln25wIEO4N28dClMbe7NL3dj/zfcu4e102
	 teM5I9BIBCIYRvKOmMVP9+77Pc7Qm9qLcHpJx1r0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE049F804CF;
	Mon,  7 Jun 2021 21:14:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47C55F804CC; Mon,  7 Jun 2021 21:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D20CEF804CA
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 21:13:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D20CEF804CA
Received: by m.b4.vu (Postfix, from userid 1000)
 id 60FD961956CD; Tue,  8 Jun 2021 04:43:51 +0930 (ACST)
Date: Tue, 8 Jun 2021 04:43:51 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH V2 2/2] ALSA: usb-audio: scarlett2: Read mux at init time
Message-ID: <15b17c60a2bca174bcddcec41c9419b746f21c1d.1623091570.git.g@b4.vu>
References: <cover.1623091570.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1623091570.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Daniel Sales <daniel.sales.z@gmail.com>,
 Markus Schroetter <project.m.schroetter@gmail.com>,
 Vladimir Sadovnikov <sadko4u@gmail.com>, Alex Fellows <alex.fellows@gmail.com>
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

Add support for retrieving the mux configuration from the hardware
when the driver is initialising. Previously the ALSA controls were
initialised to a default hard-coded state instead of being initialised
to match the hardware state.

Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
Suggested-by: Vladimir Sadovnikov <sadko4u@gmail.com>
Tested-by: Markus Schroetter <project.m.schroetter@gmail.com>
Tested-by: Alex Fellows <alex.fellows@gmail.com>
Tested-by: Daniel Sales <daniel.sales.z@gmail.com>
Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 170 ++++++++++++++++++++------------
 1 file changed, 106 insertions(+), 64 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 5969d6bda58d..a461317dc8c6 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -32,6 +32,10 @@
  * Scarlett 6i6 support added in June 2019 (thanks to Martin Wittmann
  * for providing usbmon output and testing).
  *
+ * Support for loading mixer volume and mux configuration from the
+ * interface during driver initialisation added in May 2021 (thanks to
+ * Vladimir Sadovnikov for figuring out how).
+ *
  * This ALSA mixer gives access to:
  *  - input, output, mixer-matrix muxes
  *  - 18x10 mixer-matrix gain stages
@@ -228,6 +232,7 @@ struct scarlett2_mixer_data {
 	struct delayed_work work;
 	const struct scarlett2_device_info *info;
 	int num_mux_srcs;
+	int num_mux_dsts;
 	u16 scarlett2_seq;
 	u8 vol_updated;
 	u8 master_vol;
@@ -468,6 +473,7 @@ static int scarlett2_get_port_start_num(const struct scarlett2_ports *ports,
 #define SCARLETT2_USB_GET_METER_LEVELS 0x00001001
 #define SCARLETT2_USB_GET_MIX 0x00002001
 #define SCARLETT2_USB_SET_MIX 0x00002002
+#define SCARLETT2_USB_GET_MUX 0x00003001
 #define SCARLETT2_USB_SET_MUX 0x00003002
 #define SCARLETT2_USB_GET_DATA 0x00800000
 #define SCARLETT2_USB_SET_DATA 0x00800001
@@ -877,6 +883,94 @@ static u32 scarlett2_mux_src_num_to_id(const struct scarlett2_ports *ports,
 	return 0;
 }
 
+/* Convert a hardware ID to a port number index */
+static u32 scarlett2_mux_id_to_num(const struct scarlett2_ports *ports,
+				   int direction,
+				   u32 id)
+{
+	int port_type;
+	int port_num = 0;
+
+	for (port_type = 0;
+	     port_type < SCARLETT2_PORT_TYPE_COUNT;
+	     port_type++) {
+		struct scarlett2_ports port = ports[port_type];
+		int count = port.num[direction];
+
+		if (id >= port.id && id < port.id + count)
+			return port_num + id - port.id;
+		port_num += count;
+	}
+
+	/* Oops */
+	return -1;
+}
+
+/* Convert one mux entry from the interface and load into private->mux[] */
+static void scarlett2_usb_populate_mux(struct scarlett2_mixer_data *private,
+				       u32 mux_entry)
+{
+	const struct scarlett2_device_info *info = private->info;
+	const struct scarlett2_ports *ports = info->ports;
+
+	int dst_idx, src_idx;
+
+	dst_idx = scarlett2_mux_id_to_num(ports, SCARLETT2_PORT_OUT,
+					  mux_entry & 0xFFF);
+	if (dst_idx < 0)
+		return;
+
+	if (dst_idx >= private->num_mux_dsts) {
+		usb_audio_err(private->mixer->chip,
+			"BUG: scarlett2_mux_id_to_num(%06x, OUT): %d >= %d",
+			mux_entry, dst_idx, private->num_mux_dsts);
+		return;
+	}
+
+	src_idx = scarlett2_mux_id_to_num(ports, SCARLETT2_PORT_IN,
+					  mux_entry >> 12);
+	if (src_idx < 0)
+		return;
+
+	if (src_idx >= private->num_mux_srcs) {
+		usb_audio_err(private->mixer->chip,
+			"BUG: scarlett2_mux_id_to_num(%06x, IN): %d >= %d",
+			mux_entry, src_idx, private->num_mux_srcs);
+		return;
+	}
+
+	private->mux[dst_idx] = src_idx;
+}
+
+/* Send USB message to get mux inputs and then populate private->mux[] */
+static int scarlett2_usb_get_mux(struct usb_mixer_interface *mixer)
+{
+	struct scarlett2_mixer_data *private = mixer->private_data;
+	int count = private->num_mux_dsts;
+	int err, i;
+
+	struct {
+		__le16 num;
+		__le16 count;
+	} __packed req;
+
+	__le32 data[SCARLETT2_MUX_MAX];
+
+	req.num = 0;
+	req.count = cpu_to_le16(count);
+
+	err = scarlett2_usb(mixer, SCARLETT2_USB_GET_MUX,
+			    &req, sizeof(req),
+			    data, count * sizeof(u32));
+	if (err < 0)
+		return err;
+
+	for (i = 0; i < count; i++)
+		scarlett2_usb_populate_mux(private, le32_to_cpu(data[i]));
+
+	return 0;
+}
+
 /* Send USB messages to set mux inputs */
 static int scarlett2_usb_set_mux(struct usb_mixer_interface *mixer)
 {
@@ -1783,72 +1877,23 @@ static void scarlett2_private_suspend(struct usb_mixer_interface *mixer)
 
 /*** Initialisation ***/
 
-static int scarlett2_count_mux_srcs(const struct scarlett2_ports *ports)
+static void scarlett2_count_mux_io(struct scarlett2_mixer_data *private)
 {
-	int port_type, count = 0;
+	const struct scarlett2_ports *ports = private->info->ports;
+	int port_type, srcs = 0, dsts = 0;
 
 	for (port_type = 0;
 	     port_type < SCARLETT2_PORT_TYPE_COUNT;
-	     port_type++)
-		count += ports[port_type].num[SCARLETT2_PORT_IN];
-
-	return count;
-}
-
-/* Default routing connects PCM outputs and inputs to Analogue,
- * S/PDIF, then ADAT
- */
-static void scarlett2_init_routing(u8 *mux,
-				   const struct scarlett2_ports *ports)
-{
-	int i, input_num, input_count, port_type;
-	int output_num, output_count, port_type_connect_num;
-
-	static const int connect_order[] = {
-		SCARLETT2_PORT_TYPE_ANALOGUE,
-		SCARLETT2_PORT_TYPE_SPDIF,
-		SCARLETT2_PORT_TYPE_ADAT,
-		-1
-	};
-
-	/* Assign PCM inputs (routing outputs) */
-	output_num = scarlett2_get_port_start_num(ports,
-						  SCARLETT2_PORT_OUT,
-						  SCARLETT2_PORT_TYPE_PCM);
-	output_count = ports[SCARLETT2_PORT_TYPE_PCM].num[SCARLETT2_PORT_OUT];
-
-	for (port_type = connect_order[port_type_connect_num = 0];
-	     port_type >= 0;
-	     port_type = connect_order[++port_type_connect_num]) {
-		input_num = scarlett2_get_port_start_num(
-			ports, SCARLETT2_PORT_IN, port_type);
-		input_count = ports[port_type].num[SCARLETT2_PORT_IN];
-		for (i = 0;
-		     i < input_count && output_count;
-		     i++, output_count--)
-			mux[output_num++] = input_num++;
+	     port_type++) {
+		srcs += ports[port_type].num[SCARLETT2_PORT_IN];
+		dsts += ports[port_type].num[SCARLETT2_PORT_OUT_44];
 	}
 
-	/* Assign PCM outputs (routing inputs) */
-	input_num = scarlett2_get_port_start_num(ports,
-						 SCARLETT2_PORT_IN,
-						 SCARLETT2_PORT_TYPE_PCM);
-	input_count = ports[SCARLETT2_PORT_TYPE_PCM].num[SCARLETT2_PORT_IN];
-
-	for (port_type = connect_order[port_type_connect_num = 0];
-	     port_type >= 0;
-	     port_type = connect_order[++port_type_connect_num]) {
-		output_num = scarlett2_get_port_start_num(
-			ports, SCARLETT2_PORT_OUT, port_type);
-		output_count = ports[port_type].num[SCARLETT2_PORT_OUT];
-		for (i = 0;
-		     i < output_count && input_count;
-		     i++, input_count--)
-			mux[output_num++] = input_num++;
-	}
+	private->num_mux_srcs = srcs;
+	private->num_mux_dsts = dsts;
 }
 
-/* Initialise private data, routing, sequence number */
+/* Initialise private data and sequence number */
 static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 				  const struct scarlett2_device_info *info)
 {
@@ -1862,16 +1907,13 @@ static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 	mutex_init(&private->data_mutex);
 	INIT_DELAYED_WORK(&private->work, scarlett2_config_save_work);
 	private->info = info;
-	private->num_mux_srcs = scarlett2_count_mux_srcs(info->ports);
+	scarlett2_count_mux_io(private);
 	private->scarlett2_seq = 0;
 	private->mixer = mixer;
 	mixer->private_data = private;
 	mixer->private_free = scarlett2_private_free;
 	mixer->private_suspend = scarlett2_private_suspend;
 
-	/* Setup default routing */
-	scarlett2_init_routing(private->mux, info->ports);
-
 	/* Initialise the sequence number used for the proprietary commands */
 	return scarlett2_usb(mixer, SCARLETT2_USB_INIT_SEQ, NULL, 0, NULL, 0);
 }
@@ -1947,7 +1989,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 			return err;
 	}
 
-	return 0;
+	return scarlett2_usb_get_mux(mixer);
 }
 
 /* Notify on volume change */
@@ -2055,7 +2097,7 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer,
 {
 	int err;
 
-	/* Initialise private data, routing, sequence number */
+	/* Initialise private data and sequence number */
 	err = scarlett2_init_private(mixer, info);
 	if (err < 0)
 		return err;
-- 
2.31.1

