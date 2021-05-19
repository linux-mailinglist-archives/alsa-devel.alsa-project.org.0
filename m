Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E620388C7B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 13:15:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01C84167D;
	Wed, 19 May 2021 13:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01C84167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621422949;
	bh=x3KCl5BY/n2VOfV+OzbsextBZH27Hu50N6VHDOuc6sQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mmJDBBho52KJAmJw7X2ratiKNLeNjCzrRG/7+RNAaAgiwkt3YmkEiE5a2G0BU+HWW
	 3rJXvqEHs4rm0Q1LHrWfYDR6q5oCczJyUTZKWnWThTrDo+ILER31wMc79JPVFx8lfT
	 MWUwWKODxvS5Q3KnOm7f91dk5DevryjgM8jOQ18Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7238EF80148;
	Wed, 19 May 2021 13:14:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A82C4F8016E; Wed, 19 May 2021 13:14:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72C90F8014C
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 13:14:09 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 084F5A003F;
 Wed, 19 May 2021 13:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 084F5A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1621422848; bh=wew+NugOgMPA2bBfXTyTXyYcqOob/svN5eI50XpSaI8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Z09uzpWc26dvXYSPW4FgXK2fPwXcv/UcQNYn0xe/yioFWAlvWePv3MfDKeppn/B9L
 r4fOkgZUlqDHcYBl93dwby9AYRaexbqTJyM/aw97Y9V8MM5BNjm8WEdg4nS1epjzpi
 vlJ4kuwy92Uau3rauWxsuX/J7nTS6DqPm9fXYVR8=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 19 May 2021 13:13:53 +0200 (CEST)
Subject: Re: Question about Tegra UCMs
To: Dmitry Osipenko <digetx@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
 <20210518180949.GA949047@robh.at.kernel.org>
 <20210518183455.GE4358@sirena.org.uk>
 <92cef674-c454-e08c-b44d-d8c08b1e8ccf@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <562efe35-dd91-12a0-96a5-b8f4f34ea153@perex.cz>
Date: Wed, 19 May 2021 13:13:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <92cef674-c454-e08c-b44d-d8c08b1e8ccf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ion Agorria <ion@agorria.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Rob Herring <robh@kernel.org>
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

Dne 19. 05. 21 v 0:31 Dmitry Osipenko napsal(a):
> Mark, could you please help me to understand the UCM naming scheme that ALSA uses..
> 
> About a year ago I tried to complain to Jaroslav Kysela in a comment to the UCM change [1] that it should be breaking the naming scheme of Tegra UCMs, but haven't got a meaningful reply and moved on to other things.
> 
> [1] https://github.com/alsa-project/alsa-ucm-conf/commit/8ff2d50745efbb6959324f672460e413f0b618b8

I'm sorry about that, but it's better to create a tracked ticket (issue or
pull request).

> Today I noticed that the naming scheme changed again and I still don't understand what to do about it.
> 
> I have two devices:
> 
>  1. Acer Picasso tablet that uses "Acer Iconia Tab A500 WM8903" for the card model name.
> 
>  2. Google Nexus 7 that uses "ASUS Google Nexus 7 ALC5642".
> 
> Previously UCMs were picked up by pulseaudio from these paths:
> 
>  1. /usr/share/alsa/ucm2/Acer Iconia Tab A500 WM8903/
>  2. /usr/share/alsa/ucm2/ASUS Google Nexus 7 ALC5642/
> 
> Now the lookup paths are changed to:
> 
>  1. /usr/share/alsa/ucm2/Acer_Iconia_Tab/
>  2. /usr/share/alsa/ucm2/ASUS_Google_Nex/

Yes, it's based on the driver name (which is incorrectly set /or not set/ in
your case).

Lookup paths (with description):

https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/ucm.conf

The latest scheme is even different - lookups were moved to ucm2/conf.d with
redirection to the more descriptive layered configuration tree structure, so
the other developers can immediately identify the hardware which is
configured. See Qualcomm examples. The long card names does not help us so much.

> Strace shows that pulseaudio searches UCMs only at these paths.
> 
> The output of /proc/asound/cards:
> 
>  0 [WM8903         ]: Acer_Iconia_Tab - Acer Iconia Tab A500 WM8903
>                       Acer Iconia Tab A500 WM8903
> 
>  0 [ALC5642        ]: ASUS_Google_Nex - ASUS Google Nexus 7 ALC5642
>                       ASUS Google Nexus 7 ALC5642

Fields are explained in:

https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/README.md

> Is there anything on the kernel side that I could change to get a working naming scheme? If yes, I may try to do something about it in the v2, thanks in advance.

Try to set a meaningful driver name (usually the code handling the ASoC card
creation). It should be very close to the kernel module name (but more user
friendly). The current code for your hardware use the auto-generated driver
name from the ALSA long name.

Then try to reuse the existing configs - for example your Nexus 7 config has
many blocks from codecs/rt5640/* .

Anyway, create a PR so we can discuss the details.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
