Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F363F8B0A
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 17:30:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC7D116C9;
	Thu, 26 Aug 2021 17:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC7D116C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629991812;
	bh=CLIuS4d0+PCorMuS5szJDIGXwDJQ+uPhsGJNwbFL/Vg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rTtJmG3w/ewQuuUMchSouLEpeJH3HJz8zqBbEXrbgT0j9Xf0SFNQi5C+uiTxSytOU
	 aGVxewZeTOR0IdgkwGfVrJ3faNuNvkJlBWp6jTbN7lRE2ysFCTJ+p+aV9+u0cvt91i
	 LI1EFAOkRW6kt7Cbh9s+zIhRtf++UB2ERXWZgAus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E68B8F80224;
	Thu, 26 Aug 2021 17:28:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47797F801D8; Thu, 26 Aug 2021 17:28:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B867FF80054
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 17:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B867FF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="hjDLqcmc"
Received: by mail-io1-xd2c.google.com with SMTP id n24so4217487ion.10
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mipq3pfFW3pvFFZMO/fj0f+8W+eyXMtuOTC9xSNUupY=;
 b=hjDLqcmcoxMrVZNaQzZ7DRr6kff2rilVixwd0QPZaJ6r5hycBaY9WUNxwMfmO5ikdF
 lOYcgTVAAP+GZYVxSyNs2FqJ3oBk/6dbTXmkiPbcQYqALxb7D+ptJ2bN8/7x/1w2e+IE
 XInqrRHoVv6V/ylVkOQx4+oHqLVtdkovxtd3cptYUep3x6djZbKlZ4wgh2mIAeSY4+pn
 8Es1I66oiYvVGAKX644XG2P2HkL8a2WIxVn++FTY4nNy2uHaC8rbWfAeUxBF6ZnYrcYD
 fUAtnjMRHHGyqO6ZxSSmLSMNFlZwuERzdjfTTqfbcIqzZosghYuPo33ZU4bKf+DVA8Yk
 TaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mipq3pfFW3pvFFZMO/fj0f+8W+eyXMtuOTC9xSNUupY=;
 b=s4gWM70dM9ymke1B9Mr8Im3qKAl1OniA+p0AT8tusxxU5YhUYtuoN08011B/EKKn30
 gTPPIK3k3AdCUOQ2jA3Yvf8hkTsmBhJwidKYH1FCXXe5ubR23JduCzz2jnDhex61U0hv
 BKWgf7vYErYr6UBvuq9s31mrAcoV6HnFJSC56qwVzi8lc6oa6zhYkgjl54a5uItGel5A
 0jtSHtpK7HbGY7osmIWmDABah4m3WyAOQepJkRHrqCQD5Dy2ziWbXg4za3KgTHJmFzYm
 0IZeWRRSL4v9RwSoQk3mACIgfivNvILkrmhXGYyCPhlH10B0rl3hgzSj8ZgjXy+K7NRL
 MsLw==
X-Gm-Message-State: AOAM5304USb/NG98Qb+Yc9rhSZEcLVSt2hVINyaUaPnT0QEhWSYY/dEV
 tWJ/Lz18GtT0ob1jrfAKaOWSQvbnO0BEqQsE7tC+Hg==
X-Google-Smtp-Source: ABdhPJwlzY1MlK+7fpGYd2DHBc0ZWGLZDHVnc9K6uMkSfehD7RGnPhVUJobtfGP9MzUt7W84ftTlI6qlWAT5K7Qm3XU=
X-Received: by 2002:a05:6602:2219:: with SMTP id
 n25mr3410411ion.185.1629991705985; 
 Thu, 26 Aug 2021 08:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210826141314.3720975-1-tzungbi@google.com>
 <YSevGntb3mmYlZGE@sirena.org.uk>
In-Reply-To: <YSevGntb3mmYlZGE@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 26 Aug 2021 23:28:15 +0800
Message-ID: <CA+Px+wWr99PxEz6qROhj7H8LXFiRZ1sxrn-BcB7ZODJA1Suh+A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: mt8192: re-add audio afe
 document
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 Jiaxin.Yu@mediatek.com
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

On Thu, Aug 26, 2021 at 11:19 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Aug 26, 2021 at 10:13:14PM +0800, Tzung-Bi Shih wrote:
>
> > The dependency has merged.  Re-adds back the document.
>
> What is the dependency and where wsa it merged?
The context is in the original email after "---".  Do you think it
needs to be part of the commit message?
