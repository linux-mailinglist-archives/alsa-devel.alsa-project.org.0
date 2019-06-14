Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF13456F0
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 10:06:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A755D1853;
	Fri, 14 Jun 2019 10:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A755D1853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560499574;
	bh=r9u3Yo8TKubHFLgqU6So4ovawS/1kRwaHLSXRRvpC6Y=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PhGSR1bULdQ+hUeziBGEV7NMdnMb+/8jrpAf7ZNZjRsJqCAX8FhEYyxHDlH6pDB0V
	 Xszdj4rOC/cT36SZIGC9rWQt9Napd8yR2nHIpXsFaD801lJHnPlr1BAVzXMX6Tk0Lv
	 +XhxSPHWrbIF2R6q+NvfXpHWMyReIYzThfZNAGWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00437F896E0;
	Fri, 14 Jun 2019 10:04:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 602B4F896E0; Fri, 14 Jun 2019 10:04:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4032BF8076F
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 10:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4032BF8076F
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 01:04:19 -0700
X-ExtLoop1: 1
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2019 01:04:19 -0700
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 14 Jun 2019 01:04:18 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx158.amr.corp.intel.com (10.18.116.75) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 14 Jun 2019 01:04:18 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.83]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.173]) with mapi id 14.03.0439.000;
 Fri, 14 Jun 2019 16:04:16 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: 'Takashi Iwai' <tiwai@suse.de>
Thread-Topic: [alsa-devel] [RFC PATCH 3/4] ASoC: hdac_hdmi: refine hdmi jacks
Thread-Index: AQHVFG5wpg37HjgRpkesT50Q0sKADaaCv0uAgADqFbD//56WAIABPtqwgBZdwWA=
Date: Fri, 14 Jun 2019 08:04:15 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D195289BC7B@SHSMSX103.ccr.corp.intel.com>
References: <1558948047-18930-1-git-send-email-libin.yang@intel.com>
 <1558948047-18930-4-git-send-email-libin.yang@intel.com>
 <s5hftowv2ii.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D195285809B@SHSMSX103.ccr.corp.intel.com>
 <s5hsgswt1at.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D19528582FD@SHSMSX103.ccr.corp.intel.com>
In-Reply-To: <96A12704CE18D347B625EE2D4A099D19528582FD@SHSMSX103.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjAwNDc1NTMtZTczYi00OTY0LWJlNWYtYjFlOGE1NzRiMzFkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUkNTck5EV1lqUUFcL1JYckpmR3ZrRmxORmFOZkhwRWV6eUdVTmJwYlhpMmVteEpiOWlPdVRmWTRpbXhMc1wvbnFTIn0=
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: multipart/mixed;
 boundary="_002_96A12704CE18D347B625EE2D4A099D195289BC7BSHSMSX103ccrcor_"
MIME-Version: 1.0
Cc: "'alsa-devel@alsa-project.org'" <alsa-devel@alsa-project.org>,
 "'broonie@kernel.org'" <broonie@kernel.org>,
 "'pierre-louis.bossart@linux.intel.com'"
 <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 3/4] ASoC: hdac_hdmi: refine hdmi jacks
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

--_002_96A12704CE18D347B625EE2D4A099D195289BC7BSHSMSX103ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Sorry for a long delay for the hdmi jacks. I was busy on another critical i=
ssue
last 2 weeks. I have worked out the UCM configuration files. Please check t=
he=20
attachment. It is a long file, so I use the attachment instead of the patch=
 mode.
Based on my test, it works well. Could you please help review if the config=
uration
file is OK or not. I will do more test on the meantime, including DPMST and
NON-DPMST.

Regards,
Libin


>-----Original Message-----
>From: Yang, Libin
>Sent: Friday, May 31, 2019 10:27 AM
>To: Takashi Iwai <tiwai@suse.de>
>Cc: alsa-devel@alsa-project.org; broonie@kernel.org; pierre-
>louis.bossart@linux.intel.com
>Subject: RE: [alsa-devel] [RFC PATCH 3/4] ASoC: hdac_hdmi: refine hdmi jac=
ks
>
>Hi Takashi,
>
>>
>>On Thu, 30 May 2019 17:00:24 +0200,
>>Yang, Libin wrote:
>>>
>>> Hi Takashi,
>>>
>>> >-----Original Message-----
>>> >From: Takashi Iwai [mailto:tiwai@suse.de]
>>> >Sent: Thursday, May 30, 2019 3:13 PM
>>> >To: Yang, Libin <libin.yang@intel.com>
>>> >Cc: alsa-devel@alsa-project.org; broonie@kernel.org; pierre-
>>> >louis.bossart@linux.intel.com
>>> >Subject: Re: [alsa-devel] [RFC PATCH 3/4] ASoC: hdac_hdmi: refine
>>> >hdmi jacks
>>> >
>>> >On Mon, 27 May 2019 11:07:26 +0200,
>>> >libin.yang@intel.com wrote:
>>> >>
>>> >> From: Libin Yang <libin.yang@intel.com>
>>> >>
>>> >> This patch does the following actions:
>>> >> 1) move snd_soc_card_jack_new() from machine driver to codec driver.
>>> >>    This is because the jack information is more lated to the codec
>>> >>    Also this patch calls snd_jack_add_new_kctl() to export the jack =
kctl
>>> >>    to userspace.
>>> >>
>>> >> 2) jack is bound to pcm in origal code. The patch binds jack to pin-=
port.
>>> >>    This mean each pin-port (3x3) has a jack. pin-port is used for DP=
-MST
>>> >>    mode. The port means device entry for DP-MST in hdac_hdmi
>>> >>    As hdac_hdmi allows user to map the pin-port to a pcm manually,
>>> >> the
>>jack
>>> >>    is bound to pcm is not accurate.
>>> >>    However, PA assumes jack is bound to PCM for the legacy mode.
>>> >>    For example, for ubuntu, in
>>> >>    /usr/share/pulseaudio/alsa-mixer/paths/hdmi-output-x.conf uses
>>> >>    "Jack HDMI/DP,pcm=3Dn" to find which jack event is used.
>>> >>    This main issue is: pcm number is fixed (3, 7, 8, 9, 10) for hdmi=
 in
