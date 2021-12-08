Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 830EB46D355
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 13:31:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A4BF2721;
	Wed,  8 Dec 2021 13:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A4BF2721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638966682;
	bh=xbFdNIw9HM4YAc7uIEh+h7mVxqskjsU7UitTUb6mpGU=;
	h=Date:To:Subject:In-Reply-To:References:From:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7rhhc1nH6y6nl3Twq1LpodhuNzv5HERgnYR082ojKAk6JwCXdNP0T3i4t3bJlLgf
	 53B7t/mbwGXeIf+0wiuVT3Ct2oHSpKYegjoar1KU24GkhnrO20yPIWMxj0rKlZEguC
	 5TF9mb2Id851eC+ncabVSWikl+59erHD0a8MESOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7382DF80103;
	Wed,  8 Dec 2021 13:30:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDF55F804E5; Wed,  8 Dec 2021 13:30:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.net9.ga (mx1.net9.ga [192.210.226.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 146F1F80217
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 13:29:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 146F1F80217
Received: from u34 by mx1.net9.ga with local (@Mail Server)
 (envelope-from <u34@net9.ga>)
 id 1muw55-000WNp-Ui; Wed, 08 Dec 2021 12:29:55 +0000
Date: Wed, 08 Dec 2021 12:29:55 +0000
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Is it a regression? 5.15.5: No sound with speaker-test.
 5.12.13: it works.
In-Reply-To: <s5hlf0wojv8.wl-tiwai@suse.de>
References: <E1mrgJF-000RWu-7d@mx1.net9.ga> <s5hlf0wojv8.wl-tiwai@suse.de>
User-Agent: s-nail v14.9.22
Message-Id: <E1muw55-000WNp-Ui@mx1.net9.ga>
From: u34@net9.ga
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

Takashi Iwai <tiwai@suse.de> wrote:

Thank you.

> On Mon, 29 Nov 2021 14:03:05 +0100,
> u34@net9.ga wrote:
> > 
> > The following looks to me a regression in the linux sound driver.
> > alsa-info.sh output is included at the bottom of this message. There are 2 
> > outputs. An output with a 5.12.13 kernel. The other output is with a 
> > 5.15.5. They were obtained with the same PC. With 5.12.13, the 
> > speaker-test program works as expected. There is no sound when the 
> > speaker-test program is ran with 5.15.5.
> > 5.15.5 has 
> >     options snd-hda-intel id=PCH index=0
> >     options snd-hda-intel id=HDMI index=1
> > , which 5.12.13 does not have.
> 
> Both those lines conflict with each other, so they make no sense and
> are already incorrect.
> 
> If you want to swap the card indices inevitably needed, just pass a
> single option line below instead.
> 
>   options snd-hda-intel index=1,0
> 

I have modified my setting as you suggested.

speaker-test is now producing sound with both 5.12.13, and 5.15.5. Which is 
actualy 5.15.6, not 5.15.5, by now. It got upgraded a few days ago. I don't 
know what is the exact change that made it working. I have done several 
other chnages in the last couple of days.

> And how did you invoke speaker-test?

With 5.12.13 I invoked speaker-test either by
    speaker-test -c2 -Ddefault:PCH
or by
    speaker-test -c2 -t sine -f 1000 -Ddefault:PCH
With 5.15.5 I invoked speaker-test by similar commands. But, usualy, ommiting 
-Ddefault:PCH.

> 
> Is it only about speaker-test and aplay works as is?
> 

I don't follow you. What is only about speaker-test and aplay?
Is it that my report is only about speaker-test and aplay?
I haven't tried anything else, other then speaker-test and aplay. In fact, 
I used aplay only with -L or -l options for its reports. I didn't try to 
play any sound file after I realized that speaker-test is failing with 5.15.5.

> Takashi

--
u34
