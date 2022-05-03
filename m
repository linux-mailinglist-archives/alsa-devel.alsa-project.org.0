Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E099E518CE3
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 21:11:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 652531E9;
	Tue,  3 May 2022 21:11:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 652531E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651605114;
	bh=tVanN1BrtQI+ipj20APcQNlm96efpkveQCwUCelCnko=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PuvX6Ie6oyY7gcw5zSotGHIAe777zPNVUje1GTyCv/daSdeYgqav35TZzwCwGybAL
	 n8mWZPZgAuutI+tg5gNkH+Yi//egbGHyhPb2EA8Txns4/QKZyPUpzZOtPEF06P9XhB
	 6l8wWepvlGgH7gOjUtOu1ffYSHaV8KvL5xSWjCWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1DBCF8025E;
	Tue,  3 May 2022 21:10:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7965FF80236; Tue,  3 May 2022 21:10:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_30,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 742E1F80129
 for <alsa-devel@alsa-project.org>; Tue,  3 May 2022 21:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 742E1F80129
Received: by mail-oi1-f181.google.com with SMTP id y63so19174312oia.7
 for <alsa-devel@alsa-project.org>; Tue, 03 May 2022 12:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7yeN27LgLOTH1OIdidEHCANwuTTV7KrHzb40Yxp96tQ=;
 b=R5WA+1Ksxgx8qQOm01Lw1+BkT7hlD9O5/wjY2Ya9nJesAWR5rnphqjI1KzTZr7fA3n
 R1Z3Sy63w5tQINxIrt7lcgTQZ3nGCu+s9++d4drAJgNjRcc7avgVshSoNF8EdQ9tFZJz
 8inILhQwweuF7u+oTGSf/YRdDzTrohfzoHKlZoUxTKgc/+R03l3X3SUrKljHjHEvjn6F
 rctgm2yZnyPYnnQD0W7VLzapEvgPDYJjKQn/RWQDZCpkGThO0gwwCzmRBM8gsHkO1gx6
 84kzw55045HCbMrlAspw7oPljP98FRODYhSvpylMhJ/SS6eNHo9H54EpH1amwQD/qYo0
 0LfQ==
X-Gm-Message-State: AOAM531kbnj1mYS5V5jbWcETUGTg2vynHXi7Qj+rlR8eq6hnDa08VVh+
 z6203YqyjXKupcTZFEeSGQ==
X-Google-Smtp-Source: ABdhPJw/Ti/A/NDoUYbUn6yFMHEnxQPjR5L/ApJdK8p56ms7HskiA+45SEZfKQdFoCi8o2f4jYQbTw==
X-Received: by 2002:a05:6808:2392:b0:325:8f49:7394 with SMTP id
 bp18-20020a056808239200b003258f497394mr2604226oib.264.1651605043786; 
 Tue, 03 May 2022 12:10:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m9-20020a4ad509000000b0035eb4e5a6dasm5175929oos.48.2022.05.03.12.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:10:43 -0700 (PDT)
Received: (nullmailer pid 4061611 invoked by uid 1000);
 Tue, 03 May 2022 19:10:42 -0000
Date: Tue, 3 May 2022 14:10:42 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Kaehn <kaehndan@gmail.com>
Subject: Re: [PATCH v5 2/2] Add generic serial MIDI driver using serial bus API
Message-ID: <YnF+Montey61iclw@robh.at.kernel.org>
References: <20220502150404.20295-1-kaehndan@gmail.com>
 <20220502150404.20295-3-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502150404.20295-3-kaehndan@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

On Mon, May 02, 2022 at 10:04:04AM -0500, Daniel Kaehn wrote:
> Generic serial MIDI driver adding support for using serial devices
> compatible with the serial bus as raw MIDI devices, allowing using
> additional serial devices not compatible with the existing
> serial-u16550 driver. Supports only setting standard serial baudrates on
> the underlying serial device; however, the underlying serial device can
> be configured so that a requested 38.4 kBaud is actually the standard MIDI
> 31.25 kBaud. Supports DeviceTree configuration.

Curious, what would it take to remove serial-u16550? I suppose some way 
to use it without DT.