>>> >>    legacy mode. But it is not always the same for ASoC hdmi audio.
>>> >
>>> >The question is what brings this change practically.  On the legacy
>>> >driver, as the jack is bound with the PCM, user-space (typically PA)
>>> >who receives a jack connection event opens simply the corresponding
>>> >PCM substream.  Now, for
>>> >ASoC:
>>> >  1. Which PCM substream?
>>> >  2. How to set up the routing?
>>> >
>>> >I assume the 1 doens't matter, any substream, unlike the legacy case.
>>> >But how is 2 done automatically?
>>>
>>> For the legacy HDA, there are 2 mode (dynamic pcm assignment (DPMST)
>>> and static pcm assignment (NON-DPMST)).
>>> 1) For static pcm assignment, pcm is always statically mapped to pin.
>>> For example, pcm1 <=3D> pin 1; pcm <=3D> pin 2 and so on. So it is the
>>> same to bind jack to pcm or to pin.
>>> 2) For dynamic pcm assignment, in generic_hdmi_build_jack(), the jack
>>> is bound to PCM when it is created (spec->pcm_rec[pcm_idx].jack). We
>>> will find the jack by pcm_idx. And when monitor is connected to a
>>> pin,
>>> update_eld() will be called. In update_eld(), it will call
>>> hdmi_attach_hda_pcm() to find a pcm to bind to the pin. So it can
>>> find a jack (from the pcm) and report its status to userspace.
>>>
>>> So in a word for legacy HDA, it can always find a PCM (no matter in
>>> static mode or in dynamic mode) when the monitor is connected to a
>>> pin. This means it can always update the status of to userspace that
>>> the pcm status is changed.
>>
>>Right, that's why the jack control has a pcm suffix.  It is bound with
>>the PCM stream in the end, so user-space can simply open it.
>>
>>> However, in hdac_hdmi, there is no such dynamic pcm assignment. And
>>> it is not statically assignment of pcm to pin. PCM is statically bound =
to cvt.
>>> hdac_hdmi allows user to assign a cvt to a pin with alsamixer ( in
>>> function hdac_hdmi_set_pin_port_mux(), so this function maps the pin
>>> to
>>the pcm).
>>> As user may assign NONE pcm to a pin in alsamixer, this means a pin
>>> can be assigned none of pcms. So if we mapped jack to pcm, we may not
>>> find any jack for the pin when a monitor is connected to the pin.
>>> This means driver can't notify userspace of the monitor connection.
>>> As you know, PA will use the monitor connection status to decide
>>> whether to user it or not. So this is the problem. The root cause is
>>> pcm is bound to cvt. And pin may be not bound to any pcm (This is the
>>> difference from the legacy hda).
>>>
>>> In my patch, as jack is bound to pin-port, so it can always notify
>>> userspace that a monitor is connected. We can use configuration in
>>> /usr/share/alsa/ ucm or /usr/share/pulseaudio to configure the amixer
>>> to assign a pcm to the pin (monitor). And userspace can playback on
>>> the
>>monitor now.
>>
>>Then please prepare the UCM stuff at first and make sure that
>>everything works with the proposed change.  The kernel changes can be
>>merged once after all things get ready.
>
>OK. I will prepare the UCM and PA configurations to check it works well an=
d
>the purpose is patch should be compatible with the old drivers.
>
>Regards,
>Libin
>
>>
>>
>>thanks,
>>
>>Takashi
>>
>>>
>>> Regards,
>>> Libin
>>>
>>> >
>>> >
>>> >thanks,
>>> >
>>> >Takashi
>>> >
>>> >>
>>> >> Signed-off-by: Libin Yang <libin.yang@intel.com>
>>> >> ---
>>> >>  sound/soc/codecs/hdac_hdmi.c                       | 127 ++++++++++=
++---------
>>> >>  sound/soc/intel/boards/bxt_da7219_max98357a.c      |  10 --
>>> >>  sound/soc/intel/boards/bxt_rt298.c                 |  10 --
>>> >>  sound/soc/intel/boards/glk_rt5682_max98357a.c      |  10 --
>>> >>  sound/soc/intel/boards/kbl_da7219_max98357a.c      |  10 --
>>> >>  sound/soc/intel/boards/kbl_da7219_max98927.c       |  10 --
>>> >>  sound/soc/intel/boards/kbl_rt5660.c                |  10 --
>>> >>  sound/soc/intel/boards/kbl_rt5663_max98927.c       |  10 --
>>> >>  .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |   9 --
>>> >>  sound/soc/intel/boards/skl_hda_dsp_common.c        |   9 --
>>> >>  sound/soc/intel/boards/skl_nau88l25_max98357a.c    |  11 --
>>> >>  sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |  11 --
>>> >>  sound/soc/intel/boards/skl_rt286.c                 |  10 --
>>> >>  sound/soc/intel/boards/sof_rt5682.c                |  11 --
>>> >>  14 files changed, 74 insertions(+), 184 deletions(-)
>>> >>
>>> >> diff --git a/sound/soc/codecs/hdac_hdmi.c
>>> >> b/sound/soc/codecs/hdac_hdmi.c index 90c2ee3..ed267fa 100644
>>> >> --- a/sound/soc/codecs/hdac_hdmi.c
>>> >> +++ b/sound/soc/codecs/hdac_hdmi.c
>>> >> @@ -4,6 +4,7 @@
>>> >>   *  Copyright (C) 2014-2015 Intel Corp
>>> >>   *  Author: Samreen Nilofer <samreen.nilofer@intel.com>
>>> >>   *	    Subhransu S. Prusty <subhransu.s.prusty@intel.com>
>>> >> + *	    Libin Yang <libin.yang@intel.com>
>>> >>   *
>>> >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>~
>>~~~
>>> >~~~~~~~~~
>>> >>   *
>>> >>   *  This program is free software; you can redistribute it and/or
>>> >> modify @@ -30,6 +31,7 @@  #include <sound/hda_i915.h>  #include
>>> >> <sound/pcm_drm_eld.h>  #include <sound/hda_chmap.h>
>>> >> +#include <sound/hda_codec.h>
>>> >>  #include "../../hda/local.h"
>>> >>  #include "hdac_hdmi.h"
>>> >>
>>> >> @@ -95,6 +97,8 @@ struct hdac_hdmi_port {
>>> >>  	int num_mux_nids;
>>> >>  	hda_nid_t mux_nids[HDA_MAX_CONNECTIONS];
>>> >>  	struct hdac_hdmi_eld eld;
>>> >> +	struct snd_soc_jack jack;
>>> >> +	int jack_event;
>>> >>  	const char *jack_pin;
>>> >>  	struct snd_soc_dapm_context *dapm;
>>> >>  	const char *output_pin;
>>> >> @@ -105,14 +109,12 @@ struct hdac_hdmi_pcm {
>>> >>  	int pcm_id;
>>> >>  	struct list_head port_list;
>>> >>  	struct hdac_hdmi_cvt *cvt;
>>> >> -	struct snd_soc_jack *jack;
>>> >>  	int stream_tag;
>>> >>  	int channels;
>>> >>  	int format;
>>> >>  	bool chmap_set;
>>> >>  	unsigned char chmap[8]; /* ALSA API channel-map */
>>> >>  	struct mutex lock;
>>> >> -	int jack_event;
>>> >>  };
>>> >>
>>> >>  struct hdac_hdmi_dai_port_map {
>>> >> @@ -166,8 +168,7 @@ hdac_hdmi_get_pcm_from_cvt(struct
>>> >hdac_hdmi_priv *hdmi,
>>> >>  	return pcm;
>>> >>  }
>>> >>
>>> >> -static void hdac_hdmi_jack_report(struct hdac_hdmi_pcm *pcm,
>>> >> -		struct hdac_hdmi_port *port, bool is_connect)
>>> >> +static void hdac_hdmi_jack_report(struct hdac_hdmi_port *port,
>>> >> +bool
>>> >> +is_connect)
>>> >>  {
>>> >>  	struct hdac_device *hdev =3D port->pin->hdev;
>>> >>
>>> >> @@ -176,19 +177,25 @@ static void hdac_hdmi_jack_report(struct
>>> >hdac_hdmi_pcm *pcm,
>>> >>  	else
>>> >>  		snd_soc_dapm_disable_pin(port->dapm, port->jack_pin);
>>> >>
>>> >> +	/* if jack is not ready, skip reporting jack status */
>>> >> +	if (!port->jack.jack) {
>>> >> +		snd_soc_dapm_sync(port->dapm);
>>> >> +		return;
>>> >> +	}
>>> >> +
>>> >>  	if (is_connect) {
>>> >> -		if (pcm->jack_event =3D=3D 0) {
>>> >> +		if (port->jack_event =3D=3D 0) {
>>> >>  			dev_dbg(&hdev->dev,
>>> >> -					"jack report for pcm=3D%d\n",
>>> >> -					pcm->pcm_id);
>>> >> -			snd_soc_jack_report(pcm->jack, SND_JACK_AVOUT,
>>> >> -						SND_JACK_AVOUT);
>>> >> +				"jack report for pin:port =3D %d:%d\n",
>>> >> +				port->id, port->pin->nid);
>>> >> +			snd_soc_jack_report(&port->jack, SND_JACK_AVOUT,
>>> >> +					    SND_JACK_AVOUT);
>>> >>  		}
>>> >> -		pcm->jack_event =3D 1;
>>> >> +		port->jack_event =3D 1;
>>> >>  	} else {
>>> >> -		if (pcm->jack_event =3D=3D 1)
>>> >> -			snd_soc_jack_report(pcm->jack, 0, SND_JACK_AVOUT);
>>> >> -		pcm->jack_event =3D 0;
>>> >> +		if (port->jack_event =3D=3D 1)
>>> >> +			snd_soc_jack_report(&port->jack, 0,
>>> >SND_JACK_AVOUT);
>>> >> +		port->jack_event =3D 0;
>>> >>  	}
>>> >>
>>> >>  	snd_soc_dapm_sync(port->dapm);
>>> >> @@ -1235,26 +1242,15 @@ static void
>hdac_hdmi_present_sense(struct
>>> >hdac_hdmi_pin *pin,
>>> >>  	pcm =3D hdac_hdmi_get_pcm(hdev, port);
>>> >>
>>> >>  	if (!port->eld.monitor_present || !port->eld.eld_valid) {
>>> >> -
>>> >>  		dev_err(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
>>> >>  						__func__, pin->nid, port->id);
>>> >> -
>>> >> -		/*
>>> >> -		 * PCMs are not registered during device probe, so don't
>>> >> -		 * report jack here. It will be done in usermode mux
>>> >> -		 * control select.
>>> >> -		 */
>>> >> -		if (pcm)
>>> >> -			hdac_hdmi_jack_report(pcm, port, false);
>>> >> -
>>> >> +		hdac_hdmi_jack_report(port, false);
>>> >>  		mutex_unlock(&hdmi->pin_mutex);
>>> >>  		return;
>>> >>  	}
>>> >>
>>> >>  	if (port->eld.monitor_present && port->eld.eld_valid) {
>>> >> -		if (pcm)
>>> >> -			hdac_hdmi_jack_report(pcm, port, true);
>>> >> -
>>> >> +		hdac_hdmi_jack_report(port, true);
>>> >>  		print_hex_dump_debug("ELD: ", DUMP_PREFIX_OFFSET, 16, 1,
>>> >>  			  port->eld.eld_buffer, port->eld.eld_size, false);
>>> >>
>>> >> @@ -1650,6 +1646,30 @@ static int
>>> >> create_fill_jack_kcontrols(struct
>>> >snd_soc_card *card,
>>> >>  	return snd_soc_add_card_controls(card, kc, i);  }
>>> >>
>>> >> +static void hdac_hdmi_present_sense_all_pins(struct hdac_device
>>*hdev,
>>> >> +			struct hdac_hdmi_priv *hdmi, bool detect_pin_caps) {
>>> >> +	int i;
>>> >> +	struct hdac_hdmi_pin *pin;
>>> >> +
>>> >> +	list_for_each_entry(pin, &hdmi->pin_list, head) {
>>> >> +		if (detect_pin_caps) {
>>> >> +
>>> >> +			if (hdac_hdmi_get_port_len(hdev, pin->nid)  =3D=3D 0)
>>> >> +				pin->mst_capable =3D false;
>>> >> +			else
>>> >> +				pin->mst_capable =3D true;
>>> >> +		}
>>> >> +
>>> >> +		for (i =3D 0; i < pin->num_ports; i++) {
>>> >> +			if (!pin->mst_capable && i > 0)
>>> >> +				continue;
>>> >> +
>>> >> +			hdac_hdmi_present_sense(pin, &pin->ports[i]);
>>> >> +		}
>>> >> +	}
>>> >> +}
>>> >> +
>>> >>  int hdac_hdmi_jack_port_init(struct snd_soc_component *component,
>>> >>  			struct snd_soc_dapm_context *dapm)  { @@ -1659,6
>>> >+1679,7 @@ int
>>> >> hdac_hdmi_jack_port_init(struct snd_soc_component *component,
>>> >>  	struct snd_soc_dapm_widget *widgets;
>>> >>  	struct snd_soc_dapm_route *route;
>>> >>  	char w_name[NAME_SIZE];
>>> >> +	char jack_name[NAME_SIZE];
>>> >>  	int i =3D 0, j, ret;
>>> >>
>>> >>  	widgets =3D devm_kcalloc(dapm->dev, hdmi->num_ports, @@ -1687,6
>>> >> +1708,30 @@ int hdac_hdmi_jack_port_init(struct snd_soc_component
>>> >*component,
>>> >>  			pin->ports[j].jack_pin =3D widgets[i].name;
>>> >>  			pin->ports[j].dapm =3D dapm;
>>> >>
>>> >> +			/*
>>> >> +			 * Create pin-port jack. Each port (device entry) of
>>> >> +			 * the pin has a corresponding jack
>>> >> +			 */
>>> >> +			snprintf(jack_name, sizeof(jack_name),
>>> >> +				 "HDMI/DP, pin:port=3D%d:%d Jack",
>>> >> +				  pin->nid, pin->ports[j].id);
>>> >> +			ret =3D snd_soc_card_jack_new(dapm->card, jack_name,
>>> >> +						    SND_JACK_AVOUT,
>>> >> +						    &(pin->ports[j].jack),
>>> >> +						    NULL, 0);
>>> >> +			if (ret)
>>> >> +				return ret;
>>> >> +
>>> >> +			/* create the jack kctl */
>>> >> +			ret =3D snd_jack_add_new_kctl(pin->ports[j].jack.jack,
>>> >> +						    jack_name,
>>> >SND_JACK_AVOUT);
>>> >> +			/*
>>> >> +			 * It's not a critical issue if driver fails to
>>> >> +			 * create jack kctl.
>>> >> +			 */
>>> >> +			if (ret)
>>> >> +				dev_warn(&hdev->dev, "failed creating Jack
>>> >kctl\n");
>>> >> +
>>> >>  			/* add to route from Jack widget to output */
>>> >>  			hdac_hdmi_fill_route(&route[i], pin->ports[j].jack_pin,
>>> >>  					NULL, pin->ports[j].output_pin, NULL);
>>> >@@ -1695,6 +1740,9 @@ int
>>> >> hdac_hdmi_jack_port_init(struct snd_soc_component *component,
>>> >>  		}
>>> >>  	}
>>> >>
>>> >> +	/* now jack is ready, let's update the status */
>>> >> +	hdac_hdmi_present_sense_all_pins(hdev, hdmi, true);
>>> >> +
>>> >>  	/* Add Route from Jack widget to the output widget */
>>> >>  	ret =3D snd_soc_dapm_new_controls(dapm, widgets, hdmi- num_ports);
>>> >>  	if (ret < 0)
>>> >> @@ -1744,8 +1792,6 @@ int hdac_hdmi_jack_init(struct snd_soc_dai
>>> >>*dai,
>>> >int device,
>>> >>  		return -ENOMEM;
>>> >>  	pcm->pcm_id =3D device;
>>> >>  	pcm->cvt =3D hdmi->dai_map[dai->id].cvt;
>>> >> -	pcm->jack_event =3D 0;
>>> >> -	pcm->jack =3D jack;
>>> >>  	mutex_init(&pcm->lock);
>>> >>  	INIT_LIST_HEAD(&pcm->port_list);
>>> >>  	snd_pcm =3D hdac_hdmi_get_pcm_from_id(dai->component->card,
>>> >device);
>>> >> @@ -1765,30 +1811,6 @@ int hdac_hdmi_jack_init(struct snd_soc_dai
>>> >> *dai, int device,  }  EXPORT_SYMBOL_GPL(hdac_hdmi_jack_init);
>>> >>
>>> >> -static void hdac_hdmi_present_sense_all_pins(struct hdac_device
>*hdev,
>>> >> -			struct hdac_hdmi_priv *hdmi, bool detect_pin_caps)
>>> >> -{
>>> >> -	int i;
>>> >> -	struct hdac_hdmi_pin *pin;
>>> >> -
>>> >> -	list_for_each_entry(pin, &hdmi->pin_list, head) {
>>> >> -		if (detect_pin_caps) {
>>> >> -
>>> >> -			if (hdac_hdmi_get_port_len(hdev, pin->nid)  =3D=3D 0)
>>> >> -				pin->mst_capable =3D false;
>>> >> -			else
>>> >> -				pin->mst_capable =3D true;
>>> >> -		}
>>> >> -
>>> >> -		for (i =3D 0; i < pin->num_ports; i++) {
>>> >> -			if (!pin->mst_capable && i > 0)
>>> >> -				continue;
>>> >> -
>>> >> -			hdac_hdmi_present_sense(pin, &pin->ports[i]);
>>> >> -		}
>>> >> -	}
>>> >> -}
>>> >> -
>>> >>  static int hdmi_codec_probe(struct snd_soc_component *component)
>{
>>> >>  	struct hdac_hdmi_priv *hdmi =3D
>>> >> snd_soc_component_get_drvdata(component);
>>> >> @@ -1823,7 +1845,6 @@ static int hdmi_codec_probe(struct
>>> >snd_soc_component *component)
>>> >>  		return ret;
>>> >>  	}
>>> >>
>>> >> -	hdac_hdmi_present_sense_all_pins(hdev, hdmi, true);
>>> >>  	/* Imp: Store the card pointer in hda_codec */
>>> >>  	hdmi->card =3D dapm->card->snd_card;
>>> >>
>>> >> diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c
>>> >> b/sound/soc/intel/boards/bxt_da7219_max98357a.c
>>> >> index 5cadb7f..c69cfa9 100644
>>> >> --- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
>>> >> +++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
>>> >> @@ -573,14 +573,12 @@ static const struct x86_cpu_id glk_ids[] =3D {
>>> >>  	{}
>>> >>  };
>>> >>
>>> >> -#define NAME_SIZE	32
>>> >>  static int bxt_card_late_probe(struct snd_soc_card *card)  {
>>> >>  	struct bxt_card_private *ctx =3D snd_soc_card_get_drvdata(card);
>>> >>  	struct bxt_hdmi_pcm *pcm;
>>> >>  	struct snd_soc_component *component =3D NULL;
>>> >>  	int err, i =3D 0;
>>> >> -	char jack_name[NAME_SIZE];
>>> >>
>>> >>  	if (x86_match_cpu(glk_ids))
>>> >>  		snd_soc_dapm_add_routes(&card->dapm, gemini_map, @@
>>> >-591,14 +589,6
>>> >> @@ static int bxt_card_late_probe(struct snd_soc_card *card)
>>> >>
>>> >>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>> >>  		component =3D pcm->codec_dai->component;
>>> >> -		snprintf(jack_name, sizeof(jack_name),
>>> >> -			"HDMI/DP, pcm=3D%d Jack", pcm->device);
>>> >> -		err =3D snd_soc_card_jack_new(card, jack_name,
>>> >> -					SND_JACK_AVOUT, &broxton_hdmi[i],
>>> >> -					NULL, 0);
>>> >> -
>>> >> -		if (err)
>>> >> -			return err;
>>> >>
>>> >>  		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>> >>  						&broxton_hdmi[i]);
>>> >> diff --git a/sound/soc/intel/boards/bxt_rt298.c
>>> >> b/sound/soc/intel/boards/bxt_rt298.c
>>> >> index e91057f..d1372891 100644
>>> >> --- a/sound/soc/intel/boards/bxt_rt298.c
>>> >> +++ b/sound/soc/intel/boards/bxt_rt298.c
>>> >> @@ -507,25 +507,15 @@ static struct snd_soc_dai_link
>>> >> broxton_rt298_dais[]
>>> >=3D {
>>> >>  	},
>>> >>  };
>>> >>
>>> >> -#define NAME_SIZE	32
>>> >>  static int bxt_card_late_probe(struct snd_soc_card *card)  {
>>> >>  	struct bxt_rt286_private *ctx =3D snd_soc_card_get_drvdata(card);
>>> >>  	struct bxt_hdmi_pcm *pcm;
>>> >>  	struct snd_soc_component *component =3D NULL;
>>> >>  	int err, i =3D 0;
>>> >> -	char jack_name[NAME_SIZE];
>>> >>
>>> >>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>> >>  		component =3D pcm->codec_dai->component;
>>> >> -		snprintf(jack_name, sizeof(jack_name),
>>> >> -			"HDMI/DP, pcm=3D%d Jack", pcm->device);
>>> >> -		err =3D snd_soc_card_jack_new(card, jack_name,
>>> >> -					SND_JACK_AVOUT, &broxton_hdmi[i],
>>> >> -					NULL, 0);
>>> >> -
>>> >> -		if (err)
>>> >> -			return err;
>>> >>
>>> >>  		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>> >>  						&broxton_hdmi[i]);
>>> >> diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c
>>> >> b/sound/soc/intel/boards/glk_rt5682_max98357a.c
>>> >> index d17126f..2a35974 100644
>>> >> --- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
>>> >> +++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
>>> >> @@ -29,7 +29,6 @@
>>> >>  #define MAXIM_DEV0_NAME "MX98357A:00"
>>> >>  #define DUAL_CHANNEL 2
>>> >>  #define QUAD_CHANNEL 4
>>> >> -#define NAME_SIZE 32
>>> >>
>>> >>  static struct snd_soc_jack geminilake_hdmi[3];
>>> >>
>>> >> @@ -523,21 +522,12 @@ static int glk_card_late_probe(struct
>>> >> snd_soc_card *card)  {
>>> >>  	struct glk_card_private *ctx =3D snd_soc_card_get_drvdata(card);
>>> >>  	struct snd_soc_component *component =3D NULL;
>>> >> -	char jack_name[NAME_SIZE];
>>> >>  	struct glk_hdmi_pcm *pcm;
>>> >>  	int err =3D 0;
>>> >>  	int i =3D 0;
>>> >>
>>> >>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>> >>  		component =3D pcm->codec_dai->component;
>>> >> -		snprintf(jack_name, sizeof(jack_name),
>>> >> -			"HDMI/DP, pcm=3D%d Jack", pcm->device);
>>> >> -		err =3D snd_soc_card_jack_new(card, jack_name,
>>> >> -					SND_JACK_AVOUT,
>>> >&geminilake_hdmi[i],
>>> >> -					NULL, 0);
>>> >> -
>>> >> -		if (err)
>>> >> -			return err;
>>> >>
>>> >>  		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>> >>  						&geminilake_hdmi[i]);
>>> >> diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c
>>> >> b/sound/soc/intel/boards/kbl_da7219_max98357a.c
>>> >> index 07491a0..f293307 100644
>>> >> --- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
>>> >> +++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
>>> >> @@ -519,25 +519,15 @@ static struct snd_soc_dai_link
>>> >> kabylake_dais[] =3D
>>{
>>> >>  	},
>>> >>  };
>>> >>
>>> >> -#define NAME_SIZE	32
>>> >>  static int kabylake_card_late_probe(struct snd_soc_card *card)  {
>>> >>  	struct kbl_codec_private *ctx =3D snd_soc_card_get_drvdata(card);
>>> >>  	struct kbl_hdmi_pcm *pcm;
>>> >>  	struct snd_soc_component *component =3D NULL;
>>> >>  	int err, i =3D 0;
>>> >> -	char jack_name[NAME_SIZE];
>>> >>
>>> >>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>> >>  		component =3D pcm->codec_dai->component;
>>> >> -		snprintf(jack_name, sizeof(jack_name),
>>> >> -			"HDMI/DP, pcm=3D%d Jack", pcm->device);
>>> >> -		err =3D snd_soc_card_jack_new(card, jack_name,
>>> >> -					SND_JACK_AVOUT, &skylake_hdmi[i],
>>> >> -					NULL, 0);
>>> >> -
>>> >> -		if (err)
>>> >> -			return err;
>>> >>
>>> >>  		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>> >>  				&skylake_hdmi[i]);
>>> >> diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c
>>> >> b/sound/soc/intel/boards/kbl_da7219_max98927.c
>>> >> index f72a7bf..84d3609 100644
>>> >> --- a/sound/soc/intel/boards/kbl_da7219_max98927.c
>>> >> +++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
>>> >> @@ -34,7 +34,6 @@
>>> >>
>>> >>  #define DUAL_CHANNEL	2
>>> >>  #define QUAD_CHANNEL	4
>>> >> -#define NAME_SIZE	32
>>> >>
>>> >>  static struct snd_soc_card *kabylake_audio_card;  static struct
>>> >> snd_soc_jack kabylake_hdmi[3]; @@ -952,18 +951,9 @@ static int
>>> >> kabylake_card_late_probe(struct snd_soc_card *card)
>>> >>  	struct kbl_hdmi_pcm *pcm;
>>> >>  	struct snd_soc_component *component =3D NULL;
>>> >>  	int err, i =3D 0;
>>> >> -	char jack_name[NAME_SIZE];
>>> >>
>>> >>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>> >>  		component =3D pcm->codec_dai->component;
>>> >> -		snprintf(jack_name, sizeof(jack_name),
>>> >> -			"HDMI/DP, pcm=3D%d Jack", pcm->device);
>>> >> -		err =3D snd_soc_card_jack_new(card, jack_name,
>>> >> -					SND_JACK_AVOUT, &kabylake_hdmi[i],
>>> >> -					NULL, 0);
>>> >> -
>>> >> -		if (err)
>>> >> -			return err;
>>> >>
>>> >>  		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>> >>  						&kabylake_hdmi[i]);
>>> >> diff --git a/sound/soc/intel/boards/kbl_rt5660.c
>>> >> b/sound/soc/intel/boards/kbl_rt5660.c
>>> >> index 3255e00..06411bf 100644
>>> >> --- a/sound/soc/intel/boards/kbl_rt5660.c
>>> >> +++ b/sound/soc/intel/boards/kbl_rt5660.c
>>> >> @@ -447,25 +447,15 @@ static struct snd_soc_dai_link
>>> >> kabylake_rt5660_dais[] =3D {  };
>>> >>
>>> >>
>>> >> -#define NAME_SIZE	32
>>> >>  static int kabylake_card_late_probe(struct snd_soc_card *card)  {
>>> >>  	struct kbl_codec_private *ctx =3D snd_soc_card_get_drvdata(card);
>>> >>  	struct kbl_hdmi_pcm *pcm;
>>> >>  	struct snd_soc_component *component =3D NULL;
>>> >>  	int err, i =3D 0;
>>> >> -	char jack_name[NAME_SIZE];
>>> >>
>>> >>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>> >>  		component =3D pcm->codec_dai->component;
>>> >> -		snprintf(jack_name, sizeof(jack_name),
>>> >> -			"HDMI/DP, pcm=3D%d Jack", pcm->device);
>>> >> -		err =3D snd_soc_card_jack_new(card, jack_name,
>>> >> -					SND_JACK_AVOUT, &skylake_hdmi[i],
>>> >> -					NULL, 0);
>>> >> -
>>> >> -		if (err)
>>> >> -			return err;
>>> >>
>>> >>  		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>> >>  				&skylake_hdmi[i]);
>>> >> diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c
>>> >> b/sound/soc/intel/boards/kbl_rt5663_max98927.c
>>> >> index d714752..9c43c6c 100644
>>> >> --- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
>>> >> +++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
>>> >> @@ -898,25 +898,15 @@ static struct snd_soc_dai_link
>>> >kabylake_5663_dais[] =3D {
>>> >>  	},
>>> >>  };
>>> >>
>>> >> -#define NAME_SIZE	32
>>> >>  static int kabylake_card_late_probe(struct snd_soc_card *card)  {
>>> >>  	struct kbl_rt5663_private *ctx =3D snd_soc_card_get_drvdata(card);
>>> >>  	struct kbl_hdmi_pcm *pcm;
>>> >>  	struct snd_soc_component *component =3D NULL;
>>> >>  	int err, i =3D 0;
>>> >> -	char jack_name[NAME_SIZE];
>>> >>
>>> >>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>> >>  		component =3D pcm->codec_dai->component;
>>> >> -		snprintf(jack_name, sizeof(jack_name),
>>> >> -			"HDMI/DP, pcm=3D%d Jack", pcm->device);
>>> >> -		err =3D snd_soc_card_jack_new(card, jack_name,
>>> >> -					SND_JACK_AVOUT, &skylake_hdmi[i],
>>> >> -					NULL, 0);
>>> >> -
>>> >> -		if (err)
>>> >> -			return err;
>>> >>
>>> >>  		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>> >>  						&skylake_hdmi[i]);
>>> >> diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
>>> >> b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
>>> >> index 879f142..8fe4007 100644
>>> >> --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
>>> >> +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
>>> >> @@ -40,7 +40,6 @@
>>> >>  #define RT5663_DEV_NAME "i2c-10EC5663:00"
>>> >>  #define RT5514_AIF1_BCLK_FREQ (48000 * 8 * 16)  #define
>>> >> RT5514_AIF1_SYSCLK_FREQ 12288000 -#define NAME_SIZE 32
>>> >>
>>> >>  #define DMIC_CH(p) p->list[p->count-1]
>>> >>
>>> >> @@ -600,18 +599,10 @@ static int kabylake_card_late_probe(struct
>>> >snd_soc_card *card)
>>> >>  	struct kbl_hdmi_pcm *pcm;
>>> >>  	struct snd_soc_component *component =3D NULL;
>>> >>  	int err, i =3D 0;
>>> >> -	char jack_name[NAME_SIZE];
>>> >>
>>> >>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>> >>  		component =3D pcm->codec_dai->component;
>>> >> -		snprintf(jack_name, sizeof(jack_name),
>>> >> -			"HDMI/DP,pcm=3D%d Jack", pcm->device);
>>> >> -		err =3D snd_soc_card_jack_new(card, jack_name,
>>> >> -				SND_JACK_AVOUT, &ctx->kabylake_hdmi[i],
>>> >> -				NULL, 0);
>>> >>
>>> >> -		if (err)
>>> >> -			return err;
>>> >>  		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>> >>  						&ctx->kabylake_hdmi[i]);
>>> >>  		if (err < 0)
>>> >> diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c
>>> >> b/sound/soc/intel/boards/skl_hda_dsp_common.c
>>> >> index 8b68f41..0f57fc2 100644
>>> >> --- a/sound/soc/intel/boards/skl_hda_dsp_common.c
>>> >> +++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
>>> >> @@ -118,19 +118,10 @@ int skl_hda_hdmi_jack_init(struct
>>> >> snd_soc_card
>>> >*card)
>>> >>  	struct skl_hda_private *ctx =3D snd_soc_card_get_drvdata(card);
>>> >>  	struct snd_soc_component *component =3D NULL;
>>> >>  	struct skl_hda_hdmi_pcm *pcm;
>>> >> -	char jack_name[NAME_SIZE];
>>> >>  	int err;
>>> >>
>>> >>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>> >>  		component =3D pcm->codec_dai->component;
>>> >> -		snprintf(jack_name, sizeof(jack_name),
>>> >> -			 "HDMI/DP, pcm=3D%d Jack", pcm->device);
>>> >> -		err =3D snd_soc_card_jack_new(card, jack_name,
>>> >> -					    SND_JACK_AVOUT, &pcm-
>>> >>hdmi_jack,
>>> >> -					    NULL, 0);
>>> >> -
>>> >> -		if (err)
>>> >> -			return err;
>>> >>
>>> >>  		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>> >>  					  &pcm->hdmi_jack);
>>> >> diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
>>> >> b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
>>> >> index 0922106..aca426f 100644
>>> >> --- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
>>> >> +++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
>>> >> @@ -587,26 +587,15 @@ static struct snd_soc_dai_link skylake_dais[] =
=3D
>{
>>> >>  	},
>>> >>  };
>>> >>
>>> >> -#define NAME_SIZE	32
>>> >>  static int skylake_card_late_probe(struct snd_soc_card *card)  {
>>> >>  	struct skl_nau8825_private *ctx =3D snd_soc_card_get_drvdata(card)=
;
>>> >>  	struct skl_hdmi_pcm *pcm;
>>> >>  	struct snd_soc_component *component =3D NULL;
>>> >>  	int err, i =3D 0;
>>> >> -	char jack_name[NAME_SIZE];
>>> >>
>>> >>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>> >>  		component =3D pcm->codec_dai->component;
>>> >> -		snprintf(jack_name, sizeof(jack_name),
>>> >> -			"HDMI/DP, pcm=3D%d Jack", pcm->device);
>>> >> -		err =3D snd_soc_card_jack_new(card, jack_name,
>>> >> -					SND_JACK_AVOUT,
>>> >> -					&skylake_hdmi[i],
>>> >> -					NULL, 0);
>>> >> -
>>> >> -		if (err)
>>> >> -			return err;
>>> >>
>>> >>  		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>> >>  						&skylake_hdmi[i]);
>>> >> diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
>>> >> b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
>>> >> index 8433c52..788a837 100644
>>> >> --- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
>>> >> +++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
>>> >> @@ -638,26 +638,15 @@ static struct snd_soc_dai_link skylake_dais[] =
=3D
>{
>>> >>  	},
>>> >>  };
>>> >>
>>> >> -#define NAME_SIZE	32
>>> >>  static int skylake_card_late_probe(struct snd_soc_card *card)  {
>>> >>  	struct skl_nau88125_private *ctx =3D snd_soc_card_get_drvdata(card=
);
>>> >>  	struct skl_hdmi_pcm *pcm;
>>> >>  	struct snd_soc_component *component =3D NULL;
>>> >>  	int err, i =3D 0;
>>> >> -	char jack_name[NAME_SIZE];
>>> >>
>>> >>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>> >>  		component =3D pcm->codec_dai->component;
>>> >> -		snprintf(jack_name, sizeof(jack_name),
>>> >> -			"HDMI/DP, pcm=3D%d Jack", pcm->device);
>>> >> -		err =3D snd_soc_card_jack_new(card, jack_name,
>>> >> -					SND_JACK_AVOUT,
>>> >> -					&skylake_hdmi[i],
>>> >> -					NULL, 0);
>>> >> -
>>> >> -		if (err)
>>> >> -			return err;
>>> >>
>>> >>  		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>> >>  						&skylake_hdmi[i]);
>>> >> diff --git a/sound/soc/intel/boards/skl_rt286.c
>>> >> b/sound/soc/intel/boards/skl_rt286.c
>>> >> index 0e1818d..5d245f5 100644
>>> >> --- a/sound/soc/intel/boards/skl_rt286.c
>>> >> +++ b/sound/soc/intel/boards/skl_rt286.c
>>> >> @@ -473,25 +473,15 @@ static struct snd_soc_dai_link
>>> >> skylake_rt286_dais[]
>>> >=3D {
>>> >>  	},
>>> >>  };
>>> >>
>>> >> -#define NAME_SIZE	32
>>> >>  static int skylake_card_late_probe(struct snd_soc_card *card)  {
>>> >>  	struct skl_rt286_private *ctx =3D snd_soc_card_get_drvdata(card);
>>> >>  	struct skl_hdmi_pcm *pcm;
>>> >>  	struct snd_soc_component *component =3D NULL;
>>> >>  	int err, i =3D 0;
>>> >> -	char jack_name[NAME_SIZE];
>>> >>
>>> >>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>> >>  		component =3D pcm->codec_dai->component;
>>> >> -		snprintf(jack_name, sizeof(jack_name),
>>> >> -			"HDMI/DP, pcm=3D%d Jack", pcm->device);
>>> >> -		err =3D snd_soc_card_jack_new(card, jack_name,
>>> >> -					SND_JACK_AVOUT, &skylake_hdmi[i],
>>> >> -					NULL, 0);
>>> >> -
>>> >> -		if (err)
>>> >> -			return err;
>>> >>
>>> >>  		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>> >>  						&skylake_hdmi[i]);
>>> >> diff --git a/sound/soc/intel/boards/sof_rt5682.c
>>> >> b/sound/soc/intel/boards/sof_rt5682.c
>>> >> index f28fb98..660e4a6 100644
>>> >> --- a/sound/soc/intel/boards/sof_rt5682.c
>>> >> +++ b/sound/soc/intel/boards/sof_rt5682.c
>>> >> @@ -22,8 +22,6 @@
>>> >>  #include "../../codecs/rt5682.h"
>>> >>  #include "../../codecs/hdac_hdmi.h"
>>> >>
>>> >> -#define NAME_SIZE 32
>>> >> -
>>> >>  #define SOF_RT5682_SSP_CODEC(quirk)		((quirk) & GENMASK(2,
>>> >0))
>>> >>  #define SOF_RT5682_SSP_CODEC_MASK			(GENMASK(2,
>>> >0))
>>> >>  #define SOF_RT5682_MCLK_EN			BIT(3)
>>> >> @@ -216,7 +214,6 @@ static int sof_card_late_probe(struct
>>> >> snd_soc_card
>>> >> *card)  {
>>> >>  	struct sof_card_private *ctx =3D snd_soc_card_get_drvdata(card);
>>> >>  	struct snd_soc_component *component =3D NULL;
>>> >> -	char jack_name[NAME_SIZE];
>>> >>  	struct sof_hdmi_pcm *pcm;
>>> >>  	int err =3D 0;
>>> >>  	int i =3D 0;
>>> >> @@ -227,14 +224,6 @@ static int sof_card_late_probe(struct
>>> >> snd_soc_card *card)
>>> >>
>>> >>  	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>> >>  		component =3D pcm->codec_dai->component;
>>> >> -		snprintf(jack_name, sizeof(jack_name),
>>> >> -			 "HDMI/DP, pcm=3D%d Jack", pcm->device);
>>> >> -		err =3D snd_soc_card_jack_new(card, jack_name,
>>> >> -					    SND_JACK_AVOUT, &sof_hdmi[i],
>>> >> -					    NULL, 0);
>>> >> -
>>> >> -		if (err)
>>> >> -			return err;
>>> >>
>>> >>  		err =3D hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>> >>  					  &sof_hdmi[i]);
>>> >> --
>>> >> 2.7.4
>>> >>
>>>

