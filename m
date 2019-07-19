Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA3A6E7CB
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 17:10:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 711F716BB;
	Fri, 19 Jul 2019 17:09:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 711F716BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563549044;
	bh=syfu+OLMeBX7iFij1CCDS8/dkFbtHSj5sviYeCE5ED0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Auj6BUb0BTjFdwRaCsdG0LLQmU0s2B6rMUvNyx3tXbvCQgGxgohMC02Xsew8HSKCb
	 Qe+jIc1ITyXkFSvZlAKFyvS78uvVvHuE1Xmsxq+GNt+Vnlw/cRtH6ynyM40AK6LYwY
	 GTd7fxoUdoImdDwCUheE5aldescdQD6It0e1QFps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD04CF80228;
	Fri, 19 Jul 2019 17:09:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 846D2F80272; Fri, 19 Jul 2019 17:08:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from b4.vu (b4.vu [203.16.231.147])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 275D0F800B2
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 17:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 275D0F800B2
Received: from b4.vu (localhost.localdomain [127.0.0.1])
 by b4.vu (8.13.8/8.13.8) with ESMTP id x6JF8mlh012116;
 Sat, 20 Jul 2019 00:38:48 +0930
Received: (from g@localhost) by b4.vu (8.13.8/8.13.8/Submit) id x6JF8mdH012115;
 Sat, 20 Jul 2019 00:38:48 +0930
Date: Sat, 20 Jul 2019 00:38:48 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190719150848.GA11924@b4.vu>
References: <20190717155105.GA4198@b4.vu> <s5hd0i7nxue.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hd0i7nxue.wl-tiwai@suse.de>
User-Agent: Mutt/1.4.2.2i
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH V6 RESEND] ALSA: usb-audio: Scarlett Gen 2
	mixer interface
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

Hi Takashi,

On Thu, Jul 18, 2019 at 05:53:13PM +0200, Takashi Iwai wrote:
[...]
> Thanks, the patch looks almost good, but it's already too late for
> 5.3, so I'm going to queue this for 5.4 after 5.3 merge window is
> closed in this week.

Thank you. I really appreciate your assistance and feedback.

> But, before that, maybe one more refresh would be appreciated.
> Namely,
> 
> - We need a verification of the fixed pipe before actually submitting
>   urb.  scarlett2_usb() calls with usb_sndctrlpipe(), and this pipe
>   has to be verified beforehand.  See the commit 801ebf1043ae for
>   details.

I had a look at that commit, and I think I don't need to change
scarlett2_usb() because it calls snd_usb_ctl_msg() which already calls
the snd_usb_pipe_sanity_check() function to verify the pipe.

I'm thinking though that scarlett2_mixer_status_create() which does
something like this:

  struct usb_device *dev = mixer->chip->dev;
  unsigned int pipe = usb_rcvintpipe(dev, SCARLETT2_USB_INTERRUPT_ENDPOINT);
  ...
  usb_fill_int_urb(mixer->urb, dev, pipe, ...);
  usb_submit_urb(mixer->urb, GFP_KERNEL);

probably needs this added:

  if (snd_usb_pipe_sanity_check(dev, pipe))
          return -EINVAL;

Do you agree?

> - Some pointers seem to be initialized as "0".  Use NULL instead.

Will fix.

Regards,
Geoffrey.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
