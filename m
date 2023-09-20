Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 791697A890F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 17:56:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FEAB886;
	Wed, 20 Sep 2023 17:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FEAB886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695225406;
	bh=H0v2nzakP2PoL73m28Vcwq3NnDzJ/DBbKaoII+cQL/w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hhu1fKCRh3cg3yqvqk/7Z+1PmNwt70b1OLu9h99+YWeTC9BbKGI01A5D28Ap3o7lN
	 a4iFK+uyXKaoqrDPy1fxOY+2ERT1q+lVriMGrL7mrzre74a70zwnOiFSEk51W/yWVT
	 8s8FcZnIh0PPr1lbrXlawbHdgsaAVF1Jk5mW90rE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFAD8F800AA; Wed, 20 Sep 2023 17:55:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C06AF801F5;
	Wed, 20 Sep 2023 17:55:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FCEEF8025A; Wed, 20 Sep 2023 17:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D029F800AA
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 17:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D029F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UU5nDZvA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=91YCGc0e
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9C094220B0;
	Wed, 20 Sep 2023 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695225348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UB+XFYGQ0cgspEKDB50ANo+U0SFIJfmEoFjjQp/M6dA=;
	b=UU5nDZvA4ShGB7ENSlAKMorbIG0Qs+MeLLl8AtYtW36t98WRRI9a9B4IUZKf6m38troJUa
	K0AUV4vtHfuHyHT346m+DHgDDJyzpCm7FBCHTU1xQHimb28LCXe6qhqS/2sKsJxdAY9C1q
	rqV4EgK7MXK89I6zsxZoA4ZFV66TWNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695225348;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UB+XFYGQ0cgspEKDB50ANo+U0SFIJfmEoFjjQp/M6dA=;
	b=91YCGc0e/qVJAl8zt/LsKfKUTqfKJ1Pc/zTj2w75GDjLRvW3VvajNFsWhn7Zyg17kjGhec
	Jttd8fVW78FXtJAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 539F71333E;
	Wed, 20 Sep 2023 15:55:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8F30EgQWC2UjVQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 20 Sep 2023 15:55:48 +0000
Date: Wed, 20 Sep 2023 17:55:47 +0200
Message-ID: <87edisvny4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net,
	alsa-devel@alsa-project.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v3 2/2] ALSA: Add new driver for MARIAN M2 sound card
In-Reply-To: <20230920151610.113880-2-ivan.orlov0322@gmail.com>
References: <20230920151610.113880-1-ivan.orlov0322@gmail.com>
	<20230920151610.113880-2-ivan.orlov0322@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 4BX3XZDZRXJ6577642WNQIL2OM6NU3M3
