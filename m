Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD4A14755
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 11:15:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C2541875;
	Mon,  6 May 2019 11:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C2541875
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557134119;
	bh=79e2ZK1uz3bK88B2CvRaPEAo+FL18irKZjpaekWGY/Y=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CTNmvFdYHGBDLU8UTrg5zsSW2qFX3qtFPPQ1jTQIEHzTzwcpHPjefzRsBZSfFtb2C
	 CaKbyDoHqfDX+iRwLivjPmUSGUzfbwcR5BPRllpYqDJnMViJauvRS7Sq3UHPhg0ZtD
	 0uKXoaUHWNV1VI+XHHp/Sgy/tMUirBkh6NP2vO1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BBE0F89673;
	Mon,  6 May 2019 11:13:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1835F89673; Mon,  6 May 2019 11:13:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0745CF80726
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 11:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0745CF80726
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 02:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,437,1549958400"; d="scan'208";a="146737754"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga008.fm.intel.com with ESMTP; 06 May 2019 02:13:24 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 6 May 2019 02:13:23 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.70]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.150]) with mapi id 14.03.0415.000;
 Mon, 6 May 2019 17:13:21 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [alsa-devel] [RFC PATCH] ASoC: codec: hdac_hdmi: no checking
 monitor in hw_params
Thread-Index: AQHVA9v3OuP7ztZrUkauVERTrsPn8qZdOxwAgAAFmACAAIgEYP//fhYAgACG7hA=
Date: Mon, 6 May 2019 09:13:21 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D195283511A@SHSMSX103.ccr.corp.intel.com>
References: <1557125960-29353-1-git-send-email-libin.yang@intel.com>
 <320b97c1-ed3c-6c56-0829-c00d2e475278@perex.cz>
 <s5h1s1c6ko9.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D19528350DE@SHSMSX103.ccr.corp.intel.com>
 <s5hzho0553f.wl-tiwai@suse.de>
In-Reply-To: <s5hzho0553f.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjhhYWYyYWYtZDU2MS00ZDk4LWFlY2QtNjU5MzcyN2RkN2U2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiK1R4WTNldm9CRTA3Nm8zdlwvTERTdU8zNStCUVZxRFBcL1hYZTcwRHRVT3FtdURhcDRaSTlmOTh5OWZmcDJFTlhwIn0=
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Lin,
 Mengdong" <mengdong.lin@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "Wang, Rander" <rander.wang@intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "broonie@kernel.org" <broonie@kernel.org>
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

Hi Takashi,

