Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 192F532A3A
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 10:01:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A3CA1673;
	Mon,  3 Jun 2019 10:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A3CA1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559548869;
	bh=eKlrbLrIr8PlR6Od8iRn3RxRNW9QvtfgdbkkQ+7/Xcs=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=alrqg5si3NnPrRIETkfn7ay8NW3XdFZIbWS4NFOJEXLIlGNMhC0DBAqZNbsTQH/ri
	 VuSllzdaJkxtcUEw/YxloVPx5QGUQvuZXF5YNJJSpiWDfVC85yxyyTRX6bTNUcCZS2
	 3kOmmztmjAAgXlOdSevfA1IYDV2vuVu3Uf8PAJo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8E0AF80CC4;
	Mon,  3 Jun 2019 09:59:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9E2FF896DD; Mon,  3 Jun 2019 09:59:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FFCAF80CC4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 09:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FFCAF80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 00:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,546,1549958400"; d="scan'208";a="181072014"
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2019 00:59:10 -0700
Date: Mon, 3 Jun 2019 10:03:01 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Message-ID: <20190603100301.00d68690@xxx>
In-Reply-To: <20190603043251.226549-3-cychiang@chromium.org>
References: <20190603043251.226549-1-cychiang@chromium.org>
 <20190603043251.226549-3-cychiang@chromium.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH 2/7] ASoC: hdmi-codec: use HDMI state
 notifier to add jack support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon,  3 Jun 2019 12:32:46 +0800
Cheng-Yi Chiang <cychiang@chromium.org> wrote:

