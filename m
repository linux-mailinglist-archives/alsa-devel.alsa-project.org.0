Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D51166B16
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 12:50:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22925166A;
	Fri, 12 Jul 2019 12:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22925166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562928600;
	bh=uFp3+gbl2BInJw+5zIQKFKyLe4moetehLmnyZUUaI7Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RUyh5j0bsDHduuiPHjNnm98WFiHL+MqC+l1upzyZLKilaqTJTDSNeKHir9c/cvwQa
	 jFmQv8SpzIMZcbebATOCojz/04jCZiCzutxG0Xr+2NCHG7AL/Bs604NCED/H+aFjdN
	 NECey+7ZkDYC3ZqutjqJVz6ym7mfSXs15p3J3un8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79933F802A0;
	Fri, 12 Jul 2019 12:48:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45F17F802A0; Fri, 12 Jul 2019 12:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6FC4F800D8
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 12:48:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6FC4F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="J8rE92gE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lzot1skSOlOTbBm7xK1JQoexdHkMmrM79kAyAnNcQlQ=; b=J8rE92gEEPn2uOL+Y361gE38j
 XzQeuEPCUGPwfHPnj7BdO/2csE6YOKoiSxLzgOk94VzCZoInY4/pEYAjH1oPKqbTbH1hvjc8WXLNw
 uRdQtTyheg4+8TzRu2Q4j31X33BH6Evsa3YIcuT3EuoKIJEO/b4l972IxqBLEr2onteG/9/qrROZ8
 qaVCHpNbjvCmUxbaTVJhMaimRNgY2MXVGnoE/XmA0fIZnZmVPezfivjgQTDwV4/4C5AoEM7nSx58q
 1nYZ1wJJhUIvfvCOzFPRn1P3HdAVP3jVCMq1T4XAkRUftAQjqaNXCv1WKJoEn6amGrWKK5hrHqSVD
 BVfnA58sw==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:59374)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hlt5o-0001JS-RD; Fri, 12 Jul 2019 11:47:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hlt5g-0005bu-Aq; Fri, 12 Jul 2019 11:47:48 +0100
Date: Fri, 12 Jul 2019 11:47:48 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Message-ID: <20190712104748.zlgxgdjbtj2gw4yz@shell.armlinux.org.uk>
References: <20190712100443.221322-1-cychiang@chromium.org>
 <20190712100443.221322-3-cychiang@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190712100443.221322-3-cychiang@chromium.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v3 2/5] drm: bridge: dw-hdmi: Report
 connector status using callback
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

