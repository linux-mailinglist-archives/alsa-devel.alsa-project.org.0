Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 637E4357C2A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 08:11:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09C131686;
	Thu,  8 Apr 2021 08:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09C131686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617862278;
	bh=jjNzmaBW6HAl1H68mUeCA/VZEgqDypH7gdgZWbvPZsQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSC0kLzfeS+4q8UPmzFMgkBGQ1vHJ03pfgH/7+7zWe8TmyVng+iKSY08TjDhCaR4W
	 eI+CMoRXeyUgBNkf13DvjJ3ozNOpaXMhDgvRLvM6VxAX3nrYXuNHmFy3RtKnr0Uag2
	 nSVLfGQl0gvAy+sgUp4yUA6RKvEuEywhprofo2Zc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F72AF80246;
	Thu,  8 Apr 2021 08:09:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E6C5F8020B; Thu,  8 Apr 2021 08:09:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A22E3F80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 08:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A22E3F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AwB0cNwB"
Received: by mail-qk1-x734.google.com with SMTP id q26so1119199qkm.6
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 23:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dAyROF48Hwwrms3OnAIeZIykmBtOR69RlGEuHK9Gyv8=;
 b=AwB0cNwBe7vqm1cQBrVUMMCH5OZN79S/GnQvVTk7AscTCFLLIpOr58QNiXp0BENuTe
 I7wBYTsuf9DDDk5Jef/KGkJ+eFupiLRcMj2RIQ98raq68zBTxaNKulSnk2HRnPUbpIDd
 b+eBddAn1UyN/HhFPTezH5N+UFTRO913Pjdi3efYfXHJQNgn2aifRj5jRSDKei0i1usi
 weTWB/ARF9Vd3SyjRIs5ItGoCvlNKYukTLvQd/+Ait4wSPN+onmNDOki5JXxYRHeVXKg
 Nhx6P5Pp86NbHIkeGCbGgollrwjbLlgTo+zCPR/4pWhL/P5i5l0KXfdouE5C9uzo2YNU
 5ZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dAyROF48Hwwrms3OnAIeZIykmBtOR69RlGEuHK9Gyv8=;
 b=HqTXruW6jj17BkQa+ONQWmRVT0R0OBOrELwXvQchUDTG2X46AxgPeUXa+gO5zqfwUG
 miMYpzJ9ej0VlyD4g/YLJCg5j/puUFAih4MNmjfZ7uFyjfguN9qJiqu1xsfeoTQ4YhIR
 LB6Z+kbH7s5Xm4b/2osmaekL2DWHG7EyKDd5drxjX4OMTlRfgigJES7JJwRqZaTjiN/h
 UXUD/OVQSUNjgSIrHFKTX4eDTEMMIP395C/KIOaTVQBFztAjRbIDf4foxhivB7l3ViHu
 Qc3yBYo+GHm7epimpPp9FfVflMUw2mg9MEPvY7VBRq40T0b7juOOx9s4v0G0Q39QpbCh
 cFCw==
X-Gm-Message-State: AOAM531hGI6Uv24/86G6U+e0WsoGGL74pr3unm9rADI8zIQAbITkwz6F
 sSpIriSpbGd2tlkhCdQCxWtUV1s9UAIv2HBPMFc=
X-Google-Smtp-Source: ABdhPJyJ8kUPEKGsByO9sfR2zLTHMIqc1CwZF5iLNy3UKVQs2OcGfXiIPVYuCaN6cs1ZXIkEEPxPAuDcjGnJo7U8RRU=
X-Received: by 2002:a05:620a:486:: with SMTP id
 6mr6621971qkr.193.1617862172141; 
 Wed, 07 Apr 2021 23:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
 <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
 <CAEsQvcsCJUi8eP_t8MGUKf0zSf7Zmqiof8b0fmk-XhZtUScbmg@mail.gmail.com>
 <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
 <CAOsVg8raD8enyWELM4w17dZCe=1Vy2s+7RLszVko4aRLmj7jDA@mail.gmail.com>
In-Reply-To: <CAOsVg8raD8enyWELM4w17dZCe=1Vy2s+7RLszVko4aRLmj7jDA@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 8 Apr 2021 03:14:13 -0300
Message-ID: <CAEsQvcsz2Na9epF24urfqt5ZxFUU6efCj9hzV6x-a1mY_dfrUA@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Lucas <jaffa225man@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Mike Oliphant <oliphant@nostatic.org>
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

Em Qui, 8 de abr de 2021 02:36, Lucas <jaffa225man@gmail.com> escreveu:

> Well, I just got back from testing Mike's suggestion of setting the Roland
> Boutique D-05 as a playback quirk, disabling its capture quirk, and setting
> that endpoint test section to always be skipped.  Sure, enough, the D-05's
> playback is now perfectly crystal clear without the crackles associated
> with an LP record.
>

I know that feeling and it is wonderful.


> This is just a guess until I recompile again, but my capture from the D-05
> reports a read error, seemingly just as the vanilla mainline kernel does,
> and I think it's because I disabled its capture quirk line.  So, it seems
> to me that the D-05 needs both quirk table entries, whether or not the GT-1
> does.
>

Looking back to Mike's 2019 post
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-January/161733.html
we see the output of lsusb -v for the BOSS GT-1 and clearly we see that
0x8e is the implicit feedback sync EP, at least if we are to trust lsusb
-v. Therefore Mike is on the right track that the GT-1 implicit feedback
sync is for playback only.

>
