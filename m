Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F5C777F0
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2019 11:39:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EA40207C;
	Sat, 27 Jul 2019 11:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EA40207C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564220397;
	bh=KetkDjmiqyHvqYcvHa3nNSopUsy7/YZpAaAOgiFFAYw=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d/3zUVqr9JjFVfpWpWbyYKhv6T9+ZnkNkB31bocxruqwagVeLSiddpPuMTFiC8Ekn
	 /9KoSmSKpNSny2crZpV94QvW8Qm5mwOuTLyIq5bMjoRs5yZGZsJ3jO5akzftEFphjv
	 YYvA/1X6B8Tr3Ce6SrlFWUjBZuHMFdHHYD9NqFIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91D95F802BD;
	Sat, 27 Jul 2019 11:38:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6D2EF80394; Sat, 27 Jul 2019 11:38:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FA47F802BD
 for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2019 11:38:08 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4D6D3A0040;
 Sat, 27 Jul 2019 11:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4D6D3A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1564220288; bh=azvOsGyxkfEWqm5FRpvxv52WfS9dBbyYpbHm6oIVlik=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=5KyRtcBv1QDMPb42poTrUUNuBccDIDSVv3kSRcwwI42yJ7V9c3//RiXWlmwBZDrBK
 sxpfpKk52pUNnjSetLYbnAmIbHjo69Pyeu6sa0EQseMePS9J0lYb3XOEq3CfdyBh86
 qA7vCI3LwCcZpgmWoKwyfAwtQ4gb3jYb0OyIpITg=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 27 Jul 2019 11:38:06 +0200 (CEST)
To: eleven xiang <eleven.xiang@gmail.com>, alsa-devel@alsa-project.org
References: <CAC0dki4GtTUbEBEuVVo0AynfRW13CdAFzc_m6Ss1POq2E3Q7bQ@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <b2634d02-1f09-fb4e-9674-c7932d0b8bc8@perex.cz>
Date: Sat, 27 Jul 2019 11:38:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAC0dki4GtTUbEBEuVVo0AynfRW13CdAFzc_m6Ss1POq2E3Q7bQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [alsa-lib][v1.1.19][pcm][multi plug] multi plug
 stuck in busy loop which caused high cpu loading.
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

Dne 25. 07. 19 v 11:59 eleven xiang napsal(a):
> Dear,
> 
> Currently, for Audio Echo Cancellation process, we combined both mic signal
> and reference signal into one pcm with the multi plug.
> And both the mic and ref signal are hw pcm devices, and they lived in the
> same sound card in driver.
> 
> Here is the issue:
> 
> 1. the master slave pcm device is already for read;
> 2. the second salve pcm is not ready for read, which means no data;
> 3. under this situation, snd_pcm_read_areas function will be stuck in busy
> loop as below:
> 
>         avail = snd_pcm_avail_update(pcm); * // here always return avail=0,
> due to the second salve pcm device wasn't ready*
>         if (avail < 0) {
>             err = avail;
>             goto _end;
>         }
>         if (avail == 0) {
>             if (state == SND_PCM_STATE_DRAINING)
>                 goto _end;
>             if (pcm->mode & SND_PCM_NONBLOCK) {
>                 err = -EAGAIN;
>                 goto _end;
>             }
> 
>             err = snd_pcm_wait(pcm, -1); * // return immediately, due to
> the master slave pcm was ready for read.*
>             if (err < 0)
>                 break;
>             goto _again; *// stuck in busy loop !! again and again until
> the second pcm data was ready !!!*
> 
>         }
> 
> it seemed that the root cause is that the two devices have obvious
> interrupt period gap , and we also found that this issue can be easily
> reproduced on our device under low memory case.
> 
> Currently we monitor this gap and return error to up layer to
> close-and-reopen device to fix this issue.
> So I wonder if there is any good solution ?

I tried to resolve this sync in my latest pcm_multi updates (all are in 1.1.9
already). Could you trace, why snd_pcm_wait() does not really wait for the
slave when avail == 0? There should not be the busy loop. The
snd_pcm_multi_may_wait_for_avail_min() callback should be called inside the
multi plugin.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
