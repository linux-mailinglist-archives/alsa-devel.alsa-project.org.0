Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA19517235
	for <lists+alsa-devel@lfdr.de>; Mon,  2 May 2022 17:06:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC99D163B;
	Mon,  2 May 2022 17:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC99D163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651503966;
	bh=5J1B70N+5Ia6H5raLiUpZUzZwOkTLsLLJDHw5fXR28s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xt1Y0r76QWSS5SkBTeRsbyEsX7GC9tvE5DafcJdNkW/Lgw6+BWD1uz+efAy7ZT8DW
	 vy1RuaUkByEBafJFjOonnjLBPxn9OYfp6wXseYWVBNnGhvxCjcRqkNJMuG6hcvuLb1
	 8DM+/GfpXgjZzH0Z30ButkoDiae++hikdQTglW9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05F42F8050F;
	Mon,  2 May 2022 17:04:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B252F80507; Mon,  2 May 2022 17:04:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B338F80154
 for <alsa-devel@alsa-project.org>; Mon,  2 May 2022 17:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B338F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="H6W6wdPK"
Received: by mail-il1-x136.google.com with SMTP id o5so8064546ils.11
 for <alsa-devel@alsa-project.org>; Mon, 02 May 2022 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PKKUM6rV/QiarmLZ1OhgQ+vh51B7c4MflEHzwzQMD+Q=;
 b=H6W6wdPKuvFfBEe6itFJmwgYb5Sss7HWGB5BJojA/jVLwIJzCUnRS3S31OWbC5L9Pk
 MWLGdKB31MaFpUNL2GhAh1CGHM0eusf2DErt4ulntP4C62xW1y7f8mKK8YqOV/3rhgXw
 OcV7AZRAy6xcWoi4vOGJjg/r19DocCOqdG4dv4p2GZXcnxCEAclWVhw+rxICtQm3R66v
 NSR5pw50eBB+XPhgjSWqYbQQZon5z70S0yLTKmjMncOHPTLE4nW7mPLKFmkGb4nTexqn
 /k6GT1ZkhPCSwOMy66Ve3UniGIQzKnRrmbLVdFRUOMuZ26Qgt4SxymBpdS4tXWHACqXA
 aklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PKKUM6rV/QiarmLZ1OhgQ+vh51B7c4MflEHzwzQMD+Q=;
 b=U0gQKAANWqyh34mwLzEb1qOA9G0m5j9IN4MJCTnPh2yO/v0GDNMiLHVyIj/G4eoieE
 6yKF8g1IIx9eD78PXuU4z9CZ6Jq17KKtf4qaz5WYwj9yrjJ7E8/zR1s7tMeTxd5005sa
 gFTueOmL5Zx1GPg5t0ZftboMq8tZpna0wcihtzHto2TnyNBA2tl2IClxu1RVgBsSghEn
 PFSy2gzD8BhT70o8j5RDPh/SGlI47mz+6/tJoEMft3i7WuabWEBjIcI4NR7tbXDLSAEX
 ND6Xy5SvzAvGuCkeiLXiMm1cb8I8aDWlWk9sK5HTsvBPDg9IwDj+5luKLFHHZRt4mtTV
 MHaQ==
X-Gm-Message-State: AOAM531P+6eVc3djQVYw57hjIf216TMESRbIolNpRqKhW3tkDcfRZ39z
 xFUkol7ttey+BOlK8DeGZKU=
X-Google-Smtp-Source: ABdhPJzHPN5DcKQRPr2ISCZ0yjdXlT5JJa7BaUwCiYffrU4VX+1VfVP7RUQouegZ6yDklAwDfxy0vA==
X-Received: by 2002:a05:6e02:1be9:b0:2cd:a11f:49fb with SMTP id
 y9-20020a056e021be900b002cda11f49fbmr4529241ilv.190.1651503857912; 
 Mon, 02 May 2022 08:04:17 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-29-252-111.wi.res.rr.com.
 [65.29.252.111]) by smtp.gmail.com with ESMTPSA id
 s12-20020a92c5cc000000b002cde6e352basm2718218ilt.4.2022.05.02.08.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 08:04:17 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com,
	robh@kernel.org
