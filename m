Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3551121B6E
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 22:02:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09C241660;
	Mon, 16 Dec 2019 22:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09C241660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576530171;
	bh=BX8x7gFxkllYYwNl+iFgFGrOkIvwfacEuUxflpNCoH8=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LKkEkQ3vDIPCmIkBVrp4YL9dlhsMyIsJye1B3SVSlPFoWmcRQz2eir/H1VAoV7aDS
	 x8S3z/fVPWV9Bt+Aq1xEAXn6VXxsixf0Shxk+wFYWUk7W2dw/ykqllRGpcg9rRYV26
	 tkG4GWVZjlmBbvLaKygOF+Zj+Uxc/905Hyy7I1Zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34FACF80256;
	Mon, 16 Dec 2019 22:01:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28369F80255; Mon, 16 Dec 2019 22:01:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFF5DF8014F
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 22:01:00 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D2B7DA003F;
 Mon, 16 Dec 2019 22:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D2B7DA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1576530059; bh=u8ePWiDqrR218/sX0fUQm8wmXxpjsaS3liqcVIhOlEg=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=JvwNipBaE6nPKuESL6xsnKOA1AoA2BpHsVWdXYIZRFRchEcTWokET483WAKhpaD2q
 1y67T47Szvd/gxRYrWikSR2fpp5cgzKoqpgWBVhZW+tTkDVKkALFnd1As0NNTbhDHs
 UbXkZy//hoiAdkdLby6FuC0a6eZ+NuOqb+Xlu/N8=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 16 Dec 2019 22:00:57 +0100 (CET)
To: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org
References: <20191216125136.6709-1-hui.wang@canonical.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <084ab279-3eef-e1bb-070b-1e4f1c8f26c7@perex.cz>
Date: Mon, 16 Dec 2019 22:00:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191216125136.6709-1-hui.wang@canonical.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [alsa-lib][PATCH] conf: SOF-Intel: map pcm device
	for sof driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 16. 12. 19 v 13:51 Hui Wang napsal(a):
> On the machines with HDA codec, the sof driver will use the legacy hda
> codec driver, as a result, most mixer controls are same as before.
> 
> There are only 2 difference:
>   - HDMI pcm index is 3, 4 and 5 instead of 3, 7, 8...
>   - dmic is on device 6, 7 instead of 0
> 
> After applying this patch, we will get (aplay -L):
> hdmi:CARD=sofsklhdacard,DEV=0
>      sof-skl_hda_card,
>      HDMI Audio Output
> hdmi:CARD=sofsklhdacard,DEV=1
>      sof-skl_hda_card,
>      HDMI Audio Output
> hdmi:CARD=sofsklhdacard,DEV=2
>      sof-skl_hda_card,
>      HDMI Audio Output
> 
> and (arecord -L):
> dmic:CARD=sofsklhdacard,DEV=0
>      sof-skl_hda_card,
>      Digital Mic connected to the PCH directly
> dmic:CARD=sofsklhdacard,DEV=1
>      sof-skl_hda_card,
>      Digital Mic connected to the PCH directly
> 
> Then we could add minor changes in the pulseaudio configuration, after
> that, all output and input devices will work under pulseaudio.
> 
> This is a supplement for ucm, the ucm for sof driver has higher
> priority than this conf, if there is no ucm for sof driver, this conf
> will take effect.

Exactly. The dmic definitions should not be a standard in my eyes. I would not 
like to accept this. I can accept the standard definitions for the playback 
devices for this driver, but UCM will replace everything. It's better to 
define the special PA config for now until we resolve all the UCM issues like:

http://people.redhat.com/~jkysela/sof/carbon-x1-pulse.tar.gz2

The 2nd PA UCM patchset which is working with the current UCM in ALSA's repos 
for this hardware:

https://gitlab.freedesktop.org/pulseaudio/pulseaudio/merge_requests/217

But it is just a start. There are plenty unresolved abstraction issues with this.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
