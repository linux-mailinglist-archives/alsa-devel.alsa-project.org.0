Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBDE67D1E4
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 17:40:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD6EE7E;
	Thu, 26 Jan 2023 17:39:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD6EE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674751231;
	bh=4y5T8Z1YzTy28i7M/tIXpNDOtq+YX0jkW9G/xOmLxUs=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gcFulmw0ghGfvDK8mjm9vq9SPK5VZWECdqA129QB05Tim3HtD6LQR3cNzeC6p3UgD
	 aDVkR14kga8x7okgbNLyT/ETEcUD3Ke7q+zMKXJH63BmUFzsbCMknh5Jih5gGmUHa5
	 /CB2Dj/ti7BeFj+V71yeozoXIsmvrunEsELUZvVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72D2DF802DF;
	Thu, 26 Jan 2023 17:39:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AB26F8027D; Thu, 26 Jan 2023 17:39:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F34CDF800AE
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 17:39:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F34CDF800AE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nTJd3UqQ
Received: by mail-wr1-x42d.google.com with SMTP id m14so1906288wrg.13
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 08:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WcIULWf1hJO2aSG6ip1Q2Tbo7KEX8l8vfq1u07hQEUU=;
 b=nTJd3UqQHJYIgHfYtrJfyHF3jy6yesQbAxKnBfhlrW7ZZYv5vss1/BwpzGKnU//+pW
 zpEWqlJSU1UJSI1ZnMW1/fpJO+yHRhfSOrbz1DMeeefUw11iYpnJNzq7lutcwL4sdVQA
 M8u0eJoyy7W8bYrQw3m8zo2lACqWAzDw3gWKispcuaQug6tcfxcDGjBfRUSmloFUhxGM
 Sw/XwIM7yxzH/86FHVCW4XrLFoPQQKBIX3LLkuUfneMt47tO5zFJRor1KAkP1FlI503l
 rgytrxiJuJYtCArZvzsNUT3M8ZVe4MODcWS2KQ1S65g210VjD1EB76AaowZCvsQ/VBqY
 zIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WcIULWf1hJO2aSG6ip1Q2Tbo7KEX8l8vfq1u07hQEUU=;
 b=BbI/iN2t75MuB5y6AmCPAq1Vs9j0yTAAq8dVjMAQQ89wvbWn4VY3OZXdzwYCKMQTnp
 K8ZBsDqVumSUYXmf4YAIoLhCMnPViXNsivzusUyhn6bx0XxMunMr0Oehg74lWn8Zb2Ed
 wgYT7WPmQRNuV4Wtj0qY/CnSUzCsGBijNmgrvsa9se2Djni2vFjMDZkYCAjt3r7fUBFg
 uRqZObied8A2CyeQRJmoBuPCj2g5f74hZweyLMamba7cJ0G/4ntM2f4jZI8cuO34XBrS
 9kBYEgmAzCPehnbFTIlC+yVnL/7dc8/9aFTVtk+uGlWL+mI9Z+xmg3QOpp/K5Tm6+iSd
 8RiQ==
X-Gm-Message-State: AFqh2kr+nzd6EGurPpH0MOAJWL+AonfSrHsjgPeYV9+NkFyj9LYqmi5r
 qzYZ2ydP4y9Z4svlcRBey0k=
X-Google-Smtp-Source: AMrXdXsrjgrGETIMbiJakho1CzIks0SH953VqlAvOj6xcJEoDaMM1z2UyXPlB7L/3oOwE6z5TxzZag==
X-Received: by 2002:a05:6000:1f95:b0:2bc:371a:8a2 with SMTP id
 bw21-20020a0560001f9500b002bc371a08a2mr32915198wrb.37.1674751157968; 
 Thu, 26 Jan 2023 08:39:17 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm1716079wrr.62.2023.01.26.08.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 08:39:17 -0800 (PST)
Date: Thu, 26 Jan 2023 19:39:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: pci: lx6464es: fix a debug loop
Message-ID: <Y9KsqpFRrlhX57WJ@kadam>
References: <Y9JIGt0HT8mLkUXF@kili>
 <878rhptq36.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rhptq36.wl-tiwai@suse.de>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jan 26, 2023 at 01:53:01PM +0100, Takashi Iwai wrote:
> On Thu, 26 Jan 2023 10:30:02 +0100,
> Dan Carpenter wrote:
> > 
> > This loop accidentally reuses the "i" iterator for both the inside and
> > the outside loop.  The value of MAX_STREAM_BUFFER is 5.  I believe that
> > chip->rmh.stat_len is in the 2-12 range.  If the value of .stat_len is
> > 4 or more then it will loop exactly one time, but if it's less then it
> > is a forever loop.
> > 
> > Fixes: 8e6320064c33 ("ALSA: lx_core: Remove useless #if 0 .. #endif")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >  sound/pci/lx6464es/lx_core.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/sound/pci/lx6464es/lx_core.c b/sound/pci/lx6464es/lx_core.c
> > index d3f58a3d17fb..7c1b380a54c0 100644
> > --- a/sound/pci/lx6464es/lx_core.c
> > +++ b/sound/pci/lx6464es/lx_core.c
> > @@ -493,13 +493,11 @@ int lx_buffer_ask(struct lx6464es *chip, u32 pipe, int is_capture,
> >  		dev_dbg(chip->card->dev,
> >  			"CMD_08_ASK_BUFFERS: needed %d, freed %d\n",
> >  			    *r_needed, *r_freed);
> > -		for (i = 0; i < MAX_STREAM_BUFFER; ++i) {
> > -			for (i = 0; i != chip->rmh.stat_len; ++i)
> > -				dev_dbg(chip->card->dev,
> > -					"  stat[%d]: %x, %x\n", i,
> > -					    chip->rmh.stat[i],
> > -					    chip->rmh.stat[i] & MASK_DATA_SIZE);
> > -		}
> > +		for (i = 0; i < chip->rmh.stat_len; ++i)
> 
> Judging from the previous lines, the access over MAX_STREAM_BUFFER
> might be unsafe.  So I guess a more safer change would be something
> like:
> 
> 		for (i = 0; i < MAX_STREAM_BUFFER && chip->rmh.stat_len; ++i)

&& i < chip->rmh.stat_len

TBH, I'd prefer to just delete all this code since it used be ifdef 0.

But I'll resend as you have suggested.

regards,
dan carpenter

