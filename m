Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D55941D7B8
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 12:29:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C71816A9;
	Thu, 30 Sep 2021 12:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C71816A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632997769;
	bh=f2AJW+ZwZuzBbSTF2+h3iIu78D7riEZPBIHRLhudKRQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ikyU2yZmfftCg2JBUj12IePtx2C43yLFBcu9k6U5Ha0v6wOZLbHGATy0azU3ofjMf
	 bBLJ/kaJxAGXih1TkloHUZejPZfewPba5vrVRI8E5kGvY1QUWvZZ7PmTmPIuVNZEMP
	 zKzwRIQE9/iXbdMUvWJRNfP5hsOovXDb6AtX2W8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFB3CF80113;
	Thu, 30 Sep 2021 12:28:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE7DFF804AD; Thu, 30 Sep 2021 12:28:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29A70F80218
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 12:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29A70F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.b="jGC48Kly"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Content-Type:
 References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID
 :Content-Description; bh=gvuAQCRw/XgU+VwBMCubv+50avjq2QI/UZMSE20Vryg=; b=jGC4
 8KlySDCZaLLu0jF60pqzGinnCKWUB155J745yCcZ6kL0mhR2nB/0iyHwVxC1YLQ3J2GdIovt5FEPZ
 bcU9sTS6U+KEig4rnmPGEYIhRbTMaqkRmHJiQqL5mYNZtO0hX930frISATwUFj4c4/dZzWV6OVYCe
 2QfWINZ5dH2cGvB8+o8Q0SRihMZArfnJxOcdqJEUaPWSUrQAUXvFWC59jUu156uzwttMy/dJ3ZCwc
 Md2snBEV+vjrsa3y4gBRiSA6wDYapgJUsK/4K5UsWVdIjc65z27G0OWtbJ2/N5/VExQKCDULkeVD5
 ZxYX5oHyiZD5LoLGdThBScBpQ/5/IQ==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mVtIA-000314-AG; Thu, 30 Sep 2021 11:27:54 +0100
Date: Thu, 30 Sep 2021 11:27:53 +0100
From: John Keeping <john@metanate.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: rawmidi: Fix potential UAF from sequencer
 destruction
Message-ID: <20210930112753.40e1efa6.john@metanate.com>
In-Reply-To: <s5hczoqlfgn.wl-tiwai@suse.de>
References: <20210929113620.2194847-1-john@metanate.com>
 <s5hzgrvl9j0.wl-tiwai@suse.de>
 <20210929161758.49ce947f.john@metanate.com>
 <s5hv92jl7t2.wl-tiwai@suse.de>
 <20210929175632.50b78be8.john@metanate.com>
 <s5hfstmlgkj.wl-tiwai@suse.de> <s5hczoqlfgn.wl-tiwai@suse.de>
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

On Thu, 30 Sep 2021 08:55:52 +0200
Takashi Iwai <tiwai@suse.de> wrote:

