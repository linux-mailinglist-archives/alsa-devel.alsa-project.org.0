Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF8B65E139
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 01:01:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 294E8DC61;
	Thu,  5 Jan 2023 01:00:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 294E8DC61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672876871;
	bh=DZgBOwyaksYR8rOqarCeAE7wIzcUZnoEzEaWzuWNeE8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HJKSi07fq+VB04B8BvbDDi5FTZNtxF19nG1i7ECeU8i2PFBSDZYw5n0qdMXDvxK2D
	 B6XTc/J3EVqUHou7bT4QDFMGBuGKwYmqY3FhQn6/HJ3rYOLrmWlX3owZ3mnYzLUGha
	 eCMwRwO+H/4u/VWsyrf8Gfi3pGZPZOgk0aKk6SYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EE4CF80240;
	Thu,  5 Jan 2023 00:59:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 425C2F8024D; Thu,  5 Jan 2023 00:59:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85451F80238
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 00:59:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85451F80238
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dUSBD2sN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672876761; x=1704412761;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DZgBOwyaksYR8rOqarCeAE7wIzcUZnoEzEaWzuWNeE8=;
 b=dUSBD2sNVwUX0EK7QUn9j6pIIt7wn94BTEY+uJB3H3HdL2Utof5HIriX
 D10fsEI2Ed52m7i2EHmCpLx8kicxQQ7gp60bZLcbqGbcB+9vGlepEjjWD
 JmcMMbM+htpYF28+4FaPmr0gDbU/P0ZG0mHqaZ0BvipMaihutkrSheRGI
 c/oeODBHrmKTujj5+ipnJ0P9xDzG2/l6Z7SRzr/jXjp8UpF4b6Sg2Nb3G
 KK1GUXpi1sCvr0GfYneVcSqtXD7EnA5siIE8mPHfk+13zDt755O2AkD8X
 urU+5MAPymNZnVLOAajGrqG8PamTxXrP9RD82jpNr9HViID9EBDnYnYNj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="323306069"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; d="scan'208";a="323306069"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 15:58:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="900745331"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; d="scan'208";a="900745331"
Received: from kvthalli-mobl1.amr.corp.intel.com (HELO [10.212.102.90])
 ([10.212.102.90])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 15:58:47 -0800
Message-ID: <5babccd6-9796-7613-cf82-cc859f338448@linux.intel.com>
Date: Wed, 4 Jan 2023 17:33:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 02/14] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh+dt@kernel.org, agross@kernel.org
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-3-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221223233200.26089-3-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/23/22 17:31, Wesley Cheng wrote:
> The QC ADSP is able to support USB playback and capture, so that the
> main application processor can be placed into lower CPU power modes.  This
> adds the required AFE port configurations and port start command to start
> an audio session.

It would be good to clarify what sort of endpoints can be supported. I
presume the SOF-synchronous case is handled, but how would you deal with
async endpoints with feedback (be it explicit or implicit)?

Note that it's very hard to make the decision not to support async
endpoints, there are quite a few devices that are exposed as async to
work around an obscure legacy issue on Windows but are really
sof-synchronous endpoints that never ask for any change of pace.

> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../sound/qcom,q6dsp-lpass-ports.h            |   1 +
>  sound/soc/qcom/qdsp6/q6afe-dai.c              |  47 +++++
>  sound/soc/qcom/qdsp6/q6afe.c                  | 183 ++++++++++++++++++
>  sound/soc/qcom/qdsp6/q6afe.h                  |  46 ++++-
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  23 +++
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h      |   1 +
>  sound/soc/qcom/qdsp6/q6routing.c              |   8 +
>  7 files changed, 308 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 9f7c5103bc82..746bc462bb2e 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -131,6 +131,7 @@
>  #define RX_CODEC_DMA_RX_7	126
>  #define QUINARY_MI2S_RX		127
>  #define QUINARY_MI2S_TX		128
> +#define USB_RX				129

the commit message says the DSP can support Playback and capture, but
here there's capture only ...


>  
>  static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
> +	{"USB Playback", NULL, "USB_RX"},

... but here RX means playback?

I am not sure I get the convention on directions and what is actually
supported?

