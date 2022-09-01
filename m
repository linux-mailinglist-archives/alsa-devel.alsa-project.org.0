Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E692A5A9491
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 12:27:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EF341F4;
	Thu,  1 Sep 2022 12:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EF341F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662028020;
	bh=VMwmHupUXrGX77R6GQ77Rc8h7fCwyJZ5ObT2MiVtqAE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MQc6T3+hPcPL6ybWj1dZxHQ4Vg0lNQTLSXpoiU2tMhtIblwI2VUSN4xLTZH1C2ax2
	 gukH0ZzYZT665wyVOOOA9SH0c6Asub4nGE/MaEdsve46ubJzNvwS/5g5DyHZypyODF
	 gi2hWaoKl+wi8QKIHGUUqpWXeW7ArgfhTaAvGhEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2041F804A9;
	Thu,  1 Sep 2022 12:25:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F9B6F8026D; Thu,  1 Sep 2022 12:25:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34340F80236
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 12:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34340F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="0qrPtEG9"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="T2PxWqRL"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8110022480;
 Thu,  1 Sep 2022 10:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662027951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U1piqUSHeDth9PbLrp5GfBL1vXr2iyrSLhKcTCmmjak=;
 b=0qrPtEG9HTv5c3h4UH/B7HIM+95F6w64of6vnApdEUCi7ny0BdRkry0QtH5CUB8dMZimeY
 wKIDu1qIWEaJRpi/B08hmOSxeinGFOsizWiIhtwfB+0VEQT97d5sxdF45OFLAzrvaPWqWH
 9wEpVChBGYHiAdbIiRPAQKhPwc71wbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662027951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U1piqUSHeDth9PbLrp5GfBL1vXr2iyrSLhKcTCmmjak=;
 b=T2PxWqRLMHffrG6MUkajo7fTLpkuo9CYpidi2B/yL1ioRLMuEXkNXnVnF63o5EmS4m/GwV
 W49iGderaF01YkDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 684F113A79;
 Thu,  1 Sep 2022 10:25:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5UINGa+IEGPBaQAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 01 Sep 2022 10:25:51 +0000
Date: Thu, 01 Sep 2022 12:25:51 +0200
Message-ID: <87y1v3fl1s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: chihhao chen <chihhao.chen@mediatek.com>
Subject: Re: missing sound on kernel-5.15
In-Reply-To: <204d18b345165560f23b3021dbdbc8e8e39c1674.camel@mediatek.com>
References: <87e6d6ae69d68dc588ac9acc8c0f24d6188375c3.camel@mediatek.com>
 <YwNvQaNNIKB8ELhR@geday>
 <120e52d94c00aab2cf1f3d611b06f03356e8229f.camel@mediatek.com>
 <87r10zxyml.wl-tiwai@suse.de>
 <dcd647b6b5833e08e3ac588685bcdd9f5c625bbb.camel@mediatek.com>
 <87a67nb5yc.wl-tiwai@suse.de> <87r10y9are.wl-tiwai@suse.de>
 <87ilma8edo.wl-tiwai@suse.de>
 <0f36385ad917ac5ec1fdf4fedd8acd6bb3494bdf.camel@mediatek.com>
 <87bks28b8c.wl-tiwai@suse.de>
 <04ecea78ade006c6c7f4575158d1973feb9a6062.camel@mediatek.com>
 <875yia87gu.wl-tiwai@suse.de>
 <737b992a1546486fa622c83831209f935e45ffd2.camel@mediatek.com>
 <871qsxxa6g.wl-tiwai@suse.de>
 <d161bc518a0313e807a6711150a5a259d93cae29.camel@mediatek.com>
 <87tu5sx2ih.wl-tiwai@suse.de>
 <f0ed9708c99cedd4c6c91c39e905dc7e03cc6bcb.camel@mediatek.com>
 <87k06owux0.wl-tiwai@suse.de>
 <5b47c3025fba9fd7b2156d1260962b1d67c1b2fa.camel@mediatek.com>
 <87sflcy1i8.wl-tiwai@suse.de>
 <09f0c52d86155fd6617eec59c341c6cdd4aa5059.camel@mediatek.com>
 <878rn3h6ra.wl-tiwai@suse.de> <8735dbh52h.wl-tiwai@suse.de>
 <204d18b345165560f23b3021dbdbc8e8e39c1674.camel@mediatek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org
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

