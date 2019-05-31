Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF02E31180
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 17:45:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F183857;
	Fri, 31 May 2019 17:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F183857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559317539;
	bh=+X2RID94QoAzFOIbHcIxqmH28PlfTMRj0k65/uHgeos=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iIfr741AT3EC2KdHPkjxgCS1yyh70rToDo+9lK4aF5CwOocAZWGGWie2K3Ls7NbBQ
	 pC3PSzISid2pUA1I896dzhdLkyQD0ja6rrgcAdFy+AU9oekp1MO/ULisdwFiz/U/+K
	 P00rnv4Yel7R2EdUnjeJJJQmcQChFqZDyFY7SuOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01107F896E5;
	Fri, 31 May 2019 17:44:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 449CDF896E8; Fri, 31 May 2019 17:44:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56DCAF896E4
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 17:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56DCAF896E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 08:43:54 -0700
X-ExtLoop1: 1
Received: from hoangng2-mobl.amr.corp.intel.com ([10.254.19.252])
 by fmsmga007.fm.intel.com with ESMTP; 31 May 2019 08:43:53 -0700
Message-ID: <d62f5761b8fb4c156dc775fb0e0426c262d6bdcc.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Fri, 31 May 2019 08:43:53 -0700
In-Reply-To: <s5h5zpqskhw.wl-tiwai@suse.de>
References: <20190530201828.2648-1-ranjani.sridharan@linux.intel.com>
 <684fe069-d2fb-f716-bd3e-67f0c7a52de0@linux.intel.com>
 <s5hftovtaq0.wl-tiwai@suse.de>
 <e8bdeb7b299a11932ec98df805045a2871c0f79d.camel@linux.intel.com>
 <s5hef4en4ct.wl-tiwai@suse.de>
 <0f75caffee97f7cec5a1bd31e9f3eb3ea1a12948.camel@linux.intel.com>
 <s5hr28esow9.wl-tiwai@suse.de> <s5hmuj2sno7.wl-tiwai@suse.de>
 <6e0653565e70e877974f92e94cf4ae49caee3e15.camel@linux.intel.com>
 <s5h5zpqskhw.wl-tiwai@suse.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: hda: increment codec device refcount
 when it is added to the card
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

> > Hi Takashi,
> > 
> > No, this actually comes at the second step in the case of SOF (ie
> > after
> > the machine driver is unregistered).
> >  
> > Actually, I just found out what's causing the issue. It is the call
> > to
> > snd_hda_codec_dev_free() which calls put_device() when
> > snd_card_free()
> > is invoked. So, adding a get_device() in snd_hda_codec_device_new()
> > would make the refcount balanced. 
> > 
> > On the other hand, removing the put_device() in
> > snd_hda_codec_dev_free() would also address the problem. I'm not
> > sure
> > which would be the preferred route.
> 
> The latter one, I'd say.
> 
> Actually the difference between ASoC and the legacy HDA bus is who
> releases the device object.  For HDA legacy bus, it's supposed to be
> done via snd_device_free() chain, while ASoC bus releases explicitly
> as shown in my previous post.
> 
> So, if any, I'd paper over it like below.
OK, makes sense. Let me send a V2 with the change. 

Also, should I also look into adding the change to make hdac_hdmi codec
card managed as well?

Thanks,
Ranjani

> 
> 
> thanks,
> 
> Takashi
> 
> --- a/sound/pci/hda/hda_codec.c
> +++ b/sound/pci/hda/hda_codec.c
> @@ -840,7 +840,12 @@ static int snd_hda_codec_dev_free(struct
> snd_device *device)
>  	if (codec->core.type == HDA_DEV_LEGACY)
>  		snd_hdac_device_unregister(&codec->core);
>  	codec_display_power(codec, false);
> -	put_device(hda_codec_dev(codec));
> +	/*
> +	 * again, ASoC HD-audio bus manages differently; it's released
> in
> +	 * snd_hdac_ext_bus_device_remove() explicitly
> +	 */
> +	if (codec->core.type == HDA_DEV_LEGACY)
> +		put_device(hda_codec_dev(codec));
>  	return 0;
>  }
>  

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
