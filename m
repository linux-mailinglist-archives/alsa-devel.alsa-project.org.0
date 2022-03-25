Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C372A4E6EF6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 08:34:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5733C1636;
	Fri, 25 Mar 2022 08:33:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5733C1636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648193685;
	bh=VZflLcvLUu9JscJnRV3GLcTx+CtZIYEATLTdmDgPf+s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=agxmohgn8/uO8Cfa4ElMwoovCCW4oByD/rHLAbmowE3Z4qvbpHjZETLmAclAYpL3u
	 0duXFR0oOLgApHvrCGeAvMnkPlE8ePzKJzjOMGFzPJ6H4ZvgtkB4iOsAe669tyW1PT
	 dYPrwxvCJBJQw5LeKF6rOMc+xKEBWelzhOfapR0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE0C8F801F7;
	Fri, 25 Mar 2022 08:33:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EA19F80162; Fri, 25 Mar 2022 08:33:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 988FAF80115
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 08:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 988FAF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="GGNvzFbo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F244961B44;
 Fri, 25 Mar 2022 07:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B9DC340E9;
 Fri, 25 Mar 2022 07:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648193603;
 bh=VZflLcvLUu9JscJnRV3GLcTx+CtZIYEATLTdmDgPf+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GGNvzFboSXETPBY7RDASQj7rJ9DTDmfDSf0uwZqg4dAnQy37pKYXA/vuPm6Z7b3AF
 Hwrh6De5DQoTtzABxsOzAcDTHcuMd6FAGOq5/5qdJU/xQxoYpV5yGJs4JcJptaGZ48
 yTVW7WIkWqsxqUyU3lfE5KdUx1VGuCfHZRcx9Lvs=
Date: Fri, 25 Mar 2022 08:33:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oh Eomji <eomji.oh@samsung.com>
Subject: Re: [PATCH v1 2/3] sound: usb: Calling vendor's call-back function
 within usb audio operation.
Message-ID: <Yj1wQP6Yj6W9rrcu@kroah.com>
References: <1648109444-196321-1-git-send-email-eomji.oh@samsung.com>
 <CGME20220324081348epcas2p48d3a24dfdfd8d01e9bf350571b18ffff@epcas2p4.samsung.com>
 <1648109444-196321-3-git-send-email-eomji.oh@samsung.com>
 <YjwtDo7b/RMHr45e@kroah.com> <20220325071357.GB123495@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325071357.GB123495@ubuntu>
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 Pavel Skripkin <paskripkin@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>
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

