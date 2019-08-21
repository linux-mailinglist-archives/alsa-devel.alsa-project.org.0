Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC318971DE
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 08:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37435166A;
	Wed, 21 Aug 2019 08:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37435166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566367406;
	bh=37pkYFhAdLvP+CiKsIAdcE0w3EeJWO/jANIcICK7N2c=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lpKrQZgpDCcK2+9TYb2tNeByo+FTwPQJmskYLgn0c43ZScom/K20ncG+H3jNLQUlz
	 w973tFwm/lAuFnWkOMWAMZg0BfePZ3rgKLhuVcczpNr02UbuKv9zTKRcwlgoKZ8bZU
	 XZhk5D2nT4FztAahWb7dX16uUbnFbSqOtBPJqLI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60632F80308;
	Wed, 21 Aug 2019 08:01:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D797F80306; Wed, 21 Aug 2019 08:01:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4410BF800BF
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 08:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4410BF800BF
Received: by mail-ed1-f50.google.com with SMTP id m44so1498976edd.9
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 23:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hs9Q4JQ4sAzVdPQmb3HqoJDxpZfogEn9LhSdqe880xI=;
 b=cN2gFZPoBeRDzayrIS0TJPCfQ7tE8PD6kvCNCL67JaZGIe9o7jQj9Sf77Uze/qmwyi
 2ZCcsGZlAYbPoQFjZxOZ74uCQeHVNOJvNx3ukgHwR1H++T0EtQ/s2nGSPS986c2HMNzb
 4If4aIN/WMzQzyC7VOTyHHrzIZ7pphtPCVALktA7yEryo3eSvzK6HhzCP1D3fhZPSbey
 2cYxPn2p6R9zPcCQGwUmcE087tN/Jndh7qQ1dsSHgDRAJhtl8l4jvQynVIm15p2WdHEz
 JMh8laftodB3Wm2wCw40Omdwc2yA5zXI7cuhXfuBKMaag5qnLkA4ztoky3c5t0rAZoGw
 3zWA==
X-Gm-Message-State: APjAAAV6NiQc7UXIQwLttZkclLEMnlqe1T7wcbZTFRHwsOyIgogSRn5R
 +3pXNwlopSEuQkAm6AqRSVCQGdE4/W0=
X-Google-Smtp-Source: APXvYqxKVkruVxHywKdw6uFksVAkYzd75Yuu6rmxcT80MoLLsM7ZbIqFz448xuppsM9yFO5CxT8b2g==
X-Received: by 2002:a17:906:228e:: with SMTP id
 p14mr29909486eja.258.1566367290873; 
 Tue, 20 Aug 2019 23:01:30 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id s11sm3858089edh.60.2019.08.20.23.01.28
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2019 23:01:28 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id l2so834270wmg.0
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 23:01:28 -0700 (PDT)
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr3726750wmf.47.1566367288272;
 Tue, 20 Aug 2019 23:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-10-codekipper@gmail.com>
 <CAGb2v65+-OB4zEyW8f7hcWHkL7DtfEB1YK2B1nOKdgNdNqC0kQ@mail.gmail.com>
 <CAEKpxBnxf=iejk887A7qFkzt3BXVxiRS1PeA45aZYR9DsBAU4Q@mail.gmail.com>
In-Reply-To: <CAEKpxBnxf=iejk887A7qFkzt3BXVxiRS1PeA45aZYR9DsBAU4Q@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 21 Aug 2019 14:01:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v65CueHKeZMCsMFjwWA1vo7ne3K8uVu2_yGOsXChY371ew@mail.gmail.com>
Message-ID: <CAGb2v65CueHKeZMCsMFjwWA1vo7ne3K8uVu2_yGOsXChY371ew@mail.gmail.com>
To: Code Kipper <codekipper@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] [PATCH v5 09/15] clk: sunxi-ng: h6:
 Allow I2S to change parent rate
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

On Wed, Aug 21, 2019 at 1:52 PM Code Kipper <codekipper@gmail.com> wrote:
>
> Thanks....I've added to my next patch series but if you could add it
> when applying that would be great.

Please reply with an explicit SoB to put it on the record.

ChenYu

> BR,
> CK
>
> On Wed, 21 Aug 2019 at 06:07, Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > On Wed, Aug 14, 2019 at 2:09 PM <codekipper@gmail.com> wrote:
> > >
> > > From: Jernej Skrabec <jernej.skrabec@siol.net>
> > >
> > > I2S doesn't work if parent rate couldn't be change. Difference between
> > > wanted and actual rate is too big.
> > >
> > > Fix this by adding CLK_SET_RATE_PARENT flag to I2S clocks.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> >
> > This lacks your SoB. Please reply and I can add it when applying.
> >
> > ChenYu
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/CAEKpxBnxf%3Diejk887A7qFkzt3BXVxiRS1PeA45aZYR9DsBAU4Q%40mail.gmail.com.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