> On Thu, 30 Sep 2021 08:31:56 +0200,
> Takashi Iwai wrote:
> > 
> > On Wed, 29 Sep 2021 18:56:32 +0200,
> > John Keeping wrote:
> > > 
> > > On Wed, 29 Sep 2021 17:28:57 +0200
> > > Takashi Iwai <tiwai@suse.de> wrote:
> > > 
> > > > On Wed, 29 Sep 2021 17:17:58 +0200,
> > > > John Keeping wrote:
> > > > > 
> > > > > On Wed, 29 Sep 2021 16:51:47 +0200
> > > > > Takashi Iwai <tiwai@suse.de> wrote:
> > > > >   
> > > > > > On Wed, 29 Sep 2021 13:36:20 +0200,
> > > > > > John Keeping wrote:  
> > > > > > > 
> > > > > > > If the sequencer device outlives the rawmidi device, then
> > > > > > > snd_rawmidi_dev_seq_free() will run after release_rawmidi_device() has
> > > > > > > freed the snd_rawmidi structure.
> > > > > > > 
> > > > > > > This can easily be reproduced with CONFIG_DEBUG_KOBJECT_RELEASE.
> > > > > > > 
> > > > > > > Keep a reference to the rawmidi device until the sequencer has been
> > > > > > > destroyed in order to avoid this.
> > > > > > > 
> > > > > > > Signed-off-by: John Keeping <john@metanate.com>    
> > > > > > 
> > > > > > Thanks for the patch.  I wonder, though, how this could be triggered.
> > > > > > Is this the case where the connected sequencer device is being used
> > > > > > while the sound card gets released?  Or is it something else?  
> > > > > 
> > > > > I'm not sure if it's possible to trigger via the ALSA API; I haven't
> > > > > found a route that can trigger it, but that doesn't mean there isn't
> > > > > one :-)
> > > > > 
> > > > > Mostly this is useful to make CONFIG_DEBUG_KOBJECT_RELEASE cleaner.  
> > > > 
> > > > Hm, then could you check whether the patch below papers over it
> > > > instead?
> > > 
> > > No, this patch doesn't solve it.  The issue is that the effect of the
> > > final device_put() is delayed from the time it is called and there is no
> > > way to guarantee the ordering without ensuring the sequencer has been
> > > destroyed before the final reference to the rawmidi device is put.
> > > 
> > > Both of the functions involved are called from the core
> > > device::release() hook.
> > > 
> > > I'm using the patch below to easily check that the sequencer has been
> > > freed before the rawmidi data.  This can easily be triggered by
> > > unplugging a USB MIDI device (it's not 100% since the kobject release
> > > delays are random).
> > 
> > Hm, it's strange.  I suppose you're *not* using the MIDI device,
> > right?
> > 
> > The release path for the USB-audio driver is:
> >   usb_audio_disconnect() ->
> >     snd_card_free_when_closed() ->
> >       release_card_device() (via put_device(&card->card_dev)) ->
> >         snd_card_do_free()
> > 
> > And here in snd_card_do_free(), the snd_device free-callback chains
> > are called at the beginning (snd_device_free_all()).
> > As it's executed in a reverse loop, snd_rawmidi_dev_seq_free() shall
> > be called before snd_rawmidi_dev_free().  Since the final put_device()
> > for the rawmidi device is called in the latter function, the device
> > release must not happen before snd_rawmidi_dev_seq_free()...
> 
> Correction: now I finally understood what I misunderstood.
> Although the snd_device call chain mentioned above itself is correct,
> the snd_rawmidi_dev_seq_free() function isn't called directly from the
> snd_device chain, but it's rater the own private_free of
> snd_seq_device object.  That is, the call of snd_seq_device
> private_free is done in a wrong place; it should be called in the
> snd_device call chain instead of the device release.
> 
> A fix patch is something like below.  Could you check whether this
> fixes the problem?

Yes, this fixes it!


Thanks,
John

> --- a/sound/core/seq_device.c
> +++ b/sound/core/seq_device.c
> @@ -156,6 +156,8 @@ static int snd_seq_device_dev_free(struct snd_device *device)
>  	struct snd_seq_device *dev = device->device_data;
>  
>  	cancel_autoload_drivers();
> +	if (dev->private_free)
> +		dev->private_free(dev);
>  	put_device(&dev->dev);
>  	return 0;
>  }
> @@ -183,11 +185,7 @@ static int snd_seq_device_dev_disconnect(struct snd_device *device)
>  
>  static void snd_seq_dev_release(struct device *dev)
>  {
> -	struct snd_seq_device *sdev = to_seq_dev(dev);
> -
> -	if (sdev->private_free)
> -		sdev->private_free(sdev);
> -	kfree(sdev);
> +	kfree(to_seq_dev(dev));
>  }
>  
>  /*
> 
> 
> 

