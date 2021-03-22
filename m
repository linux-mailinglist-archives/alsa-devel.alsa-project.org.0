Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A63344E51
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 19:20:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 874B31612;
	Mon, 22 Mar 2021 19:19:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 874B31612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616437241;
	bh=7WR4Ur9IcKDTQVX0tuJrSYTjFtg7lcLU0/amB2+rTZw=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BikAEOdP8OacpZElT35aH1Qm+bqQpEnIW0LxCVg+1VSG7PcBkkckAyydvUaWQPVeN
	 Dqn/AP2zzvoYgk1QI4VxUhsjCt5IUg250LQZFYDJYJHIYy0MvV645DZTZmopGLaCjL
	 eqVBJtgS4Gk2TDszHmpNzy556jdntRzo99sYagdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5D04F801D5;
	Mon, 22 Mar 2021 19:19:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A8FDF8016B; Mon, 22 Mar 2021 19:19:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD5F8F80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 19:19:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD5F8F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vCJcRopk"
Received: by mail-ed1-x52a.google.com with SMTP id dm8so20560283edb.2
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=he1sHNhqR2uI8k5Zg0QdITwzf6w5j/Yg2Uh7d+S2xLg=;
 b=vCJcRopkyQsuskm6zcIoUiJ9GWAgVLbIjcAewyRF7O8lVbZivCnAmuc1mDBqI4dwDe
 L+2gUceCa4NZYWxACOaT3OX3jp7EWY0uRbUaCrDIqLAPk2tkZ173Ep4Cq4i5jWOiAn5R
 2S17iwCtOvDa5p34y1f3Y7LE8/VOBBfyJyiEHFK0BCMCOHng4F2iFsJ8vNEfoK+FB10A
 rMxUurH+1HGOXXGHHcKCw6idJatfeVsRDYTTGuBOXFt6LlaYaoSKoI3wovuDCRTFt/Hq
 VK0Wzz8TiEe1f6oUgkFUtWBbBvUSP7FXF4z1RUP/SrdpkG7PZS7HCBoL/7e6KYn48xga
 kJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=he1sHNhqR2uI8k5Zg0QdITwzf6w5j/Yg2Uh7d+S2xLg=;
 b=mGuDD9doEAGh1UM1zEOVfpcLDC3kXG0p0DADwwi9i3GTEWAC9r0rFDmiR1hwRrCxnp
 Zpg0xSIK7/KW8MzfEam7hBP3bwGLS9nNFdjN6xyRzyw2quxdId5wVJjffPn676xh0Tx5
 NlVWK/8jyg04GtW6MZLsxGciFVTOlL0OsXoec1Fzm9+4kbsz1kkkvi6fvRC4TTGXydxx
 JRJtbFZSy4Zjk7F20/AH1Cy2G4rWQO7gY3rpCLoKc7ERbFh+fmIMlwcAfWdpvaH7rwCH
 vlI8dCyL0MF99MOy2UPM/Y/8qRS+NhEzKLTh5CVCI4nYWSrZpL32Up06v0y1M40l5tMn
 jsoQ==
X-Gm-Message-State: AOAM531jj5itdmv6X+7FZbqnTrgTuLxdEKWSeDub/Molkn0PMY7S1sfx
 ytkyMSzOaslbKxRqeYhq2Tk=
X-Google-Smtp-Source: ABdhPJyQTAbHgsYJ40Dng8g4x/bptgrSUZ5xMOHL7gNjZ4UJRFyVYyFWFwfuMEPoS7xJgoxKwEBtXw==
X-Received: by 2002:a05:6402:4386:: with SMTP id
 o6mr917732edc.307.1616437144316; 
 Mon, 22 Mar 2021 11:19:04 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 m7sm11473349edp.81.2021.03.22.11.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 11:19:03 -0700 (PDT)
Subject: Re: [PATCH v6 2/5] drm: rockchip: add sound support to rk3066 hdmi
 driver
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
References: <20201206133355.16007-1-jbx6244@gmail.com>
 <20201206133355.16007-3-jbx6244@gmail.com>
Message-ID: <48dbe9b7-0aa0-f459-301f-f380e2b7f2f8@gmail.com>
Date: Mon, 22 Mar 2021 19:19:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201206133355.16007-3-jbx6244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 lgirdwood@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org
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

