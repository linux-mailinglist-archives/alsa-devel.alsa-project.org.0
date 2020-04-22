Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD51B50FC
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 01:46:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0017816E1;
	Thu, 23 Apr 2020 01:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0017816E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587599212;
	bh=7+zxfnAv+wTSNU9ppe8F28iJ8OuJrAVcwMBgZRhLEAM=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RDj+ARUFguKp410UGtHK/XUVKtV35vFT7nCiz/StpvbMh+7OZ3KbJMTXD+CFftL+4
	 N2j+g8PhXpOVUzrnEjkzVHVPzcPPdBOcWb+WyYPQo2NcR3wu5VuTpYlKblsp1V0y0X
	 3GSRSAIGEETqLE/ocRbnu/A6UhTO1rE4eGYS2WZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21625F800FF;
	Thu, 23 Apr 2020 01:45:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57BA8F80108; Thu, 23 Apr 2020 01:45:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7349BF80108
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 01:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7349BF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="aRQskvRi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=G8Vofhegb4kX8QustYpwWVP3XfSLRPkzvNjo/+z8kFc=; b=aRQskvRi1c0q+baVtg2Ap3ubSC
 V8xDw0q4MnYrOFThP2Sd/wdC/2QPSXRLzbRqKA+g5YdPHDwWLx5J3FW2IYSLLBJsV0iRb6N+0Qe9i
 lte0XZcwAB3v9v0mzshOxPEIAiTDye7Y2yP8InAH+imJOvz1qZRP9Oq7mXiKrRS/DhGQ=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jRP38-000146-H6; Thu, 23 Apr 2020 02:45:02 +0300
Message-ID: <c0cb78664e3acd94f07e59f3a4216c16ab9f497d.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: Apply async workaround for Scarlett
 2i4 2nd gen
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>
Date: Thu, 23 Apr 2020 02:45:01 +0300
In-Reply-To: <s5heesfxo2o.wl-tiwai@suse.de>
References: <7190177d62f349eea7a5d1056924a63fc4270d43.camel@tsoy.me>
 <20200422185522.3347-1-grpintar@gmail.com>
 <a45d18d7922d780f29f89cff855eb30fbdd1fce8.camel@tsoy.me>
 <s5heesfxo2o.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Gregor Pintar <grpintar@gmail.com>, alsa-devel@alsa-project.org
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

В Ср, 22/04/2020 в 22:28 +0200, Takashi Iwai пишет:
> On Wed, 22 Apr 2020 21:26:23 +0200,
> Alexander Tsoy wrote:
> > В Ср, 22/04/2020 в 20:55 +0200, Gregor Pintar пишет:
> > > On Wed, 22 Apr 2020 Alexander Tsoy wrote:
> > > > В Вт, 21/04/2020 в 21:31 +0200, Takashi Iwai пишет:
> > > > > I wonder, though, whether we can correct the rounding error
> > > > > in
> > > > > the
> > > > > driver code, too.
> > > > 
> > > > I'm not sure if it's possible with currently used Q16.16
> > > > arithmetic.
> > > 
> > > Maybe calculate fixed correction shifts (like it would be
> > > feedback)?
> > > Something like leap year.
> > > 
> > > In endpoint.c:
> > > static inline unsigned get_usb_high_speed_rate(unsigned int rate)
> > > {
> > > 	return ((rate << 10) + 62) / 125;
> > > }
> > > I guess 62 tries to round it, but exact number is needed. So
> > > exact
> > > value for
> > > 44100 should be 361267.2. For 48000 it is 360448.
> > > If only we can deliver that 0.2 by shifting rate somehow?
> > > 
> > > At least maybe it would be better to disable sample rates that do
> > > not
> > > divide
> > > by 1000 on SYNC playback endpoints, if there are others sample
> > > rates.
> > > 
> > > But I'm not familar with the code or USB.
> > 
> > I think instead of accumulating the fractional part of fs/fps in
> > Q16.16
> > format we should accumulating remainder of division fs/fps.
> > 
> > So for 44100 Hz and High Speed USB the calculations would be:
> > 
> > fs = 44100
> > fps = 8000
> > rem = 44100 % 8000 = 4100
> > accum = 0
> > packet_size_min = 44100 / 8000 = 5
> > packet_size_max = 44100 + (8000 - 1) / 8000 = 6
> > 
> > 
> > 1. accum += rem = 4100
> >    accum < fps => packet_size = packet_size_min = 5
> > 
> > 2. accum += rem = 8200
> >    accum >= fps => {
> >        packet_size = packet_size_max = 6
> >        accum -= fps = 200
> >    }
> > 
> > 3. accum += rem = 4300
> >    accum < fps => packet_size = packet_size_min = 5
> > 
> > ...
> > 
> > 80. accum += rem = 8000
> >     accum >= fps => {
> >         packet_size = packet_size_max = 6
> >         accum -= fps = 0
> >     }
> > ...
> 
> Yeah, something like that is what I had in my mind.
> It'd be greatly appreciated if someone can experiment it.
> Unfortunately I have no proper USB-audio device now at hands...

