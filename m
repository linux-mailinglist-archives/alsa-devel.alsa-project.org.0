Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 633ED2AE06
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 07:37:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAA23177B;
	Mon, 27 May 2019 07:36:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAA23177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558935448;
	bh=PAQgWCAGgNfkPkJet5Wq1rpePqO61ET4XhYWJHKXSA4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sLS1SsJnXmc6/y0J8tQiIkRmspsf9QYUv+IQPPKthHgzKXyYxv5ggz7UXMkBGiWj0
	 9pvIjTg+xnJaqNYgywsG4+QKMPtE+FE61iqe1U4zEUU67TM1hcRHBv0j1i6YA5yTd0
	 MKF/SisS1zDAVXYKnsoYdwqguFIPsO1BSL+qbfx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24A23F896E4;
	Mon, 27 May 2019 07:35:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02502F896E4; Mon, 27 May 2019 07:35:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61B28F80730
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 07:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61B28F80730
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 May 2019 22:35:31 -0700
X-ExtLoop1: 1
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga008.jf.intel.com with ESMTP; 26 May 2019 22:35:31 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 26 May 2019 22:35:30 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.70]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.10]) with mapi id 14.03.0415.000;
 Mon, 27 May 2019 13:35:28 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH RFC] ASoC: hdac_hdmi: refine hdmi jacks
Thread-Index: AQHVEf7LgFEE96FIaku7fl11ZpnzmKZ+d3DQ
Date: Mon, 27 May 2019 05:35:29 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D1952842CCE@SHSMSX103.ccr.corp.intel.com>
References: <1558680186-12994-1-git-send-email-libin.yang@intel.com>
In-Reply-To: <1558680186-12994-1-git-send-email-libin.yang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzliYzcwZGQtY2MwOC00MTNmLWFhODItODhiODlhMjEyOTJkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTEt1YXdZOGVLT3Nya0w5a3k2eG43emd2NjNnQW9jRnZPbG9qcmpVbkt2ZXVLZkw1RUhHZlFPZlJZdnU1cGpCcSJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "tiwai@suse.de" <tiwai@suse.de>, "broonie@kernel.org" <broonie@kernel.org>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH RFC] ASoC: hdac_hdmi: refine hdmi jacks
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

Hi all,

I will split the big patch into some small patches and add more descriptions.

Regards,
Libin

