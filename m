Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21658520095
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 17:01:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EA711906;
	Mon,  9 May 2022 17:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EA711906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652108491;
	bh=pU0fkEP7hKkAETzEbc6xm5UTiNnNzMDP6Z7DC+5ckfg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D4PpAb6kD5jBm9RibZ8I3xxFHUuZN03wlfDHJxRhg8k0MSqf0UbGDqV0/V4uiN1Si
	 dOFFJudem0oQMQ5SeJwtP8f3CQvaEsDOPY5qPo6838IFLHeEa+hVv0ZaSU9bXfxB5U
	 9kZj1SWvJLJ4JY+IXUqEjfivLUWO/G8k86Y6+KJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85858F80510;
	Mon,  9 May 2022 16:59:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BE20F8047B; Mon,  9 May 2022 16:59:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48867F8025D
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 16:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48867F8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SsDeVPGf"
Received: by mail-io1-xd2d.google.com with SMTP id s23so4022016iog.13
 for <alsa-devel@alsa-project.org>; Mon, 09 May 2022 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gduLCFVAwfnGQQ0qPSZih72aTfoodaTx6qwBsfaaLUk=;
 b=SsDeVPGfSULQhaBR7/jRf2ELztVTsAtbst4xW015v8c+IXF21K64ShBdJvHZrHXE8M
 pAw4wqFqJ8CXcr+VjV7NPC/yUXA8yJatGomX1V+Blq+VaAMWXZcgw7e8r7AiyxHmi3lJ
 CuCy4P5Byz+bJ2e4LnM4nBH084YC6t4JqGLbhK5PiUaRNzDykikm7lvGSuvyxvNuuW+i
 ABzYF7vk588mVIUFNN5OJFg90gRpsvj47KgN8cWBb2Flyoxr2BxSuohhVem6WYiGgnvT
 jJiU7Pw7YfPHs5Uayi1qTTlnhbqRP3Orl+JZkpecLAj4+1JmNgQdQcmlkcAKehBQzBDY
 yaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gduLCFVAwfnGQQ0qPSZih72aTfoodaTx6qwBsfaaLUk=;
 b=X6hsikeZP2pdXqvO35Gc2aoMpBgQTxPP0rTGD+Sb5Yxy3RncCXvsxiwpjZiljGCx24
 mRM/3KWSWMljrFucXYmWeKo3fbBqFCFnD1dHdxMFt2qZKU+ua6yodNsU6fKp1wRpTTTe
 EaSSp5mhxbDBBPIOuTerDGFN+anLKNPIDd/kTFUEJv/zjdj5vVNvp3ZKszh+pXnNjjP0
 M4CkETS5URTgLDnQ1GxWK3c6Z0zIyvp/mImsBd+48tzTrXGOgJmbDS1iW8L+fMDG9KfQ
 H0rB8EUxUMNsiiZz/nm1J2oBr837feopRE3rexd/ruBzpvLjA81vucqJ0APdgE4n9zhM
 B4iA==
X-Gm-Message-State: AOAM530MDQRh683e5d7uB0sxvRh7jNXfzLAZAOMGRa7Z6NcrnnhaLAxB
 QRw4aZdojqEmYatGNDWs9m4=
X-Google-Smtp-Source: ABdhPJwAPnywSuYg1uCWyx7q1pYOJbASxUP3RGXLg8x0c90PhXEzz0JcS2slvy5s5YS/1c7AZcyT1Q==
X-Received: by 2002:a05:6602:2e8c:b0:64d:633a:4148 with SMTP id
 m12-20020a0566022e8c00b0064d633a4148mr6696797iow.12.1652108383145; 
 Mon, 09 May 2022 07:59:43 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-29-252-111.wi.res.rr.com.
 [65.29.252.111]) by smtp.gmail.com with ESMTPSA id
 p18-20020a02b892000000b0032b3a7817c1sm3664414jam.133.2022.05.09.07.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 07:59:42 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com,
	robh@kernel.org
Subject: [PATCH v7 2/2] Add generic serial MIDI driver using serial bus API
Date: Mon,  9 May 2022 09:59:33 -0500
Message-Id: <20220509145933.1161526-3-kaehndan@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220509145933.1161526-1-kaehndan@gmail.com>
References: <20220509145933.1161526-1-kaehndan@gmail.com>
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
 sound/drivers/serial-generic.c | 374 +++++++++++++++++++++++++++++++++
 3 files changed, 394 insertions(+)
 create mode 100644 sound/drivers/serial-generic.c

