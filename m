Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3735C647C8
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 16:08:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DAAB168F;
	Wed, 10 Jul 2019 16:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DAAB168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562767727;
	bh=bKK6SJqUlpxnZuf/apBdljUmq0awDI1hKlkCGC7ynr0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LvFz6ZsPLGgOyquCA1QYfIn921BY6N02mGK+DPCRHVGGQltAuEqxAQKWQxFsT0lN/
	 pd4qQs5Hej9VW+wPSD7emvCx5+bPiONrY9brSs8pIutIS66iwPAcUMEYh1ovMxHtXt
	 myoxhCKJ69E+A46ARuFiAEPqsZr+wmvv2w02NO6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD21EF802BC;
	Wed, 10 Jul 2019 16:07:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B187F802A1; Wed, 10 Jul 2019 16:07:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from b4.vu (b4.vu [203.16.231.147])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91CB7F800E2
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 16:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91CB7F800E2
Received: from b4.vu (localhost.localdomain [127.0.0.1])
 by b4.vu (8.13.8/8.13.8) with ESMTP id x6AE6mHf029526;
 Wed, 10 Jul 2019 23:36:48 +0930
Received: (from g@localhost) by b4.vu (8.13.8/8.13.8/Submit) id x6AE6lFu029525;
 Wed, 10 Jul 2019 23:36:47 +0930
Date: Wed, 10 Jul 2019 23:36:47 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190710140647.GA29152@b4.vu>
References: <20190709132605.GA25293@b4.vu> <s5hk1crtinr.wl-tiwai@suse.de>
 <20190709162430.GA25766@b4.vu> <s5h1ryzi108.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5h1ryzi108.wl-tiwai@suse.de>
User-Agent: Mutt/1.4.2.2i
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH V4] ALSA: usb-audio: Scarlett Gen 2 mixer
	interface
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

On Tue, Jul 09, 2019 at 07:14:15PM +0200, Takashi Iwai wrote:
> On Tue, 09 Jul 2019 18:24:30 +0200,
> Geoffrey D. Bennett wrote:
[...]
> > > > +static int scarlett_gen2_mixer_enable;
> > > > +module_param(scarlett_gen2_mixer_enable, int, 0444);
> > > > +MODULE_PARM_DESC(scarlett_gen2_mixer_enable,
> > > > +		 "Focusrite Scarlett Gen 2 Mixer Driver Enable");
> > > 
> > > Do we need this?  If disabling the quirk is really required, it should
> > > be implemented rather in a generic option, instead.
> > 
> > Actually it would be best to have it disabled by default as I have had
> > two reports from people who tried this mixer driver and it broke audio
> > for them.
> 
> Hm, and these have the same USB device ID?

Yes, same device ID. I couldn't see any significant difference between
mine and theirs usbmon trace and lsusb -v output.

[...]
> I guess you can use chip->setup value for the quirk-specific
> configuration as a start.  It's a bit hackish but the parameter is
> already there for long time, hence you don't need to add any extra
> stuff for that.

Got it. Have implemented and will resend soon.

In your other email you wrote:

> Canceling the pending work is the right thing for suspend, but we need
> reconsidering the side effect.  For example, the device might be
> removed while the machine is in sleep.  And the purpose of the
> scheduled work is to sync the config to NVRAM.  That is, it should
> have been done before going to suspend.  Then we don't have to resume
> the task at resume, too.
> 
> That said, the best would be:
> - cancel the pending work, check the return value
> - re-execute the work immediately (delay=0) if the work was canceled
>   in the above, and do flush -- or just call the function directly

I agree and have implemented that as well.

Thanks,
Geoffrey.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
