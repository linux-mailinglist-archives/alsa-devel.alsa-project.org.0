Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7676B222
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 12:46:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7506E7F4;
	Tue,  1 Aug 2023 12:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7506E7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690886779;
	bh=+njGx/bONLIT4z3L2t2ni/LnpygfXKgj+bWvM4sm8o8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bfBJIAlVHg6X4CnxfVgvKLVlAmsoIJFwBCTJQ+DZ1k2KrVg8o1BH2Qxkp2Mn1AI0H
	 0F/qy+2YLFuBL+dRmO6JUV8lqBIOzG//XEYLcVrMZrGAEqcgiuLvtzjA+Bg/5KzV2Y
	 RWlb9XAolHQxu8oCxWZUXOCV6Raqv28jx9wK7s50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 361F8F80425; Tue,  1 Aug 2023 12:45:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC211F8016D;
	Tue,  1 Aug 2023 12:45:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51AE1F801D5; Tue,  1 Aug 2023 12:45:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 246D0F80087
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 12:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 246D0F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Oc6zt7+7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 779BD20005;
	Tue,  1 Aug 2023 10:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690886722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZU6BOq2ROWRKKk0qgc0ZNhhDzXJUcmNvZZuf7GrZzjo=;
	b=Oc6zt7+77zObe/f5CmDZ0M8Jgr8PHns5FKzn7jXnxNkGsS0tyLuEFojbJ3/S4jVcncnwQ+
	+3rB0rL37KYriDQYcsbkjQ5hLwCekAnFOcoOb+blf6WeIcv/rf8dAW3VOUVo42pi733dbR
	XTnnmJClvcpQhEraY3Tr2pnqwSWiQtyKeqZB/gZ5AD3NwfW2dfvnoGkvdcw+U9b3vOjWlm
	+jUiku88t+6hEIP3nWtNEIA7dlNnbwYJwe41xd65oL8dJIH442XllAbkqGqP5oBAlSmhq/
	bHRG5FSvDxxcqa5KwbMkOtT7Owd3+1XOrh4Rneg3dl6hIXg6s6SSWxwmAgnjvg==
Date: Tue, 1 Aug 2023 12:45:17 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 26/28] ASoC: codecs: Add support for the framer codec
Message-ID: <20230801124517.6b6009f5@bootlin.com>
In-Reply-To: <2e253048-a36e-4fee-b2f4-22f19230cf54@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-27-herve.codina@bootlin.com>
	<2e253048-a36e-4fee-b2f4-22f19230cf54@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: ZI4G7AKG4IMT72PUXUV5E7W4LQHDSWAP
