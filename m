Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4673C4A999
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 20:14:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5D8E16CE;
	Tue, 18 Jun 2019 20:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5D8E16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560881678;
	bh=K4GKU+5nhpA+/A21A0GmVKoxymjvo+wyqiMr6ITPKXk=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PvYAF/Gd6aoEG4CQm0l1aYw8eE4yCSsaSApMv4GxIrYVWaGp/j0bCVN/XyREicdKL
	 LnFnQEMwW3zdkwaGQ5sJIVLAKU/zkTwYRcdRupfuk70TrfH1DAjN7kXXRORIHU5jB4
	 MM91/Or1fu+tnFH7k600QYHsCdnv10Q8OBnY7Caw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CD36F896F4;
	Tue, 18 Jun 2019 20:12:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F5DCF896F4; Tue, 18 Jun 2019 20:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F073DF89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 20:12:48 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 26166A0046;
 Tue, 18 Jun 2019 20:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 26166A0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1560881568; bh=64B9gMoLeTgMQwu14X0PSkH+UiX5HurQpc09GlT7w8k=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Q/walW5MBtZZ39icS08Sizsh/fn/XK6JMW6ZL3u24gtHdoAcZBt6AuB7pkRoGM8us
 N/+qwWBbEzitCJF9BsojOjgHccfmRknpyNarawLRlgtjQzd//KK0ib4/UyiZr8WSg+
 ZWvqVSfR61SGzxqDhoAFEnuooI7tKusUPiiElzV4=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 18 Jun 2019 20:12:46 +0200 (CEST)
To: scott andrew franco <samiam@moorecad.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20190618091424.6c61c97e98fe7bb02193b2d6dca4a85a.2b4174f59f.mailapi@email03.godaddy.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <21aba5e0-16e1-f406-267b-4ab4af9dd19d@perex.cz>
Date: Tue, 18 Jun 2019 20:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618091424.6c61c97e98fe7bb02193b2d6dca4a85a.2b4174f59f.mailapi@email03.godaddy.com>
Content-Language: en-US
Subject: Re: [alsa-devel] Issues with tip alsa-lib (stable, 1.1.9)
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

Dne 18. 06. 19 v 18:14 scott andrew franco napsal(a):
> A roundup of my current issues with the alsa-lib repository:
>  
> 1. No apparent .so (dynamic link) file output.
>  
> The configure and make instructions were followed, and no apparent .so
> resulted:
>  
> samiam@samiam-home-pc:~/projects/alsa/alsa-lib-1.1.9$ find . -name *.so
> samiam@samiam-home-pc:~/projects/alsa/alsa-lib-1.1.9$ find . -name *.a
> ./src/timer/.libs/libtimer.a
> ./src/rawmidi/.libs/librawmidi.a
> ./src/ucm/.libs/libucm.a
> ./src/topology/.libs/libtopology.a
> ./src/.libs/libasound.a
> ./src/hwdep/.libs/libhwdep.a
> ./src/seq/.libs/libseq.a
> ./src/mixer/.libs/libmixer.a
> ./src/control/.libs/libcontrol.a
> ./src/pcm/.libs/libpcm.a
> samiam@samiam-home-pc:~/projects/alsa/alsa-lib-1.1.9$
>  This has made it difficult to debug issues with the library.
>  Using the configure flags does not seem to have an effect on this, IE:
>  ./configure --enable-shared=yes --enable-static=no
>  Linux distributions have libasound.so files in them, so clearly it was
>  possible at some time in the past.

You don't send the more details (config logs etc.) so it's difficult to see
what's going wrong with your distribution and configuration. Ubuntu is
specific. If you miss something, send us a patch for the review and inclusion.

>  2. Build instructions are conflicting.
>  ./configure
>  make
>  Does work on this version. This is the standard GNU build method, and I 
>  have seen these build instructions around the internet for building alsa.
>  The INSTALL file recommends:
>  ./gitcompile
>  Which also (appears) to work, but no reason appears for why this special
>  file is needed or what it does that is different. I can't get a .so (dynamic library
>  from the build, so I can't check the function of the resulting build.
>  Is there a reason the instructions from ./gitcompile cannot be merged back
>  into the make?

If you compile from the repository, gitcompile should be used, otherwise use
the tar ball. The ALSA website allows to generate/download the latest tar ball
with the autoconf/automake/libtool scripts bundled.

>  3. make install brings the system down.
>  Executing:
>  make install
>  Brought my ubuntu 18.04 sound system down. I had to reinstall Ubuntu to get
>  it to work again.

Distributions usually do own modifications in the default ALSA library
configurations. The best way is to use LD_PRELOAD when you compile your own
alsa-lib for the debugging to not broke the system's dependencies.

>  In summary, ALSA is not a development project anymore. It is the "official sound
>  system of Linux" and is part of the kernel. There is a lot of activity on the ALSA
>  list. Cannot some effort be put into professionalizing the repository?

??? I see your frustration, but we are not responsible how distributions adapt
the universal code.

						Jaroslav


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
