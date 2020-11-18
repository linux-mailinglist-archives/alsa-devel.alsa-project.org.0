Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 436002B855B
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 21:13:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE0561714;
	Wed, 18 Nov 2020 21:12:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE0561714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605730425;
	bh=xH09zmAMJR7NQ0penF01YGocgLtiRqP/c16vo28xqMs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uYYzZEpe0OxCEcdybE4X2gJ6jtMchTbX5aexNupszHjtXVM+H7uASufYXK4fxl1XH
	 FBBYbwQwAv0mf8jFv2kw7kXJ7XYX4dqYIUskDH843oAyEeWqNmfaHVt+YzY6ysWLgu
	 wf/l51tW/JzhzAryVSebBMbwWeb5M82F8g11D4fo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 365AFF8016D;
	Wed, 18 Nov 2020 21:12:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86021F8016C; Wed, 18 Nov 2020 21:12:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD043F80158
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 21:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD043F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cQxU872/"
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4A0C246C3
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 20:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605730312;
 bh=xH09zmAMJR7NQ0penF01YGocgLtiRqP/c16vo28xqMs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cQxU872/OaztpvrzHVfL0VYocUM+OEd0boZ+scemi/iOBcUE3xN+h0h0dlfC/cuF/
 usSKtwTQbKMSt0j0isXHAaGScy4lEOBJiatXkcSEO/4/D2F9Wf67WlRCKuxNGLYc+B
 FVRmgNPnIPl+get85P+KmjQXoM8caKKXad6SShD8=
Received: by mail-ed1-f49.google.com with SMTP id q16so3354170edv.10
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 12:11:51 -0800 (PST)
X-Gm-Message-State: AOAM530TasaLCloabRlRSkHKfeiqm9aFuObZo7+ret/LTR5PVlKh6PFE
 qX52GbkjX2J3qvlYQn1aG2BORVfoXzbS4uYWFt4=
X-Google-Smtp-Source: ABdhPJyuwE9rW2aLLtgf1eTOIDKPNtfAwUEfdypJSwWno4+HwFzVqFNqhTiVYC+WS/NF+0wik6+rQf5kI+AxgGY8/io=
X-Received: by 2002:a05:6402:290:: with SMTP id
 l16mr28013820edv.104.1605730310120; 
 Wed, 18 Nov 2020 12:11:50 -0800 (PST)
MIME-Version: 1.0
References: <20201117182310.73609-1-krzk@kernel.org>
 <20201118153816.fctrz6dfjiph2mgl@gilmour.lan>
In-Reply-To: <20201118153816.fctrz6dfjiph2mgl@gilmour.lan>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 18 Nov 2020 21:11:37 +0100
X-Gmail-Original-Message-ID: <CAJKOXPdnOSYZ425FEStjBcd71NTycYDVXmH4e3aq4+wa=kbdyQ@mail.gmail.com>
Message-ID: <CAJKOXPdnOSYZ425FEStjBcd71NTycYDVXmH4e3aq4+wa=kbdyQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: sunxi: do not select COMMON_CLK to fix builds
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 18 Nov 2020 at 16:38, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Nov 17, 2020 at 07:23:10PM +0100, Krzysztof Kozlowski wrote:
> > COMMON_CLK is a user-selectable option with its own dependencies.  The
> > most important dependency is !HAVE_LEGACY_CLK.  User-selectable drivers
> > should not select COMMON_CLK because they will create a dependency cycle
> > and build failures.  For example on MIPS a configuration with COMMON_CLK
> > (selected by SND_SUN8I_CODEC) and HAVE_LEGACY_CLK (selected by
> > SOC_RT305X) is possible:
> >
> >   WARNING: unmet direct dependencies detected for COMMON_CLK
> >     Depends on [n]: !HAVE_LEGACY_CLK [=y]
> >     Selected by [y]:
> >     - SND_SUN8I_CODEC [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] &&
> >       (ARCH_SUNXI || COMPILE_TEST [=y]) && OF [=y] && (MACH_SUN8I || ARM64 && ARCH_SUNXI || COMPILE_TEST [=y])
> >
> >     /usr/bin/mips-linux-gnu-ld: drivers/clk/clk.o: in function `clk_set_rate':
> >     (.text+0xaeb4): multiple definition of `clk_set_rate'; arch/mips/ralink/clk.o:(.text+0x88): first defined here
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Samuel Holland <samuel@sholland.org>
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
>
> however, I'm not sure the prefix is the one Mark would expect?

Good point, I'll fix it in v3.

Best regards,
Krzysztof
