Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6914794
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 11:27:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4B7B1852;
	Mon,  6 May 2019 11:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4B7B1852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557134833;
	bh=vnhrv5uPGJnVR/EBHqWsTjOHkhTT2ni88JFzg5mUQvY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DkWJWEbVUlPzVIuzBXBLHRWdk515fnEdCDt0O5WzFPCJq5XCccSF2MvHWdlP/KUYk
	 MqIajViMySzHkyuw9gpOh6a1P9a6IAX6tk7EIytN8JX0iAjri8+ceV+pFlc7NRJZ11
	 r6FlGjNBZBv+MCx7JVUX4dVS4197eOh2b/G55Ats=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62A0DF896F0;
	Mon,  6 May 2019 11:25:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E55ECF89673; Mon,  6 May 2019 11:25:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E53C0F80726
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 11:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E53C0F80726
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 02:25:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,437,1549958400"; d="scan'208";a="321868331"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga005.jf.intel.com with ESMTP; 06 May 2019 02:25:20 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 6 May 2019 02:25:19 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 6 May 2019 02:25:19 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.70]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.249]) with mapi id 14.03.0415.000;
 Mon, 6 May 2019 17:25:16 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: Jaroslav Kysela <perex@perex.cz>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, Hui Wang <hui.wang@canonical.com>
Thread-Topic: [alsa-devel] [RFC PATCH] ASoC: codec: hdac_hdmi: no checking
 monitor in hw_params
Thread-Index: AQHVA9v3OuP7ztZrUkauVERTrsPn8qZdOxwAgACLKdD//4ErAIAAiXYg
Date: Mon, 6 May 2019 09:25:16 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D1952835144@SHSMSX103.ccr.corp.intel.com>
References: <1557125960-29353-1-git-send-email-libin.yang@intel.com>
 <320b97c1-ed3c-6c56-0829-c00d2e475278@perex.cz>
 <96A12704CE18D347B625EE2D4A099D19528350C9@SHSMSX103.ccr.corp.intel.com>
 <30fdd871-e4fa-e8a6-2393-cbc655fce75e@perex.cz>
In-Reply-To: <30fdd871-e4fa-e8a6-2393-cbc655fce75e@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzBiZjY5ZjUtOTAxOC00NWRlLTlmZjctY2ViZmEwYmQxYTZhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMUJ3XC9FMmJPOEVtdXVXQnpOZHdDdG16NTRWS1hYTHFZS3Q3NjFQeDlUKzdWSkk4NUFhOXRVck5OSUZrQUpVTlgifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "tiwai@suse.de" <tiwai@suse.de>, "Lin, Mengdong" <mengdong.lin@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "Wang, Rander" <rander.wang@intel.com>
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

Hi Jaroslav,

>-----Original Message-----
>From: Jaroslav Kysela [mailto:perex@perex.cz]
>Sent: Monday, May 6, 2019 5:04 PM
>To: Yang, Libin <libin.yang@intel.com>; alsa-devel@alsa-project.org
>Cc: tiwai@suse.de; pierre-louis.bossart@linux.intel.com; broonie@kernel.org;
>Hui Wang <hui.wang@canonical.com>; Lin, Mengdong
><mengdong.lin@intel.com>; Wang, Rander <rander.wang@intel.com>
>Subject: Re: [alsa-devel] [RFC PATCH] ASoC: codec: hdac_hdmi: no checking
>monitor in hw_params
>
>Dne 06. 05. 19 v 10:46 Yang, Libin napsal(a):
>> Add Mengdong, Hui, Rander
>>
>> Hi Jaroslav,
>>
>>> -----Original Message-----
>>> From: Jaroslav Kysela [mailto:perex@perex.cz]
>>> Sent: Monday, May 6, 2019 4:20 PM
>>> To: Yang, Libin <libin.yang@intel.com>; alsa-devel@alsa-project.org
>>> Cc: tiwai@suse.de; pierre-louis.bossart@linux.intel.com;
>>> broonie@kernel.org; subhransu.s.prusty@intel.com;
>>> samreen.nilofer@intel.com
>>> Subject: Re: [alsa-devel] [RFC PATCH] ASoC: codec: hdac_hdmi: no
>>> checking monitor in hw_params
>>>
>>> Dne 06. 05. 19 v 8:59 libin.yang@intel.com napsal(a):
>>>> From: Libin Yang <libin.yang@intel.com>
>>>>
>>>> This patch move the check of monitor from hw_params to trigger callback.
>>>>
>>>> The original code will check the monitor presence in hw_params. If
>>>> the monitor doesn't exist, hw_params will return -ENODEV. Mostly this is
>OK.
>>>>
>>>> However, pulseaudio will check the pcm devices when kernel is booting
>up.
>>>> It will try to open, set hw_params, prepare such pcm devices. We
>>>> can't guarantee that the monitor will be connected when kernel is booting
>up.
>>>> Especially, hdac_hdmi will export 3 pcms at most. It's hard to say
>>>> users will connect 3 monitors to the HDMI/DP ports. This will cause
>>>> pulseaudio fail in parsing the pcm devices because the driver will
>>>> return -ENODEV in hw_params.
>>>>
>>>> This patch tries to move the check of monitor presence into trigger
>>>> callback. This can "trick" the pulseaudio the pcm is ready.
>>>>
>>>> This bug is found when we try to enable HDMI detection in
>>>> gnome-sound-setting for ASoC hdac_hdmi. After we enable the hdmi in
>>>> UCM, pulseaudio will try to parse the hdmi pcm devices. It will
>>>> cause failure if there are no monitors connected.
>>>
>>> I don't like this solution much. PA should use the Jack control to
>>> add the devices dynamically and avoid probing when the Jack control is
>false.
>>
>> Before we decided to use UCM, we did some investigation on Jack controls.
>> And we found we need do much more changes in driver to support Jack
>> Controls.
>
>How do you handle the dynamic monitor configuration (like when user
>disconnects the monitor on-the-fly) then? The control interface can notify the
>state change through the Jack controls. The PCM interface does not handle
>this.

