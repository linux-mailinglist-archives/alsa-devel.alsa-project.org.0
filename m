Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2623541EDAB
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 14:40:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9317616DC;
	Fri,  1 Oct 2021 14:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9317616DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633092018;
	bh=dearztGRw1GXxn/uQ+0slvG+eWn3LhM4LC+VUDWRPrQ=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fGT0FVASDCB+SiWHj2RMqOl6CjByZ6Proc4i5P1mBbTyLaWSy3JV9oYtRJc+rgHjE
	 F9DmAeWBVjsyYs+noj3hq1Qj92cQnyN1avklyvDmns0XgptAMvucCysxnd6gHol/7+
	 jjwsLrREGFcqvOp6e4OQ1ksk73AX4ZRWaxL6E3ZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20261F80165;
	Fri,  1 Oct 2021 14:39:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A3E0F80245; Fri,  1 Oct 2021 14:38:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C7A4F800F3
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 14:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C7A4F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="CxO0ssxt"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="GCde8NMD"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id E4A68A1A3D401;
 Fri,  1 Oct 2021 14:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1633091931; bh=dearztGRw1GXxn/uQ+0slvG+eWn3LhM4LC+VUDWRPrQ=;
 h=Subject:From:To:References:Cc:Date:In-Reply-To:From;
 b=CxO0ssxtIFcJbvipIE3r0Jz4iJt0mx+6xdZLmSl9Ra8y58hStoSnCLnuzU9LrPolG
 K2/98xBY+z3GcXrNVcZU1/6Y08nSNLhakQDUz6gTZ5vWSDl0VhQcEKNucVsxnZ5gi9
 H4Uuw6r2yxVzDT58+p1fG//XXNldYeV4weGAx8xY=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NNRtXa_1KyZv; Fri,  1 Oct 2021 14:38:46 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 49B6DA1A3D400;
 Fri,  1 Oct 2021 14:38:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1633091926; bh=dearztGRw1GXxn/uQ+0slvG+eWn3LhM4LC+VUDWRPrQ=;
 h=Subject:From:To:References:Cc:Date:In-Reply-To:From;
 b=GCde8NMDseTJAhC/7FXLyfU1g7g9/1iZORxMItchHO5339lQMk8kIKD6ntlQ9b1t0
 k4jbu3+fZ2spSkdbHUlkQADBss8wMIIQnh6Nt2twPBt9qmejbEYmtoVzle8cOpMgdX
 IWi6yI3a3i8QlhRzNazE0Glh22sxWsZh0YeQ335I=
Subject: Re: RFC: usb: gadget: u_audio: Notifying gadget that host started
 playback/capture?
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <6ebc2456-a46b-bc47-da76-7a341414c1fb@ivitera.com>
Message-ID: <35766f0f-784d-d37a-6d07-665f9ee88331@ivitera.com>
Date: Fri, 1 Oct 2021 14:38:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6ebc2456-a46b-bc47-da76-7a341414c1fb@ivitera.com>
Content-Type: multipart/mixed; boundary="------------210795DD75CC1BC4DE8E7EF2"
Content-Language: en-US
Cc: Julian Scheel <julian@jusst.de>, Takashi Iwai <tiwai@suse.de>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
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

This is a multi-part message in MIME format.
--------------210795DD75CC1BC4DE8E7EF2
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Dne 08. 09. 21 v 10:21 Pavel Hofman napsal(a):
> Hi,
> 
> The current audio gadget has no way to inform the gadget side that the 
> host side has started playback/capture and that gadget-side alsa 
> processes should be started.
> 
> Playback/capture processes on the host side do not get stuck without the 
> gadget side consuming/producing data (OUT requests are ignored in 
> u_audio_iso_complete, IN ones send initial zeros in their req->buf).
> 
> However, playback/capture processes on the gadget side get stuck without 
> the host side sending playback OUT packets or capture IN requests and 
> time out with error. If there was a way to inform the gadget side that 
> playback/capture has started on the host side, the gadget clients could 
> react accordingly.
> 

I drafted a simple patch for u_audio.c which defines read-only boolean 
ctl elems "Capture Requested" and "Playback Requested". Their values are 
set/reset in methods u_audio_start_capture/playback and 
u_audio_stop_capture/playback, i.e. at changes of respective altsettings 
from 0 to 1 and back. Every ctl elem value change sends notification via 
snd_ctl_notify. The principle works OK for capture/playback start/stop 
on the host, as monitored by alsactl:

pi@raspberrypi:~ $ alsactl monitor hw:UAC2Gadget
node hw:UAC2Gadget, #4 (3,0,0,Capture Requested,0) VALUE
node hw:UAC2Gadget, #4 (3,0,0,Capture Requested,0) VALUE
node hw:UAC2Gadget, #3 (3,0,0,Playback Requested,0) VALUE
node hw:UAC2Gadget, #3 (3,0,0,Playback Requested,0) VALUE

However at enumeration the USB host switches both playback and capture 
altsettings repeatedly, generating "fake" events from the gadget side 
POW. The host even sends regular-sized EP-OUT packets filled with zeros 
during enumeration (tested on linux only for now).

Please is there any way to "detect" the enumeration stage to mask out 
the "fake" playback/capture start/stop events?

The attached patch does not apply cleanly to mainline u_audio.c because 
it's rebased on other patches not submitted yet but it's only a 
discussion inducer for now.

Thanks a lot,

Pavel.

