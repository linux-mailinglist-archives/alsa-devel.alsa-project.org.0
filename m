Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C4A41C830
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 17:19:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4322616DA;
	Wed, 29 Sep 2021 17:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4322616DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632928767;
	bh=GgdbX8sEkWXl2ViyjTSR27aoOhV2yDDQzCADyCQZi3I=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uHsGvtJ1S/wz7BN/WGeKeb8gL1s8VIQMPA5DoRKTvtunNsNtV/Sp4T/xUJoppJkoN
	 o4q/Ipl67JF7WntFTEGLZsdmQkwyQe1X0uFY8YtVOv2YS3gA1IYDaI95Gq7WUYeBM5
	 /a8eJxP9/QJRiW69zuzxXrmNDHUAI2vQGOXNifOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A94F3F8026D;
	Wed, 29 Sep 2021 17:18:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D44CDF80227; Wed, 29 Sep 2021 17:18:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96933F80105
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 17:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96933F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.b="3CENo1UU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Content-Type:
 References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID
 :Content-Description; bh=rjLdat9yjq8HJiW+J7pr/WIptZGdEDDoclvqwXbUkQY=; b=3CEN
 o1UUUnLZKR38/86YRTizDTxRbVFFPrXI8QuzlwgwFG60+HuKuUzGMEWzwqmRiLPAfHlVxVpIs/28F
 OcFPYiZqfv+3WYXY/yR26RjOyrhOMtrf8Co+ZSgn9XdCjMtotAwuMfccE0M/5hzvJ3Lya5hdRXnqK
 Xz7787w1WfNKf0k9kH54dBk8ME6xdqsPTc/aEkOCUnbbeAGd4YAJkZD61ZMNxIFAVrQhrfTemHlj+
 ufFUDyDV7kdbBxIpj10AG0SgxJoT2NW/mJCkyjpufd8rutsVfoJ3xYM4G8Uf/+tbsPziLWIDw2jUa
 agETGjBFi+l6mtv7OhdH4Z8oBO1vkw==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mVbLL-0005pI-2d; Wed, 29 Sep 2021 16:17:59 +0100
Date: Wed, 29 Sep 2021 16:17:58 +0100
From: John Keeping <john@metanate.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: rawmidi: Fix potential UAF from sequencer
 destruction
Message-ID: <20210929161758.49ce947f.john@metanate.com>
In-Reply-To: <s5hzgrvl9j0.wl-tiwai@suse.de>
References: <20210929113620.2194847-1-john@metanate.com>
 <s5hzgrvl9j0.wl-tiwai@suse.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authenticated: YES
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

On Wed, 29 Sep 2021 16:51:47 +0200
Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 29 Sep 2021 13:36:20 +0200,
> John Keeping wrote:
> > 
> > If the sequencer device outlives the rawmidi device, then
> > snd_rawmidi_dev_seq_free() will run after release_rawmidi_device() has
> > freed the snd_rawmidi structure.
> > 
> > This can easily be reproduced with CONFIG_DEBUG_KOBJECT_RELEASE.
> > 
> > Keep a reference to the rawmidi device until the sequencer has been
> > destroyed in order to avoid this.
> > 
> > Signed-off-by: John Keeping <john@metanate.com>  
> 
> Thanks for the patch.  I wonder, though, how this could be triggered.
> Is this the case where the connected sequencer device is being used
> while the sound card gets released?  Or is it something else?

I'm not sure if it's possible to trigger via the ALSA API; I haven't
found a route that can trigger it, but that doesn't mean there isn't
one :-)

Mostly this is useful to make CONFIG_DEBUG_KOBJECT_RELEASE cleaner.


Regards,
John

> > ---
> >  sound/core/rawmidi.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
> > index 6f30231bdb88..b015f5f69175 100644
> > --- a/sound/core/rawmidi.c
> > +++ b/sound/core/rawmidi.c
> > @@ -1860,6 +1860,7 @@ static void snd_rawmidi_dev_seq_free(struct snd_seq_device *device)
> >  	struct snd_rawmidi *rmidi = device->private_data;
> >  
> >  	rmidi->seq_dev = NULL;
> > +	put_device(&rmidi->dev);
> >  }
> >  #endif
> >  
> > @@ -1936,6 +1937,9 @@ static int snd_rawmidi_dev_register(struct snd_device *device)
> >  #if IS_ENABLED(CONFIG_SND_SEQUENCER)
> >  	if (!rmidi->ops || !rmidi->ops->dev_register) { /* own registration mechanism */
> >  		if (snd_seq_device_new(rmidi->card, rmidi->device, SNDRV_SEQ_DEV_ID_MIDISYNTH, 0, &rmidi->seq_dev) >= 0) {
> > +			/* Ensure we outlive the sequencer (see snd_rawmidi_dev_seq_free). */
> > +			get_device(&rmidi->dev);
> > +
> >  			rmidi->seq_dev->private_data = rmidi;
> >  			rmidi->seq_dev->private_free = snd_rawmidi_dev_seq_free;
> >  			sprintf(rmidi->seq_dev->name, "MIDI %d-%d", rmidi->card->number, rmidi->device);
> > -- 
> > 2.33.0
> >   