ping

On 12/6/20 2:33 PM, Johan Jonker wrote:
> From: Zheng Yang <zhengyang@rock-chips.com>
> 
> Add sound support to the rk3066 HDMI driver.
> 
> The I2S input of the HDMI TX allows transmission of
> DVD-Audio and decoded Dolby Digital
> to A/V Receivers and high-end displays.
> The interface supports 2 to 8 channels audio up to 192 kHz.
> The HDMI TX supports variable word length of
> 16bits to 32bits for I2S audio inputs.(This driver 24bit max)
> There are three I2S input modes supported.(This driver HDMI_I2S only)
> On RK3066/PX2 the HDMI TX audio source is connected to I2S_8CH.
> 
> Signed-off-by: Zheng Yang <zhengyang@rock-chips.com>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/Kconfig       |   2 +
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c | 277 ++++++++++++++++++++++++++++++++-
>  2 files changed, 278 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> index 310aa1546..4c20445dc 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -11,6 +11,8 @@ config DRM_ROCKCHIP
>  	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
>  	select DRM_RGB if ROCKCHIP_RGB
>  	select SND_SOC_HDMI_CODEC if ROCKCHIP_CDN_DP && SND_SOC
> +	select SND_SOC_HDMI_CODEC if ROCKCHIP_RK3066_HDMI && SND_SOC
> +	select SND_SOC_ROCKCHIP_I2S if ROCKCHIP_RK3066_HDMI && SND_SOC
>  	help
>  	  Choose this option if you have a Rockchip soc chipset.
>  	  This driver provides kernel mode setting and buffer
> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> index 1c546c3a8..2f8654023 100644
> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
> @@ -13,6 +13,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> +#include <sound/hdmi-codec.h>
> +
>  #include "rk3066_hdmi.h"
>  
>  #include "rockchip_drm_drv.h"
> @@ -20,9 +22,16 @@
>  
>  #define DEFAULT_PLLA_RATE 30000000
>  
> +struct audio_info {
> +	int channels;
> +	int sample_rate;
> +	int sample_width;
> +};
> +
>  struct hdmi_data_info {
>  	int vic; /* The CEA Video ID (VIC) of the current drm display mode. */
>  	bool sink_is_hdmi;
> +	bool sink_has_audio;
>  	unsigned int enc_out_format;
>  	unsigned int colorimetry;
>  };
> @@ -54,12 +63,19 @@ struct rk3066_hdmi {
>  
>  	unsigned int tmdsclk;
>  
> +	struct platform_device *audio_pdev;
> +	struct audio_info audio;
> +	bool audio_enable;
> +
>  	struct hdmi_data_info hdmi_data;
>  	struct drm_display_mode previous_mode;
>  };
>  
>  #define to_rk3066_hdmi(x) container_of(x, struct rk3066_hdmi, x)
>  
> +static int
> +rk3066_hdmi_config_audio(struct rk3066_hdmi *hdmi, struct audio_info *audio);
> +
>  static inline u8 hdmi_readb(struct rk3066_hdmi *hdmi, u16 offset)
>  {
>  	return readl_relaxed(hdmi->regs + offset);
> @@ -205,6 +221,23 @@ static int rk3066_hdmi_config_avi(struct rk3066_hdmi *hdmi,
>  					HDMI_INFOFRAME_AVI, 0, 0, 0);
>  }
>  
> +static int rk3066_hdmi_config_aai(struct rk3066_hdmi *hdmi,
> +				  struct audio_info *audio)
> +{
> +	union hdmi_infoframe frame;
> +	int rc;
> +
> +	rc = hdmi_audio_infoframe_init(&frame.audio);
> +
> +	frame.audio.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
> +	frame.audio.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
> +	frame.audio.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
> +	frame.audio.channels = hdmi->audio.channels;
> +
> +	return rk3066_hdmi_upload_frame(hdmi, rc, &frame,
> +					HDMI_INFOFRAME_AAI, 0, 0, 0);
> +}
> +
>  static int rk3066_hdmi_config_video_timing(struct rk3066_hdmi *hdmi,
>  					   struct drm_display_mode *mode)
>  {
> @@ -353,6 +386,7 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
>  		hdmi_modb(hdmi, HDMI_HDCP_CTRL, HDMI_VIDEO_MODE_MASK,
>  			  HDMI_VIDEO_MODE_HDMI);
>  		rk3066_hdmi_config_avi(hdmi, mode);
> +		rk3066_hdmi_config_audio(hdmi, &hdmi->audio);
>  	} else {
>  		hdmi_modb(hdmi, HDMI_HDCP_CTRL, HDMI_VIDEO_MODE_MASK, 0);
>  	}
> @@ -369,9 +403,20 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
>  	 */
>  	rk3066_hdmi_i2c_init(hdmi);
>  
> -	/* Unmute video output. */
> +	/* Unmute video and audio output. */
>  	hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
>  		  HDMI_VIDEO_AUDIO_DISABLE_MASK, HDMI_AUDIO_DISABLE);
> +	if (hdmi->audio_enable) {
> +		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2, HDMI_AUDIO_DISABLE, 0);
> +		/* Reset audio capture logic. */
> +		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
> +			  HDMI_AUDIO_CP_LOGIC_RESET_MASK,
> +			  HDMI_AUDIO_CP_LOGIC_RESET);
> +		usleep_range(900, 1000);
> +		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
> +			  HDMI_AUDIO_CP_LOGIC_RESET_MASK, 0);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -473,9 +518,13 @@ static int rk3066_hdmi_connector_get_modes(struct drm_connector *connector)
>  	edid = drm_get_edid(connector, hdmi->ddc);
>  	if (edid) {
>  		hdmi->hdmi_data.sink_is_hdmi = drm_detect_hdmi_monitor(edid);
> +		hdmi->hdmi_data.sink_has_audio = drm_detect_monitor_audio(edid);
>  		drm_connector_update_edid_property(connector, edid);
>  		ret = drm_add_edid_modes(connector, edid);
>  		kfree(edid);
> +	} else {
> +		hdmi->hdmi_data.sink_is_hdmi = true;
> +		hdmi->hdmi_data.sink_has_audio = true;
>  	}
>  
>  	return ret;
> @@ -536,6 +585,228 @@ struct drm_connector_helper_funcs rk3066_hdmi_connector_helper_funcs = {
>  };
>  
>  static int
> +rk3066_hdmi_config_audio(struct rk3066_hdmi *hdmi, struct audio_info *audio)
> +{
> +	u32 rate, channel, word_length, N, CTS;
> +	u64 tmp;
> +
> +	if (audio->channels < 3)
> +		channel = HDMI_AUDIO_I2S_CHANNEL_1_2;
> +	else if (audio->channels < 5)
> +		channel = HDMI_AUDIO_I2S_CHANNEL_3_4;
> +	else if (audio->channels < 7)
> +		channel = HDMI_AUDIO_I2S_CHANNEL_5_6;
> +	else
> +		channel = HDMI_AUDIO_I2S_CHANNEL_7_8;
> +
> +	switch (audio->sample_rate) {
> +	case 32000:
> +		rate = HDMI_AUDIO_SAMPLE_FRE_32000;
> +		N = N_32K;
> +		break;
> +	case 44100:
> +		rate = HDMI_AUDIO_SAMPLE_FRE_44100;
> +		N = N_441K;
> +		break;
> +	case 48000:
> +		rate = HDMI_AUDIO_SAMPLE_FRE_48000;
> +		N = N_48K;
> +		break;
> +	case 88200:
> +		rate = HDMI_AUDIO_SAMPLE_FRE_88200;
> +		N = N_882K;
> +		break;
> +	case 96000:
> +		rate = HDMI_AUDIO_SAMPLE_FRE_96000;
> +		N = N_96K;
> +		break;
> +	case 176400:
> +		rate = HDMI_AUDIO_SAMPLE_FRE_176400;
> +		N = N_1764K;
> +		break;
> +	case 192000:
> +		rate = HDMI_AUDIO_SAMPLE_FRE_192000;
> +		N = N_192K;
> +		break;
> +	default:
> +		DRM_DEV_ERROR(hdmi->dev, "no support for sample rate %d\n",
> +			      audio->sample_rate);
> +		return -ENOENT;
> +	}
> +
> +	switch (audio->sample_width) {
> +	case 16:
> +		word_length = 0x02;
> +		break;
> +	case 20:
> +		word_length = 0x0a;
> +		break;
> +	case 24:
> +		word_length = 0x0b;
> +		break;
> +	default:
> +		DRM_DEV_ERROR(hdmi->dev, "no support for word length %d\n",
> +			      audio->sample_width);
> +		return -ENOENT;
> +	}
> +
> +	tmp = (u64)hdmi->tmdsclk * N;
> +	do_div(tmp, 128 * audio->sample_rate);
> +	CTS = tmp;
> +
> +	/* Set_audio source I2S. */
> +	hdmi_writeb(hdmi, HDMI_AUDIO_CTRL1, 0x00);
> +	hdmi_writeb(hdmi, HDMI_AUDIO_CTRL2, 0x40);
> +	hdmi_writeb(hdmi, HDMI_I2S_AUDIO_CTRL,
> +		    HDMI_AUDIO_I2S_FORMAT_STANDARD | channel);
> +	hdmi_writeb(hdmi, HDMI_I2S_SWAP, 0x00);
> +	hdmi_modb(hdmi, HDMI_AV_CTRL1, HDMI_AUDIO_SAMPLE_FRE_MASK, rate);
> +	hdmi_writeb(hdmi, HDMI_AUDIO_SRC_NUM_AND_LENGTH, word_length);
> +
> +	/* Set N value. */
> +	hdmi_modb(hdmi, HDMI_LR_SWAP_N3,
> +		  HDMI_AUDIO_N_19_16_MASK, (N >> 16) & 0x0F);
> +	hdmi_writeb(hdmi, HDMI_N2, (N >> 8) & 0xFF);
> +	hdmi_writeb(hdmi, HDMI_N1, N & 0xFF);
> +
> +	/* Set CTS value. */
> +	hdmi_writeb(hdmi, HDMI_CTS_EXT1, CTS & 0xff);
> +	hdmi_writeb(hdmi, HDMI_CTS_EXT2, (CTS >> 8) & 0xff);
> +	hdmi_writeb(hdmi, HDMI_CTS_EXT3, (CTS >> 16) & 0xff);
> +
> +	if (audio->channels > 2)
> +		hdmi_modb(hdmi, HDMI_LR_SWAP_N3,
> +			  HDMI_AUDIO_LR_SWAP_MASK,
> +			  HDMI_AUDIO_LR_SWAP_SUBPACKET1);
> +	rate = (~(rate >> 4)) & 0x0f;
> +	hdmi_writeb(hdmi, HDMI_AUDIO_STA_BIT_CTRL1, rate);
> +	hdmi_writeb(hdmi, HDMI_AUDIO_STA_BIT_CTRL2, 0);
> +
> +	return rk3066_hdmi_config_aai(hdmi, audio);
> +}
> +
> +static int rk3066_hdmi_audio_hw_params(struct device *dev, void *d,
> +				       struct hdmi_codec_daifmt *daifmt,
> +				       struct hdmi_codec_params *params)
> +{
> +	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	if (!hdmi->hdmi_data.sink_has_audio) {
> +		DRM_DEV_ERROR(hdmi->dev, "no audio support\n");
> +		return -ENODEV;
> +	}
> +
> +	if (!hdmi->encoder.crtc)
> +		return -ENODEV;
> +
> +	switch (daifmt->fmt) {
> +	case HDMI_I2S:
> +		break;
> +	default:
> +		DRM_DEV_ERROR(dev, "invalid format %d\n", daifmt->fmt);
> +		return -EINVAL;
> +	}
> +
> +	hdmi->audio.channels = params->channels;
> +	hdmi->audio.sample_rate = params->sample_rate;
> +	hdmi->audio.sample_width = params->sample_width;
> +
> +	return rk3066_hdmi_config_audio(hdmi, &hdmi->audio);
> +}
> +
> +static void rk3066_hdmi_audio_shutdown(struct device *dev, void *d)
> +{
> +	/* do nothing */
> +}
> +
> +static int
> +rk3066_hdmi_audio_mute_stream(struct device *dev, void *d,
> +			      bool mute, int direction)
> +{
> +	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	if (!hdmi->hdmi_data.sink_has_audio) {
> +		DRM_DEV_ERROR(hdmi->dev, "no audio support\n");
> +		return -ENODEV;
> +	}
> +
> +	hdmi->audio_enable = !mute;
> +
> +	if (mute)
> +		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
> +			  HDMI_AUDIO_DISABLE, HDMI_AUDIO_DISABLE);
> +	else
> +		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2, HDMI_AUDIO_DISABLE, 0);
> +
> +	/*
> +	 * Under power mode E we need to reset the audio capture logic to
> +	 * make the audio setting update.
> +	 */
> +	if (rk3066_hdmi_get_power_mode(hdmi) == HDMI_SYS_POWER_MODE_E) {
> +		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
> +			  HDMI_AUDIO_CP_LOGIC_RESET_MASK,
> +			  HDMI_AUDIO_CP_LOGIC_RESET);
> +		usleep_range(900, 1000);
> +		hdmi_modb(hdmi, HDMI_VIDEO_CTRL2,
> +			  HDMI_AUDIO_CP_LOGIC_RESET_MASK, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rk3066_hdmi_audio_get_eld(struct device *dev, void *d,
> +				     u8 *buf, size_t len)
> +{
> +	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
> +	struct drm_mode_config *config = &hdmi->encoder.dev->mode_config;
> +	struct drm_connector *connector;
> +	int ret = -ENODEV;
> +
> +	mutex_lock(&config->mutex);
> +	list_for_each_entry(connector, &config->connector_list, head) {
> +		if (&hdmi->encoder == connector->encoder) {
> +			memcpy(buf, connector->eld,
> +			       min(sizeof(connector->eld), len));
> +			ret = 0;
> +		}
> +	}
> +	mutex_unlock(&config->mutex);
> +
> +	return ret;
> +}
> +
> +static const struct hdmi_codec_ops audio_codec_ops = {
> +	.hw_params = rk3066_hdmi_audio_hw_params,
> +	.audio_shutdown = rk3066_hdmi_audio_shutdown,
> +	.mute_stream = rk3066_hdmi_audio_mute_stream,
> +	.get_eld = rk3066_hdmi_audio_get_eld,
> +	.no_capture_mute = 1,
> +};
> +
> +static int rk3066_hdmi_audio_codec_init(struct rk3066_hdmi *hdmi,
> +					struct device *dev)
> +{
> +	struct hdmi_codec_pdata codec_data = {
> +		.i2s = 1,
> +		.ops = &audio_codec_ops,
> +		.max_i2s_channels = 8,
> +	};
> +
> +	hdmi->audio.channels = 2;
> +	hdmi->audio.sample_rate = 48000;
> +	hdmi->audio.sample_width = 16;
> +	hdmi->audio_enable = false;
> +	hdmi->audio_pdev =
> +		platform_device_register_data(dev,
> +					      HDMI_CODEC_DRV_NAME,
> +					      PLATFORM_DEVID_NONE,
> +					      &codec_data,
> +					      sizeof(codec_data));
> +
> +	return PTR_ERR_OR_ZERO(hdmi->audio_pdev);
> +}
> +
> +static int
>  rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
>  {
>  	struct drm_encoder *encoder = &hdmi->encoder;
> @@ -567,6 +838,8 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
>  
>  	drm_connector_attach_encoder(&hdmi->connector, encoder);
>  
> +	rk3066_hdmi_audio_codec_init(hdmi, dev);
> +
>  	return 0;
>  }
>  
> @@ -815,6 +1088,7 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
>  	return 0;
>  
>  err_cleanup_hdmi:
> +	platform_device_unregister(hdmi->audio_pdev);
>  	hdmi->connector.funcs->destroy(&hdmi->connector);
>  	hdmi->encoder.funcs->destroy(&hdmi->encoder);
>  err_disable_i2c:
> @@ -830,6 +1104,7 @@ static void rk3066_hdmi_unbind(struct device *dev, struct device *master,
>  {
>  	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
>  
> +	platform_device_unregister(hdmi->audio_pdev);
>  	hdmi->connector.funcs->destroy(&hdmi->connector);
>  	hdmi->encoder.funcs->destroy(&hdmi->encoder);
>  
> 

