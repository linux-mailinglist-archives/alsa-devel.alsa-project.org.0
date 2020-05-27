Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 887111E4907
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 18:01:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1130A17A1;
	Wed, 27 May 2020 18:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1130A17A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590595300;
	bh=PdlvnwDutjb/77XkEtD1r65LredhRAMtRfD2KGF4Q+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AzCJStWreMuON0L0vIlWv3dcovnyLhgQvNUXLYbw6zveGSGtyDYhIPWLsAWIkm2Qv
	 ah8+b1by5mC0hc01+8UW8pDZKM8FKKMlPIExYEDOt2yXUS3MZjYKXUTkYeLU8ywEVp
	 4MiWgPCM1yCvUzHpJxRfzCc2NLOcvPSnDiFSYPiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41D0DF8016F;
	Wed, 27 May 2020 17:59:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83E0DF8014E; Wed, 27 May 2020 17:59:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40249F800FF
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 17:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40249F800FF
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MXGzQ-1jVpV11YnW-00YjZ7 for <alsa-devel@alsa-project.org>; Wed, 27 May
 2020 17:59:53 +0200
Received: by mail-qk1-f182.google.com with SMTP id c185so10718951qke.7
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 08:59:53 -0700 (PDT)
X-Gm-Message-State: AOAM532V9JxHTDR8rC5HD1VyCUiN44WMejQYGpAvUaB8OgoKLfo+LvnY
 BNXZPcdd+Hp9U51DsdPaeqUPZdrZ/KPsAFhCJG0=
X-Google-Smtp-Source: ABdhPJxDutw7MBd/EYBIKtYxOivFQlLGm+KC5RbbRJSXfuIwQcc5opcAUQCuxjh5ZJMaChtg/SMDmArapoMUIIqUbag=
X-Received: by 2002:ae9:c10d:: with SMTP id z13mr4427434qki.3.1590595192185;
 Wed, 27 May 2020 08:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200527134151.834555-1-arnd@arndb.de>
 <20200527134743.GH5308@sirena.org.uk>
In-Reply-To: <20200527134743.GH5308@sirena.org.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 May 2020 17:59:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3fmQSTAKehsjZX8CEEEK7oHoGdviLKY2JE4=tTccGkyQ@mail.gmail.com>
Message-ID: <CAK8P3a3fmQSTAKehsjZX8CEEEK7oHoGdviLKY2JE4=tTccGkyQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: amd: rt5682: fix soundwire dependencies
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PItm1Ki0Bka0tZVzj9YTLHwNK/raKV3Q/gElHh3fueRkhBikag9
 HoeazUcOr2apHb42XmRsDOnVYZ5sbAwNjVfBddFqLGgTIICnjm8ahU2ZmCI0QL4GaeUA/nA
 RMefk1PmMXZxtPdHDDOiwH53gI44x/u1mnIN+7KXF0ubacvY6koIziFqDL71r5YQmNVPAqT
 JDs/oLoZXM+MIINkCHvSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K8RV9tx35bI=:VcZnVH+wWuLiJR/KkdZcTR
 gwaso36jXTxHZomdjN6nRgMCiWcORPC97NHewkpkwG24sEAAy04L2ZmyhyeqM+2bfV73kUjj9
 XRDXkfoK/xH3aMq74cxvz6D1h4Va0HaiGUw0NTpwMlhxi0CUUyCr0UWV2hoXPtdnuUeD3/abZ
 YNOC2yygO5afLynUp7Ua6FIh7mlVvT4D4w+OpZZUyh0nTk52L/qzXRJURI74lhxwvnHwOFhAr
 GSyKKZEe77nvXrHSxAkamZtATwXx8KqheQ8XPJKZfqGDMGtiFpONYI7kTe76Cupl4Z8sHy4f6
 K3ZZlYRLeUSgZSUJZL7COPm06oZIzdzFuUZ/kE6aEDqRkrRMAWd+OYvnt8AOrKODJAhKj/jRk
 e4UaNSDzo6v6iYLng5pY+p0UCQEHpkMp03jJgttqAP874pApmcV7JK5Kh/Sq66ii/pztObiwP
 JwcjA8ETvni0v4vAN82zScORO+6wxbC5WKpTMKT2AZs/8H/8EOymIQ0aeu3Z9e+cE8vGNaJ5Q
 krSMgaXvVwWCsrr2CPDvcdR7kjS28spfYkW9xQso8/tkxxGlxSofxZg2ZITXhgujgc7UEiAk5
 3fCZ0d9SHbI0qRyLHZO/YHbOyUJjaUnrKBPf3kkXsMCm1FIEc1SWfonWipEc88SqNe6FRH9jN
 rR7//G0JmtjX44AaGARK7K69J1bd5SDReZelveVKIP1UVoy3TopJMIhqzy7d/whLzYo1huqZs
 tow1mLyzAz5YfVPemuDF/avXtcvyRpIHmVqnEA4siSK/TGSwngi0ZK1XK+Aj6Siz3k3Ts5VtD
 7VCV6NGo/B0BpVB8tb8gtvFp6eHuoWPrpVD38nn9Eh6t4Bq/Ig=
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>
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

On Wed, May 27, 2020 at 3:47 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, May 27, 2020 at 03:41:26PM +0200, Arnd Bergmann wrote:
>
> > Maybe the SND_SOC_RT5682 driver itself can be reworked so that
> > the common part depends on neither soundwire nor i2c and the two
> > bus specific options can be loadable modules when the common part
> > is built-in.
>
> Yes, please do that.

It took me longer than I thought it would, but I have a patch now.
I'll send it after it passes more randconfig builds to ensure it covers
all corner cases.

      Arnd