> +struct afe_param_id_usb_cfg {
> +/* Minor version used for tracking USB audio device configuration.
> + * Supported values: AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG
> + */
> +	u32                  cfg_minor_version;
> +/* Sampling rate of the port.
> + * Supported values:
> + * - AFE_PORT_SAMPLE_RATE_8K
> + * - AFE_PORT_SAMPLE_RATE_11025
> + * - AFE_PORT_SAMPLE_RATE_12K
> + * - AFE_PORT_SAMPLE_RATE_16K
> + * - AFE_PORT_SAMPLE_RATE_22050
> + * - AFE_PORT_SAMPLE_RATE_24K
> + * - AFE_PORT_SAMPLE_RATE_32K
> + * - AFE_PORT_SAMPLE_RATE_44P1K
> + * - AFE_PORT_SAMPLE_RATE_48K
> + * - AFE_PORT_SAMPLE_RATE_96K
> + * - AFE_PORT_SAMPLE_RATE_192K
> + */
> +	u32                  sample_rate;
> +/* Bit width of the sample.
> + * Supported values: 16, 24
> + */
> +	u16                  bit_width;
> +/* Number of channels.
> + * Supported values: 1 and 2

that aligns with my feedback on the cover letter, if you connect a
device that can support from than 2 channels should the DSP even expose
this DSP-optimized path?

Oh and I forgot, what happens if there are multiple audio devices
connected, can the DSP deal with all of them? If not, how is this handled?

> + */
> +	u16                  num_channels;
> +/* Data format supported by the USB. The supported value is
> + * 0 (#AFE_USB_AUDIO_DATA_FORMAT_LINEAR_PCM).
> + */
> +	u16                  data_format;
> +/* this field must be 0 */
> +	u16                  reserved;
> +/* device token of actual end USB aduio device */

typo: audio

> +	u32                  dev_token;
> +/* endianness of this interface */
> +	u32                   endian;

Is this a USB concept? I can't recall having seen any parts of the USB
audio class spec that the data can be big or little endian?

> +/* service interval */
> +	u32                  service_interval;
> +} __packed;

> +int afe_port_send_usb_dev_param(struct q6afe_port *port, struct q6afe_usb_cfg *cfg)
> +{
> +	union afe_port_config *pcfg = &port->port_cfg;
> +	struct afe_param_id_usb_audio_dev_params usb_dev;
> +	struct afe_param_id_usb_audio_dev_lpcm_fmt lpcm_fmt;
> +	struct afe_param_id_usb_audio_svc_interval svc_int;
> +	int ret = 0;
> +
> +	if (!pcfg) {
> +		pr_err("%s: Error, no configuration data\n", __func__);

can you use a dev_err() here and the rest of the code?

> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +	memset(&usb_dev, 0, sizeof(usb_dev));
> +	memset(&lpcm_fmt, 0, sizeof(lpcm_fmt));
> +
> +	usb_dev.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
> +	q6afe_port_set_param_v2(port, &usb_dev,
> +					AFE_PARAM_ID_USB_AUDIO_DEV_PARAMS,
> +					AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(usb_dev));
> +	if (ret) {
> +		pr_err("%s: AFE device param cmd failed %d\n",
> +			__func__, ret);
> +		goto exit;
> +	}
> +
> +	lpcm_fmt.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
> +	lpcm_fmt.endian = pcfg->usb_cfg.endian;
> +	ret = q6afe_port_set_param_v2(port, &lpcm_fmt,
> +					AFE_PARAM_ID_USB_AUDIO_DEV_LPCM_FMT,
> +					AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(lpcm_fmt));
> +	if (ret) {
> +		pr_err("%s: AFE device param cmd LPCM_FMT failed %d\n",
> +			__func__, ret);
> +		goto exit;
> +	}
> +
> +	svc_int.cfg_minor_version =
> +		AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
> +	svc_int.svc_interval = pcfg->usb_cfg.service_interval;
> +	ret = q6afe_port_set_param_v2(port, &svc_int,
> +					AFE_PARAM_ID_USB_AUDIO_SVC_INTERVAL,
> +					AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(svc_int));
> +	if (ret) {
> +		pr_err("%s: AFE device param cmd svc_interval failed %d\n",
> +			__func__, ret);
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +exit:
> +	return ret;
> +}