Subject: [PATCH v5 2/2] Add generic serial MIDI driver using serial bus API
Date: Mon,  2 May 2022 10:04:04 -0500
Message-Id: <20220502150404.20295-3-kaehndan@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220502150404.20295-1-kaehndan@gmail.com>
References: <20220502150404.20295-1-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Daniel Kaehn <kaehndan@gmail.com>
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

Generic serial MIDI driver adding support for using serial devices
compatible with the serial bus as raw MIDI devices, allowing using
additional serial devices not compatible with the existing
serial-u16550 driver. Supports only setting standard serial baudrates on
the underlying serial device; however, the underlying serial device can
be configured so that a requested 38.4 kBaud is actually the standard MIDI
31.25 kBaud. Supports DeviceTree configuration.

Signed-off-by: Daniel Kaehn <kaehndan@gmail.com>
---
 sound/drivers/Kconfig          |  18 ++
 sound/drivers/Makefile         |   2 +
 sound/drivers/serial-generic.c | 377 +++++++++++++++++++++++++++++++++
 3 files changed, 397 insertions(+)
 create mode 100644 sound/drivers/serial-generic.c

diff --git a/sound/drivers/Kconfig b/sound/drivers/Kconfig
index ca4cdf666f82..060e7d3f2439 100644
--- a/sound/drivers/Kconfig
+++ b/sound/drivers/Kconfig
@@ -165,6 +165,24 @@ config SND_SERIAL_U16550
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-serial-u16550.
 
+config SND_SERIAL_GENERIC
+	tristate "Generic serial MIDI driver"
+	depends on SERIAL_DEV_BUS
+	depends on OF
+	select SND_RAWMIDI
+	help
+	  To include support for mapping generic serial devices as raw
+	  ALSA MIDI devices, say Y here. The driver only supports setting
+	  the serial port to standard baudrates. To attain the standard MIDI
+	  baudrate of 31.25 kBaud, configure the clock of the underlying serial
+	  device so that a requested 38.4 kBaud will result in the standard speed.
+
+	  Use this devicetree binding to configure serial port mapping
+	  <file:Documentation/devicetree/bindings/sound/serialmidi.yaml>
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-serial-generic.
+
 config SND_MPU401
 	tristate "Generic MPU-401 UART driver"
 	select SND_MPU401_UART
diff --git a/sound/drivers/Makefile b/sound/drivers/Makefile
index c0fe4eccdaef..b60303180a1b 100644
--- a/sound/drivers/Makefile
+++ b/sound/drivers/Makefile
@@ -10,6 +10,7 @@ snd-mtpav-objs := mtpav.o
 snd-mts64-objs := mts64.o
 snd-portman2x4-objs := portman2x4.o
 snd-serial-u16550-objs := serial-u16550.o
+snd-serial-generic-objs := serial-generic.o
 snd-virmidi-objs := virmidi.o
 
 # Toplevel Module Dependency
@@ -17,6 +18,7 @@ obj-$(CONFIG_SND_DUMMY) += snd-dummy.o
 obj-$(CONFIG_SND_ALOOP) += snd-aloop.o
 obj-$(CONFIG_SND_VIRMIDI) += snd-virmidi.o
 obj-$(CONFIG_SND_SERIAL_U16550) += snd-serial-u16550.o
+obj-$(CONFIG_SND_SERIAL_GENERIC) += snd-serial-generic.o
 obj-$(CONFIG_SND_MTPAV) += snd-mtpav.o
 obj-$(CONFIG_SND_MTS64) += snd-mts64.o
 obj-$(CONFIG_SND_PORTMAN2X4) += snd-portman2x4.o
