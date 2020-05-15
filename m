Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F361D491E
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 11:10:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DDD4166A;
	Fri, 15 May 2020 11:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DDD4166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589533839;
	bh=6Vne5TFZ+3SHgwVYN2gaC6/UPeX7FZpLWTw80dC8v7s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eGxPJJqBin76yeEdcpmDvDLiNX7ykhICONN7WV18xPKgPSIIUh90yKuoOXxrjaeTt
	 IjIxl3nP41V9X8hSrfzzgoqeQwTZF5kZ+/oa33tnuZibIOTN/jSt2NKmwvMNpKehO/
	 /LbPtvQqgCvQWj4VqbYZmjLLeeLBBnOdys8YU1n8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA5CDF80253;
	Fri, 15 May 2020 11:08:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90E4EF80101; Fri, 15 May 2020 11:08:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3469F80101
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 11:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3469F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zTWqCAgt"
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 739CF2076A
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 09:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589533731;
 bh=6Vne5TFZ+3SHgwVYN2gaC6/UPeX7FZpLWTw80dC8v7s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zTWqCAgtNcUHL2jVtdgt9jm8OPA/p4193f7r6VPW4oxfow6IJGMl5NxRT1XNcuPAq
 z4JORFvB5Db6qv8SzzjNNhJNoxeCM+2PV6Rn/73qo672joD8flqzihqKl+ltlj5iCo
 iRxgOo2gGKV0JaM2LArfLqpbiTCZu0fQI/0MFYag=
Received: by mail-il1-f173.google.com with SMTP id j2so1719119ilr.5
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 02:08:51 -0700 (PDT)
X-Gm-Message-State: AOAM533ceNlJpv+veRxQkb6l9N0fuXcwDnVeOHT5BNI1oxPPwldh4tY9
 Gf0tbqjO3jmZzXJajUlrKnBRMMdm0aYOCQCqJ9Q=
X-Google-Smtp-Source: ABdhPJwTrXIn22aj00q5gK9CoTCB600xY8ME8XcfoHDqxdUw9pMdUdtADEZEWBugD442F1DsgLnGdmZ9LzztQ+BK/vE=
X-Received: by 2002:a92:8555:: with SMTP id f82mr2250462ilh.279.1589533730788; 
 Fri, 15 May 2020 02:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200514161847.6240-1-ardb@kernel.org>
 <20200514162548.GA141824@google.com>
 <CA+Px+wWps5d5qpL_0ed2jrD5bMKgd=8p1rbcRH28J-1SpgVz0Q@mail.gmail.com>
 <CAMj1kXE2KsCoDrH5nY7vmGA6K4ekDTX=v-stj1uh7UHNqquJMg@mail.gmail.com>
 <CA+Px+wV1w4gFcV+ABtK44ec0aPTT9APkpFMUyLMUh5tStgHstQ@mail.gmail.com>
 <CAMj1kXEkUetEX4XG1CkS9nBa2e7J4LsM1vL7FvSoBUgVjz51mQ@mail.gmail.com>
 <CA+Px+wXFpGZJx6yRJWQPsT0=8uWPduWW1_EierRxEJhjLFHjTw@mail.gmail.com>
In-Reply-To: <CA+Px+wXFpGZJx6yRJWQPsT0=8uWPduWW1_EierRxEJhjLFHjTw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 15 May 2020 11:08:39 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH7p+nXZnTn-rzo_3u_wCi1VHPMf6jvtZNw8h3TRj6uUw@mail.gmail.com>
Message-ID: <CAMj1kXH7p+nXZnTn-rzo_3u_wCi1VHPMf6jvtZNw8h3TRj6uUw@mail.gmail.com>
Subject: Re: [PATCH] SoC: cros_ec_codec: switch to library API for SHA-256
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@google.com>, Benson Leung <bleung@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, 15 May 2020 at 11:02, Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Fri, May 15, 2020 at 2:50 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > In this case, you are using the digest to decide whether the same code
> > has already been loaded, right?
> >
> > So it makes sense to think about the threat model here: if you are
> > able to defeat the strong hash, what does that buy an attacker? If an
> > attacker is able to create a different piece of code that has the same
> > digest as the code that was already loaded, the only thing that
> > happens is that the loader will ignore it. If that is a threat you
> > want to protect yourself against, then you need sha256. Otherwise, a
> > crc is sufficient.
>
> My original intention is to:
> - avoid transmitting duplicate data if remote processor already has
> the same binary blob (be reminded that the transmission may be costly)
> - check integrity if any transmission error
>
> Not considering preventing an attacker in the original design.  If an
> attacker can send arbitrary binary blobs to the remote processor (via
> a dedicated SPI or a specific memory region), the attacker should
> already "root" the kernel and the device.
>
> I understand your point that CRC should be sufficient in the use case.
> However here are my considerations:
> - as the payload is possibly executable, I would like to use stronger
> hash to pay more attention

As I explained, the fact that the code is executable does not make a
difference here.

Typically, code signing involves SHA-256 to make absolutely sure that
the correct code is loaded only. So *only* if the digest matches, the
code is loaded, and if it doesn't match, the code is rejected.

In your case, the code is only loaded if the digest *does not* match.
I understand that you are using it for integrity as well, but this use
case simply does not require strong crypto, even if it involves code.

> - calling calculate_sha256() is in-frequent, I don't really see a
> drawback if it is almost one time effort
>
> If we want to switch to use CRC32, we cannot change the kernel code
> only.  There is an implementation of a remote processor that also
> needs to modify accordingly.  I will keep in mind whether to switch to
> use CRC32 next time when we are revisiting the design.
>

OK, that is an excellent reason to stick with the current code. If the
receiving side requires changes then switching at this point makes no
sense.

> > In general, you shouldn't use crypto at all unless you can explain why
> > it is necessary.
>
> When you are mentioning "crypto", do you refer to both crc32 and
> sha256 in the case?

No, CRC is not crypto.