OK, here is a quick hacky patch, that seems to work for me:


diff --git a/sound/usb/card.h b/sound/usb/card.h
index 395403a2d33f..fc5e3e391219 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -84,6 +84,10 @@ struct snd_usb_endpoint {
 	dma_addr_t sync_dma;		/* DMA address of syncbuf */
 
 	unsigned int pipe;		/* the data i/o pipe */
+	unsigned int framesize[2];	/* min/max frame size in samples */
+	unsigned int sample_rem;	/* remainder of division fs/fps */
+	unsigned int sample_accum;	/* fs % fps accumulator */
+	unsigned int fps;		/* frames per second */
 	unsigned int freqn;		/* nominal sampling rate in fs/fps in Q16.16 format */
 	unsigned int freqm;		/* momentary sampling rate in fs/fps in Q16.16 format */
 	int	   freqshift;		/* how much to shift the feedback value to get Q16.16 */
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 4a9a2f6ef5a4..e0e4dc5cfe0e 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -124,12 +124,12 @@ int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep)
 
 /*
  * For streaming based on information derived from sync endpoints,
- * prepare_outbound_urb_sizes() will call next_packet_size() to
+ * prepare_outbound_urb_sizes() will call slave_next_packet_size() to
  * determine the number of samples to be sent in the next packet.
  *
- * For implicit feedback, next_packet_size() is unused.
+ * For implicit feedback, slave_next_packet_size() is unused.
  */
-int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep)
+int snd_usb_endpoint_slave_next_packet_size(struct snd_usb_endpoint *ep)
 {
 	unsigned long flags;
 	int ret;
@@ -146,6 +146,32 @@ int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep)
 	return ret;
 }
 
+/*
+ * For adaptive and synchronous endpoints, prepare_outbound_urb_sizes()
+ * will call next_packet_size() to determine the number of samples to be
+ * sent in the next packet.
+ */
+int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep)
+{
+	unsigned long flags;
+	int ret;
+
+	if (ep->fill_max)
+		return ep->maxframesize;
+
+	spin_lock_irqsave(&ep->lock, flags);
+	ep->sample_accum += ep->sample_rem;
+	if (ep->sample_accum >= ep->fps) {
+		ep->sample_accum -= ep->fps;
+		ret = ep->framesize[1];
+	} else {
+		ret = ep->framesize[0];
+	}
+	spin_unlock_irqrestore(&ep->lock, flags);
+
+	return ret;
+}
+
 static void retire_outbound_urb(struct snd_usb_endpoint *ep,
 				struct snd_urb_ctx *urb_ctx)
 {
@@ -190,6 +216,8 @@ static void prepare_silent_urb(struct snd_usb_endpoint *ep,
 
 		if (ctx->packet_size[i])
 			counts = ctx->packet_size[i];
+		else if (ep->sync_master)
+			counts = snd_usb_endpoint_slave_next_packet_size(ep);
 		else
 			counts = snd_usb_endpoint_next_packet_size(ep);
 
@@ -874,10 +902,17 @@ int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
 	ep->maxpacksize = fmt->maxpacksize;
 	ep->fill_max = !!(fmt->attributes & UAC_EP_CS_ATTR_FILL_MAX);
 
-	if (snd_usb_get_speed(ep->chip->dev) == USB_SPEED_FULL)
+	if (snd_usb_get_speed(ep->chip->dev) == USB_SPEED_FULL) {
 		ep->freqn = get_usb_full_speed_rate(rate);
-	else
+		ep->fps = 1000;
+	} else {
 		ep->freqn = get_usb_high_speed_rate(rate);
+		ep->fps = 8000;
+	}
+
+	ep->sample_rem = rate % ep->fps;
+	ep->framesize[0] = rate / ep->fps;
+	ep->framesize[1] = (rate + (ep->fps - 1)) / ep->fps;
 
 	/* calculate the frequency in 16.16 format */
 	ep->freqm = ep->freqn;
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index 63a39d4fa8d8..d23fa0a8c11b 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -28,6 +28,7 @@ void snd_usb_endpoint_release(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_free(struct snd_usb_endpoint *ep);
 
 int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep);
+int snd_usb_endpoint_slave_next_packet_size(struct snd_usb_endpoint *ep);
 int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep);
 
 void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index a4e4064f9aee..b50965ab3b3a 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1579,6 +1579,8 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 	for (i = 0; i < ctx->packets; i++) {
 		if (ctx->packet_size[i])
 			counts = ctx->packet_size[i];
+		else if (ep->sync_master)
+			counts = snd_usb_endpoint_slave_next_packet_size(ep);
 		else
 			counts = snd_usb_endpoint_next_packet_size(ep);
 
-- 
2.25.3