On Fri, Mar 25, 2022 at 04:13:57PM +0900, Oh Eomji wrote:
> On Thu, Mar 24, 2022 at 09:34:22AM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Mar 24, 2022 at 05:10:43PM +0900, Oh Eomji wrote:
> > > When a new interface is connected or removed, the call-back functions
> > > are called to transmit a command to the hardware.
> > > 
> > > Signed-off-by: Oh Eomji <eomji.oh@samsung.com>
> > > ---
> > >  sound/usb/pcm.c    | 37 +++++++++++++++++++++++++++++++++++++
> > >  sound/usb/stream.c |  2 ++
> > >  2 files changed, 39 insertions(+)
> > > 
> > > diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> > > index cec6e91a..4bae4ba 100644
> > > --- a/sound/usb/pcm.c
> > > +++ b/sound/usb/pcm.c
> > > @@ -144,6 +144,8 @@ find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
> > >  			found = fp;
> > >  			cur_attr = attr;
> > >  		}
> > > +
> > > +		snd_vendor_set_pcm_binterval(fp, found, &cur_attr, &attr);
> > >  	}
> > >  	return found;
> > >  }
> > > @@ -434,6 +436,7 @@ static int configure_endpoints(struct snd_usb_audio *chip,
> > >  			       struct snd_usb_substream *subs)
> > >  {
> > >  	int err;
> > > +	struct usb_interface *iface;
> > >  
> > >  	if (subs->data_endpoint->need_setup) {
> > >  		/* stop any running stream beforehand */
> > > @@ -442,6 +445,13 @@ static int configure_endpoints(struct snd_usb_audio *chip,
> > >  		err = snd_usb_endpoint_configure(chip, subs->data_endpoint);
> > >  		if (err < 0)
> > >  			return err;
> > > +
> > > +		iface = usb_ifnum_to_if(chip->dev, subs->data_endpoint->iface);
> > > +		err = snd_vendor_set_pcm_intf(iface, subs->data_endpoint->iface,
> > > +				subs->data_endpoint->altsetting, subs->direction);
> > > +		if (err < 0)
> > > +			return err;
> > > +
> > >  		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
> > >  	}
> > >  
> > > @@ -616,8 +626,18 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
> > >  	struct snd_pcm_runtime *runtime = substream->runtime;
> > >  	struct snd_usb_substream *subs = runtime->private_data;
> > >  	struct snd_usb_audio *chip = subs->stream->chip;
> > > +	struct snd_usb_endpoint *ep = subs->data_endpoint;
> > >  	int ret;
> > >  
> > > +	ret = snd_vendor_set_pcm_buf(subs->dev, subs->cur_audiofmt->iface);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (!subs->cur_audiofmt) {
> > > +		dev_err(&subs->dev->dev, "no format is specified\n");
> > > +		return -ENXIO;
> > > +	}
> > > +
> > >  	ret = snd_usb_lock_shutdown(chip);
> > >  	if (ret < 0)
> > >  		return ret;
> > > @@ -630,6 +650,13 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
> > >  	if (ret < 0)
> > >  		goto unlock;
> > >  
> > > +	if (snd_vendor_get_ops()) {
> > > +		ret = snd_vendor_set_rate(ep->cur_audiofmt->iface,
> > > +				ep->cur_rate, ep->cur_audiofmt->altsetting);
> > > +		if (!ret)
> > > +			goto unlock;
> > > +	}
> > > +
> > >  	/* reset the pointer */
> > >  	subs->buffer_bytes = frames_to_bytes(runtime, runtime->buffer_size);
> > >  	subs->inflight_bytes = 0;
> > > @@ -1104,6 +1131,11 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
> > >  	struct snd_usb_substream *subs = &as->substream[direction];
> > >  	int ret;
> > >  
> > > +	ret = snd_vendor_set_pcm_connection(subs->dev, SOUND_PCM_OPEN,
> > > +					    direction);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >  	runtime->hw = snd_usb_hardware;
> > >  	/* need an explicit sync to catch applptr update in low-latency mode */
> > >  	if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
> > > @@ -1137,6 +1169,11 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
> > >  	struct snd_usb_substream *subs = &as->substream[direction];
> > >  	int ret;
> > >  
> > > +	ret = snd_vendor_set_pcm_connection(subs->dev, SOUND_PCM_CLOSE,
> > > +					    direction);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >  	snd_media_stop_pipeline(subs);
> > >  
> > >  	if (!snd_usb_lock_shutdown(subs->stream->chip)) {
> > > diff --git a/sound/usb/stream.c b/sound/usb/stream.c
> > > index ceb93d7..26ca696 100644
> > > --- a/sound/usb/stream.c
> > > +++ b/sound/usb/stream.c
> > > @@ -1227,6 +1227,8 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
> > >  		snd_usb_init_pitch(chip, fp);
> > >  		snd_usb_init_sample_rate(chip, fp, fp->rate_max);
> > >  		usb_set_interface(chip->dev, iface_no, altno);
> > > +		if (protocol > UAC_VERSION_1)
> > 
> > Why the protocol check?  That's not documented in your changelog
> > anywhere :(
> > 
> >
> Hi,
> 
> In kernel 5.10, set_interface is performed when the protocol is more
> than UAC_VERSION_1 in the snd_usb_init_sample_rate function.
> There was an issue here, so there is a history of adding to perform
> snd_vendor_set_interface when the protocol is more than UAC_VERSION_1.
> But I don't think I need this in kerenel 5.15, so I'll delete it.

5.15 is very old, you are working on 5.18-rc1 now :)

