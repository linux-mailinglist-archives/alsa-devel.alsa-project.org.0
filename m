Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C70C12793D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 11:25:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18E6D15F8;
	Fri, 20 Dec 2019 11:24:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18E6D15F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576837508;
	bh=U9M6TQV4AjeBjioPMwugf0HLr5R8/iMT1WSPOjDkt00=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KzjBX1EkWXtzYJOAkB4Kn6HJ7jFVjKpYOpex8MkJ7a2Xro4MudP95CSqlmV5yn84N
	 suR5ahYIA4zxjYBxn0DMmnCR/L+CaUu3qS4NytNDlhB+E/CFg/ZfmJoH5w/M9jG2yt
	 prFh+e7FJHbsYop4vsHTe5n+4Wwyyu7TcmTe7UoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 750FEF80247;
	Fri, 20 Dec 2019 11:23:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44F22F8015A; Fri, 20 Dec 2019 11:23:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2057F80059
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 11:23:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2057F80059
Received: by mail-lf1-f68.google.com with SMTP id i23so6620234lfo.7
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 02:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fVDETBozZ4/qDsszN1mn7+6jrkiK3wgtTef6sQxNVJ4=;
 b=g2WfUUyFzJwhm7IML0EQgeEf9vAHdIavhMm8SXWRf7CD1hUkhkcS26q/8IfbODMxuZ
 6he0HZrXvaRWhQK3oh9YQNiMobM7zus82DWdfEItF8BEI+KL8hg2vTgCByc+eqfzUgFm
 iTOrJDu5endSr5vaxu/xYEasHBbYR9+gB6K5pvcAKvkcq/IbwykVN9KWf9Au4RIYrKU7
 mhAA9I8EzKqGXdAeaToXo7QR4YuAJUdl+WaUXdtuAKRMAwq4tTPsiVe+KGPTK9v/a2YN
 oRP1AlwNpnMQGfZoORnJYohVbwprXYX9HfwWVmh5MHgYfaJkWM5D75AMq7LS88ScWyHU
 h69g==
X-Gm-Message-State: APjAAAX1LXY8p5uSrSxTQ5K5eu9ZXMa1XYZQ9xTToGmMlK2tLJ13xFq0
 5+7TBN2i0Z4l9/HB1k7/aq4=
X-Google-Smtp-Source: APXvYqxnhc7AhHRdkgCq7FXSfcejTVt7KSCTYkqz/ngaR2fEsJGHcFdA3ZXx4mY+iUrPwzq5NkOmrQ==
X-Received: by 2002:a19:c205:: with SMTP id l5mr8258003lfc.159.1576837397388; 
 Fri, 20 Dec 2019 02:23:17 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.184.20])
 by smtp.gmail.com with ESMTPSA id h19sm4044923ljk.44.2019.12.20.02.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 02:23:16 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1iiFRD-00018f-PN; Fri, 20 Dec 2019 11:23:15 +0100
Date: Fri, 20 Dec 2019 11:23:15 +0100
From: Johan Hovold <johan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191220102315.GU22665@localhost>
References: <20191220093134.1248-1-johan@kernel.org>
 <s5hbls35nxx.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hbls35nxx.wl-tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Johan Hovold <johan@kernel.org>, stable <stable@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: fix set_format altsetting
	sanity check
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

On Fri, Dec 20, 2019 at 10:46:50AM +0100, Takashi Iwai wrote:
> On Fri, 20 Dec 2019 10:31:34 +0100,
> Johan Hovold wrote:
> > 
> > Make sure to check the return value of usb_altnum_to_altsetting() to
> > avoid dereferencing a NULL pointer when the requested alternate settings
> > is missing.
> > 
> > The format altsetting number may come from a quirk table and there does
> > not seem to be any other validation of it (the corresponding index is
> > checked however).
> > 
> > Fixes: b099b9693d23 ("ALSA: usb-audio: Avoid superfluous usb_set_interface() calls")
> > Cc: stable <stable@vger.kernel.org>     # 4.18
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  sound/usb/pcm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> > index 9c8930bb00c8..73dd9d21bb42 100644
> > --- a/sound/usb/pcm.c
> > +++ b/sound/usb/pcm.c
> > @@ -506,9 +506,9 @@ static int set_format(struct snd_usb_substream *subs, struct audioformat *fmt)
> >  	if (WARN_ON(!iface))
> >  		return -EINVAL;
> >  	alts = usb_altnum_to_altsetting(iface, fmt->altsetting);
> > -	altsd = get_iface_desc(alts);
> > -	if (WARN_ON(altsd->bAlternateSetting != fmt->altsetting))
> > +	if (WARN_ON(!alts))
> >  		return -EINVAL;
> 
> Do we need WARN_ON() here?  If this may hit on syzbot, it'll stop at
> this point because of panic_on_warn.

Yeah, I considered that too and decided to leave it in. Just like for
the WARN_ON(iface), those numbers should be verified at probe.

I tried tracking where fmt->altsetting comes from, and it seems like
a sanity check needs to be added at least to create_fixed_stream_quirk()
where, for example, fmt->iface, fmt->altset_idx and the number of
endpoints are verified.

If there are other paths that can end up setting these fields to invalid
values, we want that WARN_ON() in there so we can fix those.

Johan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