> Signed-off-by: Daniel Kaehn <kaehndan@gmail.com>
> ---
>  sound/drivers/Kconfig          |  18 ++
>  sound/drivers/Makefile         |   2 +
>  sound/drivers/serial-generic.c | 377 +++++++++++++++++++++++++++++++++
>  3 files changed, 397 insertions(+)
>  create mode 100644 sound/drivers/serial-generic.c
> 
> diff --git a/sound/drivers/Kconfig b/sound/drivers/Kconfig
> index ca4cdf666f82..060e7d3f2439 100644
> --- a/sound/drivers/Kconfig
> +++ b/sound/drivers/Kconfig
> @@ -165,6 +165,24 @@ config SND_SERIAL_U16550
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-serial-u16550.
>  
> +config SND_SERIAL_GENERIC
> +	tristate "Generic serial MIDI driver"
> +	depends on SERIAL_DEV_BUS
> +	depends on OF
> +	select SND_RAWMIDI
> +	help
> +	  To include support for mapping generic serial devices as raw
> +	  ALSA MIDI devices, say Y here. The driver only supports setting
> +	  the serial port to standard baudrates. To attain the standard MIDI
> +	  baudrate of 31.25 kBaud, configure the clock of the underlying serial
> +	  device so that a requested 38.4 kBaud will result in the standard speed.
> +
> +	  Use this devicetree binding to configure serial port mapping
> +	  <file:Documentation/devicetree/bindings/sound/serialmidi.yaml>
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called snd-serial-generic.
> +
>  config SND_MPU401
>  	tristate "Generic MPU-401 UART driver"
>  	select SND_MPU401_UART
> diff --git a/sound/drivers/Makefile b/sound/drivers/Makefile
> index c0fe4eccdaef..b60303180a1b 100644
> --- a/sound/drivers/Makefile
> +++ b/sound/drivers/Makefile
> @@ -10,6 +10,7 @@ snd-mtpav-objs := mtpav.o
>  snd-mts64-objs := mts64.o
>  snd-portman2x4-objs := portman2x4.o
>  snd-serial-u16550-objs := serial-u16550.o
> +snd-serial-generic-objs := serial-generic.o
>  snd-virmidi-objs := virmidi.o
>  
>  # Toplevel Module Dependency
> @@ -17,6 +18,7 @@ obj-$(CONFIG_SND_DUMMY) += snd-dummy.o
>  obj-$(CONFIG_SND_ALOOP) += snd-aloop.o
>  obj-$(CONFIG_SND_VIRMIDI) += snd-virmidi.o
>  obj-$(CONFIG_SND_SERIAL_U16550) += snd-serial-u16550.o
> +obj-$(CONFIG_SND_SERIAL_GENERIC) += snd-serial-generic.o
>  obj-$(CONFIG_SND_MTPAV) += snd-mtpav.o
>  obj-$(CONFIG_SND_MTS64) += snd-mts64.o
>  obj-$(CONFIG_SND_PORTMAN2X4) += snd-portman2x4.o
> diff --git a/sound/drivers/serial-generic.c b/sound/drivers/serial-generic.c
> new file mode 100644
> index 000000000000..8168f8a71e15
> --- /dev/null
> +++ b/sound/drivers/serial-generic.c
> @@ -0,0 +1,377 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *   serial-generic.c
> + *   Copyright (c) by Daniel Kaehn <kaehndan@gmail.com
> + *   Based on serial-u16550.c by Jaroslav Kysela <perex@perex.cz>,
> + *		                 Isaku Yamahata <yamahata@private.email.ne.jp>,
> + *		                 George Hansper <ghansper@apana.org.au>,
> + *		                 Hannu Savolainen
> + *
> + * Generic serial MIDI driver using the serdev serial bus API for hardware interaction
> + */
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/serdev.h>
> +#include <linux/serial_reg.h>
> +#include <linux/slab.h>
> +#include <linux/dev_printk.h>
> +
> +#include <sound/core.h>
> +#include <sound/rawmidi.h>
> +#include <sound/initval.h>
> +
> +MODULE_DESCRIPTION("Generic serial MIDI driver");
> +MODULE_LICENSE("GPL");
> +
> +

1 blank line. Here and elsewhere.