>-----Original Message-----
>From: Takashi Iwai [mailto:tiwai@suse.de]
>Sent: Monday, May 6, 2019 5:02 PM
>To: Yang, Libin <libin.yang@intel.com>
>Cc: Jaroslav Kysela <perex@perex.cz>; alsa-devel@alsa-project.org; pierre-
>louis.bossart@linux.intel.com; broonie@kernel.org; Lin, Mengdong
><mengdong.lin@intel.com>; Wang, Rander <rander.wang@intel.com>;
>hui.wang@canonical.com
>Subject: Re: [alsa-devel] [RFC PATCH] ASoC: codec: hdac_hdmi: no checking
>monitor in hw_params
>
>On Mon, 06 May 2019 10:56:36 +0200,
>Yang, Libin wrote:
>>
>> Hi Takashi,
>>
>>
>> >-----Original Message-----
>> >From: Takashi Iwai [mailto:tiwai@suse.de]
>> >Sent: Monday, May 6, 2019 4:40 PM
>> >To: Jaroslav Kysela <perex@perex.cz>
>> >Cc: Yang, Libin <libin.yang@intel.com>; alsa-devel@alsa-project.org;
>> >pierre- louis.bossart@linux.intel.com; broonie@kernel.org;
>> >subhransu.s.prusty@intel.com; samreen.nilofer@intel.com
>> >Subject: Re: [alsa-devel] [RFC PATCH] ASoC: codec: hdac_hdmi: no
>> >checking monitor in hw_params
>> >
>> >On Mon, 06 May 2019 10:19:48 +0200,
>> >Jaroslav Kysela wrote:
>> >>
>> >> Dne 06. 05. 19 v 8:59 libin.yang@intel.com napsal(a):
>> >> > From: Libin Yang <libin.yang@intel.com>
>> >> >
>> >> > This patch move the check of monitor from hw_params to trigger
>callback.
>> >> >
>> >> > The original code will check the monitor presence in hw_params.
>> >> > If the monitor doesn't exist, hw_params will return -ENODEV.
>> >> > Mostly this is
>> >OK.
>> >> >
>> >> > However, pulseaudio will check the pcm devices when kernel is booting
>up.
>> >> > It will try to open, set hw_params, prepare such pcm devices. We
>> >> > can't guarantee that the monitor will be connected when kernel is
>> >> > booting
>> >up.
>> >> > Especially, hdac_hdmi will export 3 pcms at most. It's hard to
>> >> > say users will connect 3 monitors to the HDMI/DP ports. This will
>> >> > cause pulseaudio fail in parsing the pcm devices because the
>> >> > driver will return -ENODEV in hw_params.
>> >> >
>> >> > This patch tries to move the check of monitor presence into
>> >> > trigger callback. This can "trick" the pulseaudio the pcm is ready.
>> >> >
>> >> > This bug is found when we try to enable HDMI detection in
>> >> > gnome-sound-setting for ASoC hdac_hdmi. After we enable the hdmi
>> >> > in UCM, pulseaudio will try to parse the hdmi pcm devices. It
>> >> > will cause failure if there are no monitors connected.
>> >>
>> >> I don't like this solution much. PA should use the Jack control to
>> >> add the devices dynamically and avoid probing when the Jack control is
>false.
>> >
>> >Ideally, yes, but this isn't going to happen soon, I'm afraid.  And
>> >we're still responsible for fixing for the existing platforms.  So I
>> >find the proposed patch OK although it's hackish.  The added code in
>> >the trigger has almost no overhead, and it won't break stuff.
>>
>> Yes, this is why we want to use UCM. We need more changes in the
>> driver to use Jack control.
>>
>> I have another question:
>> Is it possible that we remove the monitor detection? I mean just
>> returning ok even there are no monitors?
>>
>> There is one case: playback -> disconnect monitor -> S3.
>> As it will trigger start after S3, my patch will cause playback to
>> exit as it will check the monitors.
>> The original code will not break playback in this case.
>
>This pretty much depends on the driver; the legacy HD-audio has no such
>check.  If it were no monitor connection and a stream is played back, it'll be
>passed to the hardware as-is.

Yes, I refer to legacy HDA driver and wonder if we can remove the check. :)

