Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2844F1506D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:39:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC287190E;
	Mon,  6 May 2019 17:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC287190E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557157170;
	bh=LeY2JC/SGu7Nnte1TQClz6HI/kBPhbKPW8hmv3JZsME=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TN6O/rgSmwxOmKUodYABeZPErgPQfg5UUJJm/8Nbj02/HE0+Uyfsul8gwtHUHWwML
	 w+c01z0zRu13VEL1mI5OlqJdZBNGC4kA4MIswaXQB+Nt5zDWNXZVOA1DWTB9BLOgzO
	 kIsHfFdweRUB+FSVIU80fe0+vzF7Fv2HSfbzAKTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ED6EF896FF;
	Mon,  6 May 2019 17:37:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8062CF896F0; Mon,  6 May 2019 17:37:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E34E2F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E34E2F80C07
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 08:37:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="141847640"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 06 May 2019 08:37:35 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 343BF58010A;
 Mon,  6 May 2019 08:37:35 -0700 (PDT)
To: libin.yang@intel.com, alsa-devel@alsa-project.org
References: <1557125960-29353-1-git-send-email-libin.yang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bebcb1f6-1d8b-63aa-a22d-b48047b64809@linux.intel.com>
Date: Mon, 6 May 2019 10:37:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557125960-29353-1-git-send-email-libin.yang@intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, broonie@kernel.org, subhransu.s.prusty@intel.com,
 samreen.nilofer@intel.com
Subject: Re: [alsa-devel] [RFC PATCH] ASoC: codec: hdac_hdmi: no checking
 monitor in hw_params
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 5/6/19 1:59 AM, libin.yang@intel.com wrote:
> From: Libin Yang <libin.yang@intel.com>
> 
> This patch move the check of monitor from hw_params to trigger callback.
> 
> The original code will check the monitor presence in hw_params. If the
> monitor doesn't exist, hw_params will return -ENODEV. Mostly this is OK.
> 
> However, pulseaudio will check the pcm devices when kernel is booting up.
> It will try to open, set hw_params, prepare such pcm devices. We can't
> guarantee that the monitor will be connected when kernel is booting up.
> Especially, hdac_hdmi will export 3 pcms at most. It's hard to say users
> will connect 3 monitors to the HDMI/DP ports. This will cause pulseaudio
> fail in parsing the pcm devices because the driver will return -ENODEV in
> hw_params.
> 
> This patch tries to move the check of monitor presence into trigger
> callback. This can "trick" the pulseaudio the pcm is ready.
> 
> This bug is found when we try to enable HDMI detection in
> gnome-sound-setting for ASoC hdac_hdmi. After we enable the hdmi in UCM,
> pulseaudio will try to parse the hdmi pcm devices. It will cause failure if
> there are no monitors connected.

Out of curiosity, how is this handled in the legacy driver? I haven't 
done this for a long time but I remember very clearly being able to play 
on the HDMI:3,7, etc devices without any monitors connected. You'd get 
of course no sound but there was no error reported to userspace. The 
hardware is perfectly capable of pushing samples into the display 
controller using the HDAudio/iDisp link.

> 
> Signed-off-by: Libin Yang <libin.yang@intel.com>
> ---
>   sound/soc/codecs/hdac_hdmi.c | 44 +++++++++++++++++++++++++++++++-------------
>   1 file changed, 31 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
> index 4de1fbf..f482e09 100644
> --- a/sound/soc/codecs/hdac_hdmi.c
> +++ b/sound/soc/codecs/hdac_hdmi.c
> @@ -455,24 +455,11 @@ static int hdac_hdmi_set_hw_params(struct snd_pcm_substream *substream,
>   	struct snd_pcm_hw_params *hparams, struct snd_soc_dai *dai)
>   {
>   	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
> -	struct hdac_device *hdev = hdmi->hdev;
>   	struct hdac_hdmi_dai_port_map *dai_map;
> -	struct hdac_hdmi_port *port;
>   	struct hdac_hdmi_pcm *pcm;
>   	int format;
>   
>   	dai_map = &hdmi->dai_map[dai->id];
> -	port = dai_map->port;
> -
> -	if (!port)
> -		return -ENODEV;
> -
> -	if ((!port->eld.monitor_present) || (!port->eld.eld_valid)) {
> -		dev_err(&hdev->dev,
> -			"device is not configured for this pin:port%d:%d\n",
> -					port->pin->nid, port->id);
> -		return -ENODEV;
> -	}
>   
>   	format = snd_hdac_calc_stream_format(params_rate(hparams),
>   			params_channels(hparams), params_format(hparams),
> @@ -630,6 +617,36 @@ static void hdac_hdmi_pcm_close(struct snd_pcm_substream *substream,
>   		dai_map->port = NULL;
>   }
>   
> +static int hdac_hdmi_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
> +				 struct snd_soc_dai *dai)
> +{
> +	struct hdac_hdmi_port *port;
> +	struct hdac_hdmi_dai_port_map *dai_map;
> +	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
> +	struct hdac_device *hdev = hdmi->hdev;
> +
> +	/*
> +	 * When start, if there is no monitor,
> +	 * It should not start audio.
> +	 */
> +	if (cmd == SNDRV_PCM_TRIGGER_START) {
> +		dai_map = &hdmi->dai_map[dai->id];
> +		port = dai_map->port;
> +
> +		if (!port)
> +			return -ENODEV;
> +
> +		if ((!port->eld.monitor_present) || (!port->eld.eld_valid)) {
> +			dev_err(&hdev->dev,
> +				"device is not configured for this pin:port%d:%d\n",
> +				port->pin->nid, port->id);
> +			return -ENODEV;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static int
>   hdac_hdmi_query_cvt_params(struct hdac_device *hdev, struct hdac_hdmi_cvt *cvt)
>   {
> @@ -1389,6 +1406,7 @@ static const struct snd_soc_dai_ops hdmi_dai_ops = {
>   	.startup = hdac_hdmi_pcm_open,
>   	.shutdown = hdac_hdmi_pcm_close,
>   	.hw_params = hdac_hdmi_set_hw_params,
> +	.trigger = hdac_hdmi_pcm_trigger,
>   	.set_tdm_slot = hdac_hdmi_set_tdm_slot,
>   };
>   
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
