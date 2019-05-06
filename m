Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F5A1469B
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 10:42:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FD141834;
	Mon,  6 May 2019 10:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FD141834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557132148;
	bh=qh+7rK0rjXpMsAHdfsZhCFuobeRDPj1XDrJGsEFECII=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TRbHjXy4fzlKSN+7idxGKX5L/KEdJEZdFyENNEGUJb4pqsMyzMXApvmiYwmqzozLE
	 DiSSqI4XBftecyKlgy10+D6KY+uGaw+wRrHfRbcZkYVvRhN2ARwSRxsKewXR4fb7Tt
	 azW3SZ/1ScbwMw9AAQpP/481sPujugwz6oiCjRoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 585DCF89705;
	Mon,  6 May 2019 10:40:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE225F896E6; Mon,  6 May 2019 10:40:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.xn--80adja5bqm.su (xn--80adja5bqm.su [45.62.210.217])
 by alsa1.perex.cz (Postfix) with ESMTP id 72CBDF8962A
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 10:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72CBDF8962A
Received: by mail1.xn--80adja5bqm.su (Postfix, from userid 1000)
 id 226A420C5462; Mon,  6 May 2019 10:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail1.xn--80adja5bqm.su 226A420C5462
Date: Mon, 6 May 2019 10:40:46 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <20190506084046.GA397@xn--80adja5bqm.su>
References: <CACxsoGr1we7usowgT6zReJWSu9=AfhMYQgRjHJD-ja1zCSz3rQ@mail.gmail.com>
 <20190425164657.GA22452@xn--80adja5bqm.su>
 <s5h7ebemvlo.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5h7ebemvlo.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: alsa-devel@alsa-project.org, Drago Praznik <dragopraznik@gmail.com>
Subject: Re: [alsa-devel] Right internal speaker and internal microphone
 doesn't seem to work
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

On Sun, Apr 28, 2019 at 09:34:27AM +0200, Takashi Iwai wrote:
> > Perhaps we should try via the kernel bugtracker, but I'd appreciate if
> > someone could hint users like us to a place where problems like these
> > could be addressed.
> 
> Well, the ML itself is right, but there is not many things the
> developers can help remotely.  This is a very vendor-specific stuff,
> no generic problem, hence it's only the hardware vendor who knows how
> to fix the problem (most likely some missing extra initialization).
> Alternatively, you can do trial-and-error by yourself, e.g. applying
> the existing quirks via model option or fiddling with the pin
> configurations via hdajackretask.

do you know if there is a way to extract those assignments from the
Widows driver/look them up with some tool from a booted Windows system? 
I understand that the pin descriptions/IDs or whatever are read from the 
hardware, so in theory they should match and provide the missing info?

I still have the harddisk with Win7 that was originally in this notebook, so
I could mount it and give it a try if I knew what to do.

Then you noted, that there is not much you could do remotely - would access
to the system help?

Kind regards,
Jin

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
