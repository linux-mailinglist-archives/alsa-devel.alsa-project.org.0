Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A5876B1D8
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 12:31:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51C0F820;
	Tue,  1 Aug 2023 12:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51C0F820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690885910;
	bh=iCppW8MftHXFsOqF6+a2qCVVPf7o8tkoBBd32jR6kAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h/6Kze5Em1WNZGhzt5cp3lxQwp4fOWcWpS2Ik7xwmZIBacpCTGnIYvYHCIL7JMNiH
	 PdORh8w9hr40RSvGEmdjIdvzCJGDpbS/tXtwGlQm4S2+KXX47AyDN1nGKcyjB+BMY9
	 Ferz+owjrij6BC7qcBTY2z8aVOc/AvzaCDi9euGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B436AF801D5; Tue,  1 Aug 2023 12:30:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C41EF8016D;
	Tue,  1 Aug 2023 12:30:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7191DF801D5; Tue,  1 Aug 2023 12:30:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B63CFF80087
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 12:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B63CFF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=eiy6XJ1+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KeOeZN8j1Kv4rdUg/08Xyr1q7VbFfZ43LqMnjplQud8=; b=eiy6XJ1+OayMv3ZjecdJgWMT9C
	Uv5GOK/vQES7nI9CpL7KwfXjXVd5FKQnbNysWgmJl1slR3hFYDF+ttduAxM75xNKTR3wYVnCt6KOh
	oJmD9ziJMqaYZvpmHWHL2O+EqtZWvujJfqSoTNm77Ddkj4YFYzYuus4k8aBdjREqinVo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qQme2-002n9O-R9; Tue, 01 Aug 2023 12:30:26 +0200
Date: Tue, 1 Aug 2023 12:30:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 26/28] ASoC: codecs: Add support for the framer codec
Message-ID: <2e253048-a36e-4fee-b2f4-22f19230cf54@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-27-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726150225.483464-27-herve.codina@bootlin.com>
Message-ID-Hash: QKHVHZFJZSHGKZ4SXBPLEH5H4ELIGBTF
X-Message-ID-Hash: QKHVHZFJZSHGKZ4SXBPLEH5H4ELIGBTF
X-MailFrom: andrew@lunn.ch
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKHVHZFJZSHGKZ4SXBPLEH5H4ELIGBTF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 26, 2023 at 05:02:22PM +0200, Herve Codina wrote:
> The framer codec interracts with a framer.
> It allows to use some of the framer timeslots as audio channels to
> transport audio data over the framer E1/T1/J1 lines.
> It also reports line carrier detection events through the ALSA jack
> detection feature.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  sound/soc/codecs/Kconfig        |  15 ++
>  sound/soc/codecs/Makefile       |   2 +
>  sound/soc/codecs/framer-codec.c | 423 ++++++++++++++++++++++++++++++++
>  3 files changed, 440 insertions(+)
>  create mode 100644 sound/soc/codecs/framer-codec.c
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index f99203ef9b03..a86cdac39b72 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -110,6 +110,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_ES8328_I2C
>  	imply SND_SOC_ES7134
>  	imply SND_SOC_ES7241
> +	imply SND_SOC_FRAMER
>  	imply SND_SOC_GTM601
>  	imply SND_SOC_HDAC_HDMI
>  	imply SND_SOC_HDAC_HDA
> @@ -1043,6 +1044,20 @@ config SND_SOC_ES8328_SPI
>  	depends on SPI_MASTER
>  	select SND_SOC_ES8328
>  
> +config SND_SOC_FRAMER
> +	tristate "Framer codec"
> +	depends on GENERIC_FRAMER
> +	help
> +	  Enable support for the framer codec.
> +	  The framer codec uses the generic framer infrastructure to transport
> +	  some audio data over an analog E1/T1/J1 line.
> +	  This codec allows to use some of the time slots available on the TDM
> +	  bus on which the framer is connected to transport the audio data.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called snd-soc-framer.
> +
> +
>  config SND_SOC_GTM601
>  	tristate 'GTM601 UMTS modem audio codec'
>  
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index 32dcc6de58bd..54667274a0f6 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -116,6 +116,7 @@ snd-soc-es8326-objs := es8326.o
>  snd-soc-es8328-objs := es8328.o
>  snd-soc-es8328-i2c-objs := es8328-i2c.o
>  snd-soc-es8328-spi-objs := es8328-spi.o
> +snd-soc-framer-objs := framer-codec.o
>  snd-soc-gtm601-objs := gtm601.o
>  snd-soc-hdac-hdmi-objs := hdac_hdmi.o
>  snd-soc-hdac-hda-objs := hdac_hda.o
> @@ -499,6 +500,7 @@ obj-$(CONFIG_SND_SOC_ES8326)    += snd-soc-es8326.o
>  obj-$(CONFIG_SND_SOC_ES8328)	+= snd-soc-es8328.o
>  obj-$(CONFIG_SND_SOC_ES8328_I2C)+= snd-soc-es8328-i2c.o
>  obj-$(CONFIG_SND_SOC_ES8328_SPI)+= snd-soc-es8328-spi.o
> +obj-$(CONFIG_SND_SOC_FRAMER)	+= snd-soc-framer.o
>  obj-$(CONFIG_SND_SOC_GTM601)    += snd-soc-gtm601.o
>  obj-$(CONFIG_SND_SOC_HDAC_HDMI) += snd-soc-hdac-hdmi.o
>  obj-$(CONFIG_SND_SOC_HDAC_HDA) += snd-soc-hdac-hda.o
> diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
> new file mode 100644
> index 000000000000..52b4546a61ee
> --- /dev/null
> +++ b/sound/soc/codecs/framer-codec.c
> @@ -0,0 +1,423 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Framer ALSA SoC driver
> +//
> +// Copyright 2023 CS GROUP France
> +//
> +// Author: Herve Codina <herve.codina@bootlin.com>
> +
> +#include <linux/clk.h>
> +#include <linux/framer/framer.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <sound/jack.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/tlv.h>
> +
> +#define FRAMER_NB_CHANNEL	32
> +#define FRAMER_JACK_MASK (SND_JACK_LINEIN | SND_JACK_LINEOUT)
> +
> +struct framer_codec {
> +	struct framer *framer;
> +	struct device *dev;
> +	struct snd_soc_jack jack;
> +	struct notifier_block nb;
> +	struct work_struct carrier_work;
> +	int max_chan_playback;
> +	int max_chan_capture;
> +};
> +
> +static int framer_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
> +				   unsigned int rx_mask, int slots, int width)
> +{
> +	struct framer_codec *framer = snd_soc_component_get_drvdata(dai->component);
> +
> +	switch (width) {
> +	case 0:
> +		/* Not set -> default 8 */
> +	case 8:
> +		break;
> +	default:
> +		dev_err(dai->dev, "tdm slot width %d not supported\n", width);
> +		return -EINVAL;
> +	}
> +
> +	framer->max_chan_playback = hweight32(tx_mask);
> +	if (framer->max_chan_playback > FRAMER_NB_CHANNEL) {
> +		dev_err(dai->dev, "too much tx slots defined (mask = 0x%x) support max %d\n",

"many", not "much".

Also, "supported".

      Andrew
