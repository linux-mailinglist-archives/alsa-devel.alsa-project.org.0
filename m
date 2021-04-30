Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C48CE3700B1
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 20:45:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52F4A169B;
	Fri, 30 Apr 2021 20:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52F4A169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619808312;
	bh=ibwUhXLUski6xr9FsNBfn54+XNuaWOwhfrKc4OREyDQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uwfMY+3OHL8fYJNKW5EvVWXvxSAdtpaSKWyjtLTqHaCZ+8WZtKV9rP855ztqmdibA
	 cFFua1ZVn2/84J4GN4mBrBNj47Ga+Hpcu68ToQHtI34jssbD6s+3ojCh12gG+70ckh
	 fcf/ommUeIPLLMGPTh+IbWLUY/6c9OXNForfeOvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E00F80171;
	Fri, 30 Apr 2021 20:43:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE256F8016C; Fri, 30 Apr 2021 20:43:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2076F8012B
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 20:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2076F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EEwXinkx"
Received: by mail-pg1-x536.google.com with SMTP id p2so34555351pgh.4
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 11:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KI/MnFrdCFvAVp9lLRYtA+YcapFgP0IRl08eerf2/To=;
 b=EEwXinkxNWph9iZIOreBSC7zDYIf1fW4nFLZ9aGiN3bwvDwrYmn92TWTRXOYPE/gU5
 IEIGfcPhyvzGDxWsCp6G85OV3aytU4vjAqd6ZTQlvDIpFe7NuH5J/hWS+Gho6z/LU2mC
 vLl7SnRb7g+jiDYNBc9VzyhHHyWENZN9vBOdNQvR+Bm3R0KQzdwO+3JCqXbeQWPUefDK
 OI40DFmZm+IlTquzUee+j/GdeGb7NBy16gQ2LMtwHEBwww+Jvho3lJTcxObBnafL4DOo
 vqFmzW5QtmyZEvQf5WvFN+wTpzJumIog+bKAvHkZYzRRkI9GMNMFPZgxf4h1YR8FHi2T
 4wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KI/MnFrdCFvAVp9lLRYtA+YcapFgP0IRl08eerf2/To=;
 b=IUlm/Z/UDSzCFG4JHitQ1h5pZeq4uSsBgDcIIMXGLAI5lOTYvFj9EBxYJ03+v0lKcq
 70KnDlOVW/2EibS1/J/NLIU6wRVrexyBRW3H70DPXqpPT8RpGRHaKmfwyNa6c4qLi6BN
 j1bmxyjftjEQJxW9hyN2uMXTh/GKfWGRgEnxhbQzr4ETgDQT1zr0rXYOVycElhjjpg5O
 8NGUgpIn1qhfeaVNK31nft5U/9BTlxgQEsbDBW4A3ev7y2aSk1mYfq0r7hqqG42SX2As
 6qIhvmfbVKWHhE69N/Ef7ZfkyzX4T3dYpTYiVK6bEg9IThPuh74p31bLIykeWD9/+8CV
 1CBQ==
X-Gm-Message-State: AOAM532cmv9GLfddzF4BqQLmA6vVwllXGphDpeKPL3sLT35GvdYZUAYS
 0lQPmyaUoBvrH2NAgsIB+zbIgb+gcNhQ8R6j4SQ=
X-Google-Smtp-Source: ABdhPJxMPZpMkCGdC2AwEeUnojgwpbAa0yguUCDEQBxKd491/rtQyhV87+w7xmA2fqjNDpVJfvEvyYjKTUQmucHSixM=
X-Received: by 2002:a63:a847:: with SMTP id i7mr5759407pgp.203.1619808215145; 
 Fri, 30 Apr 2021 11:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
 <CAHp75VeiHsk15QoG3X-OV8V8jqzCNeKkif9V=cx4nvKVHaKbKA@mail.gmail.com>
 <20210427143457.GI4605@sirena.org.uk> <YIglWpz8lSidXmDd@smile.fi.intel.com>
 <CAHp75VfBSjHP1LJZJTdwXzGuE2YjxdW6r7Zf6ofHsquJBPMyWA@mail.gmail.com>
 <20210430180114.GF5981@sirena.org.uk>
In-Reply-To: <20210430180114.GF5981@sirena.org.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 30 Apr 2021 21:43:19 +0300
Message-ID: <CAHp75Vd0MKSZJpw0=qKtORmHRijw0HZLGz+W=sG_cyhLr1JPoQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] spi: pxa2xx: Set of cleanups
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

On Fri, Apr 30, 2021 at 9:01 PM Mark Brown <broonie@kernel.org> wrote:
> On Fri, Apr 30, 2021 at 07:29:48PM +0300, Andy Shevchenko wrote:
>
> > One item is still unclear to me. I noticed that you started already
> > applying patches for-next release cycle (if I understood it
> > correctly). Hence the question should or shouldn't I resend this
>
> No I haven't, I'm only applying things to for-5.13.  I've not even
> created for-5.14 yet, that will only get created once -rc1 is out and
> nothing for it is fixed yet.  If I look at it and find an issue I will
> tell you, if I've not said anything and I've got through my first batch
> of v5.14 stuff it's gone AWOL and you should resend.

Ah, okay, it means I misread the idea of applied patches.
Thanks for clarifying this for me!

-- 
With Best Regards,
Andy Shevchenko