>-----Original Message-----
>From: Yang, Libin
>Sent: Friday, May 24, 2019 2:43 PM
>To: alsa-devel@alsa-project.org
>Cc: tiwai@suse.de; broonie@kernel.org; pierre-louis.bossart@linux.intel.com;
>Yang, Libin <libin.yang@intel.com>
>Subject: [alsa-devel] [PATCH RFC] ASoC: hdac_hdmi: refine hdmi jacks
>
>From: Libin Yang <libin.yang@intel.com>
>
>Sorry for a big patch. I will split it if the patch is acceptable.
>
>This patch does the following actions:
>1) jack is bound to pcm in origal code. The patch binds jack to pin-port.
>   This mean each pin-port (3x3) has a jack. pin-port is used for DP-MST
>   mode. The port means device entry for DP-MST in hdac_hdmi
>   As hdac_hdmi allows user to map the pin-port to a pcm manually, the jack
>   is bound to pcm is not accurate.
>   However, PA assumes jack is bound to PCM for the legacy mode.
>   For example, for ubuntu, in
>   /usr/share/pulseaudio/alsa-mixer/paths/hdmi-output-x.conf uses
>   "Jack HDMI/DP,pcm=n" to find which jack event is used.
>   This main issue is: pcm number is fixed (3, 7, 8, 9, 10) for hdmi in
>   legacy mode. But it is not always the same for ASoC hdmi audio.
>
>2) move snd_soc_card_jack_new() from machine driver to codec driver.
>   This is because the jack information is more lated to the codec
>   Also this patch calls snd_jack_add_new_kctl() to export the jack kctl
>   to userspace.
>
>3) Don't call hdac_hdmi_jack_report() in hdac_hdmi_create_pin_port_muxs()
>   Jack event means the jack pin hotplug event. It should not related to
>   user setting.
>
>Signed-off-by: Libin Yang <libin.yang@intel.com>
>---
> sound/soc/codecs/hdac_hdmi.c                       | 141 +++++++++++----------
> sound/soc/intel/boards/bxt_da7219_max98357a.c      |  10 --
> sound/soc/intel/boards/bxt_rt298.c                 |  10 --
> sound/soc/intel/boards/glk_rt5682_max98357a.c      |  10 --
> sound/soc/intel/boards/kbl_da7219_max98357a.c      |  10 --
> sound/soc/intel/boards/kbl_da7219_max98927.c       |  10 --
> sound/soc/intel/boards/kbl_rt5660.c                |  10 --
> sound/soc/intel/boards/kbl_rt5663_max98927.c       |  10 --
> .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |   9 --
> sound/soc/intel/boards/skl_hda_dsp_common.c        |   9 --
> sound/soc/intel/boards/skl_nau88l25_max98357a.c    |  11 --
> sound/soc/intel/boards/skl_nau88l25_ssm4567.c      |  11 --
> sound/soc/intel/boards/skl_rt286.c                 |  10 --
> sound/soc/intel/boards/sof_rt5682.c                |  11 --
> 14 files changed, 72 insertions(+), 200 deletions(-)
>
>diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
>index 660e058..49f02b1 100644
>--- a/sound/soc/codecs/hdac_hdmi.c
>+++ b/sound/soc/codecs/hdac_hdmi.c
>@@ -4,6 +4,7 @@
>  *  Copyright (C) 2014-2015 Intel Corp
>  *  Author: Samreen Nilofer <samreen.nilofer@intel.com>
>  *	    Subhransu S. Prusty <subhransu.s.prusty@intel.com>
>+ *	    Libin Yang <libin.yang@intel.com>
>  *
>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>~~~~~~~~~
>  *
>  *  This program is free software; you can redistribute it and/or modify @@ -
>30,6 +31,7 @@  #include <sound/hda_i915.h>  #include
><sound/pcm_drm_eld.h>  #include <sound/hda_chmap.h>
>+#include <sound/hda_codec.h>
> #include "../../hda/local.h"
> #include "hdac_hdmi.h"
>
>@@ -95,6 +97,8 @@ struct hdac_hdmi_port {
> 	int num_mux_nids;
> 	hda_nid_t mux_nids[HDA_MAX_CONNECTIONS];
> 	struct hdac_hdmi_eld eld;
>+	struct snd_soc_jack jack;
>+	int jack_event;
> 	const char *jack_pin;
> 	struct snd_soc_dapm_context *dapm;
> 	const char *output_pin;
>@@ -105,14 +109,12 @@ struct hdac_hdmi_pcm {
> 	int pcm_id;
> 	struct list_head port_list;
> 	struct hdac_hdmi_cvt *cvt;
>-	struct snd_soc_jack *jack;
> 	int stream_tag;
> 	int channels;
> 	int format;
> 	bool chmap_set;
> 	unsigned char chmap[8]; /* ALSA API channel-map */
> 	struct mutex lock;
>-	int jack_event;
> };
>
> struct hdac_hdmi_dai_port_map {
>@@ -166,8 +168,7 @@ hdac_hdmi_get_pcm_from_cvt(struct hdac_hdmi_priv
>*hdmi,
> 	return pcm;
> }
>
>-static void hdac_hdmi_jack_report(struct hdac_hdmi_pcm *pcm,
>-		struct hdac_hdmi_port *port, bool is_connect)
>+static void hdac_hdmi_jack_report(struct hdac_hdmi_port *port, bool
>+is_connect)
> {
> 	struct hdac_device *hdev = port->pin->hdev;
>
>@@ -176,33 +177,24 @@ static void hdac_hdmi_jack_report(struct
>hdac_hdmi_pcm *pcm,
> 	else
> 		snd_soc_dapm_disable_pin(port->dapm, port->jack_pin);
>
>+	snd_soc_dapm_sync(port->dapm);
>+
>+	if (!port->jack.jack)
>+		return;
> 	if (is_connect) {
>-		/*
>-		 * Report Jack connect event when a device is connected
>-		 * for the first time where same PCM is attached to multiple
>-		 * ports.
>-		 */
>-		if (pcm->jack_event == 0) {
>+		if (port->jack_event == 0) {
> 			dev_dbg(&hdev->dev,
>-					"jack report for pcm=%d\n",
>-					pcm->pcm_id);
>-			snd_soc_jack_report(pcm->jack, SND_JACK_AVOUT,
>-						SND_JACK_AVOUT);
>+				"jack report for pin:port = %d:%d\n",
>+				port->id, port->pin->nid);
>+			snd_soc_jack_report(&port->jack, SND_JACK_AVOUT,
>+					    SND_JACK_AVOUT);
> 		}
>-		pcm->jack_event++;
>+		port->jack_event = 1;
> 	} else {
>-		/*
>-		 * Report Jack disconnect event when a device is disconnected
>-		 * is the only last connected device when same PCM is
>attached
>-		 * to multiple ports.
>-		 */
>-		if (pcm->jack_event == 1)
>-			snd_soc_jack_report(pcm->jack, 0, SND_JACK_AVOUT);
>-		if (pcm->jack_event > 0)
>-			pcm->jack_event--;
>+		if (port->jack_event == 1)
>+			snd_soc_jack_report(&port->jack, 0,
>SND_JACK_AVOUT);
>+		port->jack_event = 0;
> 	}
>-
>-	snd_soc_dapm_sync(port->dapm);
> }
>
> /* MST supported verbs */
>@@ -855,7 +847,6 @@ static int hdac_hdmi_pin_mux_widget_event(struct
>snd_soc_dapm_widget *w,  static int hdac_hdmi_set_pin_port_mux(struct
>snd_kcontrol *kcontrol,
> 		struct snd_ctl_elem_value *ucontrol)
> {
>-	int ret;
> 	struct hdac_hdmi_port *p, *p_next;
> 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
> 	struct snd_soc_dapm_widget *w =
>snd_soc_dapm_kcontrol_widget(kcontrol);
>@@ -865,6 +856,7 @@ static int hdac_hdmi_set_pin_port_mux(struct
>snd_kcontrol *kcontrol,
> 	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
> 	struct hdac_hdmi_pcm *pcm = NULL;
> 	const char *cvt_name =  e->texts[ucontrol-
>>value.enumerated.item[0]];
>+	int ret;
>
> 	ret = snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
> 	if (ret < 0)
>@@ -880,13 +872,12 @@ static int hdac_hdmi_set_pin_port_mux(struct
>snd_kcontrol *kcontrol,
>
> 		list_for_each_entry_safe(p, p_next, &pcm->port_list, head) {
> 			if (p == port && p->id == port->id &&
>-					p->pin == port->pin) {
>-				hdac_hdmi_jack_report(pcm, port, false);
>+			    p->pin == port->pin)
> 				list_del(&p->head);
>-			}
> 		}
> 	}
>
>+
> 	/*
> 	 * Jack status is not reported during device probe as the
> 	 * PCMs are not registered by then. So report it here.
>@@ -895,7 +886,6 @@ static int hdac_hdmi_set_pin_port_mux(struct
>snd_kcontrol *kcontrol,
> 		if (!strcmp(cvt_name, pcm->cvt->name)) {
> 			list_add_tail(&port->head, &pcm->port_list);
> 			if (port->eld.monitor_present && port->eld.eld_valid)
>{
>-				hdac_hdmi_jack_report(pcm, port, true);
> 				mutex_unlock(&hdmi->pin_mutex);
> 				return ret;
> 			}
>@@ -1247,27 +1237,18 @@ static void hdac_hdmi_present_sense(struct
>hdac_hdmi_pin *pin,
> 	}
>
> 	pcm = hdac_hdmi_get_pcm(hdev, port);
>-
> 	if (!port->eld.monitor_present || !port->eld.eld_valid) {
>-
> 		dev_err(&hdev->dev, "%s: disconnect for pin:port %d:%d\n",
> 						__func__, pin->nid, port->id);
>
>-		/*
>-		 * PCMs are not registered during device probe, so don't
>-		 * report jack here. It will be done in usermode mux
>-		 * control select.
>-		 */
>-		if (pcm)
>-			hdac_hdmi_jack_report(pcm, port, false);
>+		hdac_hdmi_jack_report(port, false);
>
> 		mutex_unlock(&hdmi->pin_mutex);
> 		return;
> 	}
>
> 	if (port->eld.monitor_present && port->eld.eld_valid) {
>-		if (pcm)
>-			hdac_hdmi_jack_report(pcm, port, true);
>+		hdac_hdmi_jack_report(port, true);
>
> 		print_hex_dump_debug("ELD: ", DUMP_PREFIX_OFFSET, 16, 1,
> 			  port->eld.eld_buffer, port->eld.eld_size, false); @@ -
>1299,6 +1280,7 @@ static int hdac_hdmi_add_ports(struct hdac_device *hdev,
> 	}
> 	pin->ports = ports;
> 	pin->num_ports = max_ports;
>+
> 	return 0;
> }
>
>@@ -1664,6 +1646,30 @@ static int create_fill_jack_kcontrols(struct
>snd_soc_card *card,
> 	return snd_soc_add_card_controls(card, kc, i);  }
>
>+static void hdac_hdmi_present_sense_all_pins(struct hdac_device *hdev,
>+			struct hdac_hdmi_priv *hdmi, bool detect_pin_caps) {
>+	int i;
>+	struct hdac_hdmi_pin *pin;
>+
>+	list_for_each_entry(pin, &hdmi->pin_list, head) {
>+		if (detect_pin_caps) {
>+
>+			if (hdac_hdmi_get_port_len(hdev, pin->nid)  == 0)
>+				pin->mst_capable = false;
>+			else
>+				pin->mst_capable = true;
>+		}
>+
>+		for (i = 0; i < pin->num_ports; i++) {
>+			if (!pin->mst_capable && i > 0)
>+				continue;
>+
>+			hdac_hdmi_present_sense(pin, &pin->ports[i]);
>+		}
>+	}
>+}
>+
> int hdac_hdmi_jack_port_init(struct snd_soc_component *component,
> 			struct snd_soc_dapm_context *dapm)
> {
>@@ -1673,6 +1679,7 @@ int hdac_hdmi_jack_port_init(struct
>snd_soc_component *component,
> 	struct snd_soc_dapm_widget *widgets;
> 	struct snd_soc_dapm_route *route;
> 	char w_name[NAME_SIZE];
>+	char jack_name[NAME_SIZE];
> 	int i = 0, j, ret;
>
> 	widgets = devm_kcalloc(dapm->dev, hdmi->num_ports, @@ -1701,6
>+1708,23 @@ int hdac_hdmi_jack_port_init(struct snd_soc_component
>*component,
> 			pin->ports[j].jack_pin = widgets[i].name;
> 			pin->ports[j].dapm = dapm;
>
>+			/* create pin-port jack */
>+			snprintf(jack_name, sizeof(jack_name),
>+				 "HDMI/DP, pin:port=%d:%d Jack",
>+				  pin->nid, pin->ports[j].id);
>+			ret = snd_soc_card_jack_new(dapm->card, jack_name,
>+						    SND_JACK_AVOUT,
>+						    &(pin->ports[j].jack),
>+						    NULL, 0);
>+			if (ret)
>+				return ret;
>+
>+			ret = snd_jack_add_new_kctl(pin->ports[j].jack.jack,
>+						    jack_name,
>SND_JACK_AVOUT);
>+			if (ret)
>+				dev_warn(&hdev->dev, "failed creating Jack
>kctl\n");
>+
>+
> 			/* add to route from Jack widget to output */
> 			hdac_hdmi_fill_route(&route[i], pin->ports[j].jack_pin,
> 					NULL, pin->ports[j].output_pin, NULL);
>@@ -1708,6 +1732,8 @@ int hdac_hdmi_jack_port_init(struct
>snd_soc_component *component,
> 			i++;
> 		}
> 	}
>+	/* now jack is ready, let's update the status */
>+	hdac_hdmi_present_sense_all_pins(hdev, hdmi, true);
>
> 	/* Add Route from Jack widget to the output widget */
> 	ret = snd_soc_dapm_new_controls(dapm, widgets, hdmi-
>>num_ports); @@ -1739,6 +1765,10 @@ int hdac_hdmi_jack_port_init(struct
>snd_soc_component *component,  }
>EXPORT_SYMBOL_GPL(hdac_hdmi_jack_port_init);
>
>+/*
>+ * TODO: maybe we should rename this function name
>+ *       as it is not related to jack init any more.
>+ */
> int hdac_hdmi_jack_init(struct snd_soc_dai *dai, int device,
> 				struct snd_soc_jack *jack)
> {
>@@ -1758,8 +1788,6 @@ int hdac_hdmi_jack_init(struct snd_soc_dai *dai, int
>device,
> 		return -ENOMEM;
> 	pcm->pcm_id = device;
> 	pcm->cvt = hdmi->dai_map[dai->id].cvt;
>-	pcm->jack_event = 0;
>-	pcm->jack = jack;
> 	mutex_init(&pcm->lock);
> 	INIT_LIST_HEAD(&pcm->port_list);
> 	snd_pcm = hdac_hdmi_get_pcm_from_id(dai->component->card,
>device); @@ -1779,30 +1807,6 @@ int hdac_hdmi_jack_init(struct
>snd_soc_dai *dai, int device,  }  EXPORT_SYMBOL_GPL(hdac_hdmi_jack_init);
>
>-static void hdac_hdmi_present_sense_all_pins(struct hdac_device *hdev,
>-			struct hdac_hdmi_priv *hdmi, bool detect_pin_caps)
>-{
>-	int i;
>-	struct hdac_hdmi_pin *pin;
>-
>-	list_for_each_entry(pin, &hdmi->pin_list, head) {
>-		if (detect_pin_caps) {
>-
>-			if (hdac_hdmi_get_port_len(hdev, pin->nid)  == 0)
>-				pin->mst_capable = false;
>-			else
>-				pin->mst_capable = true;
>-		}
>-
>-		for (i = 0; i < pin->num_ports; i++) {
>-			if (!pin->mst_capable && i > 0)
>-				continue;
>-
>-			hdac_hdmi_present_sense(pin, &pin->ports[i]);
>-		}
>-	}
>-}
>-
> static int hdmi_codec_probe(struct snd_soc_component *component)  {
> 	struct hdac_hdmi_priv *hdmi =
>snd_soc_component_get_drvdata(component);
>@@ -1837,7 +1841,6 @@ static int hdmi_codec_probe(struct
>snd_soc_component *component)
> 		return ret;
> 	}
>
>-	hdac_hdmi_present_sense_all_pins(hdev, hdmi, true);
> 	/* Imp: Store the card pointer in hda_codec */
> 	hdmi->card = dapm->card->snd_card;
>
>diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c
>b/sound/soc/intel/boards/bxt_da7219_max98357a.c
>index 5cadb7f..c69cfa9 100644
>--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
>+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
>@@ -573,14 +573,12 @@ static const struct x86_cpu_id glk_ids[] = {
> 	{}
> };
>
>-#define NAME_SIZE	32
> static int bxt_card_late_probe(struct snd_soc_card *card)  {
> 	struct bxt_card_private *ctx = snd_soc_card_get_drvdata(card);
> 	struct bxt_hdmi_pcm *pcm;
> 	struct snd_soc_component *component = NULL;
> 	int err, i = 0;
>-	char jack_name[NAME_SIZE];
>
> 	if (x86_match_cpu(glk_ids))
> 		snd_soc_dapm_add_routes(&card->dapm, gemini_map, @@
>-591,14 +589,6 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
>
> 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> 		component = pcm->codec_dai->component;
>-		snprintf(jack_name, sizeof(jack_name),
>-			"HDMI/DP, pcm=%d Jack", pcm->device);
>-		err = snd_soc_card_jack_new(card, jack_name,
>-					SND_JACK_AVOUT, &broxton_hdmi[i],
>-					NULL, 0);
>-
>-		if (err)
>-			return err;
>
> 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> 						&broxton_hdmi[i]);
>diff --git a/sound/soc/intel/boards/bxt_rt298.c
>b/sound/soc/intel/boards/bxt_rt298.c
>index e91057f..d1372891 100644
>--- a/sound/soc/intel/boards/bxt_rt298.c
>+++ b/sound/soc/intel/boards/bxt_rt298.c
>@@ -507,25 +507,15 @@ static struct snd_soc_dai_link broxton_rt298_dais[]
>= {
> 	},
> };
>
>-#define NAME_SIZE	32
> static int bxt_card_late_probe(struct snd_soc_card *card)  {
> 	struct bxt_rt286_private *ctx = snd_soc_card_get_drvdata(card);
> 	struct bxt_hdmi_pcm *pcm;
> 	struct snd_soc_component *component = NULL;
> 	int err, i = 0;
>-	char jack_name[NAME_SIZE];
>
> 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> 		component = pcm->codec_dai->component;
>-		snprintf(jack_name, sizeof(jack_name),
>-			"HDMI/DP, pcm=%d Jack", pcm->device);
>-		err = snd_soc_card_jack_new(card, jack_name,
>-					SND_JACK_AVOUT, &broxton_hdmi[i],
>-					NULL, 0);
>-
>-		if (err)
>-			return err;
>
> 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> 						&broxton_hdmi[i]);
>diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c
>b/sound/soc/intel/boards/glk_rt5682_max98357a.c
>index d17126f..2a35974 100644
>--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
>+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
>@@ -29,7 +29,6 @@
> #define MAXIM_DEV0_NAME "MX98357A:00"
> #define DUAL_CHANNEL 2
> #define QUAD_CHANNEL 4
>-#define NAME_SIZE 32
>
> static struct snd_soc_jack geminilake_hdmi[3];
>
>@@ -523,21 +522,12 @@ static int glk_card_late_probe(struct snd_soc_card
>*card)  {
> 	struct glk_card_private *ctx = snd_soc_card_get_drvdata(card);
> 	struct snd_soc_component *component = NULL;
>-	char jack_name[NAME_SIZE];
> 	struct glk_hdmi_pcm *pcm;
> 	int err = 0;
> 	int i = 0;
>
> 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> 		component = pcm->codec_dai->component;
>-		snprintf(jack_name, sizeof(jack_name),
>-			"HDMI/DP, pcm=%d Jack", pcm->device);
>-		err = snd_soc_card_jack_new(card, jack_name,
>-					SND_JACK_AVOUT,
>&geminilake_hdmi[i],
>-					NULL, 0);
>-
>-		if (err)
>-			return err;
>
> 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> 						&geminilake_hdmi[i]);
>diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c
>b/sound/soc/intel/boards/kbl_da7219_max98357a.c
>index 07491a0..f293307 100644
>--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
>+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
>@@ -519,25 +519,15 @@ static struct snd_soc_dai_link kabylake_dais[] = {
> 	},
> };
>
>-#define NAME_SIZE	32
> static int kabylake_card_late_probe(struct snd_soc_card *card)  {
> 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(card);
> 	struct kbl_hdmi_pcm *pcm;
> 	struct snd_soc_component *component = NULL;
> 	int err, i = 0;
>-	char jack_name[NAME_SIZE];
>
> 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> 		component = pcm->codec_dai->component;
>-		snprintf(jack_name, sizeof(jack_name),
>-			"HDMI/DP, pcm=%d Jack", pcm->device);
>-		err = snd_soc_card_jack_new(card, jack_name,
>-					SND_JACK_AVOUT, &skylake_hdmi[i],
>-					NULL, 0);
>-
>-		if (err)
>-			return err;
>
> 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> 				&skylake_hdmi[i]);
>diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c
>b/sound/soc/intel/boards/kbl_da7219_max98927.c
>index f72a7bf..84d3609 100644
>--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
>+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
>@@ -34,7 +34,6 @@
>
> #define DUAL_CHANNEL	2
> #define QUAD_CHANNEL	4
>-#define NAME_SIZE	32
>
> static struct snd_soc_card *kabylake_audio_card;  static struct snd_soc_jack
>kabylake_hdmi[3]; @@ -952,18 +951,9 @@ static int
>kabylake_card_late_probe(struct snd_soc_card *card)
> 	struct kbl_hdmi_pcm *pcm;
> 	struct snd_soc_component *component = NULL;
> 	int err, i = 0;
>-	char jack_name[NAME_SIZE];
>
> 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> 		component = pcm->codec_dai->component;
>-		snprintf(jack_name, sizeof(jack_name),
>-			"HDMI/DP, pcm=%d Jack", pcm->device);
>-		err = snd_soc_card_jack_new(card, jack_name,
>-					SND_JACK_AVOUT, &kabylake_hdmi[i],
>-					NULL, 0);
>-
>-		if (err)
>-			return err;
>
> 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> 						&kabylake_hdmi[i]);
>diff --git a/sound/soc/intel/boards/kbl_rt5660.c
>b/sound/soc/intel/boards/kbl_rt5660.c
>index 3255e00..06411bf 100644
>--- a/sound/soc/intel/boards/kbl_rt5660.c
>+++ b/sound/soc/intel/boards/kbl_rt5660.c
>@@ -447,25 +447,15 @@ static struct snd_soc_dai_link
>kabylake_rt5660_dais[] = {  };
>
>
>-#define NAME_SIZE	32
> static int kabylake_card_late_probe(struct snd_soc_card *card)  {
> 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(card);
> 	struct kbl_hdmi_pcm *pcm;
> 	struct snd_soc_component *component = NULL;
> 	int err, i = 0;
>-	char jack_name[NAME_SIZE];
>
> 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> 		component = pcm->codec_dai->component;
>-		snprintf(jack_name, sizeof(jack_name),
>-			"HDMI/DP, pcm=%d Jack", pcm->device);
>-		err = snd_soc_card_jack_new(card, jack_name,
>-					SND_JACK_AVOUT, &skylake_hdmi[i],
>-					NULL, 0);
>-
>-		if (err)
>-			return err;
>
> 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> 				&skylake_hdmi[i]);
>diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c
>b/sound/soc/intel/boards/kbl_rt5663_max98927.c
>index d714752..9c43c6c 100644
>--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
>+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
>@@ -898,25 +898,15 @@ static struct snd_soc_dai_link kabylake_5663_dais[]
>= {
> 	},
> };
>
>-#define NAME_SIZE	32
> static int kabylake_card_late_probe(struct snd_soc_card *card)  {
> 	struct kbl_rt5663_private *ctx = snd_soc_card_get_drvdata(card);
> 	struct kbl_hdmi_pcm *pcm;
> 	struct snd_soc_component *component = NULL;
> 	int err, i = 0;
>-	char jack_name[NAME_SIZE];
>
> 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> 		component = pcm->codec_dai->component;
>-		snprintf(jack_name, sizeof(jack_name),
>-			"HDMI/DP, pcm=%d Jack", pcm->device);
>-		err = snd_soc_card_jack_new(card, jack_name,
>-					SND_JACK_AVOUT, &skylake_hdmi[i],
>-					NULL, 0);
>-
>-		if (err)
>-			return err;
>
> 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> 						&skylake_hdmi[i]);
>diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
>b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
>index 879f142..8fe4007 100644
>--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
>+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
>@@ -40,7 +40,6 @@
> #define RT5663_DEV_NAME "i2c-10EC5663:00"
> #define RT5514_AIF1_BCLK_FREQ (48000 * 8 * 16)  #define
>RT5514_AIF1_SYSCLK_FREQ 12288000 -#define NAME_SIZE 32
>
> #define DMIC_CH(p) p->list[p->count-1]
>
>@@ -600,18 +599,10 @@ static int kabylake_card_late_probe(struct
>snd_soc_card *card)
> 	struct kbl_hdmi_pcm *pcm;
> 	struct snd_soc_component *component = NULL;
> 	int err, i = 0;
>-	char jack_name[NAME_SIZE];
>
> 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> 		component = pcm->codec_dai->component;
>-		snprintf(jack_name, sizeof(jack_name),
>-			"HDMI/DP,pcm=%d Jack", pcm->device);
>-		err = snd_soc_card_jack_new(card, jack_name,
>-				SND_JACK_AVOUT, &ctx->kabylake_hdmi[i],
>-				NULL, 0);
>
>-		if (err)
>-			return err;
> 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> 						&ctx->kabylake_hdmi[i]);
> 		if (err < 0)
>diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c
>b/sound/soc/intel/boards/skl_hda_dsp_common.c
>index 8b68f41..0f57fc2 100644
>--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
>+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
>@@ -118,19 +118,10 @@ int skl_hda_hdmi_jack_init(struct snd_soc_card
>*card)
> 	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
> 	struct snd_soc_component *component = NULL;
> 	struct skl_hda_hdmi_pcm *pcm;
>-	char jack_name[NAME_SIZE];
> 	int err;
>
> 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> 		component = pcm->codec_dai->component;
>-		snprintf(jack_name, sizeof(jack_name),
>-			 "HDMI/DP, pcm=%d Jack", pcm->device);
>-		err = snd_soc_card_jack_new(card, jack_name,
>-					    SND_JACK_AVOUT, &pcm-
>>hdmi_jack,
>-					    NULL, 0);
>-
>-		if (err)
>-			return err;
>
> 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> 					  &pcm->hdmi_jack);
>diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
>b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
>index 0922106..aca426f 100644
>--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
>+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
>@@ -587,26 +587,15 @@ static struct snd_soc_dai_link skylake_dais[] = {
> 	},
> };
>
>-#define NAME_SIZE	32
> static int skylake_card_late_probe(struct snd_soc_card *card)  {
> 	struct skl_nau8825_private *ctx = snd_soc_card_get_drvdata(card);
> 	struct skl_hdmi_pcm *pcm;
> 	struct snd_soc_component *component = NULL;
> 	int err, i = 0;
>-	char jack_name[NAME_SIZE];
>
> 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> 		component = pcm->codec_dai->component;
>-		snprintf(jack_name, sizeof(jack_name),
>-			"HDMI/DP, pcm=%d Jack", pcm->device);
>-		err = snd_soc_card_jack_new(card, jack_name,
>-					SND_JACK_AVOUT,
>-					&skylake_hdmi[i],
>-					NULL, 0);
>-
>-		if (err)
>-			return err;
>
> 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> 						&skylake_hdmi[i]);
>diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
>b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
>index 8433c52..788a837 100644
>--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
>+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
>@@ -638,26 +638,15 @@ static struct snd_soc_dai_link skylake_dais[] = {
> 	},
> };
>
>-#define NAME_SIZE	32
> static int skylake_card_late_probe(struct snd_soc_card *card)  {
> 	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(card);
> 	struct skl_hdmi_pcm *pcm;
> 	struct snd_soc_component *component = NULL;
> 	int err, i = 0;
>-	char jack_name[NAME_SIZE];
>
> 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> 		component = pcm->codec_dai->component;
>-		snprintf(jack_name, sizeof(jack_name),
>-			"HDMI/DP, pcm=%d Jack", pcm->device);
>-		err = snd_soc_card_jack_new(card, jack_name,
>-					SND_JACK_AVOUT,
>-					&skylake_hdmi[i],
>-					NULL, 0);
>-
>-		if (err)
>-			return err;
>
> 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> 						&skylake_hdmi[i]);
>diff --git a/sound/soc/intel/boards/skl_rt286.c
>b/sound/soc/intel/boards/skl_rt286.c
>index 0e1818d..5d245f5 100644
>--- a/sound/soc/intel/boards/skl_rt286.c
>+++ b/sound/soc/intel/boards/skl_rt286.c
>@@ -473,25 +473,15 @@ static struct snd_soc_dai_link skylake_rt286_dais[] =
>{
> 	},
> };
>
>-#define NAME_SIZE	32
> static int skylake_card_late_probe(struct snd_soc_card *card)  {
> 	struct skl_rt286_private *ctx = snd_soc_card_get_drvdata(card);
> 	struct skl_hdmi_pcm *pcm;
> 	struct snd_soc_component *component = NULL;
> 	int err, i = 0;
>-	char jack_name[NAME_SIZE];
>
> 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> 		component = pcm->codec_dai->component;
>-		snprintf(jack_name, sizeof(jack_name),
>-			"HDMI/DP, pcm=%d Jack", pcm->device);
>-		err = snd_soc_card_jack_new(card, jack_name,
>-					SND_JACK_AVOUT, &skylake_hdmi[i],
>-					NULL, 0);
>-
>-		if (err)
>-			return err;
>
> 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> 						&skylake_hdmi[i]);
>diff --git a/sound/soc/intel/boards/sof_rt5682.c
>b/sound/soc/intel/boards/sof_rt5682.c
>index f28fb98..660e4a6 100644
>--- a/sound/soc/intel/boards/sof_rt5682.c
>+++ b/sound/soc/intel/boards/sof_rt5682.c
>@@ -22,8 +22,6 @@
> #include "../../codecs/rt5682.h"
> #include "../../codecs/hdac_hdmi.h"
>
>-#define NAME_SIZE 32
>-
> #define SOF_RT5682_SSP_CODEC(quirk)		((quirk) & GENMASK(2,
>0))
> #define SOF_RT5682_SSP_CODEC_MASK			(GENMASK(2,
>0))
> #define SOF_RT5682_MCLK_EN			BIT(3)
>@@ -216,7 +214,6 @@ static int sof_card_late_probe(struct snd_soc_card
>*card)  {
> 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
> 	struct snd_soc_component *component = NULL;
>-	char jack_name[NAME_SIZE];
> 	struct sof_hdmi_pcm *pcm;
> 	int err = 0;
> 	int i = 0;
>@@ -227,14 +224,6 @@ static int sof_card_late_probe(struct snd_soc_card
>*card)
>
> 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
> 		component = pcm->codec_dai->component;
>-		snprintf(jack_name, sizeof(jack_name),
>-			 "HDMI/DP, pcm=%d Jack", pcm->device);
>-		err = snd_soc_card_jack_new(card, jack_name,
>-					    SND_JACK_AVOUT, &sof_hdmi[i],
>-					    NULL, 0);
>-
>-		if (err)
>-			return err;
>
> 		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
> 					  &sof_hdmi[i]);
>--
>2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
