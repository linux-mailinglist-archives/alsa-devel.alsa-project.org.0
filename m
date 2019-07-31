Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD78D7C9E4
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 19:05:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4309B16B1;
	Wed, 31 Jul 2019 19:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4309B16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564592723;
	bh=T/Ug6+DQDxCgS550Okc9KGGfxvC+8OCbmVTBJUTmI7I=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BpnFKjIFEmcf1k3Xp+5IkvIF1OapjFAzU4p5xy6AMT96kKSsFZyKIzYgh9qeoSMno
	 bq2ukjAyx8ubjGodhftqSoqQA2T1BpEI8hluZc1+ABl9ZaxgG2ndB4TTxGwc1xdVlR
	 cedYUX1bnHklnJn3HmvZjKlwGfIQkADw5kgWP9gE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68CB7F80483;
	Wed, 31 Jul 2019 19:03:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC569F80483; Wed, 31 Jul 2019 19:03:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D791F800C0
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 19:03:33 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9E853A0040;
 Wed, 31 Jul 2019 19:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9E853A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1564592612; bh=CevwJumhoUc5qny2vxLTH9hnCXuxQEZBm4b+qzdoyXY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=p2U2o6/xgAw32wZjCRlHzpEjqdhyR1olHjHKH80/y79xtqcB08rck2rfot4wx455R
 Bdi4Fi63/WzPow+vgmGPNRK4/r587SwUvLJihAdBdPwksiZfl104UCw46hZnKUgQyw
 tc6FoKs9X2xhe01Ef83PzQgu++iY44NcNEtp5Xy4=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 31 Jul 2019 19:03:30 +0200 (CEST)
To: Diego Buffa <diego.buffa@gmail.com>, alsa-devel@alsa-project.org
References: <CAFwn9n1mL0tE8CaD+tF1vWBQv-E5hidz3B12WiHzxRhvpHs8fQ@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <6d91a30f-07a0-d5cc-6796-7480ed4e6989@perex.cz>
Date: Wed, 31 Jul 2019 19:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFwn9n1mL0tE8CaD+tF1vWBQv-E5hidz3B12WiHzxRhvpHs8fQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [alsa-devel] standard read/write vs event waiting routines
 (poll) in ALSA
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

Dne 31. 07. 19 v 18:05 Diego Buffa napsal(a):
> Hi all,
> I am trying to learn more about ALSA, I always used example found in the
> howtos but now I would go further.
> 
> I went though ALSA documentation (
> https://www.alsa-project.org/alsa-doc/alsa-lib/pcm.html) and in the
> specific the transfer methods.
> Basically I don't understand the advantages of using poll instead of
> traditional blocking read/write.
> 
> Generally I know that using poll I can multiplex I/O on several files, but
> in ALSA I cannot create the poll descriptor array as I want, as I must use
> snd_pcm_poll_descriptors() which requires that the poll descriptor array
> should have the size returned by snd_pcm_poll_descriptors_count().
> 
> Am I supposed to realloc the poll array descriptor once I set it up with
> ALSA, and add my own files? Should I then always check poll array
> descriptor with snd_pcm_poll_descriptors_revents() before checking my own
> files? And in this case it is safe to call
> snd_pcm_poll_descriptors_revents() with a  poll array descriptor bigger
> than the size returned by snd_pcm_poll_descriptors_count()?
> 
> Many thanks in advance.

All ALSA poll functions works only with the ALSA file descriptors. Basically,
allocate your pollfd array as big as you like and get the file descriptors
from ALSA to this array (using the returned count) and check those descriptors
through ALSA (revents function). Look to alsa-utils/alsaloop/pcmjob.c for an
example.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