diff --git a/sound/drivers/serial-generic.c b/sound/drivers/serial-generic.c
new file mode 100644
index 000000000000..8168f8a71e15
--- /dev/null
+++ b/sound/drivers/serial-generic.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   serial-generic.c
+ *   Copyright (c) by Daniel Kaehn <kaehndan@gmail.com
+ *   Based on serial-u16550.c by Jaroslav Kysela <perex@perex.cz>,
+ *		                 Isaku Yamahata <yamahata@private.email.ne.jp>,
+ *		                 George Hansper <ghansper@apana.org.au>,
+ *		                 Hannu Savolainen
+ *
+ * Generic serial MIDI driver using the serdev serial bus API for hardware interaction
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/serdev.h>
+#include <linux/serial_reg.h>
+#include <linux/slab.h>
+#include <linux/dev_printk.h>
+
+#include <sound/core.h>
+#include <sound/rawmidi.h>
+#include <sound/initval.h>
+
+MODULE_DESCRIPTION("Generic serial MIDI driver");
+MODULE_LICENSE("GPL");
+
+
+#define SERIAL_MODE_INPUT_OPEN		1
+#define SERIAL_MODE_OUTPUT_OPEN	2
+#define SERIAL_MODE_INPUT_TRIGGERED	3
+#define SERIAL_MODE_OUTPUT_TRIGGERED	4
+
+
+#define SERIAL_TX_STATE_ACTIVE	1
+#define SERIAL_TX_STATE_WAKEUP	2
+
+
+struct snd_serial_generic {
+	struct serdev_device *serdev;
+
+	struct snd_card *card;
+	struct snd_rawmidi *rmidi;
+	struct snd_rawmidi_substream *midi_output;
+	struct snd_rawmidi_substream *midi_input;
+
+	unsigned int baudrate;
+
+	unsigned long filemode;		/* open status of file */
+	struct work_struct tx_work;
+	unsigned long tx_state;
+
+};
+
+static void snd_serial_generic_tx_wakeup(struct snd_serial_generic *drvdata)
+{
+	if (test_and_set_bit(SERIAL_TX_STATE_ACTIVE, &drvdata->tx_state))
+		set_bit(SERIAL_TX_STATE_WAKEUP, &drvdata->tx_state);
+
+	schedule_work(&drvdata->tx_work);
+}
+
+#define INTERNAL_BUF_SIZE 256
+
+static void snd_serial_generic_tx_work(struct work_struct *work)
+{
+	static char buf[INTERNAL_BUF_SIZE];
+	int num_bytes;
+	struct snd_serial_generic *drvdata = container_of(work, struct snd_serial_generic,
+						   tx_work);
+	struct snd_rawmidi_substream *substream = drvdata->midi_output;
+
+	clear_bit(SERIAL_TX_STATE_WAKEUP, &drvdata->tx_state);
+
+	while (!snd_rawmidi_transmit_empty(substream)) {
+		num_bytes = snd_rawmidi_transmit_peek(substream, buf, INTERNAL_BUF_SIZE);
+		num_bytes = serdev_device_write_buf(drvdata->serdev, buf, num_bytes);
+
+		if (!num_bytes)
+			break;
+
+		snd_rawmidi_transmit_ack(substream, num_bytes);
+
+		if (!test_bit(SERIAL_TX_STATE_WAKEUP, &drvdata->tx_state))
+			break;
+	}
+
+	clear_bit(SERIAL_TX_STATE_ACTIVE, &drvdata->tx_state);
+}
+
+static void snd_serial_generic_write_wakeup(struct serdev_device *serdev)
+{
+	struct snd_serial_generic *drvdata = serdev_device_get_drvdata(serdev);
+
+	snd_serial_generic_tx_wakeup(drvdata);
+}
+
+static int snd_serial_generic_receive_buf(struct serdev_device *serdev,
+				const unsigned char *buf, size_t count)
+{
+	int ret;
+	struct snd_serial_generic *drvdata = serdev_device_get_drvdata(serdev);
+
+	ret = snd_rawmidi_receive(drvdata->midi_input, buf, count);
+	return ret < 0 ? 0 : ret;
+}
+
+static const struct serdev_device_ops snd_serial_generic_serdev_device_ops = {
+	.receive_buf = snd_serial_generic_receive_buf,
+	.write_wakeup = snd_serial_generic_write_wakeup
+};
+
+
+static int snd_serial_generic_ensure_serdev_open(struct snd_serial_generic *drvdata)
+{
+	int err;
+	unsigned int actual_baud;
+
+	if (!drvdata->filemode) {
+		dev_dbg(drvdata->card->dev, "DEBUG - Opening serial port for card %s\n",
+			drvdata->card->shortname);
+		err = serdev_device_open(drvdata->serdev);
+		if (err < 0)
+			return err;
+		if (drvdata->baudrate) {
+			actual_baud = serdev_device_set_baudrate(drvdata->serdev,
+				drvdata->baudrate);
+			if (actual_baud != drvdata->baudrate) {
+				dev_warn(drvdata->card->dev, "requested %d baud for card %s but it was actually set to %d\n",
+					drvdata->baudrate, drvdata->card->shortname, actual_baud);
+			}
+		}
+	}
+	return 0;
+}
+
+static int snd_serial_generic_input_open(struct snd_rawmidi_substream *substream)
+{
+	int err;
+	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
+
+	dev_dbg(drvdata->card->dev, "DEBUG - Opening input for card %s\n",
+		drvdata->card->shortname);
+
+	err = snd_serial_generic_ensure_serdev_open(drvdata);
+	if (err < 0)
+		return err;
+
+	set_bit(SERIAL_MODE_INPUT_OPEN, &drvdata->filemode);
+	drvdata->midi_input = substream;
+	return 0;
+}
+
+static int snd_serial_generic_input_close(struct snd_rawmidi_substream *substream)
+{
+	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
+
+	clear_bit(SERIAL_MODE_INPUT_OPEN, &drvdata->filemode);
+
+	drvdata->midi_input = NULL;
+
+	if (!drvdata->filemode)
+		serdev_device_close(drvdata->serdev);
+	return 0;
+}
+
+static void snd_serial_generic_input_trigger(struct snd_rawmidi_substream *substream,
+					int up)
+{
+	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
+
+	if (up)
+		set_bit(SERIAL_MODE_INPUT_TRIGGERED, &drvdata->filemode);
+	else
+		clear_bit(SERIAL_MODE_INPUT_TRIGGERED, &drvdata->filemode);
+}
+
+static int snd_serial_generic_output_open(struct snd_rawmidi_substream *substream)
+{
+	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
+	int err;
+
+	dev_dbg(drvdata->card->dev, "DEBUG - Opening output for card %s\n",
+		drvdata->card->shortname);
+
+	err = snd_serial_generic_ensure_serdev_open(drvdata);
+	if (err < 0)
+		return err;
+
+	set_bit(SERIAL_MODE_OUTPUT_OPEN, &drvdata->filemode);
+
+	drvdata->midi_output = substream;
+	return 0;
+};
+
+static int snd_serial_generic_output_close(struct snd_rawmidi_substream *substream)
+{
+	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
+
+	dev_dbg(drvdata->card->dev, "DEBUG - output close called\n");
+	clear_bit(SERIAL_MODE_INPUT_OPEN, &drvdata->filemode);
+
+	if (!drvdata->filemode)
+		serdev_device_close(drvdata->serdev);
+
+	drvdata->midi_output = NULL;
+
+	return 0;
+};
+
+static void snd_serial_generic_output_trigger(struct snd_rawmidi_substream *substream,
+					 int up)
+{
+	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
+
+	dev_dbg(drvdata->card->dev, "DEBUG - Output trigger called with %d\n", up);
+
+	if (up)
+		set_bit(SERIAL_MODE_OUTPUT_TRIGGERED, &drvdata->filemode);
+	else
+		clear_bit(SERIAL_MODE_OUTPUT_TRIGGERED, &drvdata->filemode);
+
+	if (up)
+		snd_serial_generic_tx_wakeup(drvdata);
+}
+
+
+static void snd_serial_generic_output_drain(struct snd_rawmidi_substream *substream)
+{
+	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
+
+	dev_dbg(drvdata->card->dev, "DEBUG - output drain called\n");
+
+	/* Flush any pending characters */
+	serdev_device_write_flush(drvdata->serdev);
+	cancel_work_sync(&drvdata->tx_work);
+}
+
+
+static const struct snd_rawmidi_ops snd_serial_generic_output = {
+	.open =		snd_serial_generic_output_open,
+	.close =	snd_serial_generic_output_close,
+	.trigger =	snd_serial_generic_output_trigger,
+	.drain =	snd_serial_generic_output_drain,
+};
+
+static const struct snd_rawmidi_ops snd_serial_generic_input = {
+	.open =		snd_serial_generic_input_open,
+	.close =	snd_serial_generic_input_close,
+	.trigger =	snd_serial_generic_input_trigger,
+};
+
+
+static void snd_serial_generic_parse_dt(struct serdev_device *serdev,
+				struct snd_serial_generic *drvdata)
+{
+	int err;
+
+	if (serdev->dev.of_node) {
+		err = of_property_read_u32(serdev->dev.of_node, "current-speed",
+			&drvdata->baudrate);
+		if (err < 0) {
+			dev_warn(drvdata->card->dev,
+				"MIDI device reading of current-speed DT param failed with error %d, using default baudrate of serial device\n",
+				err);
+			drvdata->baudrate = 0;
+		}
+	} else {
+		dev_info(drvdata->card->dev, "MIDI device current-speed DT param not set for %s, using default baudrate of serial device\n",
+			drvdata->card->shortname);
+		drvdata->baudrate = 0;
+	}
+}
+
+static void snd_serial_generic_substreams(struct snd_rawmidi_str *stream, int dev_num)
+{
+	struct snd_rawmidi_substream *substream;
+
+	list_for_each_entry(substream, &stream->substreams, list) {
+		sprintf(substream->name, "Serial MIDI %d-%d", dev_num, substream->number);
+	}
+}
+
+static int snd_serial_generic_rmidi(struct snd_serial_generic *drvdata,
+				int outs, int ins, struct snd_rawmidi **rmidi)
+{
+	struct snd_rawmidi *rrawmidi;
+	int err;
+
+	err = snd_rawmidi_new(drvdata->card, drvdata->card->driver, 0,
+				outs, ins, &rrawmidi);
+
+	if (err < 0)
+		return err;
+
+	snd_rawmidi_set_ops(rrawmidi, SNDRV_RAWMIDI_STREAM_INPUT,
+				&snd_serial_generic_input);
+	snd_rawmidi_set_ops(rrawmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,
+				&snd_serial_generic_output);
+	strcpy(rrawmidi->name, drvdata->card->shortname);
+
+	snd_serial_generic_substreams(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT],
+					drvdata->serdev->ctrl->nr);
+	snd_serial_generic_substreams(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT],
+					drvdata->serdev->ctrl->nr);
+
+	rrawmidi->info_flags = SNDRV_RAWMIDI_INFO_OUTPUT |
+			       SNDRV_RAWMIDI_INFO_INPUT |
+			       SNDRV_RAWMIDI_INFO_DUPLEX;
+
+	if (rmidi)
+		*rmidi = rrawmidi;
+	return 0;
+}
+
+static int snd_serial_generic_probe(struct serdev_device *serdev)
+{
+	struct snd_card *card;
+	struct snd_serial_generic *drvdata;
+	int err;
+
+	err  = snd_devm_card_new(&serdev->dev, SNDRV_DEFAULT_IDX1,
+				SNDRV_DEFAULT_STR1, THIS_MODULE,
+				sizeof(struct snd_serial_generic), &card);
+
+	if (err < 0)
+		return err;
+
+	strcpy(card->driver, "SerialMIDI");
+	sprintf(card->shortname, "SerialMIDI-%d", serdev->ctrl->nr);
+	sprintf(card->longname, "Serial MIDI device at serial%d", serdev->ctrl->nr);
+
+	drvdata = card->private_data;
+
+	drvdata->serdev = serdev;
+	drvdata->card = card;
+
+	snd_serial_generic_parse_dt(serdev, drvdata);
+
+	INIT_WORK(&drvdata->tx_work, snd_serial_generic_tx_work);
+
+	err = snd_serial_generic_rmidi(drvdata, 1, 1, &drvdata->rmidi);
+	if (err < 0)
+		return err;
+
+	err = snd_card_register(card);
+	if (err < 0)
+		return err;
+
+	serdev_device_set_client_ops(serdev, &snd_serial_generic_serdev_device_ops);
+	serdev_device_set_drvdata(drvdata->serdev, drvdata);
+
+	return 0;
+}
+
+#define SND_SERIAL_GENERIC_DRIVER	"snd-serial-generic"
+
+static const struct of_device_id snd_serial_generic_dt_ids[] = {
+	{ .compatible = "serialmidi" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, snd_serial_generic_dt_ids);
+
+static struct serdev_device_driver snd_serial_generic_driver = {
+	.driver	= {
+		.name		= SND_SERIAL_GENERIC_DRIVER,
+		.of_match_table	= of_match_ptr(snd_serial_generic_dt_ids),
+	},
+	.probe	= snd_serial_generic_probe,
+};
+
+module_serdev_device_driver(snd_serial_generic_driver);
-- 
2.33.0

