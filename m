Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8162F21F89F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 19:55:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C7FB1669;
	Tue, 14 Jul 2020 19:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C7FB1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594749305;
	bh=Vj9u8QF9x99xMmejTwSLhX1eTftkeD98fKJvUc1Dfws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A5DLxRON0dyafot2ww8ElqE3qgz7hiMagpiQFrwd9VIVdnUJXbd5RBTeN+nlHnKVa
	 cMPxNlDcl2E23efgj9erLWvtMyUkm4Bd+aNQghbpSl/iwrqYN4tnVQMBhDOHtjfdSr
	 eJXB86SaDAwvlA2siGetFsDyYVm0u7fljsxM5LTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EC02F800E5;
	Tue, 14 Jul 2020 19:53:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B971F800E5; Tue, 14 Jul 2020 19:53:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9419DF8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 19:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9419DF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h/LcrFQh"
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7286922597
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594749188;
 bh=Vj9u8QF9x99xMmejTwSLhX1eTftkeD98fKJvUc1Dfws=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=h/LcrFQhreoRzvurbroMwkTmQ359hV48l9cybtWCBaOFtWTXb4wI4GMJFqJ1yaZwS
 17nUkwG5qYZIEPugizU2WFZGkh4XDeo9yrcMshphwgzT2wfk4nQ04mAarfL4g4vK+W
 YI5C9xFqehV0JuttYHL4lLcddwPuD7JqlQ7F4iTE=
Received: by mail-oi1-f179.google.com with SMTP id k4so14602151oik.2
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 10:53:08 -0700 (PDT)
X-Gm-Message-State: AOAM532JG1m9LaN+ttXjyAS6Khhe3KEb5v9hhrqAMKutVMYDtpM+dKvM
 XwpfvNSz817Yb8PJdyjRzN6bRnAGVJUhYarOwQ==
X-Google-Smtp-Source: ABdhPJzeQjKGJO3Po7FN1n6GH1S+VMKuEzA4tWJk8eA1Ub0hYOYIbQ9EQOL3U26bSjQVI/j843zgHlHyOlWhcVywtCA=
X-Received: by 2002:aca:bb82:: with SMTP id l124mr4795615oif.106.1594749187884; 
 Tue, 14 Jul 2020 10:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200623114005.791643-1-yamada.masahiro@socionext.com>
 <20200714022252.GA1151466@bogus>
 <CAK7LNAQrdqztMrHtAHnbMkxeaDLLyBS68WVovev+zytHdD7RVQ@mail.gmail.com>
 <20200714095259.GB4900@sirena.org.uk>
In-Reply-To: <20200714095259.GB4900@sirena.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jul 2020 11:52:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLvMbeMQL+SFgA58cZ=+FueSB5qYKf0f-CBy83S4sQ4cQ@mail.gmail.com>
Message-ID: <CAL_JsqLvMbeMQL+SFgA58cZ=+FueSB5qYKf0f-CBy83S4sQ4cQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: ASoC: Convert UniPhier EVEA codec to
 json-schema
To: Mark Brown <broonie@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: DTML <devicetree@vger.kernel.org>, - <alsa-devel@alsa-project.org>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Tue, Jul 14, 2020 at 3:53 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jul 14, 2020 at 03:13:26PM +0900, Masahiro Yamada wrote:
>
> > What do you mean by Reviewed-by ?
> > Do you expect this to go to the asoc tree?

Yes.

> > I just thought the schema conversion
> > would go through the dt tree.
>
> No, bindings changes usually go through the subsystem - if there's any
> other work on the binding then it'll usually also involve driver
> changes.

I have been taking some conversions so I can test them when they are
standalone, there's a low chance of other changes, and the maintainer
tends to be slow to apply and pickup fixes (not Mark).

Rob
