Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB522531DE
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 16:49:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3233A1764;
	Wed, 26 Aug 2020 16:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3233A1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598453363;
	bh=rsDgv//86vFSAM8lsZRkfGWtz/vrcCoZX8UA76dMJk4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CzMVhsUcfb+b0steRRgPHj5Fi+NIJ74qrHdgCBAmw628doKDVOoLjwB59qUwjiigo
	 tB54BgFhJ3R+lX9/NQUQcuioxuD2bio/6Wr82PzQyiysLAhvXvLtWpCgMOQzH8gy+7
	 uBtSe169XTB6k5yOwFZBADYevLOEz4Ia4+Us/TUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C401F8016F;
	Wed, 26 Aug 2020 16:47:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AC05F801D9; Wed, 26 Aug 2020 16:47:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C5A1F80105
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 16:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C5A1F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="mDhVNkcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1598453247;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=WtPyyCfNYRDGNlRLhnTbAOZUqz018Ne4S7uPqstOy3k=;
 b=mDhVNkcPXQQ1EassQtSK2pMQEI6X3ogvtsHR4i1JoClEdthuFKr1VuHNv0m5btJtI4
 VMV4dRgy5S6XgZkPLVtKllqPs0WJ6ckEEn8yaKTPQT7n2fVDv9WjReEaqmYjSbF425yY
 VIsTsVLCY1SHXE0ieHlDhhR83XmqtTVKELSK/80Vs7yjzlevLybop1gW14ezXmk/tZaj
 uOlaD7wKuyN4W1f2L2QQ/7C/VGmepFkTD8aOIWDG5ddGbb5/Oe8HYRYY7k6NVafwmKos
 z2MDSAHN+/049KVq2O0TEZ6g7pKtW83XUPAqUdRlxfIPHPYQOxwqT5ikV6Ple8oaQZ+5
 uoKA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic/Fboo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id g0b6c1w7QElPnl9
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 26 Aug 2020 16:47:25 +0200 (CEST)
Date: Wed, 26 Aug 2020 16:47:18 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v6 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
Message-ID: <20200826144718.GA854@gerhold.net>
References: <20200826110454.1811352-1-cychiang@chromium.org>
 <20200826110454.1811352-3-cychiang@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826110454.1811352-3-cychiang@chromium.org>
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Ajit Pandey <ajitp@codeaurora.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
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

