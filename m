Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08855D6443
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 15:42:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 857241615;
	Mon, 14 Oct 2019 15:41:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 857241615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571060547;
	bh=rLFkrkWrVCzqYXXbS4f6z5wPfjc9iD4lvdv5ydB15Wo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dnzo1PNlRn24nImpzD4jKC660b/lqnBE8wIg0NDnXKOxS/P3H2f1EIp51sSvYnX6B
	 EFWxZ00Cs8TboW4fPN3HPrbNU3ukkFo7TzdsWmW4QTP8Y3zRCnCq0wFJIbrNKAx/iO
	 TWWLiEB8lmNIYjcjcmREux1HJhEZfego2Se9xgtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56A7CF8011D;
	Mon, 14 Oct 2019 15:40:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 498EEF80362; Mon, 14 Oct 2019 15:40:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_29,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from b4.vu (b4.vu [203.16.231.147])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CE41F8011D
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 15:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CE41F8011D
Received: from b4.vu (localhost.localdomain [127.0.0.1])
 by b4.vu (8.13.8/8.13.8) with ESMTP id x9EDeTGV011078;
 Tue, 15 Oct 2019 00:10:29 +1030
Received: (from g@localhost) by b4.vu (8.13.8/8.13.8/Submit) id x9EDeSM8011077;
 Tue, 15 Oct 2019 00:10:28 +1030
Date: Tue, 15 Oct 2019 00:10:28 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: wwp <subscript@free.fr>
Message-ID: <20191014134028.GA11018@b4.vu>
References: <20191013102030.50d7c8d0@ladybug>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191013102030.50d7c8d0@ladybug>
User-Agent: Mutt/1.4.2.2i
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Focusrite Scarlett 18i8 3rd Gen audio interface
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

Hi wwp,

On Sun, Oct 13, 2019 at 10:20:30AM +0200, wwp wrote:
> Hello,
> 
> I've recently bought a Focusrite Scarlett 18i8 3rd Gen audio interface,
> great device, but in CentOS 7, with either the available 3.x or 4.x
> kernels, the device just appears in the available Alsa devices, but no
> mixer is available, the device direct hardware monitor output is also
> not working (it is, by default, and works well in Windows, but I
> presume that w/ no mixer support in Alsa, it's expected that nothing
> works). I'm able to bound I/O ports in QJackCtl but nothing goes out of
> the device.

Is any of the class-compliant functionality (play/record) working at
all in CentOS 7? I would expect that out of the box you should be able
to get standard ALSA/PulseAudio apps working for I/O.

> Of course, adding the 0x1235:8214 USB ID to the quirks just doesn't
> work. I presume there's more work like the patch submitted here (I saw
> the archives) in the "[PATCH RFC V2] ALSA: usb-audio: Scarlett Gen 2
> mixer interface" mail thread?

Yes, there would definitely be more work to do along those lines. If
we're lucky, the protocol is basically the same as 2nd gen and just
extended for the additional features in the 3rd gen. FWIW, I haven't
heard of anyone starting that work.

> Do you it is worth trying applying that 2nd Gen patch to one of the v4
> kernel available for CentOS 7, adding the 3rd Gen quirks and see how it
> behaves? Or is there already progress on supporting the 3rd Gen one too?

I doubt that it would do much useful beyond letting you know if it
accepts the same initialisation sequence as the 2nd gen devices. If
you want to send me (off-list) a wireshark USB capture from 1) the
Windows driver initialising your device and 2) you adjusting settings
in Focusrite Control, I can have a look at it and let you know if it
looks similar to the 2nd gen devices.

Regards,
Geoffrey.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
