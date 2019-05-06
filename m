Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3162714729
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 11:05:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A78C71852;
	Mon,  6 May 2019 11:05:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A78C71852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557133554;
	bh=qOzomWiZAJtcpib2Z1V1jPgcLcxbTDtQS5e14aRHPPI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uk3GKaLDSPEHjWZd2R+ba9q5+e1LF60/26YUBL6OHuiVBMwpQMTTFvAfHBXzo4eJ1
	 1vmKIf3JWK/mbJn4nkc8b5kJIw7pLR/WYowUtkx7H7wNOLhgRzDeizGO+rpsXrl5fy
	 iRZX09A36HSO4+vosf1pzTlTCYgxThH74ytMBCX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E690FF896E6;
	Mon,  6 May 2019 11:04:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 101EFF896E6; Mon,  6 May 2019 11:04:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DFFFF8963C
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 11:04:04 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 78817A0046;
 Mon,  6 May 2019 11:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 78817A0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1557133444; bh=QZzyciycI6OWKx7nCmSEiQFW/mcoIJgPQUpHSLsMGrA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BZBr49W8BP/nei8AYUauBhhf7qrSG3WDtR7cKgtE48zcG+X2o8xE4F//ewF5dvE6a
 fW0rRVBl4rATruRXhYq2gvgvVuJqChyU85P/g+KMvkJVRjRsICo0fC2+cJTqLYA8Uy
 RwLyTBtMWFN/Hs0gFNXiAy8GezKyrFGsR58ZCPGU=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  6 May 2019 11:03:56 +0200 (CEST)
To: "Yang, Libin" <libin.yang@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1557125960-29353-1-git-send-email-libin.yang@intel.com>
 <320b97c1-ed3c-6c56-0829-c00d2e475278@perex.cz>
 <96A12704CE18D347B625EE2D4A099D19528350C9@SHSMSX103.ccr.corp.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <30fdd871-e4fa-e8a6-2393-cbc655fce75e@perex.cz>
Date: Mon, 6 May 2019 11:03:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <96A12704CE18D347B625EE2D4A099D19528350C9@SHSMSX103.ccr.corp.intel.com>
Content-Language: en-US
Cc: "tiwai@suse.de" <tiwai@suse.de>, "Lin, Mengdong" <mengdong.lin@intel.com>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Wang, Rander" <rander.wang@intel.com>,
 Hui Wang <hui.wang@canonical.com>, "broonie@kernel.org" <broonie@kernel.org>
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

Dne 06. 05. 19 v 10:46 Yang, Libin napsal(a):
> Add Mengdong, Hui, Rander
> 
> Hi Jaroslav,
> 
>> -----Original Message-----
>> From: Jaroslav Kysela [mailto:perex@perex.cz]
>> Sent: Monday, May 6, 2019 4:20 PM
>> To: Yang, Libin <libin.yang@intel.com>; alsa-devel@alsa-project.org
>> Cc: tiwai@suse.de; pierre-louis.bossart@linux.intel.com; broonie@kernel.org;
>> subhransu.s.prusty@intel.com; samreen.nilofer@intel.com
>> Subject: Re: [alsa-devel] [RFC PATCH] ASoC: codec: hdac_hdmi: no checking
>> monitor in hw_params
>>
>> Dne 06. 05. 19 v 8:59 libin.yang@intel.com napsal(a):
>>> From: Libin Yang <libin.yang@intel.com>
>>>
>>> This patch move the check of monitor from hw_params to trigger callback.
>>>
>>> The original code will check the monitor presence in hw_params. If the
>>> monitor doesn't exist, hw_params will return -ENODEV. Mostly this is OK.
>>>
>>> However, pulseaudio will check the pcm devices when kernel is booting up.
>>> It will try to open, set hw_params, prepare such pcm devices. We can't
>>> guarantee that the monitor will be connected when kernel is booting up.
>>> Especially, hdac_hdmi will export 3 pcms at most. It's hard to say
>>> users will connect 3 monitors to the HDMI/DP ports. This will cause
>>> pulseaudio fail in parsing the pcm devices because the driver will
>>> return -ENODEV in hw_params.
>>>
>>> This patch tries to move the check of monitor presence into trigger
>>> callback. This can "trick" the pulseaudio the pcm is ready.
>>>
>>> This bug is found when we try to enable HDMI detection in
>>> gnome-sound-setting for ASoC hdac_hdmi. After we enable the hdmi in
>>> UCM, pulseaudio will try to parse the hdmi pcm devices. It will cause
>>> failure if there are no monitors connected.
>>
>> I don't like this solution much. PA should use the Jack control to add the
>> devices dynamically and avoid probing when the Jack control is false.
> 
> Before we decided to use UCM, we did some investigation on Jack controls.
> And we found we need do much more changes in driver to support Jack
> Controls. 