On Wed, Aug 26, 2020 at 07:04:54PM +0800, Cheng-Yi Chiang wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Add new driver to register sound card on sc7180 trogdor board and
> do the required configuration for lpass cpu dai and external codecs
> connected over MI2S interfaces.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  sound/soc/qcom/Kconfig  |  12 ++
>  sound/soc/qcom/Makefile |   2 +
>  sound/soc/qcom/sc7180.c | 244 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 258 insertions(+)
>  create mode 100644 sound/soc/qcom/sc7180.c
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index a607ace8b089..63678b746299 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -116,4 +116,16 @@ config SND_SOC_SDM845
>  	  SDM845 SoC-based systems.
>  	  Say Y if you want to use audio device on this SoCs.
>  
> +config SND_SOC_SC7180
> +	tristate "SoC Machine driver for SC7180 boards"
> +	depends on SND_SOC_QCOM
> +	select SND_SOC_QCOM_COMMON
> +	select SND_SOC_LPASS_SC7180
> +	select SND_SOC_MAX98357A
> +	select SND_SOC_RT5682
> +	help
> +	  To add support for audio on Qualcomm Technologies Inc.
> +	  SC7180 SoC-based systems.
> +	  Say Y if you want to use audio device on this SoCs.
> +
>  endif #SND_SOC_QCOM
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 7972c9479ab0..0cdcbf367ef1 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -17,12 +17,14 @@ snd-soc-storm-objs := storm.o
>  snd-soc-apq8016-sbc-objs := apq8016_sbc.o
>  snd-soc-apq8096-objs := apq8096.o
>  snd-soc-sdm845-objs := sdm845.o
> +snd-soc-sc7180-objs := sc7180.o
>  snd-soc-qcom-common-objs := common.o
>  
>  obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
>  obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
>  obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
>  obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
> +obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
>  obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
>  
>  #DSP lib
> diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> new file mode 100644
> index 000000000000..7849376f63ba
> --- /dev/null
> +++ b/sound/soc/qcom/sc7180.c
> @@ -0,0 +1,244 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2020, The Linux Foundation. All rights reserved.
> +//
> +// sc7180.c -- ALSA SoC Machine driver for SC7180
> +
> +#include <dt-bindings/sound/sc7180-lpass.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <uapi/linux/input-event-codes.h>
> +
> +#include "../codecs/rt5682.h"
> +#include "common.h"
> +#include "lpass.h"
> +
> +#define DEFAULT_SAMPLE_RATE_48K		48000
> +#define DEFAULT_MCLK_RATE		19200000
> +#define RT5682_PLL1_FREQ (48000 * 512)
> +
> +struct sc7180_snd_data {
> +	struct snd_soc_jack jack;
> +	u32 pri_mi2s_clk_count;
> +};
> +
> +static void sc7180_jack_free(struct snd_jack *jack)
> +{
> +	struct snd_soc_component *component = jack->private_data;
> +
> +	snd_soc_component_set_jack(component, NULL, NULL);
> +}
> +
> +static int sc7180_headset_init(struct snd_soc_component *component)
> +{
> +	struct snd_soc_card *card = component->card;
> +	struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> +	struct snd_jack *jack;
> +	int rval;
> +
> +	rval = snd_soc_card_jack_new(
> +			card, "Headset Jack",
> +			SND_JACK_HEADSET |
> +			SND_JACK_HEADPHONE |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3,
> +			&pdata->jack, NULL, 0);
> +
> +	if (rval < 0) {
> +		dev_err(card->dev, "Unable to add Headset Jack\n");
> +		return rval;
> +	}
> +
> +	jack = pdata->jack.jack;
> +
> +	snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> +	snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> +	snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> +	snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> +
> +	jack->private_data = component;
> +	jack->private_free = sc7180_jack_free;
> +
> +	rval = snd_soc_component_set_jack(component,
> +					  &pdata->jack, NULL);
> +	if (rval != 0 && rval != -EOPNOTSUPP) {
> +		dev_warn(card->dev, "Failed to set jack: %d\n", rval);
> +		return rval;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct snd_soc_aux_dev sc7180_headset_dev = {
> +	.dlc = COMP_EMPTY(),
> +	.init = sc7180_headset_init,
> +};
> +

[...]

> +static struct snd_soc_card sc7180_card = {
> +	.owner = THIS_MODULE,
> +	.aux_dev = &sc7180_headset_dev,
> +	.num_aux_devs = 1,
> +	.dapm_widgets = sc7180_snd_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets),
> +};
> +
> +static int sc7180_parse_aux_of(struct device *dev)
> +{
> +	sc7180_headset_dev.dlc.of_node = of_parse_phandle(
> +			dev->of_node, "aux-dev", 0);
> +
> +	if (!sc7180_headset_dev.dlc.of_node)
> +		return -EINVAL;
> +	return 0;
> +}
> +

Thanks for noting that this conflicts with my patch set that adds the
"aux-devs" property for the device tree [1], I didn't see this before.

The use of aux-dev in this patch looks a bit weird to me...

As I understand, the "auxiliary devices" of a sound card are intended to
be used for components that should be probed even though they don't
appear within one of the DAI links. Examples for that are especially
analog amplifiers and other components that do not have digital audio
input/output.

On the other hand, in this patch it seems to be just a way to mark the
DAI component that will provide the headphone jack detection. In your
example, the component that provides the headphone jack then appears
both as DAI component and as auxiliary device:

	aux-dev = <&alc5682>;

	dai-link@0 {
		link-name = "MultiMedia0";
		reg = <0>;
		cpu {
			sound-dai = <&lpass_cpu 0>;
		};
		codec {
			sound-dai = <&alc5682 0>;
		};
	};

Adding &alc5682 to snd_soc_card->aux_dev is kind of pointless in this
case because it will already be probed as part of the DAI link.

The only thing you gain is that you have the init() callback which gives
you the component that provides the headphone jack. But if someone wants
to add an actual auxiliary device later (e.g. an analog amplifier),
they would run into trouble...

I wonder if it would be better to just have some sort of phandle, e.g.

	audio-jack = <&alc5682>;

but instead of creating an auxiliary device for this you would e.g.
iterate over the list of components to find the one the phandle refers to.

Or maybe someone else can comment if using an auxiliary device for this
does really make sense?

Thanks,
Stephan

[1]: https://lore.kernel.org/alsa-devel/20200826095141.94017-1-stephan@gerhold.net/
