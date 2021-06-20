Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1303ADF83
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 18:53:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BDA81703;
	Sun, 20 Jun 2021 18:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BDA81703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624207985;
	bh=7o1FbQq1gieO+JygeQkNnK9d3MVYaUiiCu3VUcO7H2o=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kLcvS/uuABtWcbWsOOh/Ngg5ZKbwN7c/aDXvcHg1+9xVtxT6AmxTnD7U/11w7+zLG
	 93twAp5rc29UwtsNioyKn0eUOD9aKF/3rbk8XOAwTFlnsFLDPSuHjSwbCRm/uBmEKq
	 KyK0nziEvbhxGxveOofpG/rH5WHPCdwpio/o6fQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DC23F8053C;
	Sun, 20 Jun 2021 18:47:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2D4BF80520; Sun, 20 Jun 2021 18:46:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0501F80511
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 18:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0501F80511
Received: by m.b4.vu (Postfix, from userid 1000)
 id 2436661E5F1F; Mon, 21 Jun 2021 02:16:52 +0930 (ACST)
Date: Mon, 21 Jun 2021 02:16:52 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 14/14] ALSA: usb-audio: scarlett2: Remove hard-coded USB
 #defines
Message-ID: <20210620164652.GA9237@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Remove the hard-coded interface number and related constants for the
vendor-specific interface and look them up from the USB endpoint
descriptor.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 74 ++++++++++++++++++++++++---------
 1 file changed, 55 insertions(+), 19 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 45fd540920b9..2e1937b072ee 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -230,6 +230,10 @@ struct scarlett2_data {
 	struct mutex data_mutex; /* lock access to this data */
 	struct delayed_work work;
 	const struct scarlett2_device_info *info;
+	__u8 bInterfaceNumber;
+	__u8 bEndpointAddress;
+	__u16 wMaxPacketSize;
+	__u8 bInterval;
 	int num_mux_srcs;
 	int num_mux_dsts;
 	u16 scarlett2_seq;
@@ -444,12 +448,6 @@ static int scarlett2_get_port_start_num(const struct scarlett2_ports *ports,
 
 /*** USB Interactions ***/
 
-/* Vendor-Specific Interface, Endpoint, MaxPacketSize, Interval */
-#define SCARLETT2_USB_VENDOR_SPECIFIC_INTERFACE 5
-#define SCARLETT2_USB_INTERRUPT_ENDPOINT 4
-#define SCARLETT2_USB_INTERRUPT_MAX_DATA 64
-#define SCARLETT2_USB_INTERRUPT_INTERVAL 3
-
 /* Interrupt flags for dim/mute button and monitor changes */
 #define SCARLETT2_USB_NOTIFY_DIM_MUTE 0x00200000
 #define SCARLETT2_USB_NOTIFY_MONITOR  0x00400000
@@ -615,7 +613,7 @@ static int scarlett2_usb(
 			SCARLETT2_USB_VENDOR_SPECIFIC_CMD_REQ,
 			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
 			0,
-			SCARLETT2_USB_VENDOR_SPECIFIC_INTERFACE,
+			private->bInterfaceNumber,
 			req,
 			req_buf_size);
 
@@ -635,7 +633,7 @@ static int scarlett2_usb(
 			SCARLETT2_USB_VENDOR_SPECIFIC_CMD_RESP,
 			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
 			0,
-			SCARLETT2_USB_VENDOR_SPECIFIC_INTERFACE,
+			private->bInterfaceNumber,
 			resp,
 			resp_buf_size);
 
@@ -1886,12 +1884,45 @@ static void scarlett2_count_mux_io(struct scarlett2_data *private)
 	private->num_mux_dsts = dsts;
 }
 
-/* Initialise private data and sequence number */
+/* Look through the interface descriptors for the Focusrite Control
+ * interface (bInterfaceClass = 255 Vendor Specific Class) and set
+ * bInterfaceNumber, bEndpointAddress, wMaxPacketSize, and bInterval
+ * in private
+ */
+static int scarlett2_find_fc_interface(struct usb_device *dev,
+				       struct scarlett2_data *private)
+{
+	struct usb_host_config *config = dev->actconfig;
+	int i;
+
+	for (i = 0; i < config->desc.bNumInterfaces; i++) {
+		struct usb_interface *intf = config->interface[i];
+		struct usb_interface_descriptor *desc =
+			&intf->altsetting[0].desc;
+		struct usb_endpoint_descriptor *epd;
+
+		if (desc->bInterfaceClass != 255)
+			continue;
+
+		epd = get_endpoint(intf->altsetting, 0);
+		private->bInterfaceNumber = desc->bInterfaceNumber;
+		private->bEndpointAddress = epd->bEndpointAddress &
+			USB_ENDPOINT_NUMBER_MASK;
+		private->wMaxPacketSize = le16_to_cpu(epd->wMaxPacketSize);
+		private->bInterval = epd->bInterval;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+/* Initialise private data, sequence number, and get the USB data */
 static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 				  const struct scarlett2_device_info *info)
 {
 	struct scarlett2_data *private =
 		kzalloc(sizeof(struct scarlett2_data), GFP_KERNEL);
+	int err;
 
 	if (!private)
 		return -ENOMEM;
@@ -1899,13 +1930,19 @@ static int scarlett2_init_private(struct usb_mixer_interface *mixer,
 	mutex_init(&private->usb_mutex);
 	mutex_init(&private->data_mutex);
 	INIT_DELAYED_WORK(&private->work, scarlett2_config_save_work);
+
+	mixer->private_data = private;
+	mixer->private_free = scarlett2_private_free;
+	mixer->private_suspend = scarlett2_private_suspend;
+
 	private->info = info;
 	scarlett2_count_mux_io(private);
 	private->scarlett2_seq = 0;
 	private->mixer = mixer;
-	mixer->private_data = private;
-	mixer->private_free = scarlett2_private_free;
-	mixer->private_suspend = scarlett2_private_suspend;
+
+	err = scarlett2_find_fc_interface(mixer->chip->dev, private);
+	if (err < 0)
+		return err;
 
 	/* Initialise the sequence number used for the proprietary commands */
 	return scarlett2_usb(mixer, SCARLETT2_USB_INIT_SEQ, NULL, 0, NULL, 0);
@@ -2050,8 +2087,8 @@ static void scarlett2_notify(struct urb *urb)
 static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
 {
 	struct usb_device *dev = mixer->chip->dev;
-	unsigned int pipe = usb_rcvintpipe(dev,
-					   SCARLETT2_USB_INTERRUPT_ENDPOINT);
+	struct scarlett2_data *private = mixer->private_data;
+	unsigned int pipe = usb_rcvintpipe(dev, private->bEndpointAddress);
 	void *transfer_buffer;
 
 	if (mixer->urb) {
@@ -2067,14 +2104,13 @@ static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
 	if (!mixer->urb)
 		return -ENOMEM;
 
-	transfer_buffer = kmalloc(SCARLETT2_USB_INTERRUPT_MAX_DATA, GFP_KERNEL);
+	transfer_buffer = kmalloc(private->wMaxPacketSize, GFP_KERNEL);
 	if (!transfer_buffer)
 		return -ENOMEM;
 
 	usb_fill_int_urb(mixer->urb, dev, pipe,
-			 transfer_buffer, SCARLETT2_USB_INTERRUPT_MAX_DATA,
-			 scarlett2_notify, mixer,
-			 SCARLETT2_USB_INTERRUPT_INTERVAL);
+			 transfer_buffer, private->wMaxPacketSize,
+			 scarlett2_notify, mixer, private->bInterval);
 
 	return usb_submit_urb(mixer->urb, GFP_KERNEL);
 }
@@ -2084,7 +2120,7 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer,
 {
 	int err;
 
-	/* Initialise private data and sequence number */
+	/* Initialise private data, sequence number, and get the USB data */
 	err = scarlett2_init_private(mixer, info);
 	if (err < 0)
 		return err;
-- 
2.31.1

