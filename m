Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FCB3422BF
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 18:01:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F24CD167E;
	Fri, 19 Mar 2021 18:00:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F24CD167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616173303;
	bh=fxUy9PzEduoJQoaRUNJy0SSP7km/NCyctNqg51sx6/g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V6Ysyut92zfrHbM9zZ6uoiu56+EOIGIcb+hXJcF9WjmxEpGvgs+O4m+9kSSmDDBcG
	 Yn9th56HviFVnRx31E7OOoB6CxpvBHymoocddA+QlRbo0lcMQB7Xw0gDTRX/F+uLfp
	 DxlogIDv28FRX3so7a6m9aDjDiX5D2zHvRsBLVTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A206DF804AB;
	Fri, 19 Mar 2021 17:58:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C7C5F80475; Fri, 19 Mar 2021 17:58:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4535F8023C
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 17:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4535F8023C
IronPort-SDR: /W6MLtxJaSu951x0Zll8jbT3UuIBIq/GnEaDIyGcR6EV4z9slYQyXVtxesLg6Ocx02XhOQ4Tfz
 N9jWuJIiU6gw==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190022222"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="190022222"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 09:58:27 -0700
IronPort-SDR: pjJcDIgtNb7uxOqD0EZyz8mYL6SZYEd4pOG1xWucYDEkNF0Gz0IN5P9YYBDx4sN6QsbZkQs3lG
 Vwv2y5Nseeaw==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="406867423"
Received: from dgerstma-mobl.amr.corp.intel.com (HELO [10.212.157.39])
 ([10.212.157.39])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 09:58:26 -0700
Subject: Re: [PATCH v3 7/7] ASoC: codecs: wcd938x: add audio routing
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
 <20210319092919.21218-8-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d2ee1841-4634-25e5-2473-422a1015acec@linux.intel.com>
Date: Fri, 19 Mar 2021 11:06:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210319092919.21218-8-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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