diff --git a/sound/drivers/Kconfig b/sound/drivers/Kconfig
index ca4cdf666f82..be3009746f3a 100644
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
+	  <file:Documentation/devicetree/bindings/sound/serial-midi.yaml>
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
index 000000000000..e1f864dc7939
--- /dev/null
+++ b/sound/drivers/serial-generic.c
@@ -0,0 +1,374 @@
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
+#define SERIAL_MODE_INPUT_OPEN		1
+#define SERIAL_MODE_OUTPUT_OPEN	2
+#define SERIAL_MODE_INPUT_TRIGGERED	3
+#define SERIAL_MODE_OUTPUT_TRIGGERED	4
+
+#define SERIAL_TX_STATE_ACTIVE	1
+#define SERIAL_TX_STATE_WAKEUP	2
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
+
+		if (!test_bit(SERIAL_MODE_OUTPUT_OPEN, &drvdata->filemode))
+			break;
+
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
+	if (!test_bit(SERIAL_MODE_INPUT_OPEN, &drvdata->filemode))
+		return 0;
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
+static int snd_serial_generic_ensure_serdev_open(struct snd_serial_generic *drvdata)
+{
+	int err;
+	unsigned int actual_baud;
+
+	if (drvdata->filemode)
+		return 0;
+
+	dev_dbg(drvdata->card->dev, "Opening serial port for card %s\n",
+		drvdata->card->shortname);
+	err = serdev_device_open(drvdata->serdev);
+	if (err < 0)
+		return err;
+
+	actual_baud = serdev_device_set_baudrate(drvdata->serdev,
+		drvdata->baudrate);
+	if (actual_baud != drvdata->baudrate) {
+		dev_warn(drvdata->card->dev, "requested %d baud for card %s but it was actually set to %d\n",
+			drvdata->baudrate, drvdata->card->shortname, actual_baud);
+	}
+
+	return 0;
+}
+
+static int snd_serial_generic_input_open(struct snd_rawmidi_substream *substream)
+{
+	int err;
+	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
+
+	dev_dbg(drvdata->card->dev, "Opening input for card %s\n",
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
+	dev_dbg(drvdata->card->dev, "Closing input for card %s\n",
+		drvdata->card->shortname);
+
+	clear_bit(SERIAL_MODE_INPUT_OPEN, &drvdata->filemode);
+	clear_bit(SERIAL_MODE_INPUT_TRIGGERED, &drvdata->filemode);
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
+	dev_dbg(drvdata->card->dev, "Opening output for card %s\n",
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
+	dev_dbg(drvdata->card->dev, "Closing output for card %s\n",
+		drvdata->card->shortname);
+
+	clear_bit(SERIAL_MODE_OUTPUT_OPEN, &drvdata->filemode);
+	clear_bit(SERIAL_MODE_OUTPUT_TRIGGERED, &drvdata->filemode);
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
+	if (up)
+		set_bit(SERIAL_MODE_OUTPUT_TRIGGERED, &drvdata->filemode);
+	else
+		clear_bit(SERIAL_MODE_OUTPUT_TRIGGERED, &drvdata->filemode);
+
+	if (up)
+		snd_serial_generic_tx_wakeup(drvdata);
+}
+
+static void snd_serial_generic_output_drain(struct snd_rawmidi_substream *substream)
+{
+	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
+
+	/* Flush any pending characters */
+	serdev_device_write_flush(drvdata->serdev);
+	cancel_work_sync(&drvdata->tx_work);
+}
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
+static void snd_serial_generic_parse_dt(struct serdev_device *serdev,
+				struct snd_serial_generic *drvdata)
+{
+	int err;
+
+	err = of_property_read_u32(serdev->dev.of_node, "current-speed",
+		&drvdata->baudrate);
+	if (err < 0) {
+		dev_dbg(drvdata->card->dev,
+			"MIDI device reading of current-speed DT param failed with error %d, using default of 38400\n",
+			err);
+		drvdata->baudrate = 38400;
+	}
+
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
+	serdev_device_set_client_ops(serdev, &snd_serial_generic_serdev_device_ops);
+	serdev_device_set_drvdata(drvdata->serdev, drvdata);
+
+	err = snd_card_register(card);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static const struct of_device_id snd_serial_generic_dt_ids[] = {
+	{ .compatible = "serial-midi" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, snd_serial_generic_dt_ids);
+
+static struct serdev_device_driver snd_serial_generic_driver = {
+	.driver	= {
+		.name		= "snd-serial-generic",
+		.of_match_table	= of_match_ptr(snd_serial_generic_dt_ids),
+	},
+	.probe	= snd_serial_generic_probe,
+};
+
+module_serdev_device_driver(snd_serial_generic_driver);
-- 
2.33.0

