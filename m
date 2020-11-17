Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CB52B5A5F
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 08:39:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BCBE174E;
	Tue, 17 Nov 2020 08:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BCBE174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605598777;
	bh=4lIS54VdGuqsiQB1gaz1o21sUiH6v8Utz8nnKKLAbCo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jdVxJNg7/Lo95BnXP26Gbyi+y/lvGhtPqR1tAQ08DrnxWRrWGljhyXya4fWObo1sw
	 /3PuxlbkBMlBj8KrxHNY1uHLS63ewAjoI9sKnQBcFxh0o9CckVmD7eLrpDde0ZXV+E
	 EobX855vk376Sza2adLDFbaEEmoGNuiA/dd6LSdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1713BF801F9;
	Tue, 17 Nov 2020 08:38:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05801F801F5; Tue, 17 Nov 2020 08:38:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6B96F800FE
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 08:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6B96F800FE
Received: by mail-wm1-f67.google.com with SMTP id 19so2276164wmf.1
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 23:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=18xGlNNpDhvVYVdS8rF0z2fNATOQumPp5b7l5cZcXvw=;
 b=K1kin1o9dk45aq/uxQU+DD6vI4VZJnJCXduK9CR2tatPbjGRjiGtnJWhlbboUK7kKK
 sMAEmdtagAMu25G6Di1ujW3iTj6DwolULXKmF5UrABbNzhqBywrs6B2OfdygYfAzSxlH
 WBnThWV4J+JF29zWAjaw1gn3aguaTVkQo83O5ttfR3H0Qwjgi5k+rVLas5Gz+9wlreb8
 ZS3zGghN3nhZhXI/X2auZl9Tw7bUTup2JOV2aamfwvqiO5pxEraSBcWc5JNIxuSVIcjN
 /GDRx2pIgmlEMlkb6WPeRp4HMO3zE4v/HnuBPmE+Nm7s6w1rZuNi0iKKlTVmAmOqllZl
 KQ4A==
X-Gm-Message-State: AOAM530eyLgsmFN3jb2yPndmAN5Xv401X7Eq77F6zxVgywvg++4hM4oV
 iuWAQnOpAZ6o+24fWghG7q4=
X-Google-Smtp-Source: ABdhPJyHbqmcdYgBsSt4If51dziBJ4uOp+0GJRgB5sF5O5WZ7vgFMBLSfMpTds+fFwooZbU/Vhir4w==
X-Received: by 2002:a1c:7704:: with SMTP id t4mr2234501wmi.48.1605598666215;
 Mon, 16 Nov 2020 23:37:46 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id t23sm2151117wmn.4.2020.11.16.23.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 23:37:44 -0800 (PST)
Date: Tue, 17 Nov 2020 08:37:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC 2/3] ARM: sunxi: do not select COMMON_CLK to fix builds
Message-ID: <20201117073743.GB3436@kozik-lap>
References: <20201115170950.304460-1-krzk@kernel.org>
 <20201115170950.304460-3-krzk@kernel.org>
 <f637762e-0b02-1705-ea6b-24ac338fcd69@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f637762e-0b02-1705-ea6b-24ac338fcd69@sholland.org>
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

On Mon, Nov 16, 2020 at 10:36:12PM -0600, Samuel Holland wrote:
> On 11/15/20 11:09 AM, Krzysztof Kozlowski wrote:
> > COMMON_CLK is a user-selectable option with its own dependencies.  The
> > most important dependency is !HAVE_LEGACY_CLK.  User-selectable drivers
> > should not select COMMON_CLK because they will create a dependency cycle
> > and build failures.  For example on MIPS a configuration with COMMON_CLK
> > (selected by SND_SUN8I_CODEC) and HAVE_LEGACY_CLK (selected by
> > SOC_RT305X) is possible:
> 
> Ah, that makes sense.
> 
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
> > ---
> >  arch/arm/mach-sunxi/Kconfig | 1 +
> >  sound/soc/sunxi/Kconfig     | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> > index eeadb1a4dcfe..4d9f9b6d329d 100644
> > --- a/arch/arm/mach-sunxi/Kconfig
> > +++ b/arch/arm/mach-sunxi/Kconfig
> > @@ -4,6 +4,7 @@ menuconfig ARCH_SUNXI
> >  	depends on ARCH_MULTI_V5 || ARCH_MULTI_V7
> >  	select ARCH_HAS_RESET_CONTROLLER
> >  	select CLKSRC_MMIO
> > +	select COMMON_CLK
> 
> This is not necessary, since ARCH_SUNXI depends (through ARCH_MULTI_V{5,7}) on
> ARCH_MULTIPLATFORM, which selects COMMON_CLK already.

Thanks. I'll send a v2 with changes and your review.

Best regards,
Krzysztof
