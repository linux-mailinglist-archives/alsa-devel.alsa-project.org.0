Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 767021D460F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 08:42:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04DF3165F;
	Fri, 15 May 2020 08:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04DF3165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589524964;
	bh=ivaZV4FOLmqk4qLDORTWV2G8OpRvf9zHomh3nKcKpGc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aEWvQLadZEU2hn0WtTAYJW0dv9ayezNljGM+Uyk0C3PSIvzqov520x9WaJHLRhtCt
	 lsIk962VL3qjCO33a52LMeMXKcmyI3RHXerkY43LINkqrpHVk0KX4F1KKWPZgaCN5Q
	 IGU2nH4fEsw059xNHEcaNI8FsRn9tKdNmjpX2KQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 163B9F800E3;
	Fri, 15 May 2020 08:41:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D855F80247; Fri, 15 May 2020 08:40:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F15CCF80101
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 08:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F15CCF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="kedPyfyA"
Received: by mail-il1-x143.google.com with SMTP id j2so1379900ilr.5
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 23:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jtwuwbhZ6A1b4vAVNKxC0NpUu5HS+cLkLu7H/I7Q8aw=;
 b=kedPyfyAr2Uzfrcint3dygGAooOQJHDLqe25UsKt7mCcRzfRZIKt7LRQJ9VgU1I5jf
 pJWV7TwPtiRwZBb9CHUKBXwPSVoHQqHFmYl2Gx2NU4EWFj+xnZV0U8Jt/VEyW1ShdDIj
 goHhRXdsa9fIQgyb7N6Ank+5y/8Ljlp1kBf6oGQ3NLvZ47omqJecjYwNcaOHsiYz8j4G
 ulat3c2LEI5ILSLKS/3Nd8Z6N9bZOxbreW3cNS3yIHwdmywpIx8va+oNduhu/wSKA15S
 uctKkd7aA1BAUfAkr8jM9anai0HnNCCwb+cCIm8Ks8izYJctImSqp/lQ1pfcpEZMb4Sd
 6L8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jtwuwbhZ6A1b4vAVNKxC0NpUu5HS+cLkLu7H/I7Q8aw=;
 b=VVK42Kpu7k1fZ8GWoKy9XZdQ6oBGdDVGQhoHceYF33/Ifm1CQbanDpUxwT1dFh8Ww/
 QVHZp3HdASbPiKhwNBOzLl3AyuGpLPAJ69vFyExamCJc5kfRB4FJT4cn+jhTSbFAyvgA
 dnkivn8iLB/FRSWvhsfo54pNiAmxajgiaxe1b6t5TIi7plewC6YfTvNQPY0K1CFrS5B5
 /5JoVu/juS25m7HlQzFnG5N/iHRmoGbE9MHxe2zRFlGqiHC+9eG8JhaInfNK+ZpFvC+l
 lpKE4l5zZV9jdESz7cgGEjZBwcQFj/6Sh4MXg6sLDWpPRNh1gEZIuFrt0GsYfWZlhCtz
 4pUg==
X-Gm-Message-State: AOAM531j8j/VhjJje30KF0ngHYp+zUc6WkqdMxofKlgk6gxTQUlyuQg6
 ozv+VOPZP2ksugpZCI5/M54vfHrXJOuPo029xOAPGw==
X-Google-Smtp-Source: ABdhPJwY5u0/HlPGaYfutVthaYvaNNYfoLyJIHZEkfVG8bTmmyGQbdDQTXWFhHP8/InxirnOa2oag2kKxJnFWIolUHw=
X-Received: by 2002:a92:8747:: with SMTP id d7mr1876893ilm.235.1589524846202; 
 Thu, 14 May 2020 23:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200514161847.6240-1-ardb@kernel.org>
 <20200514162548.GA141824@google.com>
 <CA+Px+wWps5d5qpL_0ed2jrD5bMKgd=8p1rbcRH28J-1SpgVz0Q@mail.gmail.com>
 <CAMj1kXE2KsCoDrH5nY7vmGA6K4ekDTX=v-stj1uh7UHNqquJMg@mail.gmail.com>
In-Reply-To: <CAMj1kXE2KsCoDrH5nY7vmGA6K4ekDTX=v-stj1uh7UHNqquJMg@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 15 May 2020 14:40:35 +0800
Message-ID: <CA+Px+wV1w4gFcV+ABtK44ec0aPTT9APkpFMUyLMUh5tStgHstQ@mail.gmail.com>
Subject: Re: [PATCH] SoC: cros_ec_codec: switch to library API for SHA-256
To: Ard Biesheuvel <ardb@kernel.org>
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

On Fri, May 15, 2020 at 2:04 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > Looking at the code, I was wondering if the SHA-256 is really required
> > > > here? It looks like it is using it as some kind of fingerprint to decide
> > > > whether the provided file is identical to the one that has already been
> > > > loaded. If this is the case, we should probably just use CRC32 instead.
> >
> > No, the binary blob carries data and possibly code.  We are not only
> > using the hash as a fingerprint but also an integrity check.
> >
>
> But does it have to be cryptographically strong? Why is CRC32 not sufficient?

Please see https://crrev.com/c/1490800/26/include/ec_commands.h#4744
for our original decision.

Also would like to let you know that the data path to call
calculate_sha256( ) is in-frequent (1~2 times) if you think it is too
expensive to use SHA256.
