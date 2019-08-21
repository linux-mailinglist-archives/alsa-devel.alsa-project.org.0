Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E40E797649
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 11:37:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FCC51658;
	Wed, 21 Aug 2019 11:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FCC51658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566380271;
	bh=L8y0YmchoodRm29sCBY8T4dGpWjn/Qxg5dQIdqLgQYo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B/LXnC4778HbMtR1r2T0Et5dQbccEtjahsrSDG2jHEPmi/NZZ2qfX4eHOXEIPb2FX
	 VrHl0kykeL7esh+RlTdQ+QUfu7cxNfHrdqCU9nHvFN3SgJvrpmJDK4s5Xyc0xvDBl4
	 tjXkiiPjyOCexGsbDnsl7YLDFe41NKBknah1FI9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E424AF80306;
	Wed, 21 Aug 2019 11:36:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB803F80306; Wed, 21 Aug 2019 11:36:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05E07F80157
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 11:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05E07F80157
Received: by mail-ed1-f68.google.com with SMTP id f22so2187556edt.4
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 02:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LfU8K2+XLYidqJ3RYJr0NsqUHW7a3b14hBOppxr6+tU=;
 b=myP7l9hNtAKieojWqHdNB8TNoa1OGlMhhLfCULGHq6it8ZAplBPb2pr9MTp1RR6SGz
 Ru0DeeUPzC1DcH6ps+OzJH/q5VVcvJgvcYvZhTtE9cU6Ss6wkFxho2dTjwyvuVYXdgNY
 Ud42P8GZ2oK8xPgss4Z0vhumhVd2wIVC4z+ru0gP19rQVFzlAUhCQZivH8pgmIhdRi71
 FM49su5CVpYAbWsZt2/q58h0wN14MMIGmyaYysHEjkTBbVWaGx7CgAPxllPC8WGJs3BH
 nbdHF3m4HT7GvG5qFh4gjrl8mqVR4Unlte5Tph3A8oO71FrhtHXzrz1XNC7iJFtcwX9J
 UA9w==
X-Gm-Message-State: APjAAAWl051cVZl/txr7VG/Y78NqSxhBzHgKDX/6qZjpgeuF+2J86XmN
 alykOB6FAeGlcDEStr8r0TqLxqdKuMc=
X-Google-Smtp-Source: APXvYqyyznHk7mtXqEvKazs8jM799QJdxEhCLlLOyiWkQIPMtk+/ElKYnM8vLueV8BkdXUb8pmoDdw==
X-Received: by 2002:a05:6402:1846:: with SMTP id
 v6mr32199514edy.31.1566380157074; 
 Wed, 21 Aug 2019 02:35:57 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48])
 by smtp.gmail.com with ESMTPSA id j12sm3874927edt.66.2019.08.21.02.35.56
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2019 02:35:56 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 10so1392313wmp.3
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 02:35:56 -0700 (PDT)
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr4849166wml.25.1566380156278;
 Wed, 21 Aug 2019 02:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-10-codekipper@gmail.com>
 <CAEKpxB=9NNoZgZoY_GpcEuDYoMUGzb+ATgZOSM64qy9tirC_MQ@mail.gmail.com>
In-Reply-To: <CAEKpxB=9NNoZgZoY_GpcEuDYoMUGzb+ATgZOSM64qy9tirC_MQ@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 21 Aug 2019 17:35:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v67JfquPoLbUVARSzX3ua22N_3Vg5Ys1JXht4ew_PXto5Q@mail.gmail.com>
Message-ID: <CAGb2v67JfquPoLbUVARSzX3ua22N_3Vg5Ys1JXht4ew_PXto5Q@mail.gmail.com>
To: Code Kipper <codekipper@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] Re: [PATCH v5 09/15] clk: sunxi-ng:
 h6: Allow I2S to change parent rate
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

On Wed, Aug 21, 2019 at 5:19 PM Code Kipper <codekipper@gmail.com> wrote:
>
> On Wed, 14 Aug 2019 at 08:09, <codekipper@gmail.com> wrote:
> >
> > From: Jernej Skrabec <jernej.skrabec@siol.net>
> >
> > I2S doesn't work if parent rate couldn't be change. Difference between
> > wanted and actual rate is too big.
> >
> > Fix this by adding CLK_SET_RATE_PARENT flag to I2S clocks.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>

Applied for 5.4
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