> From: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Use HDMI connection / disconnection notifications to update an ALSA
> jack object. Also make a copy of the ELD block after every change.
> 
> This was posted by Philipp Zabel at
> 
> https://patchwork.kernel.org/patch/9430747/
> 
> Modified by Cheng-Yi Chiang:
> - Fix the conflict of removed hdmi_codec_remove ops.
> - Other minor fix for the conflict with latest hdmi-codec on ASoC
>   for-next tree.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
> The original patch is at https://patchwork.kernel.org/patch/9430747/
> I could not find the LKML link for the patch.
> 
>  include/sound/hdmi-codec.h    |   7 +++
>  sound/soc/codecs/Kconfig      |   1 +
>  sound/soc/codecs/hdmi-codec.c | 104
> +++++++++++++++++++++++++++++++++- 3 files changed, 110
> insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
> index 9483c55f871b..4fa39c93363f 100644
> --- a/include/sound/hdmi-codec.h
> +++ b/include/sound/hdmi-codec.h
> @@ -107,6 +107,13 @@ struct hdmi_codec_pdata {
>  	void *data;
>  };
>  
> +struct snd_soc_component;
> +struct snd_soc_jack;
> +
> +int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
> +			       struct snd_soc_jack *jack,
> +			       struct device *dev);
> +
>  #define HDMI_CODEC_DRV_NAME "hdmi-audio-codec"
>  
>  #endif /* __HDMI_CODEC_H__ */
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 8f577258080b..f5f6dd04234c 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -639,6 +639,7 @@ config SND_SOC_HDMI_CODEC
>  	select SND_PCM_ELD
>  	select SND_PCM_IEC958
>  	select HDMI
> +	select HDMI_NOTIFIERS
>  
>  config SND_SOC_ES7134
>         tristate "Everest Semi ES7134 CODEC"
> diff --git a/sound/soc/codecs/hdmi-codec.c
> b/sound/soc/codecs/hdmi-codec.c index 6a0cc8d7e141..fe796a7475a5
> 100644 --- a/sound/soc/codecs/hdmi-codec.c
> +++ b/sound/soc/codecs/hdmi-codec.c
> @@ -12,9 +12,12 @@
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See
> the GNU
>   * General Public License for more details.
>   */
> +#include <linux/hdmi-notifier.h>
>  #include <linux/module.h>
> +#include <linux/notifier.h>
>  #include <linux/string.h>
>  #include <sound/core.h>
> +#include <sound/jack.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -282,6 +285,13 @@ struct hdmi_codec_priv {
>  	struct snd_pcm_chmap *chmap_info;
>  	unsigned int chmap_idx;
>  	struct mutex lock;
> +	struct snd_soc_jack *jack;
> +	/* Lock to protect setting and getting eld. */
> +	struct mutex eld_lock;
> +	struct device *dev;
> +	struct hdmi_notifier *notifier;
> +	struct notifier_block nb;
> +	unsigned int jack_status;
>  };
>  
>  static const struct snd_soc_dapm_widget hdmi_widgets[] = {
> @@ -308,7 +318,9 @@ static int hdmi_eld_ctl_get(struct snd_kcontrol
> *kcontrol, struct snd_soc_component *component =
> snd_kcontrol_chip(kcontrol); struct hdmi_codec_priv *hcp =
> snd_soc_component_get_drvdata(component); 
> +	mutex_lock(&hcp->eld_lock);
>  	memcpy(ucontrol->value.bytes.data, hcp->eld,
> sizeof(hcp->eld));
> +	mutex_unlock(&hcp->eld_lock);
>  
>  	return 0;
>  }
> @@ -393,7 +405,7 @@ static int hdmi_codec_startup(struct
> snd_pcm_substream *substream, struct snd_soc_dai *dai)
>  {
>  	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
> -	int ret = 0;
> +	int ret;
>  
>  	ret = mutex_trylock(&hcp->lock);
>  	if (!ret) {
> @@ -408,9 +420,9 @@ static int hdmi_codec_startup(struct
> snd_pcm_substream *substream, }
>  
>  	if (hcp->hcd.ops->get_eld) {
> +		mutex_lock(&hcp->eld_lock);
>  		ret = hcp->hcd.ops->get_eld(dai->dev->parent,
> hcp->hcd.data, hcp->eld, sizeof(hcp->eld));
> -
>  		if (!ret) {
>  			ret =
> snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);

Seems to me like you missed unlock here. There is return inside this
if().

> @@ -419,6 +431,7 @@ static int hdmi_codec_startup(struct
> snd_pcm_substream *substream, }
>  		/* Select chmap supported */
>  		hdmi_codec_eld_chmap(hcp);
> +		mutex_unlock(&hcp->eld_lock);
>  	}
>  	return 0;
>  
> @@ -747,6 +760,77 @@ static const struct snd_soc_component_driver
> hdmi_driver = { .non_legacy_dai_naming	= 1,
>  };
>  
> +static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
> +				   unsigned int jack_status)
> +{
> +	if (!hcp->jack)
> +		return;
> +
> +	if (jack_status != hcp->jack_status) {
> +		snd_soc_jack_report(hcp->jack, jack_status,
> SND_JACK_LINEOUT);
> +		hcp->jack_status = jack_status;
> +	}
> +}
> +
> +static int hdmi_codec_notify(struct notifier_block *nb, unsigned
> long event,
> +			     void *data)
> +{
> +	struct hdmi_codec_priv *hcp = container_of(nb, struct
> hdmi_codec_priv,
> +						   nb);
> +	struct hdmi_notifier *n = data;
> +
> +	if (!hcp->jack)
> +		return NOTIFY_OK;
> +
> +	switch (event) {
> +	case HDMI_NEW_ELD:
> +		mutex_lock(&hcp->eld_lock);
> +		memcpy(hcp->eld, n->eld, sizeof(hcp->eld));
> +		mutex_unlock(&hcp->eld_lock);
> +		/* fall through */
> +	case HDMI_CONNECTED:
> +		hdmi_codec_jack_report(hcp, SND_JACK_LINEOUT);
> +		break;
> +	case HDMI_DISCONNECTED:
> +		hdmi_codec_jack_report(hcp, 0);
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +/**
> + * hdmi_codec_set_jack_detect - register HDMI state notifier callback
> + * @component: the hdmi-codec instance
> + * @jack: ASoC jack to report (dis)connection events on
> + * @dev: hdmi_notifier device, usually HDMI_TX or CEC device
> + */
> +int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
> +			       struct snd_soc_jack *jack,
> +			       struct device *dev)
> +{
> +	struct hdmi_codec_priv *hcp =
> snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	hcp->notifier = hdmi_notifier_get(dev);
> +	if (!hcp->notifier)
> +		return -ENOMEM;
> +
> +	hcp->jack = jack;
> +	hcp->nb.notifier_call = hdmi_codec_notify;
> +	ret = hdmi_notifier_register(hcp->notifier, &hcp->nb);
> +	if (ret)
> +		goto err_notifier_put;
> +
> +	return 0;
> +
> +err_notifier_put:
> +	hdmi_notifier_put(hcp->notifier);
> +	hcp->notifier = NULL;
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(hdmi_codec_set_jack_detect);
> +
>  static int hdmi_codec_probe(struct platform_device *pdev)
>  {
>  	struct hdmi_codec_pdata *hcd = pdev->dev.platform_data;
> @@ -774,6 +858,7 @@ static int hdmi_codec_probe(struct
> platform_device *pdev) 
>  	hcp->hcd = *hcd;
>  	mutex_init(&hcp->lock);
> +	mutex_init(&hcp->eld_lock);
>  
>  	daidrv = devm_kcalloc(dev, dai_count, sizeof(*daidrv),
> GFP_KERNEL); if (!daidrv)
> @@ -797,6 +882,20 @@ static int hdmi_codec_probe(struct
> platform_device *pdev) __func__, ret);
>  		return ret;
>  	}
> +
> +	hcp->dev = dev;
> +
> +	return 0;
> +}
> +
> +static int hdmi_codec_remove(struct platform_device *pdev)
> +{
> +	struct hdmi_codec_priv *hcp = platform_get_drvdata(pdev);
> +
> +	if (hcp->notifier) {
> +		hdmi_notifier_unregister(hcp->notifier, &hcp->nb);
> +		hdmi_notifier_put(hcp->notifier);
> +	}
>  	return 0;
>  }
>  
> @@ -805,6 +904,7 @@ static struct platform_driver hdmi_codec_driver =
> { .name = HDMI_CODEC_DRV_NAME,
>  	},
>  	.probe = hdmi_codec_probe,
> +	.remove = hdmi_codec_remove,
>  };
>  
>  module_platform_driver(hdmi_codec_driver);

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
