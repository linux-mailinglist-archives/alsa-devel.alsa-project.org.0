Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8187DB647
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 19:09:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAD2C867;
	Sun, 28 Apr 2019 19:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAD2C867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556471380;
	bh=OXPTY9lIeyifLsGtu27kYldOPT2WWyp29q8ZYxHijiw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FQwF9gCOPkN6zCjMfs21vE9FhktCO//Zn+f9f1ttFDROz1Q0EviF3zKEHLL8+Iv7Z
	 +a4xUdNNhoDRNmkbZIqD86kzvgHFmEThv2wb6w3Z8G+0yZziIa3fl/t0bxs9mX4/HC
	 MGVIH4Vw0hznyVwsyoozXTcaQledoo1MRx1xjqOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9277F80CAD;
	Sun, 28 Apr 2019 19:07:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F4B9F80CAD; Sun, 28 Apr 2019 19:07:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8885BF80C0D
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 19:07:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8885BF80C0D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fPzbzuBE"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34EAA20656;
 Sun, 28 Apr 2019 17:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556471267;
 bh=tMBABMwMn1Tklu43CLV59X9dr8+SqG8/ovrp/vPOJWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fPzbzuBE/Xj5GlFuS1dVy5Oyga5G0Rwee0mwgYdmr8Gwls2n2U1I8SK4mQGzzMyKw
 3EEZK7DaREtShiEGJIuEP6/vYrEIWzS1GoaPNxbf3VBcLiKh3cIjTG73LuF0RWj0vg
 w/pi8CO4y4ZeILcjZTU4kWkCLsv8zriwKQw/BC8o=
Date: Sun, 28 Apr 2019 19:07:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190428170745.GA19070@kroah.com>
References: <20190428160411.GA12815@kroah.com> <s5hmukakrod.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hmukakrod.wl-tiwai@suse.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [alsa-devel] [PATCH] sound: USB: line6: use dynamic buffers
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

On Sun, Apr 28, 2019 at 06:42:10PM +0200, Takashi Iwai wrote:
> On Sun, 28 Apr 2019 18:04:11 +0200,
> Greg Kroah-Hartman wrote:
> > 
> > --- a/sound/usb/line6/toneport.c
> > +++ b/sound/usb/line6/toneport.c
> > @@ -365,16 +365,21 @@ static bool toneport_has_source_select(s
> >  /*
> >  	Setup Toneport device.
> >  */
> > -static void toneport_setup(struct usb_line6_toneport *toneport)
> > +static int toneport_setup(struct usb_line6_toneport *toneport)
> >  {
> > -	u32 ticks;
> > +	u32 *ticks;
> >  	struct usb_line6 *line6 = &toneport->line6;
> >  	struct usb_device *usbdev = line6->usbdev;
> >  
> > +	ticks = kmalloc(sizeof(*ticks), GFP_KERNEL);
> > +	if (!ticks)
> > +		return -ENOMEM;
> > +
> >  	/* sync time on device with host: */
> >  	/* note: 32-bit timestamps overflow in year 2106 */
> > -	ticks = (u32)ktime_get_real_seconds();
> > -	line6_write_data(line6, 0x80c6, &ticks, 4);
> > +	*ticks = (u32)ktime_get_real_seconds();
> > +	line6_write_data(line6, 0x80c6, ticks, 4);
> > +	kfree(ticks);
> >  
> >  	/* enable device: */
> >  	toneport_send_cmd(usbdev, 0x0301, 0x0000);
> 
> This function misses the "return 0" at the end, so I fixed it up
> manually and applied now.

Ugh, sorry about that.  Odd I didn't get a build error, my fault.

thanks for the quick response.

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
