Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF2181B3
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 23:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C60F1ABB;
	Wed,  8 May 2019 23:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C60F1ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557351695;
	bh=tLBsoRhXxaPQFFG8SkvPFnOfDZQgnO8UHiyo42huxhM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FbHoSicgN9igSkXkdLTNLARsrTadI43JuHRdi81f5lDAXi9MdZjXx9pnA6k34q29x
	 dVdAountxlALE38A4b+5js8eMf6WEionebpoAsblJbf4y8Y5REl/toyQtvPQKpcjAR
	 vNCu3JcFN9QwQxzfjhV9M3vTu3uL9VIsxdaLj21o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1836F896E6;
	Wed,  8 May 2019 23:39:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55D91F896F0; Wed,  8 May 2019 23:39:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_PASS,T_DKIMWL_WL_MED,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91923F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 23:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91923F8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="kZ0sGhAL"
Received: by mail-lj1-x241.google.com with SMTP id z1so215179ljb.3
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 14:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x35GHOC+4EYtsgrhdYQQcY08TD8wwwstK0EnEQLGChI=;
 b=kZ0sGhALn3IdcGAoIdKhFQmH3MoaO+qPD1BFqOhJCn9ot837nEvhn/WG31aFznIVPD
 EfJ9Jok5N+3il0QxXYCum4koYryraM6ilb3IcCtM2Cehbfb7PFKOdeG0//7rdbs9zGqM
 usoZSbpUAeD8beJrUyClmY5+lyaW2urpR1XZGgqSwpCkeb8/oQIXUkdQeffC110GNQZE
 Li/xkfjhcBnCt7ZQ+lX+zmiHyNxO15S1MeoMcU0mXj4NTLzK5LbWP7I1ZSnv/YBhin0F
 R3p5JzWyuw1Hv215gYur366/0cKQo0+HrXuYj+WhsT/k8OlHqp/sujpz8fBxx3f3jw8/
 9aSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x35GHOC+4EYtsgrhdYQQcY08TD8wwwstK0EnEQLGChI=;
 b=KWIXElmgoS9HjKizuZdRpS+tx9miwZzDhM5ovBLzgu5zibEkVTqBDAJJGdAKJj62c5
 2iPYTL1oczn70EkdooXdT87cPkCLve+B2xIHmrY0BEYsdaBatutKrwYyjRG+/oYBrwFb
 FkI3qy/xRuCGonSdOTzITFr4XeAP6Z8dcgJYDPnAbI2umjFoj8RHdijO6195xRGQquu3
 IEOmWdKc59tnX+t0YuFDwo9AOZdSOSmh4+B8WVJIdUJyyAEkdP3qpVhFQriprHfKK3Y6
 b9JcZsFHneoFnSTjnR7jiJS+loIDRtHhUStoaKsohHMVaCTgWcwzE/j+wrid3YNNwBdk
 GBAA==
X-Gm-Message-State: APjAAAVO5E2rVT3tFCBC4oj9/+7QvuSGNuB54caK1RQxP+LBCwEnDBm/
 LiQCNj9Gljb3fUNQ355rkURLlLFTaZqCooNuIRFJIQ==
X-Google-Smtp-Source: APXvYqxNsEw4hTTxmL8Y4zpll2bZRkk9M8uJxZtl0pjA6EfZbClLaExliTbVd2dOkZbWasN2xHyUAQ33ww1TqOHkJmU=
X-Received: by 2002:a2e:9d12:: with SMTP id t18mr34389lji.163.1557351583857;
 Wed, 08 May 2019 14:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190507220115.90395-1-fletcherw@chromium.org>
 <20190507220115.90395-2-fletcherw@chromium.org>
 <20190508073623.GT14916@sirena.org.uk>
In-Reply-To: <20190508073623.GT14916@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 8 May 2019 14:39:32 -0700
Message-ID: <CAOReqxgYV3SdXot84Xa4X7=MCZdzWmb2N+jaWzjxgmdoMRx5Mw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ben Zhang <benzh@chromium.org>, Fletcher Woodruff <fletcherw@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [PATCH v5 1/3] ASoC: rt5677: allow multiple
	interrupt sources
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

From: Mark Brown <broonie@kernel.org>
Date: Wed, May 8, 2019 at 12:36 AM
To: Fletcher Woodruff
Cc: <linux-kernel@vger.kernel.org>, Ben Zhang, Jaroslav Kysela, Liam
Girdwood, Oder Chiou, Takashi Iwai, Curtis Malainey,
<alsa-devel@alsa-project.org>

> On Tue, May 07, 2019 at 04:01:13PM -0600, Fletcher Woodruff wrote:
>
> > This patch does not add polarity flipping support within regmap-irq
> > because there is extra work that must be done within the irq handler
> > to support hotword detection. On the Chromebook Pixel, the firmware will
> > disconnect GPIO1 from the jack detection irq when a hotword is detected
> > and trigger the interrupt handler. Inside the handler, we will need to
> > detect this, report the hotword event, and re-connect GPIO1 to the jack
> > detection irq.
>
> Please have a conversation with your firmware team about the concept of
> abstraction - this is clearly a problematic thing to do as it's causing
> the state of the system to change for devices that are mostly managed
> from the operating system.  It's not clear to me that this shouldn't be
> split off somehow so that it doesn't impact other systems using this
> hardware.
>
Pixelbooks (Samus Chromebook) are the only devices that use this part.
Realtek has confirmed this. Therefore we only have to worry about
breaking ourselves. That being said I agree there is likely a better
way to handle general abstraction here. We will need the explicit irq
handling since I will be following these patches up with patches that
enable hotwording on the codec (we will be sending the firmware to
linux-firmware as well that is needed for the process.)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
