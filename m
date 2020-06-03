Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 304FF1ED48E
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 18:52:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5A171661;
	Wed,  3 Jun 2020 18:51:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5A171661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591203137;
	bh=hVep/pKd7sRgajtjutDwXuCKsgPQfHsxvFvDJaD/csE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JQPazdmkiHT7b59sQFQK8T6gqJLO7xD7DcZBBnvszTnkULCVe9w+1mM3CGkYfJzlO
	 W3veB95alxOR1TFHUJgSva7zE+HRjbCrMjdDx37I9LWbTVBlZ4lBfloUWDFJdQ16xO
	 SnyCfgj2KXoJKAK3CO+RZOgxSj7hsDJP9M9om8wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7E2AF801F5;
	Wed,  3 Jun 2020 18:50:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60892F801ED; Wed,  3 Jun 2020 18:50:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83F84F800BC
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 18:50:25 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 13B60A003F;
 Wed,  3 Jun 2020 18:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 13B60A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1591203023; bh=JzJZph8lmYpDDybe2A71AkjgaUXIM4zblZa5P8AGja8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=5RwFWBFhHuJwXfONMf1dQQSHquHNB2xvyRlRDbcJq7eNDEZ+X92OIiaK8w5JoJ9Qd
 bnGIOFtB8gIFJJg9lK8AxBqw82K9zYHFN1hloywj0U+BSws/ig+XPn8QuKUiexD5+j
 NwbEgChSdl21rlkyCsoX4icEAQHigPiuUG3EWwCI=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  3 Jun 2020 18:50:20 +0200 (CEST)
Subject: Re: [PATCH] fix snd_pcm_drain() excluding SETUP state from valid
 states
To: sylvain.bertrand@gmail.com
References: <20200502193311.GA19340@freedom>
 <47281cd6-2ae5-309e-f1a9-8906ff50c9cc@perex.cz>
 <20200514210607.GA6081@freedom>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <881317ca-1180-6217-1dcd-dc75713c6f1e@perex.cz>
Date: Wed, 3 Jun 2020 18:50:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200514210607.GA6081@freedom>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 14. 05. 20 v 23:06 sylvain.bertrand@gmail.com napsal(a):
> On Thu, May 14, 2020 at 03:52:25PM +0200, Jaroslav Kysela wrote:
>> NAK: You should not call drain when the PCM handle is in the SETUP field.
>> It's an obvious caller problem. The streaming should be active somehow.
> 
> The pb here is the non-blocking calls of the drain function: in my test case,
> the first call to the drain function switches the pcm in draining state, but
> the pcm will be switched to the setup state somewhen in between 2 drain function
> calls! Naively, I was calling the drain function on a regular time basis to see
> if the draining was finished, namely expecting 0 to be returned.
> 
> Then if I understood you well, the right way(tm) to use the drain function in
> non-block mode, is to call only once the drain function, then inspect the state
> of the pcm till it not anymore in the draining state.
> 
> Am I right? Or did I miss something again?

I looked to this problem again and the original patch seems more appropriate. 
The snd_pcm_drain() should return zero, if the state is SETUP, because there 
is no further work.

I applied your patch:

https://github.com/alsa-project/alsa-lib/commit/1b9104b5ff10be7f60441f622436d4f14a2a97d1

with the (sanity) optimization in:

https://github.com/alsa-project/alsa-lib/commit/0b7f1441bb82903d45a29bf83c849ca94c5b7d7e

It basically doesn't allow to call the plugin callback (otherwise we need to 
review all plugin drain callbacks, if the SETUP state is handled properly).

			Thank you for your suggestion,
						Jaroslav

> 
> regards,
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