> +#define SERIAL_MODE_INPUT_OPEN		1
> +#define SERIAL_MODE_OUTPUT_OPEN	2
> +#define SERIAL_MODE_INPUT_TRIGGERED	3
> +#define SERIAL_MODE_OUTPUT_TRIGGERED	4
> +
> +
> +#define SERIAL_TX_STATE_ACTIVE	1
> +#define SERIAL_TX_STATE_WAKEUP	2
> +
> +
> +struct snd_serial_generic {
> +	struct serdev_device *serdev;
> +
> +	struct snd_card *card;
> +	struct snd_rawmidi *rmidi;
> +	struct snd_rawmidi_substream *midi_output;
> +	struct snd_rawmidi_substream *midi_input;
> +
> +	unsigned int baudrate;
> +
> +	unsigned long filemode;		/* open status of file */
> +	struct work_struct tx_work;
> +	unsigned long tx_state;
> +
> +};
> +
> +static void snd_serial_generic_tx_wakeup(struct snd_serial_generic *drvdata)
> +{
> +	if (test_and_set_bit(SERIAL_TX_STATE_ACTIVE, &drvdata->tx_state))
> +		set_bit(SERIAL_TX_STATE_WAKEUP, &drvdata->tx_state);
> +
> +	schedule_work(&drvdata->tx_work);
> +}
> +
> +#define INTERNAL_BUF_SIZE 256
> +
> +static void snd_serial_generic_tx_work(struct work_struct *work)
> +{
> +	static char buf[INTERNAL_BUF_SIZE];
> +	int num_bytes;
> +	struct snd_serial_generic *drvdata = container_of(work, struct snd_serial_generic,
> +						   tx_work);
> +	struct snd_rawmidi_substream *substream = drvdata->midi_output;
> +
> +	clear_bit(SERIAL_TX_STATE_WAKEUP, &drvdata->tx_state);
> +
> +	while (!snd_rawmidi_transmit_empty(substream)) {
> +		num_bytes = snd_rawmidi_transmit_peek(substream, buf, INTERNAL_BUF_SIZE);
> +		num_bytes = serdev_device_write_buf(drvdata->serdev, buf, num_bytes);
> +
> +		if (!num_bytes)
> +			break;
> +
> +		snd_rawmidi_transmit_ack(substream, num_bytes);
> +
> +		if (!test_bit(SERIAL_TX_STATE_WAKEUP, &drvdata->tx_state))
> +			break;
> +	}
> +
> +	clear_bit(SERIAL_TX_STATE_ACTIVE, &drvdata->tx_state);
> +}
> +
> +static void snd_serial_generic_write_wakeup(struct serdev_device *serdev)
> +{
> +	struct snd_serial_generic *drvdata = serdev_device_get_drvdata(serdev);
> +
> +	snd_serial_generic_tx_wakeup(drvdata);
> +}
> +
> +static int snd_serial_generic_receive_buf(struct serdev_device *serdev,
> +				const unsigned char *buf, size_t count)
> +{
> +	int ret;
> +	struct snd_serial_generic *drvdata = serdev_device_get_drvdata(serdev);
> +
> +	ret = snd_rawmidi_receive(drvdata->midi_input, buf, count);
> +	return ret < 0 ? 0 : ret;
> +}
> +
> +static const struct serdev_device_ops snd_serial_generic_serdev_device_ops = {
> +	.receive_buf = snd_serial_generic_receive_buf,
> +	.write_wakeup = snd_serial_generic_write_wakeup
> +};
> +
> +
> +static int snd_serial_generic_ensure_serdev_open(struct snd_serial_generic *drvdata)
> +{
> +	int err;
> +	unsigned int actual_baud;
> +
> +	if (!drvdata->filemode) {

if (drvdata->filemode)
	return 0;

And save some indentation. Though, can multiple opens happen or does the 
upper layer prevent that?

> +		dev_dbg(drvdata->card->dev, "DEBUG - Opening serial port for card %s\n",
> +			drvdata->card->shortname);
> +		err = serdev_device_open(drvdata->serdev);
> +		if (err < 0)
> +			return err;
> +		if (drvdata->baudrate) {

Supporting the default, random baudrates of the underlying UARTs doesn't 
seem that useful to me. Perhaps 38400 should be the default? If so, the 
binding should define that. 

> +			actual_baud = serdev_device_set_baudrate(drvdata->serdev,
> +				drvdata->baudrate);
> +			if (actual_baud != drvdata->baudrate) {
> +				dev_warn(drvdata->card->dev, "requested %d baud for card %s but it was actually set to %d\n",
> +					drvdata->baudrate, drvdata->card->shortname, actual_baud);
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int snd_serial_generic_input_open(struct snd_rawmidi_substream *substream)
> +{
> +	int err;
> +	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
> +
> +	dev_dbg(drvdata->card->dev, "DEBUG - Opening input for card %s\n",
> +		drvdata->card->shortname);
> +
> +	err = snd_serial_generic_ensure_serdev_open(drvdata);
> +	if (err < 0)
> +		return err;
> +
> +	set_bit(SERIAL_MODE_INPUT_OPEN, &drvdata->filemode);
> +	drvdata->midi_input = substream;
> +	return 0;
> +}
> +
> +static int snd_serial_generic_input_close(struct snd_rawmidi_substream *substream)
> +{
> +	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
> +
> +	clear_bit(SERIAL_MODE_INPUT_OPEN, &drvdata->filemode);
> +
> +	drvdata->midi_input = NULL;
> +
> +	if (!drvdata->filemode)
> +		serdev_device_close(drvdata->serdev);
> +	return 0;
> +}
> +
> +static void snd_serial_generic_input_trigger(struct snd_rawmidi_substream *substream,
> +					int up)
> +{
> +	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
> +
> +	if (up)
> +		set_bit(SERIAL_MODE_INPUT_TRIGGERED, &drvdata->filemode);
> +	else
> +		clear_bit(SERIAL_MODE_INPUT_TRIGGERED, &drvdata->filemode);

This bit is never read, only filemode as a whole. I'd assume this won't 
run unless the input is opened first and this can be dropped? If the 
upper layer doesn't control the ordering, this looks racy to me. If the 
above bit is set and snd_serial_generic_input_close() is called, then 
you've left the serdev open forever.

> +}
> +
> +static int snd_serial_generic_output_open(struct snd_rawmidi_substream *substream)
> +{
> +	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
> +	int err;
> +
> +	dev_dbg(drvdata->card->dev, "DEBUG - Opening output for card %s\n",

'DEBUG' seems redundant given the level encodes that.

> +		drvdata->card->shortname);
> +
> +	err = snd_serial_generic_ensure_serdev_open(drvdata);
> +	if (err < 0)
> +		return err;
> +
> +	set_bit(SERIAL_MODE_OUTPUT_OPEN, &drvdata->filemode);
> +
> +	drvdata->midi_output = substream;
> +	return 0;
> +};
> +
> +static int snd_serial_generic_output_close(struct snd_rawmidi_substream *substream)
> +{
> +	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
> +
> +	dev_dbg(drvdata->card->dev, "DEBUG - output close called\n");
> +	clear_bit(SERIAL_MODE_INPUT_OPEN, &drvdata->filemode);
> +
> +	if (!drvdata->filemode)
> +		serdev_device_close(drvdata->serdev);
> +
> +	drvdata->midi_output = NULL;
> +
> +	return 0;
> +};
> +
> +static void snd_serial_generic_output_trigger(struct snd_rawmidi_substream *substream,
> +					 int up)
> +{
> +	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
> +
> +	dev_dbg(drvdata->card->dev, "DEBUG - Output trigger called with %d\n", up);
> +
> +	if (up)
> +		set_bit(SERIAL_MODE_OUTPUT_TRIGGERED, &drvdata->filemode);
> +	else
> +		clear_bit(SERIAL_MODE_OUTPUT_TRIGGERED, &drvdata->filemode);
> +
> +	if (up)
> +		snd_serial_generic_tx_wakeup(drvdata);
> +}
> +
> +
> +static void snd_serial_generic_output_drain(struct snd_rawmidi_substream *substream)
> +{
> +	struct snd_serial_generic *drvdata = substream->rmidi->card->private_data;
> +
> +	dev_dbg(drvdata->card->dev, "DEBUG - output drain called\n");
> +
> +	/* Flush any pending characters */
> +	serdev_device_write_flush(drvdata->serdev);
> +	cancel_work_sync(&drvdata->tx_work);
> +}
> +
> +
> +static const struct snd_rawmidi_ops snd_serial_generic_output = {
> +	.open =		snd_serial_generic_output_open,
> +	.close =	snd_serial_generic_output_close,
> +	.trigger =	snd_serial_generic_output_trigger,
> +	.drain =	snd_serial_generic_output_drain,
> +};
> +
> +static const struct snd_rawmidi_ops snd_serial_generic_input = {
> +	.open =		snd_serial_generic_input_open,
> +	.close =	snd_serial_generic_input_close,
> +	.trigger =	snd_serial_generic_input_trigger,
> +};
> +
> +
> +static void snd_serial_generic_parse_dt(struct serdev_device *serdev,
> +				struct snd_serial_generic *drvdata)
> +{
> +	int err;
> +
> +	if (serdev->dev.of_node) {

Always true.

> +		err = of_property_read_u32(serdev->dev.of_node, "current-speed",
> +			&drvdata->baudrate);
> +		if (err < 0) {
> +			dev_warn(drvdata->card->dev,
> +				"MIDI device reading of current-speed DT param failed with error %d, using default baudrate of serial device\n",
> +				err);
> +			drvdata->baudrate = 0;
> +		}
> +	} else {
> +		dev_info(drvdata->card->dev, "MIDI device current-speed DT param not set for %s, using default baudrate of serial device\n",
> +			drvdata->card->shortname);

That message is somewhat misleading as the node would be missing, but I 
don't think you can get here.

> +		drvdata->baudrate = 0;
> +	}
> +}
> +
> +static void snd_serial_generic_substreams(struct snd_rawmidi_str *stream, int dev_num)
> +{
> +	struct snd_rawmidi_substream *substream;
> +
> +	list_for_each_entry(substream, &stream->substreams, list) {
> +		sprintf(substream->name, "Serial MIDI %d-%d", dev_num, substream->number);
> +	}
> +}
> +
> +static int snd_serial_generic_rmidi(struct snd_serial_generic *drvdata,
> +				int outs, int ins, struct snd_rawmidi **rmidi)
> +{
> +	struct snd_rawmidi *rrawmidi;
> +	int err;
> +
> +	err = snd_rawmidi_new(drvdata->card, drvdata->card->driver, 0,
> +				outs, ins, &rrawmidi);
> +
> +	if (err < 0)
> +		return err;
> +
> +	snd_rawmidi_set_ops(rrawmidi, SNDRV_RAWMIDI_STREAM_INPUT,
> +				&snd_serial_generic_input);
> +	snd_rawmidi_set_ops(rrawmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,
> +				&snd_serial_generic_output);
> +	strcpy(rrawmidi->name, drvdata->card->shortname);
> +
> +	snd_serial_generic_substreams(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT],
> +					drvdata->serdev->ctrl->nr);
> +	snd_serial_generic_substreams(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT],
> +					drvdata->serdev->ctrl->nr);
> +
> +	rrawmidi->info_flags = SNDRV_RAWMIDI_INFO_OUTPUT |
> +			       SNDRV_RAWMIDI_INFO_INPUT |
> +			       SNDRV_RAWMIDI_INFO_DUPLEX;
> +
> +	if (rmidi)
> +		*rmidi = rrawmidi;
> +	return 0;
> +}
> +
> +static int snd_serial_generic_probe(struct serdev_device *serdev)
> +{
> +	struct snd_card *card;
> +	struct snd_serial_generic *drvdata;
> +	int err;
> +
> +	err  = snd_devm_card_new(&serdev->dev, SNDRV_DEFAULT_IDX1,
> +				SNDRV_DEFAULT_STR1, THIS_MODULE,
> +				sizeof(struct snd_serial_generic), &card);
> +
> +	if (err < 0)
> +		return err;
> +
> +	strcpy(card->driver, "SerialMIDI");
> +	sprintf(card->shortname, "SerialMIDI-%d", serdev->ctrl->nr);
> +	sprintf(card->longname, "Serial MIDI device at serial%d", serdev->ctrl->nr);
> +
> +	drvdata = card->private_data;
> +
> +	drvdata->serdev = serdev;
> +	drvdata->card = card;
> +
> +	snd_serial_generic_parse_dt(serdev, drvdata);
> +
> +	INIT_WORK(&drvdata->tx_work, snd_serial_generic_tx_work);
> +
> +	err = snd_serial_generic_rmidi(drvdata, 1, 1, &drvdata->rmidi);
> +	if (err < 0)
> +		return err;
> +
> +	err = snd_card_register(card);
> +	if (err < 0)
> +		return err;
> +
> +	serdev_device_set_client_ops(serdev, &snd_serial_generic_serdev_device_ops);
> +	serdev_device_set_drvdata(drvdata->serdev, drvdata);

Don't these need to be called before snd_card_register()? What 
guarantees open or any of the API is not called between 
snd_card_register and these calls?

> +
> +	return 0;
> +}
> +
> +#define SND_SERIAL_GENERIC_DRIVER	"snd-serial-generic"

I'd drop the define used only once.

> +
> +static const struct of_device_id snd_serial_generic_dt_ids[] = {
> +	{ .compatible = "serialmidi" },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, snd_serial_generic_dt_ids);
> +
> +static struct serdev_device_driver snd_serial_generic_driver = {
> +	.driver	= {
> +		.name		= SND_SERIAL_GENERIC_DRIVER,
> +		.of_match_table	= of_match_ptr(snd_serial_generic_dt_ids),
> +	},
> +	.probe	= snd_serial_generic_probe,
> +};
> +
> +module_serdev_device_driver(snd_serial_generic_driver);
> -- 
> 2.33.0
> 
> 
