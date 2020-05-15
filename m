Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB491D4626
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 08:51:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C7861661;
	Fri, 15 May 2020 08:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C7861661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589525512;
	bh=AtT1Xb4FVNXxUa7zelIhmActhDAjhmCTL8gtRaQVJyU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XonzwDUKRoYQcvyQ/EIO082Rxa61uMQ2Xn+p9rum2PWx69hoq+YhgbigF2AlS+3UU
	 ztWS9+XAoOzU+0ATv24Lvy8aLOQyY3JJ7v3Hyg6uOiwi3VrmASjxvaKB4UjZpP9zz2
	 oB5GqlnuUmYK7OiDSHVveve7yjBZ1bXzBNnIC7Zk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BD48F80254;
	Fri, 15 May 2020 08:50:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AB4BF80255; Fri, 15 May 2020 08:50:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4DF0F8022D
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 08:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4DF0F8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eslx7QGZ"
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA9CA20728
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 06:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589525445;
 bh=AtT1Xb4FVNXxUa7zelIhmActhDAjhmCTL8gtRaQVJyU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eslx7QGZztOTgl8QYMht0TptLxUHnG2GPL/1P6nqfU8fQOBTLiBcr75aDZ9irutry
 ZcDE8b7Hi7YMaxYuhGeUSR1tfbP51B60lBNhUd9fhpsMRnpDJCWW9rNnErkcY82a49
 xwcgTi5wQbejXQWcZQ6Y0U+EsKdTcaoK+O9F/J1U=
Received: by mail-io1-f53.google.com with SMTP id k18so1553454ion.0
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 23:50:45 -0700 (PDT)
X-Gm-Message-State: AOAM530sDxzGWG4O57F/CoJD1O7yvLQjj/QYsypLhaCmng/9VjdZ0lA0
 w6An2k5GqfFfiJTqfJ3TVqDrSDzhb6eXV/qTF5U=
X-Google-Smtp-Source: ABdhPJxEuuhR6MxWM8ezQwkPv6OGKtL1O+Amag2jK6walSq9689P55HMsQDKuNhKhm7kto3w1BfQaTGnCLFiB65f5hs=
X-Received: by 2002:a02:c6b4:: with SMTP id o20mr1803136jan.134.1589525445079; 
 Thu, 14 May 2020 23:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200514161847.6240-1-ardb@kernel.org>
 <20200514162548.GA141824@google.com>
 <CA+Px+wWps5d5qpL_0ed2jrD5bMKgd=8p1rbcRH28J-1SpgVz0Q@mail.gmail.com>
 <CAMj1kXE2KsCoDrH5nY7vmGA6K4ekDTX=v-stj1uh7UHNqquJMg@mail.gmail.com>
 <CA+Px+wV1w4gFcV+ABtK44ec0aPTT9APkpFMUyLMUh5tStgHstQ@mail.gmail.com>
In-Reply-To: <CA+Px+wV1w4gFcV+ABtK44ec0aPTT9APkpFMUyLMUh5tStgHstQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 15 May 2020 08:50:34 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEkUetEX4XG1CkS9nBa2e7J4LsM1vL7FvSoBUgVjz51mQ@mail.gmail.com>
Message-ID: <CAMj1kXEkUetEX4XG1CkS9nBa2e7J4LsM1vL7FvSoBUgVjz51mQ@mail.gmail.com>
Subject: Re: [PATCH] SoC: cros_ec_codec: switch to library API for SHA-256
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
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

On Fri, 15 May 2020 at 08:40, Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Fri, May 15, 2020 at 2:04 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > > Looking at the code, I was wondering if the SHA-256 is really required
> > > > > here? It looks like it is using it as some kind of fingerprint to decide
> > > > > whether the provided file is identical to the one that has already been
> > > > > loaded. If this is the case, we should probably just use CRC32 instead.
> > >
> > > No, the binary blob carries data and possibly code.  We are not only
> > > using the hash as a fingerprint but also an integrity check.
> > >
> >
> > But does it have to be cryptographically strong? Why is CRC32 not sufficient?
>
> Please see https://crrev.com/c/1490800/26/include/ec_commands.h#4744
> for our original decision.
>

In this case, you are using the digest to decide whether the same code
has already been loaded, right?

So it makes sense to think about the threat model here: if you are
able to defeat the strong hash, what does that buy an attacker? If an
attacker is able to create a different piece of code that has the same
digest as the code that was already loaded, the only thing that
happens is that the loader will ignore it. If that is a threat you
want to protect yourself against, then you need sha256. Otherwise, a
crc is sufficient.


> Also would like to let you know that the data path to call
> calculate_sha256( ) is in-frequent (1~2 times) if you think it is too
> expensive to use SHA256

In general, you shouldn't use crypto at all unless you can explain why
it is necessary.