We may still need Jack control for this case. This is my second plan to enable
Jack control. But even we enable Jack control, it seems it is still easy to use UCM.
This is because ASoC control names don't follow legacy HDA rule. This means
we may need to change other controls name besides HDMI in the driver or we 
may need to add more configures in pulseaudio/alsa-mixer/paths.

Hi Mengdong & Hui,

Do you have more comments for Jack control or UCM?

Regards,
Libin

>
>						Jaroslav
>
>>
>> Regards,
>> Libin
>>
>>>
>>> 						Jaroslav
>>>
>>>>
>>>> Signed-off-by: Libin Yang <libin.yang@intel.com>
>>>> ---
>>>>  sound/soc/codecs/hdac_hdmi.c | 44
>>>> +++++++++++++++++++++++++++++++-------------
>>>>  1 file changed, 31 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/sound/soc/codecs/hdac_hdmi.c
>>>> b/sound/soc/codecs/hdac_hdmi.c index 4de1fbf..f482e09 100644
>>>> --- a/sound/soc/codecs/hdac_hdmi.c
>>>> +++ b/sound/soc/codecs/hdac_hdmi.c
>>>> @@ -455,24 +455,11 @@ static int hdac_hdmi_set_hw_params(struct
>>> snd_pcm_substream *substream,
>>>>  	struct snd_pcm_hw_params *hparams, struct snd_soc_dai *dai)  {
>>>>  	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
>>>> -	struct hdac_device *hdev = hdmi->hdev;
>>>>  	struct hdac_hdmi_dai_port_map *dai_map;
>>>> -	struct hdac_hdmi_port *port;
>>>>  	struct hdac_hdmi_pcm *pcm;
>>>>  	int format;
>>>>
>>>>  	dai_map = &hdmi->dai_map[dai->id];
>>>> -	port = dai_map->port;
>>>> -
>>>> -	if (!port)
>>>> -		return -ENODEV;
>>>> -
>>>> -	if ((!port->eld.monitor_present) || (!port->eld.eld_valid)) {
>>>> -		dev_err(&hdev->dev,
>>>> -			"device is not configured for this pin:port%d:%d\n",
>>>> -					port->pin->nid, port->id);
>>>> -		return -ENODEV;
>>>> -	}
>>>>
>>>>  	format = snd_hdac_calc_stream_format(params_rate(hparams),
>>>>  			params_channels(hparams),
>>> params_format(hparams), @@ -630,6
>>>> +617,36 @@ static void hdac_hdmi_pcm_close(struct
>snd_pcm_substream
>>> *substream,
>>>>  		dai_map->port = NULL;
>>>>  }
>>>>
>>>> +static int hdac_hdmi_pcm_trigger(struct snd_pcm_substream
>>>> +*substream,
>>> int cmd,
>>>> +				 struct snd_soc_dai *dai)
>>>> +{
>>>> +	struct hdac_hdmi_port *port;
>>>> +	struct hdac_hdmi_dai_port_map *dai_map;
>>>> +	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
>>>> +	struct hdac_device *hdev = hdmi->hdev;
>>>> +
>>>> +	/*
>>>> +	 * When start, if there is no monitor,
>>>> +	 * It should not start audio.
>>>> +	 */
>>>> +	if (cmd == SNDRV_PCM_TRIGGER_START) {
>>>> +		dai_map = &hdmi->dai_map[dai->id];
>>>> +		port = dai_map->port;
>>>> +
>>>> +		if (!port)
>>>> +			return -ENODEV;
>>>> +
>>>> +		if ((!port->eld.monitor_present) || (!port->eld.eld_valid)) {
>>>> +			dev_err(&hdev->dev,
>>>> +				"device is not configured for this
>>> pin:port%d:%d\n",
>>>> +				port->pin->nid, port->id);
>>>> +			return -ENODEV;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static int
>>>>  hdac_hdmi_query_cvt_params(struct hdac_device *hdev, struct
>>>> hdac_hdmi_cvt *cvt)  { @@ -1389,6 +1406,7 @@ static const struct
>>>> snd_soc_dai_ops hdmi_dai_ops = {
>>>>  	.startup = hdac_hdmi_pcm_open,
>>>>  	.shutdown = hdac_hdmi_pcm_close,
>>>>  	.hw_params = hdac_hdmi_set_hw_params,
>>>> +	.trigger = hdac_hdmi_pcm_trigger,
>>>>  	.set_tdm_slot = hdac_hdmi_set_tdm_slot,  };
>>>>
>>>>
>>>
>>>
>>> --
>>> Jaroslav Kysela <perex@perex.cz>
>>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>
>
>--
>Jaroslav Kysela <perex@perex.cz>
>Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