--------------210795DD75CC1BC4DE8E7EF2
Content-Type: text/x-patch; charset=UTF-8;
 name="patch.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="patch.diff"

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index e395be32275c..69aef4e3677d 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -34,6 +34,8 @@ enum {
 	UAC_VOLUME_CTRL,
 	UAC_CAPTURE_RATE_CTRL,
 	UAC_PLAYBACK_RATE_CTRL,
+	UAC_CAPTURE_REQ_CTRL,
+	UAC_PLAYBACK_REQ_CTRL,
 };
 
 /* Runtime data params for one stream */
@@ -63,6 +65,9 @@ struct uac_rtd_params {
   s16 volume_min, volume_max, volume_res;
   s16 volume;
   int mute;
+  /* playback/capture_is_requested and their state */
+  struct snd_kcontrol *snd_kctl_is_req;
+  int is_requested;
 
   spinlock_t lock; /* lock for control transfers */
 
@@ -542,6 +547,8 @@ int u_audio_set_playback_srate(struct g_audio *audio_dev, int srate)
 }
 EXPORT_SYMBOL_GPL(u_audio_set_playback_srate);
 
+static void update_is_requested(struct uac_rtd_params *prm, unsigned int val);
+
 int u_audio_start_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
@@ -553,6 +560,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 	struct uac_params *params = &audio_dev->params;
 	int req_len, i;
 
+	update_is_requested(&uac->c_prm, 1);
 	ep = audio_dev->out_ep;
 	prm = &uac->c_prm;
 	config_ep_by_speed(gadget, &audio_dev->func, ep);
@@ -625,6 +633,7 @@ void u_audio_stop_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
 
+	update_is_requested(&uac->c_prm, 0);
 	if (audio_dev->in_ep_fback)
 		free_ep_fback(&uac->c_prm, audio_dev->in_ep_fback);
 	free_ep(&uac->c_prm, audio_dev->out_ep);
@@ -645,6 +654,7 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 	int req_len, i;
 	unsigned int p_interval, p_pktsize, p_pktsize_residue;
 
+	update_is_requested(&uac->p_prm, 1);
 	dev_dbg(dev, "start playback with rate %d\n", params->p_srate_active);
 	ep = audio_dev->in_ep;
 	prm = &uac->p_prm;
@@ -711,6 +721,7 @@ void u_audio_stop_playback(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
 
+	update_is_requested(&uac->p_prm, 0);
 	free_ep(&uac->p_prm, audio_dev->in_ep);
 }
 EXPORT_SYMBOL_GPL(u_audio_stop_playback);
@@ -1027,6 +1038,27 @@ static int uac_pcm_rate_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int u_audio_stream_requested_info(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+	uinfo->value.integer.step = 1;
+
+	return 0;
+}
+
+static int u_audio_stream_requested_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
+	ucontrol->value.integer.value[0] = prm->is_requested;
+	return 0;
+}
+
+
 static struct snd_kcontrol_new u_audio_controls[]  = {
   [UAC_FBACK_CTRL] {
     .iface =        SNDRV_CTL_ELEM_IFACE_PCM,
@@ -1072,8 +1104,35 @@ static struct snd_kcontrol_new u_audio_controls[]  = {
 		.get = uac_pcm_rate_get,
 		.private_value = SNDRV_PCM_STREAM_PLAYBACK,
 		},
+  [UAC_CAPTURE_REQ_CTRL] {
+    .iface =        SNDRV_CTL_ELEM_IFACE_PCM,
+    .name =         "Capture Requested",
+    .access = SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+    .info =         u_audio_stream_requested_info,
+    .get =          u_audio_stream_requested_get,
+    .private_value = SNDRV_PCM_STREAM_CAPTURE,
+  },
+  [UAC_PLAYBACK_REQ_CTRL] {
+    .iface =        SNDRV_CTL_ELEM_IFACE_PCM,
+    .name =         "Playback Requested",
+    .access = SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+    .info =         u_audio_stream_requested_info,
+    .get =          u_audio_stream_requested_get,
+    .private_value = SNDRV_PCM_STREAM_PLAYBACK,
+  },
 };
 
+static void update_is_requested(struct uac_rtd_params *prm, unsigned int val) {
+	struct snd_kcontrol *kctl = prm->snd_kctl_is_req;
+
+	if (prm->is_requested != val) {
+		prm->is_requested = val;
+		snd_ctl_notify(prm->uac->card, SNDRV_CTL_EVENT_MASK_VALUE,
+				&kctl->id);
+		pr_debug("Setting '%s' to %d", kctl->id.name, val);
+	}
+}
+
 int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 					const char *card_name)
 {
@@ -1209,6 +1268,38 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 		err = snd_ctl_add(card, kctl);
 		if (err < 0)
 			goto snd_fail;
+
+		kctl = snd_ctl_new1(&u_audio_controls[UAC_PLAYBACK_REQ_CTRL],
+						&uac->p_prm);
+		if (!kctl) {
+			err = -ENOMEM;
+			goto snd_fail;
+		}
+
+		kctl->id.device = pcm->device;
+		kctl->id.subdevice = 0;
+
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
+			goto snd_fail;
+		(&uac->p_prm)->snd_kctl_is_req = kctl;
+	}
+
+	if (c_chmask) {
+		kctl = snd_ctl_new1(&u_audio_controls[UAC_CAPTURE_REQ_CTRL],
+					&uac->c_prm);
+		if (!kctl) {
+			err = -ENOMEM;
+			goto snd_fail;
+		}
+
+		kctl->id.device = pcm->device;
+		kctl->id.subdevice = 0;
+
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
+			goto snd_fail;
+		(&uac->c_prm)->snd_kctl_is_req = kctl;
 	}
 
 	for (i = 0; i <= SNDRV_PCM_STREAM_LAST; i++) {

--------------210795DD75CC1BC4DE8E7EF2--
