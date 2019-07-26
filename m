Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3387876559
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 14:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9018C2034;
	Fri, 26 Jul 2019 14:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9018C2034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564143140;
	bh=i8Mf0ojHVEdBueAlOgibRg5WSRFMVNtaXXRHEGX6oRE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VYLa+NMzzNdMs+gHEROJCGiyEcq8+bLnPb6JTEOwRg0SwUuAacINuWPCz7t9evMDQ
	 EP70KWoxMTMtgXUCTI52RH7jxZBEsyLZgGth9ftGJtQcTw3XZeoKPGXSX7KWcu3ztA
	 CMk5FJCvUjaTQgroaDhIw7yd9MFKK0MdfGNENCAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8D25F801A4;
	Fri, 26 Jul 2019 14:10:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09A57F80368; Fri, 26 Jul 2019 14:10:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8869F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 14:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8869F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="NtCq+FPK"
Received: by mail-vs1-xe41.google.com with SMTP id y16so35894642vsc.3
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 05:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Hk/ddKDjoh3rwEJrDhaz3iODFHsGs5iANDx40FYTho=;
 b=NtCq+FPK94+cvz+LxBD1ik58Euv8pnMYGOB5sJi8/gCvTrdjnxQzLolpowpC9ijbye
 C59/PhPvLwAPBORN4l7mgwO+HQTjyloYV1GDx/oFwYaJv1XfXqW9k9eUqWz1HQfjtj34
 LZoMbu4mHtz2br0/8RyvDY/R80R4B4J+9YjaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Hk/ddKDjoh3rwEJrDhaz3iODFHsGs5iANDx40FYTho=;
 b=otV0+k0ga+9RfHVvscnudGZmsr2llRuaLw+G2N1kY1l2JKeWXFU6m7h4eM8fxgwvyE
 djTpegynor2SUMPimWkMxD++co7mJI2SkAHZaym4KdhmG+Q9r9EIxaT0S8OtT0ZYvgkr
 qFD6MD+qSPegI6xUFJFCnHiGpF2uMKMzL1pYaStGghYXQXEy9mKOhn5eZiFvzQa71Y3j
 uwv/yA1XFH3yFTJgwL8x6wCVPgL+sR7a1YICDSMtpfpVafRs8tJby2jNoq6Kx6qzg8dF
 ECX0UY7R/GLCajY33M2m76VkkoWdXivBWnVP7UNw8XqMH3B3mB+1L//HPaT4n3zaciDi
 7GwQ==
X-Gm-Message-State: APjAAAVqBajpWB9HZCjFABBE4w42QZnQ0pdTOGD44gLc5fTz/QfWdKVf
 cWOFfjuOkcFfbbOnQFGcTUbGADkC5qdlBJDmjVMfGA==
X-Google-Smtp-Source: APXvYqzvjy8zCiVZsbAMpzxFBmwdjzNDLhL/0NIc8p6K0jlM7GCFN0g706IM3lhQXZiAwJDLHY0z+t81Nwo+kvfoFcM=
X-Received: by 2002:a67:f7cd:: with SMTP id a13mr60241411vsp.163.1564143041404; 
 Fri, 26 Jul 2019 05:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190726044202.26866-1-cychiang@chromium.org>
 <20190726111717.GB4902@sirena.org.uk>
In-Reply-To: <20190726111717.GB4902@sirena.org.uk>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 26 Jul 2019 20:10:15 +0800
Message-ID: <CAFv8NwLyTPXJ0x9F-wcGM-XFcCp+Nb1s96u9=_2xhs+=Q=E+fw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, tzungbi@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Doug Anderson <dianders@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 Matthias Kaehlcke <mka@chromium.org>, Dylan Reid <dgreid@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] Revert "ASoC: rockchip: i2s: Support mono
	capture"
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

On Fri, Jul 26, 2019 at 7:17 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Jul 26, 2019 at 12:42:02PM +0800, Cheng-Yi Chiang wrote:
> > This reverts commit db51707b9c9aeedd310ebce60f15d5bb006567e0.
> >
> > Previous discussion in
>
> Please use subject lines matching the style for the subsystem.  This
> makes it easier for people to identify relevant patches.
>
>
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.
Hi Mark,
Thank you for the reply.
Fixed the title and commit messages in v2.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
