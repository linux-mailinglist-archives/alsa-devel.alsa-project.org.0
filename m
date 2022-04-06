Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B35D4F6ABA
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 22:01:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A89AF16B8;
	Wed,  6 Apr 2022 22:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A89AF16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649275275;
	bh=DJzkIrSAHCA6cRSISS+QV1y58Ivj2Wq3yloyBt2Huuc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E1rHgj92mcerg5k+CQy0zd0VLFn3De0hGOhGl1vs5vEEmx6Lxnb7F1yO3p7fMe20S
	 y3btrZVtWMSQf+lo1Y8Zdlcgh5fi5jOQ1926hi/h6B8bk8SXpZ8vE/mFCqYWnEXY9S
	 u+554xKbAW5fkJFG0jOXC2Wlc5/3iUzRU49WmMoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F613F8019B;
	Wed,  6 Apr 2022 22:00:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D6ABF80054; Wed,  6 Apr 2022 22:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A770EF80054
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 22:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A770EF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Nn4RAbFb"
Received: from darkstar.musicnaut.iki.fi (85-76-76-218-nat.elisa-mobile.fi
 [85.76.76.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: aaro.koskinen)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id C3DA61B000E0;
 Wed,  6 Apr 2022 23:00:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1649275212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HF/OS3JAtoNKv3AksoUVmxtqiwmaGXqNkeVyB7AYT2k=;
 b=Nn4RAbFbzK4bwfg86ykyMmwZil9SKibzGCF6IqPtA9woskWkPm0Qpo8xHB6DmiuFZCDabl
 hKhYB7cTF1pnQmfdEueduNI+Bie9rxrrlv4+Ae9YdogxoZPaT+AnKd36njOcJfii/ZG9el
 NXeQ9cJa9eyyADZvMify5l3g3e6/9P6d54WrG6RxGfxgsqDX4gklm2g60np78Z2iAK4H5W
 MYGDa3g/ettQmzEK/GGe/dgnxSa0+JfQVzn6IDHYnDPuqAhZ29ChrVGrIXEk6e+gIQp/ZO
 YsKxpOTuJMbZKTk6UgFqwopmBrXCz1Q8WLvlxfzJ2EFoML4ykS+CJaqZAs9ITA==
Date: Wed, 6 Apr 2022 23:00:10 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v2] ARM: OMAP1: Prepare for conversion of OMAP1 clocks to
 CCF
Message-ID: <20220406200010.GE594699@darkstar.musicnaut.iki.fi>
References: <20220310233307.99220-3-jmkrzyszt@gmail.com>
 <1810824.tdWV9SEqCh@dell>
 <20220406132149.GC594699@darkstar.musicnaut.iki.fi>
 <1888452.PYKUYFuaPT@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1888452.PYKUYFuaPT@dell>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1649275212; a=rsa-sha256; cv=none;
 b=Ol1GS9eE8NlyDUV0WcHY2VWATp+nj58s0051qvEeumo7NtBnjXas42R78yzG70ifyC61w1
 uNejgjj5y2u/lipXR8kWDr6uohk/Qlt2RTi7GBtSFq/B72+3ebibY0TmKGFTacwnLE/Q0Q
 tPyBaa+IGUVAVry4W3pdajUy4YfXuZPAbe7qOV2W6PWhvFy5/u1KlaqNZJsnjYrRO5D9dj
 xoCq4TSeoGt+wWudWLGQwD7h83OmvjLmmnHe1ciL+J2iNX7wi6z6XTcYeQ2dMUgmsEzE7h
 UOG82BaXJw2nJuLhTmns2woVednPtANIIzueIdMPzqje3Y1nqQ/oFewmJr60ng==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1649275212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HF/OS3JAtoNKv3AksoUVmxtqiwmaGXqNkeVyB7AYT2k=;
 b=amTI0JvrXmyzyX8Uf2XnSz1hRH/n+rrTw1Nz41uGo9Db4A+x3UljqHgdkWZ+xZMSMFXmqF
 NpqoT7DqPS10usMauUwiurnKUVrlRou9YOW5adeY4I5ejE8YptoMDaRUt5BlI5ya6Tsir4
 ZQ9EwOXwkara1rof7KYZYYBUaJHXP873LqWCguWgum+N5SNiM6cE8BjG6+lCLdr+Og6l7/
 02uNTNywsqyZ7r97elJ/MoCN+w2VWTRKFSv18b2pTuPihEhiQNuhWhqeAlpXg+nqf5Nq92
 42iC+aDWXKVc7nuF531otS5HSwey0rL0Z+4eYJWSaqI9TJ0RCC9yORLMK37McA==
Cc: alsa-devel@alsa-project.org, Felipe Balbi <balbi@kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-omap@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
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

Hi,

On Wed, Apr 06, 2022 at 08:48:14PM +0200, Janusz Krzysztofik wrote:
> Dnia środa, 6 kwietnia 2022 15:21:49 CEST Aaro Koskinen pisze:
> > On Sat, Mar 26, 2022 at 10:17:49PM +0100, Janusz Krzysztofik wrote:
> > > Dnia wtorek, 22 marca 2022 20:07:53 CET Aaro Koskinen pisze:
> > > > On Tue, Mar 22, 2022 at 06:36:48PM +0200, Aaro Koskinen wrote:
> > > > > Something is still broken. When doing kexec (using CCF kernel), the
> > > > > kexec'ed kernel now hangs early (on 770):
> > > > [...]
> > > > > [    0.928863] calling  omap1_init_devices+0x0/0x2c @ 1
> > > > 
> > > > It hangs in omap_sram_reprogram_clock() (<- omap1_select_table_rate()
> > > > <- omap1_clk_late_init()).
> > > 
> > > I've reviewed my changes but haven't found anything suspicious.
> > 
> > The below change is fixing the kexec boot. Based on the comment in the
> > code, it seems this clock is needed for the SRAM to work.
> > 
> > diff --git a/arch/arm/mach-omap1/clock_data.c b/arch/arm/mach-omap1/clock_data.c
> > index e33e11f826af..b8b4876ff935 100644
> > --- a/arch/arm/mach-omap1/clock_data.c
> > +++ b/arch/arm/mach-omap1/clock_data.c
> > @@ -285,7 +285,7 @@ static struct omap1_clk tc1_ck = {
> >   */
> >  
> >  static struct omap1_clk tc2_ck = {
> > -	.hw.init	= CLK_HW_INIT("tc2_ck", "tc_ck", &omap1_clk_gate_ops, 0),
> > +	.hw.init	= CLK_HW_INIT("tc2_ck", "tc_ck", &omap1_clk_gate_ops, CLK_IS_CRITICAL),
> >  	.ops		= &clkops_generic,
> >  	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
> >  	.enable_bit	= EN_TC2_CK,
> > 
> > A.
> > 
> 
> Thank you Aaro.  Will you submit this as a separate fix, or should I submit 
> v2 of my patch 4/4 with your fix included?

Please send a new version with the fix included.

A.
