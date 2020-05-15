Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E5A1D458F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 08:06:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 440861664;
	Fri, 15 May 2020 08:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 440861664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589522801;
	bh=NKKnQQlKfZ7DPWksGID1QG65d82yj2Cn/PJXyzHkQiA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j2Q1nRl0Wb3FS1b9kYjqf5+K1sgUw3cczFu2FU/nuGAB6VIfkQsCDVt5gQKmaHiKl
	 InrZq1xY8CvJTyLyThoRbQelpWBKjjqyGWXpQnG6+pkKGyOiNtDvxV7G+oRHbgP4Ne
	 ZVo46aHaRa2whXZMbze4Bk8w4ImDJdqMbMpkYIfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57111F8022D;
	Fri, 15 May 2020 08:05:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E1CFF80247; Fri, 15 May 2020 08:04:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB9A8F800E3
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 08:04:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB9A8F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pRdWkgoe"
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5EB820760
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 06:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589522691;
 bh=NKKnQQlKfZ7DPWksGID1QG65d82yj2Cn/PJXyzHkQiA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pRdWkgoeOR8HUd6ElXEqlhKTlAsTgLVseDrE9/IHXr1fXsEeFcfngUoGSuQ1mQDCq
 ytvNwCVKj6+CjKzcmFKvwWIrodxSZLSksDQozxD69Kr+hzSj7P+/aHGLIhlrMwp1oh
 iHc7UUVu2x335BILwO4/RlPFWEWbDjhqBGAHuApY=
Received: by mail-il1-f182.google.com with SMTP id j2so1312915ilr.5
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 23:04:51 -0700 (PDT)
X-Gm-Message-State: AOAM533jqnQpsv1wzU+hBG1PCs0C0b8WBh56pJ0RuM8YZlkDGPMi+uae
 Mg6NmDXtLL8EIxDfVvgCNe/DobJXt/QfVrDFhkM=
X-Google-Smtp-Source: ABdhPJx5+SaDTdB6BR12Ly1dr7OUkgUiU9FmZErK3Y+9MOVA55Fv7ziicQ5/dhE28okXMUOeM4iQ196R/Dfqk/smnZQ=
X-Received: by 2002:a92:c948:: with SMTP id i8mr1815738ilq.258.1589522691187; 
 Thu, 14 May 2020 23:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200514161847.6240-1-ardb@kernel.org>
 <20200514162548.GA141824@google.com>
 <CA+Px+wWps5d5qpL_0ed2jrD5bMKgd=8p1rbcRH28J-1SpgVz0Q@mail.gmail.com>
In-Reply-To: <CA+Px+wWps5d5qpL_0ed2jrD5bMKgd=8p1rbcRH28J-1SpgVz0Q@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 15 May 2020 08:04:39 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE2KsCoDrH5nY7vmGA6K4ekDTX=v-stj1uh7UHNqquJMg@mail.gmail.com>
Message-ID: <CAMj1kXE2KsCoDrH5nY7vmGA6K4ekDTX=v-stj1uh7UHNqquJMg@mail.gmail.com>
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

On Fri, 15 May 2020 at 04:40, Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Fri, May 15, 2020 at 12:26 AM Benson Leung <bleung@google.com> wrote:
> > On Thu, May 14, 2020 at 06:18:47PM +0200, Ard Biesheuvel wrote:
> > > The CrOS EC codec driver uses SHA-256 explicitly, and not in a
> > > performance critical manner, so there is really no point in using
> > > the dynamic SHASH crypto API here. Let's switch to the library API
> > > instead.
>
> Pardon me if I don't understand it precisely.  What is the difference
> between the two APIs?  Suppose it should calculate the same SHA256
> hash with the same binary blob after switching to library API?
>

Yes.

> > > Looking at the code, I was wondering if the SHA-256 is really required
> > > here? It looks like it is using it as some kind of fingerprint to decide
> > > whether the provided file is identical to the one that has already been
> > > loaded. If this is the case, we should probably just use CRC32 instead.
>
> No, the binary blob carries data and possibly code.  We are not only
> using the hash as a fingerprint but also an integrity check.
>

But does it have to be cryptographically strong? Why is CRC32 not sufficient?

> > > Also, do we really need to wipe the context struct? Is there any security
> > > sensitive data in there?
>
> No, not necessary as far as I know.

OK
