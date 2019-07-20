Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D1D6F01B
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jul 2019 18:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 465C016E7;
	Sat, 20 Jul 2019 18:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 465C016E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563641790;
	bh=GB0s0pobmib9CVUGuTSt4dHKgJkWdQJI8pri5UPyWE4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LOL1HCh6wc1alH6I6uTY543wECeUXlK6WPWd0Nfw35+zIXz8uGPSFCns5J77aoxNY
	 8BdAGr0Vqgs4Y8zzUE7JKFoS9l/WiXxsQVCvDBIm829sKhH0GtPPOjXdIIA1GyprjC
	 WF930hNkns+LrkrnmJSrPib1VeVxkPf+9gK0JI9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A365DF8015B;
	Sat, 20 Jul 2019 18:54:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7290F802BC; Sat, 20 Jul 2019 18:54:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.xn--80adja5bqm.su (xn--80adja5bqm.su [45.62.210.217])
 by alsa1.perex.cz (Postfix) with ESMTP id AAAC1F8015B
 for <alsa-devel@alsa-project.org>; Sat, 20 Jul 2019 18:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAAC1F8015B
Received: by mail1.xn--80adja5bqm.su (Postfix, from userid 1000)
 id A42E820CDEF3; Sat, 20 Jul 2019 18:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail1.xn--80adja5bqm.su A42E820CDEF3
Date: Sat, 20 Jul 2019 18:54:35 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <20190720165435.GA5855@xn--80adja5bqm.su>
References: <20190404192430.GA24729@xn--80adja5bqm.su>
 <20190719111231.GA26592@xn--80adja5bqm.su>
 <s5hzhla9j8b.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hzhla9j8b.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Surround speaker connection on Acer 8951G
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

On Fri, Jul 19, 2019 at 04:44:52PM +0200, Takashi Iwai wrote:
> It might be some other external stuff like an external amp that is
> missing.  Often it's managed via GPIO or EAPD (that is controlled by
> HD-audio itself), but sometimes via a vendor-specific verb, or even
> over a completely different i2c...
> 
> In the case of vendor verbs, you can take a look at other quirks for
> similar models that touches lots of COEF stuff.

thanks for the pointers, does not sound simple, let's see if I get anywhere,
I will for sure try.

Odd that only one speaker would require such a special handling, but I guess
it is what it is.

In the meantime I found a more pressing issue where I also failed to find a
solution:

Pin 0x1b is resposible for rear speakers and at the same time for external
headphones. If I set the pin to "headphones" in hdajackretask, then
I "lose" the speaker and can't select a 5.1 profile. If I set it to internal
"speaker", the way I have it set up now, then sound comes out of speakers and 
headphones at the same time. 

"hdajacksensetest -a" will detect presence even if sensing is disabled in
hdajackretask, so I assume that this could be somehow used to mute
the speakers, but I was not able to figure out how to approach this.

This is quite an issue for audio conferencing, so I'd like to tackle this 
first and leave the LFE problem for later.

What would be the best way to solve this, how should this pin be configured?

Kind regards,
Jin
 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
