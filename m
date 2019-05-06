Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E26E1460B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 10:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B50183F;
	Mon,  6 May 2019 10:20:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B50183F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557130905;
	bh=U8D3KBJwXULcSoDiiTh77FDu95RZWAUY/pIy615tAos=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UeQBRKP8vQle4yVZQ9CocUZEu9VPSYk8XQixk91pqFVTwn7pRTeg5aOBGiaLgd81F
	 pQHlWMOfDQqZVMr97UVYNE6menqSx8kr04hNiqbxOY/TN9dKDF0/KwwAusD8NP16eJ
	 oxGdKcFwSImC+Vyub+dosgzjARLajTnXw1JM4K7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18A51F8963C;
	Mon,  6 May 2019 10:20:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9269CF8962A; Mon,  6 May 2019 10:19:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E2D7F8962A
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 10:19:56 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 704CBA003F;
 Mon,  6 May 2019 10:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 704CBA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1557130796; bh=HA/B8EGJHv9eNxrDbm9oFOdL5iTObr76p7gB00mdhRg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RI1O1gXowe+LxVi4wM22pFyE+1a3QPyDrnxsqTPvJWOyg07zn3mWRvibqaIZ460oP
 LzJsAu0ITpbKXHT4HpPLHb2HBG+I3f+WWXyUVWld5mzI3pX1Q6yQ8TIZ23eRiPI28U
 G30AKLJsZcJ5t06cv/b7vrGOeGUwpljHoIXWGYJ4=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  6 May 2019 10:19:49 +0200 (CEST)
To: libin.yang@intel.com, alsa-devel@alsa-project.org
References: <1557125960-29353-1-git-send-email-libin.yang@intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <320b97c1-ed3c-6c56-0829-c00d2e475278@perex.cz>
Date: Mon, 6 May 2019 10:19:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557125960-29353-1-git-send-email-libin.yang@intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, broonie@kernel.org, subhransu.s.prusty@intel.com,
 pierre-louis.bossart@linux.intel.com, samreen.nilofer@intel.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 06. 05. 19 v 8:59 libin.yang@intel.com napsal(a):
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

I don't like this solution much. PA should use the Jack control to add the
devices dynamically and avoid probing when the Jack control is false.

						Jaroslav

> 
> Signed-off-by: Libin Yang <libin.yang@intel.com>
> ---
>  sound/soc/codecs/hdac_hdmi.c | 44 +++++++++++++++++++++++++++++++-------------
>  1 file changed, 31 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
> index 4de1fbf..f482e09 100644
> --- a/sound/soc/codecs/hdac_hdmi.c
> +++ b/sound/soc/codecs/hdac_hdmi.c
> @@ -455,24 +455,11 @@ static int hdac_hdmi_set_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_pcm_hw_params *hparams, struct snd_soc_dai *dai)
>  {
>  	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
> -	struct hdac_device *hdev = hdmi->hdev;
>  	struct hdac_hdmi_dai_port_map *dai_map;
> -	struct hdac_hdmi_port *port;
>  	struct hdac_hdmi_pcm *pcm;
>  	int format;
>  
>  	dai_map = &hdmi->dai_map[dai->id];
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
>  	format = snd_hdac_calc_stream_format(params_rate(hparams),
>  			params_channels(hparams), params_format(hparams),
> @@ -630,6 +617,36 @@ static void hdac_hdmi_pcm_close(struct snd_pcm_substream *substream,
>  		dai_map->port = NULL;
>  }
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
>  static int
>  hdac_hdmi_query_cvt_params(struct hdac_device *hdev, struct hdac_hdmi_cvt *cvt)
>  {
> @@ -1389,6 +1406,7 @@ static const struct snd_soc_dai_ops hdmi_dai_ops = {
>  	.startup = hdac_hdmi_pcm_open,
>  	.shutdown = hdac_hdmi_pcm_close,
>  	.hw_params = hdac_hdmi_set_hw_params,
> +	.trigger = hdac_hdmi_pcm_trigger,
>  	.set_tdm_slot = hdac_hdmi_set_tdm_slot,
>  };
>  
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
