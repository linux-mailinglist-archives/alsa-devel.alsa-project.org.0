Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD9F37B880
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 10:49:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 090F718C1;
	Wed, 12 May 2021 10:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 090F718C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620809369;
	bh=6h2npLciMxeN199iRQ0nPTwPm2GkCbRM/UYxrMX+j5A=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fk8Xv5pVdhb6p7IndsqgRT+0bWV1FQHd3/Lr3X3UwCpKsfpO8S+hG/urb1nszDWey
	 G6FuXGtA8y9XcJNI2ZyL6nOw4tX6/Mh7kCKEnpmzre2UDs58adOyxoa53Kq/j4K3e5
	 gcQPdgQ7xjS2LVCwT7/8jgFc1TJYpkLHXJu9bcug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71968F8026B;
	Wed, 12 May 2021 10:48:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFBF9F80240; Wed, 12 May 2021 10:47:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DF40F8012E
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 10:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DF40F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="jsQUN3QB"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="C6FwwEzK"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id CC1C7A1A3D402;
 Wed, 12 May 2021 10:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1620809272; bh=6h2npLciMxeN199iRQ0nPTwPm2GkCbRM/UYxrMX+j5A=;
 h=To:From:Subject:Date:From;
 b=jsQUN3QBLnha1keNL5QsMe49OyCsw5W/BINSgsy4OBGXpm4qRKRBE+92W1NAjbSD7
 /quElhfciDDAc5WmqR6MzXSs3WQ/e18BtNGYmGmH76mb6XenTRmD3FEgQWrfLaM/DI
 Tztk9/tuyyxX9HaEzP7Vm+WsR/Yn2aByY6FtqKhk=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6KtQR4bdsnL; Wed, 12 May 2021 10:47:47 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id EDADAA1A3D401;
 Wed, 12 May 2021 10:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1620809267; bh=6h2npLciMxeN199iRQ0nPTwPm2GkCbRM/UYxrMX+j5A=;
 h=To:From:Subject:Date:From;
 b=C6FwwEzKuR1D+YrlW8WsAOsakE6SzzpV+hFJwjEjc60XSGBLaHmLG2iQR/Jeqoc4i
 GYwCqG4GRjWXtKdFv/3Cs732+13bxdWdvlr35RDbGRQ7PmVZTGdxHzs2YqBv2mRfDA
 CjbU+tdWrmDi018sbqKRjyk5HBqWjZnIwX7lqDC8=
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>, Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: usb: u_audio: Notifying gadget audio device about starting/stopping
 capture/playback on the host
Message-ID: <da466290-249c-d3d9-7b81-bed6a964a361@ivitera.com>
Date: Wed, 12 May 2021 10:47:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi,

I am trying to notify the user-space code running on USB audio gadget
that the USB host has started/stopped capture/playback.

For stopping action, I am enclosing a patch snippet. I used snd_pcm_stop
code when alsa SPDIF receivers detect a change in the stream
https://github.com/torvalds/linux/blob/master/sound/i2c/other/ak4117.c#L505
When testing the code, aplay/arecord ends, sox just reports alsa device
warning and does not stop. IMO that is the desired outcome - the
snd_pcm_read/write methods returned errors when capture/playback on the
host side stopped.

For starting the capture/playback on the host, perhaps some
snd_ctl_notify on some dedicated alsa control could be used, notifying
the user space application that it can open the gadget audio device?

The patch below does not compile on upstream kernel as it uses changes
not included in upstream yet (explicit feedback EP, samplerate
switching), but I am just discussing principles and options now.

Thank you very much for your opinion and recommendations.

With regards,

Pavel.




diff --git a/drivers/usb/gadget/function/u_audio.c
b/drivers/usb/gadget/function/u_audio.c
index 45367d650c5a..c6cdb844fec1 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -565,6 +565,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 	struct uac_params *params = &audio_dev->params;
 	int req_len, i;

+  dev_dbg(dev, "starting capture with rate %d\n", params->c_srate_active);
 	ep = audio_dev->out_ep;
 	prm = &uac->c_prm;
 	config_ep_by_speed(gadget, &audio_dev->func, ep);
@@ -635,6 +636,23 @@ EXPORT_SYMBOL_GPL(u_audio_start_capture);
 void u_audio_stop_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
+	unsigned long _flags;
+	struct snd_pcm_substream *substream;
+	struct uac_rtd_params *prm;
+
+  dev_dbg(uac->card->dev, "stopping capture\n");
+  prm = &uac->c_prm;
+  if (prm) {
+    substream = prm->ss;
+    if (substream) {
+      dev_dbg(uac->card->dev, "stopping capture substream\n");
+      snd_pcm_stream_lock_irqsave(substream, _flags);
+      if (snd_pcm_running(substream)) {
+        snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
+      }
+      snd_pcm_stream_unlock_irqrestore(substream, _flags);
+    }
+  }

 	if (audio_dev->in_ep_fback)
 		free_ep_fback(&uac->c_prm, audio_dev->in_ep_fback);
@@ -655,7 +673,7 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 	const struct usb_endpoint_descriptor *ep_desc;
 	int req_len, i;

-  dev_dbg(dev, "start playback with rate %d\n", params->p_srate_active);
+  dev_dbg(dev, "starting playback with rate %d\n", params->p_srate_active);
 	ep = audio_dev->in_ep;
 	prm = &uac->p_prm;
 	config_ep_by_speed(gadget, &audio_dev->func, ep);
@@ -715,6 +733,23 @@ EXPORT_SYMBOL_GPL(u_audio_start_playback);
 void u_audio_stop_playback(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
+  unsigned long _flags;
+  struct snd_pcm_substream *substream;
+  struct uac_rtd_params *prm;
+
+  dev_dbg(uac->card->dev, "stopping playback\n");
+  prm = &uac->p_prm;
+  if (prm) {
+    substream = prm->ss;
+    if (substream) {
+      dev_dbg(uac->card->dev, "stopping playback substream\n");
+      snd_pcm_stream_lock_irqsave(substream, _flags);
+      if (snd_pcm_running(substream)) {
+        snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
+      }
+      snd_pcm_stream_unlock_irqrestore(substream, _flags);
+    }
+  }

 	free_ep(&uac->p_prm, audio_dev->in_ep);
 }