X-Message-ID-Hash: ZI4G7AKG4IMT72PUXUV5E7W4LQHDSWAP
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZI4G7AKG4IMT72PUXUV5E7W4LQHDSWAP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 1 Aug 2023 12:30:26 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Wed, Jul 26, 2023 at 05:02:22PM +0200, Herve Codina wrote:
> > The framer codec interracts with a framer.
> > It allows to use some of the framer timeslots as audio channels to
> > transport audio data over the framer E1/T1/J1 lines.
> > It also reports line carrier detection events through the ALSA jack
> > detection feature.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  sound/soc/codecs/Kconfig        |  15 ++
> >  sound/soc/codecs/Makefile       |   2 +
> >  sound/soc/codecs/framer-codec.c | 423 ++++++++++++++++++++++++++++++++
> >  3 files changed, 440 insertions(+)
> >  create mode 100644 sound/soc/codecs/framer-codec.c
> > 
> > diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> > index f99203ef9b03..a86cdac39b72 100644
> > --- a/sound/soc/codecs/Kconfig
> > +++ b/sound/soc/codecs/Kconfig
> > @@ -110,6 +110,7 @@ config SND_SOC_ALL_CODECS
> >  	imply SND_SOC_ES8328_I2C
> >  	imply SND_SOC_ES7134
> >  	imply SND_SOC_ES7241
> > +	imply SND_SOC_FRAMER
> >  	imply SND_SOC_GTM601
> >  	imply SND_SOC_HDAC_HDMI
> >  	imply SND_SOC_HDAC_HDA
> > @@ -1043,6 +1044,20 @@ config SND_SOC_ES8328_SPI
> >  	depends on SPI_MASTER
> >  	select SND_SOC_ES8328
> >  
> > +config SND_SOC_FRAMER
> > +	tristate "Framer codec"
> > +	depends on GENERIC_FRAMER
> > +	help
> > +	  Enable support for the framer codec.
> > +	  The framer codec uses the generic framer infrastructure to transport
> > +	  some audio data over an analog E1/T1/J1 line.
> > +	  This codec allows to use some of the time slots available on the TDM
> > +	  bus on which the framer is connected to transport the audio data.
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called snd-soc-framer.
> > +
> > +
> >  config SND_SOC_GTM601
> >  	tristate 'GTM601 UMTS modem audio codec'
> >  
> > diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> > index 32dcc6de58bd..54667274a0f6 100644
> > --- a/sound/soc/codecs/Makefile
> > +++ b/sound/soc/codecs/Makefile
> > @@ -116,6 +116,7 @@ snd-soc-es8326-objs := es8326.o
> >  snd-soc-es8328-objs := es8328.o
> >  snd-soc-es8328-i2c-objs := es8328-i2c.o
> >  snd-soc-es8328-spi-objs := es8328-spi.o
> > +snd-soc-framer-objs := framer-codec.o
> >  snd-soc-gtm601-objs := gtm601.o
> >  snd-soc-hdac-hdmi-objs := hdac_hdmi.o
> >  snd-soc-hdac-hda-objs := hdac_hda.o
> > @@ -499,6 +500,7 @@ obj-$(CONFIG_SND_SOC_ES8326)    += snd-soc-es8326.o
> >  obj-$(CONFIG_SND_SOC_ES8328)	+= snd-soc-es8328.o
> >  obj-$(CONFIG_SND_SOC_ES8328_I2C)+= snd-soc-es8328-i2c.o
> >  obj-$(CONFIG_SND_SOC_ES8328_SPI)+= snd-soc-es8328-spi.o
> > +obj-$(CONFIG_SND_SOC_FRAMER)	+= snd-soc-framer.o
> >  obj-$(CONFIG_SND_SOC_GTM601)    += snd-soc-gtm601.o
> >  obj-$(CONFIG_SND_SOC_HDAC_HDMI) += snd-soc-hdac-hdmi.o
> >  obj-$(CONFIG_SND_SOC_HDAC_HDA) += snd-soc-hdac-hda.o
> > diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
> > new file mode 100644
> > index 000000000000..52b4546a61ee
> > --- /dev/null
> > +++ b/sound/soc/codecs/framer-codec.c
> > @@ -0,0 +1,423 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Framer ALSA SoC driver
> > +//
> > +// Copyright 2023 CS GROUP France
> > +//
> > +// Author: Herve Codina <herve.codina@bootlin.com>
> > +
> > +#include <linux/clk.h>
> > +#include <linux/framer/framer.h>
> > +#include <linux/module.h>
> > +#include <linux/notifier.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <sound/jack.h>
> > +#include <sound/pcm_params.h>
> > +#include <sound/soc.h>
> > +#include <sound/tlv.h>
> > +
> > +#define FRAMER_NB_CHANNEL	32
> > +#define FRAMER_JACK_MASK (SND_JACK_LINEIN | SND_JACK_LINEOUT)
> > +
> > +struct framer_codec {
> > +	struct framer *framer;
> > +	struct device *dev;
> > +	struct snd_soc_jack jack;
> > +	struct notifier_block nb;
> > +	struct work_struct carrier_work;
> > +	int max_chan_playback;
> > +	int max_chan_capture;
> > +};
> > +
> > +static int framer_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
> > +				   unsigned int rx_mask, int slots, int width)
> > +{
> > +	struct framer_codec *framer = snd_soc_component_get_drvdata(dai->component);
> > +
> > +	switch (width) {
> > +	case 0:
> > +		/* Not set -> default 8 */
> > +	case 8:
> > +		break;
> > +	default:
> > +		dev_err(dai->dev, "tdm slot width %d not supported\n", width);
> > +		return -EINVAL;
> > +	}
> > +
> > +	framer->max_chan_playback = hweight32(tx_mask);
> > +	if (framer->max_chan_playback > FRAMER_NB_CHANNEL) {
> > +		dev_err(dai->dev, "too much tx slots defined (mask = 0x%x) support max %d\n",  
> 
> "many", not "much".
> 
> Also, "supported".

Yes, will be fixed.

Regards,
Hervé