>
>I don't know why ASoC HD-audio driver has the check, maybe otherwise
>something gets screwed up?  If removing the monitor detection "works"
>(i.e. doesn't give any hiccup in the driver side), it's OK to remove that, of
>course.

I did some test with removing the monitor check, it works well so far.
I will do more tests on removing monitor check tomorrow.

My understanding for the monitor check is that if there is no monitors,
we should not send audio infoframe as there is no sink. But the experiences
show it is OK the audio driver setup the audio infoframe. I believe the
gfx driver or the HW has already handled such situation smoothly.

Regards,
Libin

>
>
>thanks,
>
>Takashi
>
>>
>> Regards,
>> Libin
>>
>> >
>> >
>> >thanks,
>> >
>> >Takashi
>> >
>> >>
>> >> 						Jaroslav
>> >>
>> >> >
>> >> > Signed-off-by: Libin Yang <libin.yang@intel.com>
>> >> > ---
>> >> >  sound/soc/codecs/hdac_hdmi.c | 44
>> >> > +++++++++++++++++++++++++++++++-------------
>> >> >  1 file changed, 31 insertions(+), 13 deletions(-)
>> >> >
>> >> > diff --git a/sound/soc/codecs/hdac_hdmi.c
>> >> > b/sound/soc/codecs/hdac_hdmi.c index 4de1fbf..f482e09 100644
>> >> > --- a/sound/soc/codecs/hdac_hdmi.c
>> >> > +++ b/sound/soc/codecs/hdac_hdmi.c
>> >> > @@ -455,24 +455,11 @@ static int hdac_hdmi_set_hw_params(struct
>> >snd_pcm_substream *substream,
>> >> >  	struct snd_pcm_hw_params *hparams, struct snd_soc_dai *dai)  {
>> >> >  	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
>> >> > -	struct hdac_device *hdev = hdmi->hdev;
>> >> >  	struct hdac_hdmi_dai_port_map *dai_map;
>> >> > -	struct hdac_hdmi_port *port;
>> >> >  	struct hdac_hdmi_pcm *pcm;
>> >> >  	int format;
>> >> >
>> >> >  	dai_map = &hdmi->dai_map[dai->id];
>> >> > -	port = dai_map->port;
>> >> > -
>> >> > -	if (!port)
>> >> > -		return -ENODEV;
>> >> > -
>> >> > -	if ((!port->eld.monitor_present) || (!port->eld.eld_valid)) {
>> >> > -		dev_err(&hdev->dev,
>> >> > -			"device is not configured for this pin:port%d:%d\n",
>> >> > -					port->pin->nid, port->id);
>> >> > -		return -ENODEV;
>> >> > -	}
>> >> >
>> >> >  	format = snd_hdac_calc_stream_format(params_rate(hparams),
>> >> >  			params_channels(hparams),
>> >params_format(hparams), @@ -630,6
>> >> > +617,36 @@ static void hdac_hdmi_pcm_close(struct
>> >> > +snd_pcm_substream
>> >*substream,
>> >> >  		dai_map->port = NULL;
>> >> >  }
>> >> >
>> >> > +static int hdac_hdmi_pcm_trigger(struct snd_pcm_substream
>> >> > +*substream,
>> >int cmd,
>> >> > +				 struct snd_soc_dai *dai)
>> >> > +{
>> >> > +	struct hdac_hdmi_port *port;
>> >> > +	struct hdac_hdmi_dai_port_map *dai_map;
>> >> > +	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
>> >> > +	struct hdac_device *hdev = hdmi->hdev;
>> >> > +
>> >> > +	/*
>> >> > +	 * When start, if there is no monitor,
>> >> > +	 * It should not start audio.
>> >> > +	 */
>> >> > +	if (cmd == SNDRV_PCM_TRIGGER_START) {
>> >> > +		dai_map = &hdmi->dai_map[dai->id];
>> >> > +		port = dai_map->port;
>> >> > +
>> >> > +		if (!port)
>> >> > +			return -ENODEV;
>> >> > +
>> >> > +		if ((!port->eld.monitor_present) || (!port->eld.eld_valid)) {
>> >> > +			dev_err(&hdev->dev,
>> >> > +				"device is not configured for this
>> >pin:port%d:%d\n",
>> >> > +				port->pin->nid, port->id);
>> >> > +			return -ENODEV;
>> >> > +		}
>> >> > +	}
>> >> > +
>> >> > +	return 0;
>> >> > +}
>> >> > +
>> >> >  static int
>> >> >  hdac_hdmi_query_cvt_params(struct hdac_device *hdev, struct
>> >> > hdac_hdmi_cvt *cvt)  { @@ -1389,6 +1406,7 @@ static const struct
>> >> > snd_soc_dai_ops hdmi_dai_ops = {
>> >> >  	.startup = hdac_hdmi_pcm_open,
>> >> >  	.shutdown = hdac_hdmi_pcm_close,
>> >> >  	.hw_params = hdac_hdmi_set_hw_params,
>> >> > +	.trigger = hdac_hdmi_pcm_trigger,
>> >> >  	.set_tdm_slot = hdac_hdmi_set_tdm_slot,  };
>> >> >
>> >> >
>> >>
>> >>
>> >> --
>> >> Jaroslav Kysela <perex@perex.cz>
>> >> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>> >>
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