On Fri, Jul 12, 2019 at 06:04:40PM +0800, Cheng-Yi Chiang wrote:
> Allow codec driver register callback function for plug event.
> 
> The callback registration flow:
> dw-hdmi <--- hw-hdmi-i2s-audio <--- hdmi-codec
> 
> dw-hdmi-i2s-audio implements hook_plugged_cb op
> so codec driver can register the callback.
> 
> dw-hdmi implements set_plugged_cb op so platform device can register the
> callback.
> 
> When connector plug/unplug event happens, report this event using the
> callback.
> 
> Make sure that audio and drm are using the single source of truth for
> connector status.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  .../gpu/drm/bridge/synopsys/dw-hdmi-audio.h   |  3 +
>  .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   | 10 ++++
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 55 ++++++++++++++++++-
>  3 files changed, 67 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
> index 63b5756f463b..f523c590984e 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
> @@ -2,6 +2,8 @@
>  #ifndef DW_HDMI_AUDIO_H
>  #define DW_HDMI_AUDIO_H
>  
> +#include <sound/hdmi-codec.h>
> +
>  struct dw_hdmi;
>  
>  struct dw_hdmi_audio_data {
> @@ -17,6 +19,7 @@ struct dw_hdmi_i2s_audio_data {
>  
>  	void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
>  	u8 (*read)(struct dw_hdmi *hdmi, int offset);
> +	int (*set_plugged_cb)(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> index 5cbb71a866d5..7b93cf05c985 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> @@ -104,10 +104,20 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
>  	return -EINVAL;
>  }
>  
> +static int dw_hdmi_i2s_hook_plugged_cb(struct device *dev, void *data,
> +				       hdmi_codec_plugged_cb fn)
> +{
> +	struct dw_hdmi_i2s_audio_data *audio = data;
> +	struct dw_hdmi *hdmi = audio->hdmi;
> +
> +	return audio->set_plugged_cb(hdmi, fn);
> +}
> +
>  static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
>  	.hw_params	= dw_hdmi_i2s_hw_params,
>  	.audio_shutdown	= dw_hdmi_i2s_audio_shutdown,
>  	.get_dai_id	= dw_hdmi_i2s_get_dai_id,
> +	.hook_plugged_cb = dw_hdmi_i2s_hook_plugged_cb,
>  };
>  
>  static int snd_dw_hdmi_probe(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 045b1b13fd0e..ce6646067472 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -26,6 +26,8 @@
>  #include <drm/drm_probe_helper.h>
>  #include <drm/bridge/dw_hdmi.h>
>  
> +#include <sound/hdmi-codec.h>
> +
>  #include <uapi/linux/media-bus-format.h>
>  #include <uapi/linux/videodev2.h>
>  
> @@ -185,6 +187,9 @@ struct dw_hdmi {
>  	void (*disable_audio)(struct dw_hdmi *hdmi);
>  
>  	struct cec_notifier *cec_notifier;
> +
> +	hdmi_codec_plugged_cb plugged_cb;
> +	enum drm_connector_status last_connector_result;
>  };
>  
>  #define HDMI_IH_PHY_STAT0_RX_SENSE \
> @@ -209,6 +214,40 @@ static inline u8 hdmi_readb(struct dw_hdmi *hdmi, int offset)
>  	return val;
>  }
>  
> +static void handle_plugged_change(struct dw_hdmi *hdmi, bool plugged)
> +{
> +	struct platform_device *codec_pdev;
> +
> +	if (!hdmi->audio || IS_ERR(hdmi->audio))
> +		return;
> +	codec_pdev = platform_get_drvdata(hdmi->audio);
> +	if (!codec_pdev || IS_ERR(codec_pdev))
> +		return;

This looks fragile to me, poking about in another device's driver data
from another driver is really not a good design decision.  I think this
can be simplified if the registration function took the function
pointer and the struct device pointer, and then you only need one test
below:

> +	if (!hdmi->plugged_cb)
> +		return;
> +
> +	hdmi->plugged_cb(&codec_pdev->dev, plugged);
> +}
> +
> +static int hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn)
> +{
> +	bool plugged;
> +	struct platform_device *codec_pdev;
> +
> +	if (!hdmi->audio || IS_ERR(hdmi->audio))
> +		return -EINVAL;

Given the current code structure, how can this ever be true when the
function is called?

> +	codec_pdev = platform_get_drvdata(hdmi->audio);
> +	if (!codec_pdev || IS_ERR(codec_pdev))
> +		return -EINVAL;

This doesn't seem like a good idea as I've pointed out above.

> +
> +	mutex_lock(&hdmi->mutex);
> +	hdmi->plugged_cb = fn;
> +	plugged = hdmi->last_connector_result == connector_status_connected;
> +	handle_plugged_change(hdmi, plugged);
> +	mutex_unlock(&hdmi->mutex);

Should be a blank line here for readability.

> +	return 0;
> +}
> +
>  static void hdmi_modb(struct dw_hdmi *hdmi, u8 data, u8 mask, unsigned reg)
>  {
>  	regmap_update_bits(hdmi->regm, reg << hdmi->reg_shift, mask, data);
> @@ -2044,6 +2083,7 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
>  					     connector);
> +	enum drm_connector_status result;
>  
>  	mutex_lock(&hdmi->mutex);
>  	hdmi->force = DRM_FORCE_UNSPECIFIED;
> @@ -2051,7 +2091,18 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  	dw_hdmi_update_phy_mask(hdmi);
>  	mutex_unlock(&hdmi->mutex);
>  
> -	return hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> +	result = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> +
> +	mutex_lock(&hdmi->mutex);
> +	if (result != hdmi->last_connector_result) {
> +		dev_dbg(hdmi->dev, "read_hpd result: %d", result);
> +		handle_plugged_change(hdmi,
> +				      result == connector_status_connected);
> +		hdmi->last_connector_result = result;
> +	}
> +	mutex_unlock(&hdmi->mutex);
> +
> +	return result;
>  }
>  
>  static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
> @@ -2460,6 +2511,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  	hdmi->rxsense = true;
>  	hdmi->phy_mask = (u8)~(HDMI_PHY_HPD | HDMI_PHY_RX_SENSE);
>  	hdmi->mc_clkdis = 0x7f;
> +	hdmi->last_connector_result = connector_status_disconnected;
>  
>  	mutex_init(&hdmi->mutex);
>  	mutex_init(&hdmi->audio_mutex);
> @@ -2653,6 +2705,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  		audio.hdmi	= hdmi;
>  		audio.write	= hdmi_writeb;
>  		audio.read	= hdmi_readb;
> +		audio.set_plugged_cb = hdmi_set_plugged_cb;

Why is this necessary?

The I2S audio driver already depends on the dw-hdmi module through its
use of functions already exported.  Indirecting this through the
platform data makes no sense.

Just rename hdmi_set_plugged_cb to dw_hdmi_set_plugged_cb() and export
it for dw-hdmi-i2s-audio.c to use.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