On Thu, 01 Sep 2022 12:06:25 +0200,
chihhao chen wrote:
> 
> Hi Takashi,
> 
> I tested the patch and USB audio function works well.
> (Start and stop playback more than 20 times with Samsung USB C
> Earphone)

Great, thanks for quick testing!


Takashi

> 
> Thanks
> 
> On Thu, 2022-09-01 at 10:28 +0200, Takashi Iwai wrote:
> > On Thu, 01 Sep 2022 09:51:37 +0200,
> > Takashi Iwai wrote:
> > > 
> > > On Thu, 01 Sep 2022 07:50:40 +0200,
> > > chihhao chen wrote:
> > > > 
> > > > Hi Takashi,
> > > > 
> > > > The patch fixes this problem.
> > > > I tried it with "Product: Samsung USB C Earphone" and missing
> > > > sound
> > > > problem cannot be reproduced.
> > > 
> > > OK, it's a good news.  I'm going to add more information to the
> > > patch
> > > description about the regression and submit the patch.
> > 
> > Could you check whether the below cleanup patch on top of the
> > previous
> > one doesn't break things?  I lightly tested on my devices and don't
> > believe it would change the actual behavior, but just to be sure.
> > 
> > 
> > Takashi
> > 
> > -- 8< --
> > From: Takashi Iwai <tiwai@suse.de>
> > Subject: [PATCH] ALSA: usb-audio: Clean up endpoint setups at PCM
> > prepare
> > 
> > This patch cleans up the superfluous checks and calls for setting up
> > the endpoints at PCM prepare callback:
> > 
> > - Drop stop_endpoints() and sync_pending_stops() calls; the stream is
> >   guaranteed to have been already stopped and synced at each PCM
> >   prepare call by ALSA PCM core
> > 
> > - Call snd_usb_endpoint_prepare() unconditionally;
> >   the check for endpoint->need_setup is done in
> >   snd_pcm_hw_endpoint_prepare() itself
> > 
> > - Apply snd_usb_set_format_quirk() only when the endpoint is actually
> >   set up (i.e. the return code from snd_usb_endpoint_prepare() > 0)
> > 
> > - Move a few lines back into snd_usb_pcm_prepare();
> >   it's even easier to follow than a small useless function
> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/usb/pcm.c | 40 ++++++++++------------------------------
> >  1 file changed, 10 insertions(+), 30 deletions(-)
> > 
> > diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> > index b604f7e95e82..4ed53a3dc922 100644
> > --- a/sound/usb/pcm.c
> > +++ b/sound/usb/pcm.c
> > @@ -433,35 +433,6 @@ static void close_endpoints(struct snd_usb_audio
> > *chip,
> >  	}
> >  }
> >  
> > -static int configure_endpoints(struct snd_usb_audio *chip,
> > -			       struct snd_usb_substream *subs)
> > -{
> > -	int err;
> > -
> > -	if (subs->data_endpoint->need_setup) {
> > -		/* stop any running stream beforehand */
> > -		if (stop_endpoints(subs, false))
> > -			sync_pending_stops(subs);
> > -		if (subs->sync_endpoint) {
> > -			err = snd_usb_endpoint_prepare(chip, subs-
> > >sync_endpoint);
> > -			if (err < 0)
> > -				return err;
> > -		}
> > -		err = snd_usb_endpoint_prepare(chip, subs-
> > >data_endpoint);
> > -		if (err < 0)
> > -			return err;
> > -		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
> > -	} else {
> > -		if (subs->sync_endpoint) {
> > -			err = snd_usb_endpoint_prepare(chip, subs-
> > >sync_endpoint);
> > -			if (err < 0)
> > -				return err;
> > -		}
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> >  /*
> >   * hw_params callback
> >   *
> > @@ -640,9 +611,18 @@ static int snd_usb_pcm_prepare(struct
> > snd_pcm_substream *substream)
> >  		goto unlock;
> >  	}
> >  
> > -	ret = configure_endpoints(chip, subs);
> > +	if (subs->sync_endpoint) {
> > +		ret = snd_usb_endpoint_prepare(chip, subs-
> > >sync_endpoint);
> > +		if (ret < 0)
> > +			goto unlock;
> > +	}
> > +
> > +	ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
> >  	if (ret < 0)
> >  		goto unlock;
> > +	else if (ret > 0)
> > +		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
> > +	ret = 0;
> >  
> >  	/* reset the pointer */
> >  	subs->buffer_bytes = frames_to_bytes(runtime, runtime-
> > >buffer_size);
> 