--_002_96A12704CE18D347B625EE2D4A099D195289BC7BSHSMSX103ccrcor_
Content-Type: application/octet-stream; name="HiFi"
Content-Description: HiFi
Content-Disposition: attachment; filename="HiFi"; size=6270;
	creation-date="Fri, 14 Jun 2019 07:55:47 GMT";
	modification-date="Fri, 14 Jun 2019 07:55:47 GMT"
Content-Transfer-Encoding: base64

IyBVc2UgY2FzZSBDb25maWd1cmF0aW9uIGZvciBza2wtaGRhLWNhcmQKClNlY3Rpb25WZXJiIHsK
CglFbmFibGVTZXF1ZW5jZSBbCgkJY2RldiAiaHc6MCIKCQljc2V0ICJuYW1lPSdQaW41LVBvcnQw
IE11eCcgMSIKCQljc2V0ICJuYW1lPSdQaW41LVBvcnQxIE11eCcgMiIKCQljc2V0ICJuYW1lPSdQ
aW41LVBvcnQyIE11eCcgMyIKCQljc2V0ICJuYW1lPSdQaW42LVBvcnQwIE11eCcgMiIKCQljc2V0
ICJuYW1lPSdQaW42LVBvcnQxIE11eCcgMyIKCQljc2V0ICJuYW1lPSdQaW42LVBvcnQyIE11eCcg
MSIKCQljc2V0ICJuYW1lPSdQaW43LVBvcnQwIE11eCcgMyIKCQljc2V0ICJuYW1lPSdQaW43LVBv
cnQxIE11eCcgMiIKCQljc2V0ICJuYW1lPSdQaW43LVBvcnQyIE11eCcgMSIKCQljc2V0ICJuYW1l
PSdoaWY1LTAgSmFjayBTd2l0Y2gnIG9uIgoJCWNzZXQgIm5hbWU9J2hpZjUtMSBKYWNrIFN3aXRj
aCcgb24iCgkJY3NldCAibmFtZT0naGlmNS0yIEphY2sgU3dpdGNoJyBvbiIKCQljc2V0ICJuYW1l
PSdoaWY2LTAgSmFjayBTd2l0Y2gnIG9uIgoJCWNzZXQgIm5hbWU9J2hpZjYtMSBKYWNrIFN3aXRj
aCcgb24iCgkJY3NldCAibmFtZT0naGlmNi0yIEphY2sgU3dpdGNoJyBvbiIKCQljc2V0ICJuYW1l
PSdoaWY3LTAgSmFjayBTd2l0Y2gnIG9uIgoJCWNzZXQgIm5hbWU9J2hpZjctMSBKYWNrIFN3aXRj
aCcgb24iCgkJY3NldCAibmFtZT0naGlmNy0yIEphY2sgU3dpdGNoJyBvbiIKCV0KCglEaXNhYmxl
U2VxdWVuY2UgWwoJXQoKICAgICAgICBWYWx1ZSB7CiAgICAgICAgfQp9CgoKU2VjdGlvbkRldmlj
ZS4iSERNSTEiIHsKICAgICAgICBDb21tZW50ICJIRE1JMS9EUDEgT3V0cHV0IgoKICAgICAgICBD
b25mbGljdGluZ0RldmljZSBbCgkJIkRQTVNUMi0zIgoJCSJEUE1TVDMtMyIKICAgICAgICAgICAg
ICAgICMgIkhlYWRzZXQiCiAgICAgICAgXQoKICAgICAgICBFbmFibGVTZXF1ZW5jZSBbCiAgICAg
ICAgICAgICAgICBjZGV2ICJodzowIgogICAgICAgICAgICAgICAgY3NldCAibmFtZT0naGlmNS0w
IEphY2sgU3dpdGNoJyBvbiIKCQljc2V0ICJuYW1lPSdQaW41LVBvcnQwIE11eCcgMSIKICAgICAg
ICBdCgogICAgICAgIERpc2FibGVTZXF1ZW5jZSBbCiAgICAgICAgICAgICAgICBjZGV2ICJodzow
IgoJCWNzZXQgIm5hbWU9J1BpbjUtUG9ydDAgTXV4JyAwIgoJCWNzZXQgIm5hbWU9J2hpZjUtMCBK
YWNrIFN3aXRjaCcgb2ZmIgogICAgICAgIF0KCiAgICAgICAgVmFsdWUgewogICAgICAgICAgICAg
ICAgUGxheWJhY2tQQ00gImh3OjAsMSIKICAgICAgICAgICAgICAgIFBsYXliYWNrQ2hhbm5lbHMg
IjIiCgkJSmFja0NvbnRyb2wgIkhETUkvRFAsIHBpbjpwb3J0PTU6MCBKYWNrIgoJCSMgSmFja0hX
TXV0ZSAiSGVhZHNldCIKICAgICAgICB9Cn0KClNlY3Rpb25EZXZpY2UuIkRQTVNUMS0yIiB7CiAg
ICAgICAgQ29tbWVudCAiRFBNU1QxLTIgT3V0cHV0IgoKICAgICAgICBDb25mbGljdGluZ0Rldmlj
ZSBbCiAgICAgICAgICAgICAgICAjICJIZWFkc2V0IgoJCSJIRE1JMiIKCQkiRFBNU1QzLTIiCiAg
ICAgICAgXQoKICAgICAgICBFbmFibGVTZXF1ZW5jZSBbCiAgICAgICAgICAgICAgICBjZGV2ICJo
dzowIgogICAgICAgICAgICAgICAgY3NldCAibmFtZT0naGlmNS0xIEphY2sgU3dpdGNoJyBvbiIK
CQljc2V0ICJuYW1lPSdQaW41LVBvcnQxIE11eCcgMiIKICAgICAgICBdCgogICAgICAgIERpc2Fi
bGVTZXF1ZW5jZSBbCiAgICAgICAgICAgICAgICBjZGV2ICJodzowIgoJCWNzZXQgIm5hbWU9J1Bp
bjUtUG9ydDEgTXV4JyAwIgoJCWNzZXQgIm5hbWU9J2hpZjUtMSBKYWNrIFN3aXRjaCcgb2ZmIgog
ICAgICAgIF0KCiAgICAgICAgVmFsdWUgewogICAgICAgICAgICAgICAgUGxheWJhY2tQQ00gImh3
OjAsMiIKICAgICAgICAgICAgICAgIFBsYXliYWNrQ2hhbm5lbHMgIjIiCgkJSmFja0NvbnRyb2wg
IkhETUkvRFAsIHBpbjpwb3J0PTU6MSBKYWNrIgoJCSMgSmFja0hXTXV0ZSAiSGVhZHNldCIKICAg
ICAgICB9Cn0KClNlY3Rpb25EZXZpY2UuIkRQTVNUMS0zIiB7CiAgICAgICAgQ29tbWVudCAiRFBN
U1QxLTMgT3V0cHV0IgoKICAgICAgICBDb25mbGljdGluZ0RldmljZSBbCiAgICAgICAgICAgICAg
ICAjICJIZWFkc2V0IgoJCSJEUE1TVDItMiIKCQkiSERNSTMiCiAgICAgICAgXQoKICAgICAgICBF
bmFibGVTZXF1ZW5jZSBbCiAgICAgICAgICAgICAgICBjZGV2ICJodzowIgogICAgICAgICAgICAg
ICAgY3NldCAibmFtZT0naGlmNS0yIEphY2sgU3dpdGNoJyBvbiIKCQljc2V0ICJuYW1lPSdQaW41
LVBvcnQyIE11eCcgMyIKICAgICAgICBdCgogICAgICAgIERpc2FibGVTZXF1ZW5jZSBbCiAgICAg
ICAgICAgICAgICBjZGV2ICJodzowIgoJCWNzZXQgIm5hbWU9J1BpbjUtUG9ydDIgTXV4JyAwIgoJ
CWNzZXQgIm5hbWU9J2hpZjUtMiBKYWNrIFN3aXRjaCcgb2ZmIgogICAgICAgIF0KCiAgICAgICAg
VmFsdWUgewogICAgICAgICAgICAgICAgUGxheWJhY2tQQ00gImh3OjAsMyIKICAgICAgICAgICAg
ICAgIFBsYXliYWNrQ2hhbm5lbHMgIjIiCgkJSmFja0NvbnRyb2wgIkhETUkvRFAsIHBpbjpwb3J0
PTU6MiBKYWNrIgoJCSMgSmFja0hXTXV0ZSAiSGVhZHNldCIKICAgICAgICB9Cn0KCgpTZWN0aW9u
RGV2aWNlLiJIRE1JMiIgewogICAgICAgIENvbW1lbnQgIkhETUkyL0RQMiBPdXRwdXQiCgogICAg
ICAgIENvbmZsaWN0aW5nRGV2aWNlIFsKICAgICAgICAgICAgICAgICMgIkhlYWRzZXQiCgkJIkRQ
TVNUMS0yIgoJCSJEUE1TVDMtMiIKICAgICAgICBdCgogICAgICAgIEVuYWJsZVNlcXVlbmNlIFsK
ICAgICAgICAgICAgICAgIGNkZXYgImh3OjAiCiAgICAgICAgICAgICAgICBjc2V0ICJuYW1lPSdo
aWY2LTAgSmFjayBTd2l0Y2gnIG9uIgoJCWNzZXQgIm5hbWU9J1BpbjYtUG9ydDAgTXV4JyAyIgog
ICAgICAgIF0KCiAgICAgICAgRGlzYWJsZVNlcXVlbmNlIFsKICAgICAgICAgICAgICAgIGNkZXYg
Imh3OjAiCgkJY3NldCAibmFtZT0nUGluNi1Qb3J0MCBNdXgnIDAiCgkJY3NldCAibmFtZT0naGlm
Ni0wIEphY2sgU3dpdGNoJyBvZmYiCiAgICAgICAgXQoKICAgICAgICBWYWx1ZSB7CiAgICAgICAg
ICAgICAgICBQbGF5YmFja1BDTSAiaHc6MCwyIgogICAgICAgICAgICAgICAgUGxheWJhY2tDaGFu
bmVscyAiMiIKCQlKYWNrQ29udHJvbCAiSERNSS9EUCwgcGluOnBvcnQ9NjowIEphY2siCgkJIyBK
YWNrSFdNdXRlICJIZWFkc2V0IgogICAgICAgIH0KfQoKU2VjdGlvbkRldmljZS4iRFBNU1QyLTIi
IHsKICAgICAgICBDb21tZW50ICJEUE1TVDItMiBPdXRwdXQiCgogICAgICAgIENvbmZsaWN0aW5n
RGV2aWNlIFsKICAgICAgICAgICAgICAgICMgIkhlYWRzZXQiCgkJIkRQTVNUMS0zIgoJCSJIRE1J
MyIKICAgICAgICBdCgogICAgICAgIEVuYWJsZVNlcXVlbmNlIFsKICAgICAgICAgICAgICAgIGNk
ZXYgImh3OjAiCiAgICAgICAgICAgICAgICBjc2V0ICJuYW1lPSdoaWY2LTEgSmFjayBTd2l0Y2gn
IG9uIgoJCWNzZXQgIm5hbWU9J1BpbjYtUG9ydDEgTXV4JyAzIgogICAgICAgIF0KCiAgICAgICAg
RGlzYWJsZVNlcXVlbmNlIFsKICAgICAgICAgICAgICAgIGNkZXYgImh3OjAiCgkJY3NldCAibmFt
ZT0nUGluNi1Qb3J0MSBNdXgnIDAiCgkJY3NldCAibmFtZT0naGlmNi0xIEphY2sgU3dpdGNoJyBv
ZmYiCiAgICAgICAgXQoKICAgICAgICBWYWx1ZSB7CiAgICAgICAgICAgICAgICBQbGF5YmFja1BD
TSAiaHc6MCwzIgogICAgICAgICAgICAgICAgUGxheWJhY2tDaGFubmVscyAiMiIKCQlKYWNrQ29u
dHJvbCAiSERNSS9EUCwgcGluOnBvcnQ9NjoxIEphY2siCgkJIyBKYWNrSFdNdXRlICJIZWFkc2V0
IgogICAgICAgIH0KfQoKU2VjdGlvbkRldmljZS4iRFBNU1QyLTMiIHsKICAgICAgICBDb21tZW50
ICJEUE1TVDItMyBPdXRwdXQiCgogICAgICAgIENvbmZsaWN0aW5nRGV2aWNlIFsKICAgICAgICAg
ICAgICAgICMgIkhlYWRzZXQiCgkJIkhETUkxIgoJCSJEUE1TVDMtMyIKICAgICAgICBdCgogICAg
ICAgIEVuYWJsZVNlcXVlbmNlIFsKICAgICAgICAgICAgICAgIGNkZXYgImh3OjAiCiAgICAgICAg
ICAgICAgICBjc2V0ICJuYW1lPSdoaWY2LTIgSmFjayBTd2l0Y2gnIG9uIgoJCWNzZXQgIm5hbWU9
J1BpbjYtUG9ydDIgTXV4JyAzIgogICAgICAgIF0KCiAgICAgICAgRGlzYWJsZVNlcXVlbmNlIFsK
ICAgICAgICAgICAgICAgIGNkZXYgImh3OjAiCgkJY3NldCAibmFtZT0nUGluNi1Qb3J0MiBNdXgn
IDAiCgkJY3NldCAibmFtZT0naGlmNi0yIEphY2sgU3dpdGNoJyBvZmYiCiAgICAgICAgXQoKICAg
ICAgICBWYWx1ZSB7CiAgICAgICAgICAgICAgICBQbGF5YmFja1BDTSAiaHc6MCwxIgogICAgICAg
ICAgICAgICAgUGxheWJhY2tDaGFubmVscyAiMiIKCQlKYWNrQ29udHJvbCAiSERNSS9EUCwgcGlu
OnBvcnQ9NjoyIEphY2siCgkJIyBKYWNrSFdNdXRlICJIZWFkc2V0IgogICAgICAgIH0KfQoKU2Vj
dGlvbkRldmljZS4iSERNSTMiIHsKICAgICAgICBDb21tZW50ICJIRE1JMy9EUDMgT3V0cHV0IgoK
ICAgICAgICBDb25mbGljdGluZ0RldmljZSBbCiAgICAgICAgICAgICAgICAjICJIZWFkc2V0IgoJ
CSJEUE1TVDEtMyIKCQkiRFBNU1QyLTIiCiAgICAgICAgXQoKICAgICAgICBFbmFibGVTZXF1ZW5j
ZSBbCiAgICAgICAgICAgICAgICBjZGV2ICJodzowIgogICAgICAgICAgICAgICAgY3NldCAibmFt
ZT0naGlmNy0wIEphY2sgU3dpdGNoJyBvbiIKCQljc2V0ICJuYW1lPSdQaW43LVBvcnQwIE11eCcg
MyIKICAgICAgICBdCgogICAgICAgIERpc2FibGVTZXF1ZW5jZSBbCiAgICAgICAgICAgICAgICBj
ZGV2ICJodzowIgoJCWNzZXQgIm5hbWU9J1BpbjctUG9ydDAgTXV4JyAwIgoJCWNzZXQgIm5hbWU9
J2hpZjctMCBKYWNrIFN3aXRjaCcgb2ZmIgogICAgICAgIF0KCiAgICAgICAgVmFsdWUgewogICAg
ICAgICAgICAgICAgUGxheWJhY2tQQ00gImh3OjAsMyIKICAgICAgICAgICAgICAgIFBsYXliYWNr
Q2hhbm5lbHMgIjIiCgkJSmFja0NvbnRyb2wgIkhETUkvRFAsIHBpbjpwb3J0PTc6MCBKYWNrIgoJ
CSMgSmFja0hXTXV0ZSAiSGVhZHNldCIKICAgICAgICB9Cn0KClNlY3Rpb25EZXZpY2UuIkRQTVNU
My0yIiB7CiAgICAgICAgQ29tbWVudCAiRFBNU1QzLTIgT3V0cHV0IgoKICAgICAgICBDb25mbGlj
dGluZ0RldmljZSBbCiAgICAgICAgICAgICAgICAjICJIZWFkc2V0IgoJCSJEUE1TVDEtMiIKCQki
SERNSTIiCiAgICAgICAgXQoKICAgICAgICBFbmFibGVTZXF1ZW5jZSBbCiAgICAgICAgICAgICAg
ICBjZGV2ICJodzowIgogICAgICAgICAgICAgICAgY3NldCAibmFtZT0naGlmNy0xIEphY2sgU3dp
dGNoJyBvbiIKCQljc2V0ICJuYW1lPSdQaW43LVBvcnQxIE11eCcgMiIKICAgICAgICBdCgogICAg
ICAgIERpc2FibGVTZXF1ZW5jZSBbCiAgICAgICAgICAgICAgICBjZGV2ICJodzowIgoJCWNzZXQg
Im5hbWU9J1BpbjctUG9ydDEgTXV4JyAwIgoJCWNzZXQgIm5hbWU9J2hpZjctMSBKYWNrIFN3aXRj
aCcgb2ZmIgogICAgICAgIF0KCiAgICAgICAgVmFsdWUgewogICAgICAgICAgICAgICAgUGxheWJh
Y2tQQ00gImh3OjAsMiIKICAgICAgICAgICAgICAgIFBsYXliYWNrQ2hhbm5lbHMgIjIiCgkJSmFj
a0NvbnRyb2wgIkhETUkvRFAsIHBpbjpwb3J0PTc6MSBKYWNrIgoJCSMgSmFja0hXTXV0ZSAiSGVh
ZHNldCIKICAgICAgICB9Cn0KClNlY3Rpb25EZXZpY2UuIkRQTVNUMy0zIiB7CiAgICAgICAgQ29t
bWVudCAiRFBNU1QzLTMgT3V0cHV0IgoKICAgICAgICBDb25mbGljdGluZ0RldmljZSBbCiAgICAg
ICAgICAgICAgICAjICJIZWFkc2V0IgoJCSJIRE1JMSIKCQkiRFBNU1QyLTMiCiAgICAgICAgXQoK
ICAgICAgICBFbmFibGVTZXF1ZW5jZSBbCiAgICAgICAgICAgICAgICBjZGV2ICJodzowIgogICAg
ICAgICAgICAgICAgY3NldCAibmFtZT0naGlmNy0yIEphY2sgU3dpdGNoJyBvbiIKCQljc2V0ICJu
YW1lPSdQaW43LVBvcnQyIE11eCcgMSIKICAgICAgICBdCgogICAgICAgIERpc2FibGVTZXF1ZW5j
ZSBbCiAgICAgICAgICAgICAgICBjZGV2ICJodzowIgoJCWNzZXQgIm5hbWU9J1BpbjctUG9ydDIg
TXV4JyAwIgoJCWNzZXQgIm5hbWU9J2hpZjctMiBKYWNrIFN3aXRjaCcgb2ZmIgogICAgICAgIF0K
CiAgICAgICAgVmFsdWUgewogICAgICAgICAgICAgICAgUGxheWJhY2tQQ00gImh3OjAsMSIKICAg
ICAgICAgICAgICAgIFBsYXliYWNrQ2hhbm5lbHMgIjIiCgkJSmFja0NvbnRyb2wgIkhETUkvRFAs
IHBpbjpwb3J0PTc6MiBKYWNrIgoJCSMgSmFja0hXTXV0ZSAiSGVhZHNldCIKICAgICAgICB9Cn0K

--_002_96A12704CE18D347B625EE2D4A099D195289BC7BSHSMSX103ccrcor_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--_002_96A12704CE18D347B625EE2D4A099D195289BC7BSHSMSX103ccrcor_--