How do you handle the dynamic monitor configuration (like when user
disconnects the monitor on-the-fly) then? The control interface can notify the
state change through the Jack controls. The PCM interface does not handle this.

						Jaroslav

> 
> Regards,
> Libin
> 
>>
>> 						Jaroslav
>>
>>>
>>> Signed-off-by: Libin Yang <libin.yang@intel.com>
>>> ---
>>>  sound/soc/codecs/hdac_hdmi.c | 44
>>> +++++++++++++++++++++++++++++++-------------
>>>  1 file changed, 31 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/sound/soc/codecs/hdac_hdmi.c
>>> b/sound/soc/codecs/hdac_hdmi.c index 4de1fbf..f482e09 100644
>>> --- a/sound/soc/codecs/hdac_hdmi.c
>>> +++ b/sound/soc/codecs/hdac_hdmi.c
>>> @@ -455,24 +455,11 @@ static int hdac_hdmi_set_hw_params(struct
>> snd_pcm_substream *substream,
>>>  	struct snd_pcm_hw_params *hparams, struct snd_soc_dai *dai)  {
>>>  	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
>>> -	struct hdac_device *hdev = hdmi->hdev;
>>>  	struct hdac_hdmi_dai_port_map *dai_map;
>>> -	struct hdac_hdmi_port *port;
>>>  	struct hdac_hdmi_pcm *pcm;
>>>  	int format;
>>>
>>>  	dai_map = &hdmi->dai_map[dai->id];
>>> -	port = dai_map->port;
>>> -
>>> -	if (!port)
>>> -		return -ENODEV;
>>> -
>>> -	if ((!port->eld.monitor_present) || (!port->eld.eld_valid)) {
>>> -		dev_err(&hdev->dev,
>>> -			"device is not configured for this pin:port%d:%d\n",
>>> -					port->pin->nid, port->id);
>>> -		return -ENODEV;
>>> -	}
>>>
>>>  	format = snd_hdac_calc_stream_format(params_rate(hparams),
>>>  			params_channels(hparams),
>> params_format(hparams), @@ -630,6
>>> +617,36 @@ static void hdac_hdmi_pcm_close(struct snd_pcm_substream
>> *substream,
>>>  		dai_map->port = NULL;
>>>  }
>>>
>>> +static int hdac_hdmi_pcm_trigger(struct snd_pcm_substream *substream,
>> int cmd,
>>> +				 struct snd_soc_dai *dai)
>>> +{
>>> +	struct hdac_hdmi_port *port;
>>> +	struct hdac_hdmi_dai_port_map *dai_map;
>>> +	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
>>> +	struct hdac_device *hdev = hdmi->hdev;
>>> +
>>> +	/*
>>> +	 * When start, if there is no monitor,
>>> +	 * It should not start audio.
>>> +	 */
>>> +	if (cmd == SNDRV_PCM_TRIGGER_START) {
>>> +		dai_map = &hdmi->dai_map[dai->id];
>>> +		port = dai_map->port;
>>> +
>>> +		if (!port)
>>> +			return -ENODEV;
>>> +
>>> +		if ((!port->eld.monitor_present) || (!port->eld.eld_valid)) {
>>> +			dev_err(&hdev->dev,
>>> +				"device is not configured for this
>> pin:port%d:%d\n",
>>> +				port->pin->nid, port->id);
>>> +			return -ENODEV;
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static int
>>>  hdac_hdmi_query_cvt_params(struct hdac_device *hdev, struct
>>> hdac_hdmi_cvt *cvt)  { @@ -1389,6 +1406,7 @@ static const struct
>>> snd_soc_dai_ops hdmi_dai_ops = {
>>>  	.startup = hdac_hdmi_pcm_open,
>>>  	.shutdown = hdac_hdmi_pcm_close,
>>>  	.hw_params = hdac_hdmi_set_hw_params,
>>> +	.trigger = hdac_hdmi_pcm_trigger,
>>>  	.set_tdm_slot = hdac_hdmi_set_tdm_slot,  };
>>>
>>>
>>
>>
>> --
>> Jaroslav Kysela <perex@perex.cz>
>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
