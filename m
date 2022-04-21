Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3315450B941
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:56:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2E241840;
	Fri, 22 Apr 2022 15:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2E241840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635759;
	bh=J2SqKz4Hdxi+dgn+hFyN26FOCiBMcZsyQTo9SnwhByU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ir5jsVGl06GiCtTyFdF2LR18cAcdKsOBwxEBPubdfDg3oP+g28gf2VFZuvwl/1/Im
	 6yKeVkhnG4Gk+qSvTmcz88nFHSCZ7apGRtYwTa0n01jNX2uit8Jjb1/kwkJC1cfn7h
	 2yWXE82DmOfz9q2hZKWR4z2bFeaHo/D/acpFwgxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3962F80C51;
	Fri, 22 Apr 2022 15:32:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98910F80125; Thu, 21 Apr 2022 15:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 637CCF80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 15:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 637CCF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Xk3qyrpp"
Received: from darkstar.musicnaut.iki.fi (85-76-47-192-nat.elisa-mobile.fi
 [85.76.47.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: aaro.koskinen)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 047811B00252;
 Thu, 21 Apr 2022 16:34:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1650548074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oVFIWam2OH5Kq5QzsfblzUEMIMiatzAi7D5irCcCglk=;
 b=Xk3qyrppSMBB4y+4boXcQF3oQ0tJICSyEousvelDBkd8/PVx55tQbJieAi/Q0KQa0aNG+G
 Gh88Z+pM8E36JmzxlWSVvjXm3PFhBwLXYL2LZOWOsctt2/ybfngzEzXevKqVRqqsk+dHOX
 5L1WRR3RN0Tc57TLDGaoxQzs/vTRLS73kqV8NQ7Pr+rYaKPhEVw6YpbHAi1CUcgHmT/iJb
 sSsFTNRKlLJoxWjnYPJUSCoDtMuNfYAqp6Y4933cAcgTAbeGBst/0aU+ZHi8x118KnYG/L
 TTEMpWSI21eBdlKccjScwxNSRB5ywON2ldVT1bI/+m9vyrFPnxxWxtiiOfNC6w==
Date: Thu, 21 Apr 2022 16:34:31 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 00/41] OMAP1 full multiplatform conversion
Message-ID: <20220421133431.GE1947@darkstar.musicnaut.iki.fi>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220420170836.GB1947@darkstar.musicnaut.iki.fi>
 <CAK8P3a1+sOrn8BWPVc7f+QFZ5=7fE6=MLsMYV9t+HJcG2aRCXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1+sOrn8BWPVc7f+QFZ5=7fE6=MLsMYV9t+HJcG2aRCXA@mail.gmail.com>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1650548074; a=rsa-sha256; cv=none;
 b=ENXGTtwbaVogGy0K8rD23cjHmjO1KDBpZYPSWyAXiJ0/g3DluUJMMqXizYyXV1sh/1O56S
 hChw4SwQwbKFg4HYlY2SOiU8koj4G0UA6uGgTWSMxSwgySv+tbXfSR2Tt70pNgc6FN/vqj
 fDExRVdSPenGd/ZTQhfjmyvSX3P7pooRbwh0WQDjEhItMOJyG5yZgN9teFQT3NBHXEEZkO
 lTJHNaVgxdVFvqiak5FfjdiYOvwW5qr/IFspdks2sOUviaT7JpvKaacUapRAwuXFYtOguN
 JXEZ3bM5xviSbbt9Tw3xErBDkB9cnwUXXzqGZHNp79d0+eb+sY0cVMOQI8ss7A==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1650548074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oVFIWam2OH5Kq5QzsfblzUEMIMiatzAi7D5irCcCglk=;
 b=Eu1uUO0EKvbhrdQZfCpIhRELzJA5jQZA+tye8R+aaTvgG9DkVEsXKYWX2Sby3kmhYmBCFx
 570Cbs63dCqUFZqQdnWOK5t2vzZfwXPpwZynEikAKA3hi3QfuIi/BoBmae0xNSLey+fMmB
 6AN1xF39YRJln008whjTgBohIBALbd/JXyh+rxwe1mx9rmT55Z+64rbOepQpAj7WZ0ttFr
 jnTgxti7i7/9Pg4jNgskYWOOvKpXwrgTWzEQwA6H3TD1Jh0kJTMK2AunGS+FmvtC90A9Rp
 r/9gYERVC+5BvSqEpSaGtYy+3htyiKaREqUWXaB7dxpxJqJYBA33p4txWzgVSw==
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
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

On Wed, Apr 20, 2022 at 10:00:13PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 20, 2022 at 7:08 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> > On Tue, Apr 19, 2022 at 03:36:42PM +0200, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > This is the full series for converting OMAP1 to multiplatform, rebased
> > > from my 2019 attempt to do the same thing. The soc tree contains simpler
> > > patches to do the same for iop32x, ixp4xx, ep93xx and s3c24xx, which
> > > means we are getting closer to completing this for all ARMv5 platforms
> > > (I have patches for PXA, which is the last one remaining).
> > >
> > > Janusz already tested the branch separately and did the missing work
> > > for the common-clk conversion after my previous approach was broken.
> >
> > I tested the full series on the following OMAP1 boards: ams-delta,
> > nokia770, osk, palmte and sx1 (QEMU only).
> >
> > Apart from the earlyprintk breakage, everything seemed to work OK.
> 
> Nice, thanks a lot for testing!

With the updated patch 26 also earlyprintk now works, so if you still
update the patches, feel free to add for the whole series:

Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Thanks,

A.