X-Message-ID-Hash: 4BX3XZDZRXJ6577642WNQIL2OM6NU3M3
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4BX3XZDZRXJ6577642WNQIL2OM6NU3M3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 20 Sep 2023 17:16:10 +0200,
Ivan Orlov wrote:
> 
> MARIAN Seraph M2 is a fully digital PCI soundcard with 2 MADI inputs
> and outputs. This patch introduces the driver for this soundcard, as
> there is no support for it in the mainline kernel yet.
> 
> The original driver was written by Florian Faber in 2012. However, it
> contained multiple issues and couldn't be sent upstream. This patch
> represents the driver which is based on the original version.
> 
> The driver works well for all supported rates (from 28 kHz to 108 kHz).
> It supports the non-interleaved access mode only, as it is the only
> access mode allowed by the hardware.
> 
> Testing with internal and external loopbacks showed that there is no
> issues with the time synchronization and/or data transmission in the
> driver for all possible rates, so it seems to be production-ready.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
> V1 -> V2:
> - Remove redundant documentation fix
> V2 -> V3:
> - Get rid of useless indirection in the driver code
> - Make the order of includes right
> - Remove redundant defines, including the errorneous 'DEBUG' define
> - Fix the issue with wrong clock modes: the previous version set it
> incorrectly
> - Remove 'speedmode' control - now the driver sets the DCO and VCO modes
> depending on
> the sample rate
> - Remove mHz DCO Rate control - the accuracy of calculation won't allow
> us to set it correctly in mHz anyway
> - Remove the 'detune' control - I can't prove that it works correctly.
> - Extract more numeric constants into defines to make the code more
> comprehendable
> - Remove redundant variables and structure fields
> - Remove the custom silence function, as the PCM middle layer will take
> care of it
> - Remove the custom mmap callback, as the standard PCM mmap would work
> as well
> 
>  MAINTAINERS          |    7 +
>  sound/pci/Kconfig    |   10 +
>  sound/pci/Makefile   |    2 +
>  sound/pci/marianm2.c | 1399 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1418 insertions(+)
>  create mode 100644 sound/pci/marianm2.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 23e73d19f347..d3413ecc4dfb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12622,6 +12622,13 @@ L:	linux-mips@vger.kernel.org
>  S:	Maintained
>  F:	arch/mips/boot/dts/img/pistachio*
>  
> +MARIAN SERAPH M2 SOUND CARD DRIVER
> +M:	Ivan Orlov <ivan.orlov0322@gmail.com>
> +L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/sound/cards/marian-m2.rst
> +F:	sound/pci/marianm2.c
> +
>  MARVELL 88E6XXX ETHERNET SWITCH FABRIC DRIVER
>  M:	Andrew Lunn <andrew@lunn.ch>
>  L:	netdev@vger.kernel.org
> diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
> index 787868c9e91b..e3dad79743e5 100644
> --- a/sound/pci/Kconfig
> +++ b/sound/pci/Kconfig
> @@ -222,6 +222,16 @@ config SND_CMIPCI
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-cmipci.
>  
> +config SND_MARIANM2
> +	tristate "MARIAN Seraph M2"
> +	select SND_PCM
> +	help
> +	  Say Y to include support for MARIAN Seraph M2 sound card
> +	  <file:Documentation/sound/cards/marian-m2.rst>.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called snd-marianm2
> +
>  config SND_OXYGEN_LIB
>  	tristate
>  
> diff --git a/sound/pci/Makefile b/sound/pci/Makefile
> index 04cac7469139..4d2f52c98a74 100644
> --- a/sound/pci/Makefile
> +++ b/sound/pci/Makefile
> @@ -22,6 +22,7 @@ snd-fm801-objs := fm801.o
>  snd-intel8x0-objs := intel8x0.o
>  snd-intel8x0m-objs := intel8x0m.o
>  snd-maestro3-objs := maestro3.o
> +snd-marianm2-objs := marianm2.o
>  snd-rme32-objs := rme32.o
>  snd-rme96-objs := rme96.o
>  snd-sis7019-objs := sis7019.o
> @@ -48,6 +49,7 @@ obj-$(CONFIG_SND_FM801) += snd-fm801.o
>  obj-$(CONFIG_SND_INTEL8X0) += snd-intel8x0.o
>  obj-$(CONFIG_SND_INTEL8X0M) += snd-intel8x0m.o
>  obj-$(CONFIG_SND_MAESTRO3) += snd-maestro3.o
> +obj-$(CONFIG_SND_MARIANM2) += snd-marianm2.o
>  obj-$(CONFIG_SND_RME32) += snd-rme32.o
>  obj-$(CONFIG_SND_RME96) += snd-rme96.o
>  obj-$(CONFIG_SND_SIS7019) += snd-sis7019.o
> diff --git a/sound/pci/marianm2.c b/sound/pci/marianm2.c
> new file mode 100644
> index 000000000000..7f0135ef3202
> --- /dev/null
> +++ b/sound/pci/marianm2.c
> @@ -0,0 +1,1399 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *   ALSA driver for MARIAN Seraph audio interfaces
> + *
> + *   Copyright (c) 2012 Florian Faber <faberman@linuxproaudio.org>,
> + *		   2023 Ivan Orlov <ivan.orlov0322@gmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/interrupt.h>
> +#include <sound/core.h>
> +#include <sound/control.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/initval.h>
> +#include <sound/info.h>
> +
> +#define M2_CHANNELS_COUNT	128
> +
> +#define M2_SPEEDMODE		2
> +
> +#define M2_FRAME_SIZE		(M2_CHANNELS_COUNT * 4)
> +#define SUBSTREAM_PERIOD_SIZE	(2048 * M2_FRAME_SIZE)
> +#define SUBSTREAM_BUF_SIZE	(2 * SUBSTREAM_PERIOD_SIZE)
> +#define M2_DMA_BUFSIZE		(SUBSTREAM_BUF_SIZE * 2)
> +
> +#define SERAPH_RD_IRQ_STATUS      0x00
> +#define SERAPH_RD_HWPOINTER       0x8C
> +
> +#define SERAPH_WR_DMA_ADR         0x04
> +#define SERAPH_WR_DMA_BLOCKS      0x10
> +
> +#define M2_DISABLE_PLAY_IRQ	BIT(1)
> +#define M2_DISABLE_CAPT_IRQ	BIT(2)
> +#define M2_ENABLE_LOOPBACK	BIT(3)
> +#define SERAPH_WR_DMA_ENABLE      0x84
> +#define SERAPH_WR_IE_ENABLE       0xAC
> +
> +#define PCI_VENDOR_ID_MARIAN            0x1382
> +#define PCI_DEVICE_ID_MARIAN_SERAPH_M2  0x5021
> +
> +#define RATE_SLOW	54000
> +
> +#define FREQ_MIN	28000
> +#define FREQ_MAX	108000
> +
> +#define SPEEDMODE_SLOW	1
> +#define SPEEDMODE_FAST	2
> +
> +#define MARIAN_PORTS_TYPE_INPUT	 0
> +#define MARIAN_PORTS_TYPE_OUTPUT 1
> +
> +#define MARIAN_SPI_CLOCK_DIVIDER	0x74
> +
> +#define WCLOCK_NEW_VAL		BIT(31)
> +#define SPI_ALL_READY		BIT(31)
> +
> +#define M2_CLOCK_SRC_DCO	1
> +#define M2_CLOCK_SRC_SYNCBUS	2
> +#define M2_CLOCK_SRC_MADI1	4
> +#define M2_CLOCK_SRC_MADI2	5
> +
> +#define M2_INP1_SYNC_CTL_ID	0
> +#define M2_INP1_CM_CTL_ID	0
> +#define M2_INP1_FM_CTL_ID	0
> +#define M2_INP1_FREQ_CTL_ID	4
> +#define M2_OUT1_CM_CTL_ID	0
> +#define M2_OUT1_FM_CTL_ID	0
> +#define M2_INP2_SYNC_CTL_ID	1
> +#define M2_INP2_CM_CTL_ID	1
> +#define M2_INP2_FM_CTL_ID	1
> +#define M2_INP2_FREQ_CTL_ID	5
> +#define M2_OUT2_CM_CTL_ID	1
> +#define M2_OUT2_FM_CTL_ID	1
> +
> +#define M2_SPI_STATE		0x70
> +#define M2_SPI_RESET		0x70
> +#define M2_SPI_CHIP_SELECT	0x60
> +#define M2_SPI_BITS_TO_WRITE	0x64
> +#define M2_SPI_BITS_TO_READ	0x68
> +#define M2_SPI_WRITE_DATA	0x6C
> +#define M2_SPI_DELAY		100
> +
> +#define M2_CLOCK_SRC_SELECT	0xC8
> +#define M2_WORD_CLOCK_REG	0x94
> +
> +#define M2_SET_DCO		0x88
> +
> +#define M2_VCO_CLOCK_RANGE	0x8C
> +#define M2_CLOCK_MODE		0x80
> +
> +#define M2_SET_CLOCK_SRC	0x90
> +
> +// MADI FPGA register 0x41
> +// Enable both MADI transmitters (=1)
> +#define M2_TX_ENABLE   0
> +// Use int (=0) or 32bit IEEE float (=1)
> +#define M2_INT_FLOAT   4
> +// Big endian (=0), little endian (=1)
> +#define M2_ENDIANNESS  5
> +// MSB first (=0), LSB first (=1)
> +#define M2_BIT_ORDER   6
> +
> +// MADI FPGA register 0x42
> +// Send 56ch (=0) or 64ch (=1) MADI frames
> +#define M2_PORT1_MODE  0
> +// Send 48kHz (=0) or 96kHz (=1) MADI frames
> +#define M2_PORT1_FRAME 1
> +// Send 56ch (=0) or 64ch (=1) MADI frames
> +#define M2_PORT2_MODE  2
> +// Send 48kHz (=0) or 96kHz (=1) MADI frames
> +#define M2_PORT2_FRAME 3
> +
> +#define M2_CARD_NAME		"Seraph M2"
> +
> +struct marian_card {
> +	struct snd_pcm_substream *playback_substream;
> +	struct snd_pcm_substream *capture_substream;
> +
> +	struct snd_card *card;
> +	struct snd_pcm *pcm;
> +	struct snd_dma_buffer dmabuf;
> +
> +	struct snd_dma_buffer playback_buf;
> +	struct snd_dma_buffer capture_buf;
> +
> +	struct pci_dev *pci;
> +	unsigned long port;
> +	void __iomem *iobase;
> +	int irq;
> +
> +	unsigned int idx;
> +
> +	/* hardware registers lock */
> +	spinlock_t reglock;
> +
> +	/* spinlock for SPI communication */
> +	spinlock_t spi_lock;
> +
> +	/* mutex for frequency measurement */
> +	struct mutex freq_mutex;
> +
> +	/* Enables or disables hardware loopback */
> +	int loopback;
> +
> +	/* 0..15, meaning depending on the card type */
> +	unsigned int clock_source;
> +
> +	/* Frequency of the internal oscillator (Hertz) */
> +	unsigned int dco;
> +
> +	/* Clock settings mask */
> +	u8 shadow_40;
> +
> +	/* TX enable/disable mask */
> +	u8 shadow_41;
> +
> +	/* Port mode mask */
> +	u8 shadow_42;
> +
> +	/* Frame mode mask */
> +	u8 frame;
> +};
> +
> +enum CLOCK_SOURCE {
> +	CLOCK_SRC_INTERNAL = 0,
> +	CLOCK_SRC_SYNCBUS  = 1,
> +	CLOCK_SRC_INP1     = 2,
> +	CLOCK_SRC_INP2	   = 3,
> +};
> +
> +enum m2_num_mode {
> +	M2_NUM_MODE_INT		= 0,
> +	M2_NUM_MODE_FLOAT	= 1,
> +};
> +
> +enum m2_endianness_mode {
> +	M2_BE	= 0,
> +	M2_LE	= 1,
> +};
> +
> +static const struct pci_device_id snd_marian_ids[] = {
> +	{PCI_DEVICE(PCI_VENDOR_ID_MARIAN, PCI_DEVICE_ID_MARIAN_SERAPH_M2), 0, 0, 6},
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(pci, snd_marian_ids);
> +
> +static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX; // Index 0-MAX
> +static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR; // ID for this card
> +
> +module_param_array(index, int, NULL, 0444);
> +MODULE_PARM_DESC(index, "Index value for MARIAN PCI soundcard");
> +module_param_array(id, charp, NULL, 0444);
> +MODULE_PARM_DESC(id, "ID string for MARIAN PCI soundcard");
> +
> +static int spi_wait_for_ar(struct marian_card *marian)
> +{
> +	int tries = 10;
> +
> +	while (tries > 0) {
> +		if (ioread32(marian->iobase + M2_SPI_STATE) == SPI_ALL_READY)
> +			break;
> +		udelay(M2_SPI_DELAY);
> +		tries--;
> +	}
> +	if (tries == 0)
> +		return -EIO;
> +	return 0;
> +}
> +
> +static int marian_spi_transfer(struct marian_card *marian, uint16_t cs, uint16_t bits_write,
> +			       u8 *data_write, uint16_t bits_read, u8 *data_read)
> +{
> +	u32 buf = 0;
> +	unsigned int i;
> +	int err = 0;
> +
> +	spin_lock(&marian->spi_lock);
> +
> +	if (spi_wait_for_ar(marian) < 0)
> +		iowrite32(0x1234, marian->iobase + M2_SPI_RESET); // Resetting SPI bus
> +
> +	iowrite32(cs, marian->iobase + M2_SPI_CHIP_SELECT);
> +	iowrite32(bits_write, marian->iobase + M2_SPI_BITS_TO_WRITE);
> +	iowrite32(bits_read, marian->iobase + M2_SPI_BITS_TO_READ);
> +
> +	if (bits_write <= 32) {
> +		// left-align data
> +		if (bits_write <= 8)
> +			buf = data_write[0] << (32 - bits_write);
> +		else if (bits_write <= 16)
> +			buf = data_write[0] << 24 | data_write[1] << (32 - bits_write);
> +
> +		iowrite32(buf, marian->iobase + M2_SPI_WRITE_DATA);
> +	}
> +	if (bits_read > 0 && bits_read <= 32) {
> +		if (spi_wait_for_ar(marian) < 0) {
> +			dev_dbg(marian->card->dev,
> +				"Bus didn't signal AR\n");
> +			err = -EIO;
> +			goto unlock_exit;
> +		}
> +
> +		buf = ioread32(marian->iobase + MARIAN_SPI_CLOCK_DIVIDER);
> +
> +		buf <<= 32 - bits_read;
> +		i = 0;
> +
> +		while (bits_read > 0) {
> +			data_read[i++] = (buf >> 24) & 0xFF;
> +			buf <<= 8;
> +			bits_read -= 8;
> +		}
> +	}
> +
> +unlock_exit:
> +	spin_unlock(&marian->spi_lock);
> +	return err;
> +}
> +
> +static u8 marian_m2_spi_read(struct marian_card *marian, u8 adr)
> +{
> +	u8 buf_in;
> +
> +	adr = adr & 0x7F;
> +
> +	if (marian_spi_transfer(marian, 0x02, 8, &adr, 8, &buf_in) == 0)
> +		return buf_in;
> +
> +	return 0;
> +}
> +
> +static int marian_m2_spi_write(struct marian_card *marian, u8 adr, u8 val)
> +{
> +	u8 buf_out[2];
> +
> +	buf_out[0] = 0x80 | adr;
> +	buf_out[1] = val;
> +
> +	return marian_spi_transfer(marian, 0x02, 16, (u8 *)&buf_out, 0, NULL);
> +}
> +
> +/*
> + * Measure the frequency of a clock source.
> + * The measurement is triggered and the FPGA's ready
> + * signal polled (normally takes up to 2ms). The measurement
> + * has only a certainty of 10-20Hz, this function rounds it up
> + * to the nearest 10Hz step (in 1FS).
> + */
> +static unsigned int marian_measure_freq(struct marian_card *marian, unsigned int source)
> +{
> +	u32 val;
> +	int tries = 5;
> +
> +	mutex_lock(&marian->freq_mutex);
> +	iowrite32(source, marian->iobase + M2_CLOCK_SRC_SELECT);
> +
> +	mdelay(2);
> +
> +	while (tries > 0) {
> +		val = ioread32(marian->iobase + M2_WORD_CLOCK_REG);
> +		if (val & WCLOCK_NEW_VAL)
> +			break;
> +
> +		mdelay(1);
> +		tries--;
> +	}
> +
> +	mutex_unlock(&marian->freq_mutex);
> +
> +	if (tries > 0)
> +		return (((1280000000 / ((val & 0x3FFFF) + 1)) + 5 * M2_SPEEDMODE)
> +		/ (10 * M2_SPEEDMODE)) * 10;
> +
> +	return 0;
> +}
> +
> +static int marian_generic_frequency_info(struct snd_kcontrol *kcontrol,
> +					 struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = 1;
> +	uinfo->value.integer.min = FREQ_MIN;
> +	uinfo->value.integer.max = FREQ_MAX;
> +	uinfo->value.integer.step = 1;
> +	return 0;
> +}
> +
> +static int marian_generic_frequency_get(struct snd_kcontrol *kcontrol,
> +					struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct marian_card *marian = snd_kcontrol_chip(kcontrol);
> +
> +	ucontrol->value.integer.value[0] = marian_measure_freq(marian, kcontrol->private_value);
> +	return 0;
> +}
> +
> +static int marian_generic_frequency_create(struct marian_card *marian, char *label, u32 idx)
> +{
> +	struct snd_kcontrol_new c = {
> +		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> +		.name = label,
> +		.private_value = idx,
> +		.access = SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE,
> +		.info = marian_generic_frequency_info,
> +		.get = marian_generic_frequency_get
> +	};
> +
> +	return snd_ctl_add(marian->card, snd_ctl_new1(&c, marian));
> +}
> +
> +static void marian_generic_set_dco(struct marian_card *marian, unsigned int freq)
> +{
> +	u64 val;
> +
> +	val = freq;
> +	val <<= 36;
> +	val /= 80000000;
> +
> +	iowrite32((u32)val, marian->iobase + M2_SET_DCO);
> +
> +	marian->dco = freq;
> +}
> +
> +static int marian_generic_dco_int_info(struct snd_kcontrol *kcontrol,
> +				       struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = 1;
> +	uinfo->value.integer.min = FREQ_MIN;
> +	uinfo->value.integer.max = FREQ_MAX;
> +	uinfo->value.integer.step = 1;
> +	return 0;
> +}
> +
> +static int marian_generic_dco_int_get(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct marian_card *marian = snd_kcontrol_chip(kcontrol);
> +
> +	ucontrol->value.integer.value[0] = marian->dco;
> +
> +	return 0;
> +}
> +
> +static int marian_generic_dco_int_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct marian_card *marian = snd_kcontrol_chip(kcontrol);
> +
> +	spin_lock(&marian->reglock);
> +	marian_generic_set_dco(marian, ucontrol->value.integer.value[0]);
> +	spin_unlock(&marian->reglock);

The control get/put callbacks can sleep, hence usually it's
spin_lock_irq().  Or if the all places for this lock are sleepable
context, use a mutex instead.

> +static int marian_control_pcm_loopback_info(struct snd_kcontrol *kcontrol,
> +					    struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
> +	uinfo->count = 1;
> +	uinfo->value.integer.min = 0;
> +	uinfo->value.integer.max = 1;
> +
> +	return 0;

This can be replaced with snd_ctl_boolean_mono_info.


> +}
> +
> +static int marian_control_pcm_loopback_get(struct snd_kcontrol *kcontrol,
> +					   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct marian_card *marian = snd_kcontrol_chip(kcontrol);
> +
> +	ucontrol->value.integer.value[0] = marian->loopback;
> +
> +	return 0;
> +}
> +
> +static int marian_control_pcm_loopback_put(struct snd_kcontrol *kcontrol,
> +					   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct marian_card *marian = snd_kcontrol_chip(kcontrol);
> +
> +	marian->loopback = ucontrol->value.integer.value[0];

Better to normalize with !!ucontrol->value.integer.value[0].
The value check isn't done as default.

> +static int marian_control_pcm_loopback_create(struct marian_card *marian)
> +{
> +	struct snd_kcontrol_new c = {
> +		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
> +		.name = "Loopback",

Better to have "Switch" suffix.

> +static int marian_m2_output_frame_mode_create(struct marian_card *marian, char *label, u32 idx)
> +{
> +	struct snd_kcontrol_new c = {
> +		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> +		.name = label,
> +		.private_value = idx,
> +		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_VOLATILE,

Does this have to be VOLATILE?  Some others look also dubious.
Basically you set the value via this mixer element, then it's
persistent.


thanks,

Takashi