On 3/19/21 4:29 AM, Srinivas Kandagatla wrote:
> This patch adds audio routing for both playback and capture.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   sound/soc/codecs/wcd938x.c | 97 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 97 insertions(+)
> 
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index 31e3cf729568..0f801920ebac 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -3153,6 +3153,99 @@ static const struct snd_soc_dapm_widget wcd938x_rx_dapm_widgets[] = {
>   
>   };
>   
> +static const struct snd_soc_dapm_route wcd938x_rx_audio_map[] = {
> +	{"IN1_HPHL", NULL, "VDD_BUCK"},
> +	{"IN1_HPHL", NULL, "CLS_H_PORT"},
> +
> +	{"RX1", NULL, "IN1_HPHL"},
> +	{"RX1", NULL, "RXCLK"},
> +	{"RDAC1", NULL, "RX1"},
> +	{"HPHL_RDAC", "Switch", "RDAC1"},
> +	{"HPHL PGA", NULL, "HPHL_RDAC"},
> +	{"HPHL", NULL, "HPHL PGA"},
> +
> +	{"IN2_HPHR", NULL, "VDD_BUCK"},
> +	{"IN2_HPHR", NULL, "CLS_H_PORT"},
> +	{"RX2", NULL, "IN2_HPHR"},
> +	{"RDAC2", NULL, "RX2"},
> +	{"RX2", NULL, "RXCLK"},
> +	{"HPHR_RDAC", "Switch", "RDAC2"},
> +	{"HPHR PGA", NULL, "HPHR_RDAC"},
> +	{"HPHR", NULL, "HPHR PGA"},
> +
> +	{"IN3_AUX", NULL, "VDD_BUCK"},
> +	{"IN3_AUX", NULL, "CLS_H_PORT"},
> +	{"RX3", NULL, "IN3_AUX"},
> +	{"RDAC4", NULL, "RX3"},
> +	{"RX3", NULL, "RXCLK"},
> +	{"AUX_RDAC", "Switch", "RDAC4"},
> +	{"AUX PGA", NULL, "AUX_RDAC"},
> +	{"AUX", NULL, "AUX PGA"},
> +
> +	{"RDAC3_MUX", "RX3", "RX3"},
> +	{"RDAC3_MUX", "RX1", "RX1"},
> +	{"RDAC3", NULL, "RDAC3_MUX"},
> +	{"EAR_RDAC", "Switch", "RDAC3"},
> +	{"EAR PGA", NULL, "EAR_RDAC"},
> +	{"EAR", NULL, "EAR PGA"},
> +};
> +
> +static const struct snd_soc_dapm_route wcd938x_audio_map[] = {
> +	{"ADC1_OUTPUT", NULL, "ADC1_MIXER"},
> +	{"ADC1_MIXER", "Switch", "ADC1 REQ"},
> +	{"ADC1 REQ", NULL, "ADC1"},
> +	{"ADC1", NULL, "AMIC1"},
> +
> +	{"ADC2_OUTPUT", NULL, "ADC2_MIXER"},
> +	{"ADC2_MIXER", "Switch", "ADC2 REQ"},
> +	{"ADC2 REQ", NULL, "ADC2"},
> +	{"ADC2", NULL, "HDR12 MUX"},
> +	{"HDR12 MUX", "NO_HDR12", "ADC2 MUX"},
> +	{"HDR12 MUX", "HDR12", "AMIC1"},
> +	{"ADC2 MUX", "INP3", "AMIC3"},
> +	{"ADC2 MUX", "INP2", "AMIC2"},
> +
> +	{"ADC3_OUTPUT", NULL, "ADC3_MIXER"},
> +	{"ADC3_MIXER", "Switch", "ADC3 REQ"},
> +	{"ADC3 REQ", NULL, "ADC3"},
> +	{"ADC3", NULL, "HDR34 MUX"},
> +	{"HDR34 MUX", "NO_HDR34", "ADC3 MUX"},
> +	{"HDR34 MUX", "HDR34", "AMIC5"},
> +	{"ADC3 MUX", "INP4", "AMIC4"},
> +	{"ADC3 MUX", "INP6", "AMIC6"},
> +
> +	{"ADC4_OUTPUT", NULL, "ADC4_MIXER"},
> +	{"ADC4_MIXER", "Switch", "ADC4 REQ"},
> +	{"ADC4 REQ", NULL, "ADC4"},
> +	{"ADC4", NULL, "ADC4 MUX"},
> +	{"ADC4 MUX", "INP5", "AMIC5"},
> +	{"ADC4 MUX", "INP7", "AMIC7"},
> +
> +	{"DMIC1_OUTPUT", NULL, "DMIC1_MIXER"},
> +	{"DMIC1_MIXER", "Switch", "DMIC1"},
> +
> +	{"DMIC2_OUTPUT", NULL, "DMIC2_MIXER"},
> +	{"DMIC2_MIXER", "Switch", "DMIC2"},
> +
> +	{"DMIC3_OUTPUT", NULL, "DMIC3_MIXER"},
> +	{"DMIC3_MIXER", "Switch", "DMIC3"},
> +
> +	{"DMIC4_OUTPUT", NULL, "DMIC4_MIXER"},
> +	{"DMIC4_MIXER", "Switch", "DMIC4"},
> +
> +	{"DMIC5_OUTPUT", NULL, "DMIC5_MIXER"},
> +	{"DMIC5_MIXER", "Switch", "DMIC5"},
> +
> +	{"DMIC6_OUTPUT", NULL, "DMIC6_MIXER"},
> +	{"DMIC6_MIXER", "Switch", "DMIC6"},
> +
> +	{"DMIC7_OUTPUT", NULL, "DMIC7_MIXER"},
> +	{"DMIC7_MIXER", "Switch", "DMIC7"},
> +
> +	{"DMIC8_OUTPUT", NULL, "DMIC8_MIXER"},
> +	{"DMIC8_MIXER", "Switch", "DMIC8"},
> +};

And last comment that shows I am at a loss on how this is supposed to 
work: how would sidetone be handled? This is functionality that needs 
both playback and capture to be working, but if they are split into two 
separate spaces with only the TX handling commands then what happens?


> +
>   static int wcd938x_get_micb_vout_ctl_val(u32 micb_mv)
>   {
>   	/* min micbias voltage is 1V and maximum is 2.85V */
> @@ -3332,6 +3425,8 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd938x_sdw_rx = {
>   	.num_controls = ARRAY_SIZE(wcd938x_rx_snd_controls),
>   	.dapm_widgets = wcd938x_rx_dapm_widgets,
>   	.num_dapm_widgets = ARRAY_SIZE(wcd938x_rx_dapm_widgets),
> +	.dapm_routes = wcd938x_rx_audio_map,
> +	.num_dapm_routes = ARRAY_SIZE(wcd938x_rx_audio_map),
>   };
>   
>   static const struct snd_soc_component_driver soc_codec_dev_wcd938x_sdw_tx = {
> @@ -3341,6 +3436,8 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd938x_sdw_tx = {
>   	.num_controls = ARRAY_SIZE(wcd938x_snd_controls),
>   	.dapm_widgets = wcd938x_dapm_widgets,
>   	.num_dapm_widgets = ARRAY_SIZE(wcd938x_dapm_widgets),
> +	.dapm_routes = wcd938x_audio_map,
> +	.num_dapm_routes = ARRAY_SIZE(wcd938x_audio_map),
>   };
>   
>   static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_priv *wcd)
> 
