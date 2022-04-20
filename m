Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D550B92B
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:53:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3FFF17D5;
	Fri, 22 Apr 2022 15:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3FFF17D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635583;
	bh=0xiJARz6YR5iBXyf6sFgKaEQfsOcHtnafpjzW3tn43w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dGq2vwcHf02WT749nG9kwYCHrKzYHw40/MNlQexrQF3kBgzxkfVNlKjGfQLNLrEX1
	 JRgetrLck481do0+FfUXa0jJse68fxnlgPzDKsA4Yy7mBCTNAJTz+Kbv34ZCNNRq+T
	 Y8/PsvOUjq8jrUWlBTgZXY3o7r8R+Ubc37Xa1uPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC404F80879;
	Fri, 22 Apr 2022 15:32:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45489F800F8; Wed, 20 Apr 2022 19:08:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2481AF8010B
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 19:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2481AF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="kTa4PeKc"
Received: from darkstar.musicnaut.iki.fi (85-76-69-216-nat.elisa-mobile.fi
 [85.76.69.216])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: aaro.koskinen)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 75C061B00220;
 Wed, 20 Apr 2022 20:08:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1650474519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B5msNSogp8zw4YAcAsDj6Qc4zdyDGRTVYmRgqRI/0Bk=;
 b=kTa4PeKcYbiz8v0d1bG/DaDfDPW+JW/Y5caY8AdpKOUIvDM5o36RCvYnTBodU8x4tUxuiF
 ktxA1VDWnp4JhwdnVZN87iQgFWmYig18OVXRM8AVMhj39aWpQH20CPI4avqgLCd+YIg1Qy
 idcTWI4UYPweIAjRUudXT1Zf+FbV1KFQ6CsP671o0mcoZYtmGXBa6OtYrK6P6K3jtGr5MZ
 EHOyrIqm3R/nP1YaqVIW53HsDJDowGirtgtowbqAHter8eYPWisaRosyEAvgWd8N5xDazf
 MEVSDjkPCt3ICTrqoO34GRh7hV71rJoxKjbq4SJKV8lZ4881URlm0+K8k78LMA==
Date: Wed, 20 Apr 2022 20:08:36 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 00/41] OMAP1 full multiplatform conversion
Message-ID: <20220420170836.GB1947@darkstar.musicnaut.iki.fi>
References: <20220419133723.1394715-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1650474519; a=rsa-sha256; cv=none;
 b=fUP5y+/XQ6zNbth6dMfmG2kN9cICXfnwRNYbkGoVeRNsnY+v6znhO5ch2i5vR5slzPAUec
 Sztc4GVEZyZOwSwkjLWA4eNpQZV5fEBKgPV4PA0N+8DX6z5GrX6hFbFsM5SltaEfdOE+4X
 UDuk5UOcv8jYUvEeGfo5RBPyqhwpuA6b4fVpMKqPEFiwGDCvSZdERPOuJX+KlmiYWEjjRQ
 bzFS2MgkL1ik8EAGHbfrB4YVK4K3DZYBDGcMAmDesHi8ybCiB4PqONwfrj/O7/GLX4DLwE
 F7s5Eze8miwVNtjGjumlbsWMr0sA8n2Asp4QdugmIsfg6AnQuJaXDQ3ZfwifVA==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1650474519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B5msNSogp8zw4YAcAsDj6Qc4zdyDGRTVYmRgqRI/0Bk=;
 b=uAZuJDKZ7bj4MVqgI3bbcZAOIBMgL+TVcCp9+D4Bx6tcZMUwn0Yukw4zw8doMpCzXb5WaN
 pJVbadhIweA9yGpQNueUVV9vr1H4bIPdTLnUt9sq85H8sbrTY3WHbuj7hKBBvCPd9hNdLm
 1ukZgRh1UpuRnt4Qyg6muAqbGwQyb+0ufFu2ZZFIwmdViYeENLfMfCKbIoMvRNyQt/3O2K
 fLMvlRgaN2w7kyqhajE30yj5vD3Ir8o/PY21vwX9mxyhgmVGkpxJMIAtFXlT8CRNLmGomp
 hDjQyLXElaOcP4BTszvgdBbpo30Bae+K5TvQUlGAai/EzsAchzF8OdhdOWxG2A==
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 tony@atomide.com, Linus Walleij <linus.walleij@linaro.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, jmkrzyszt@gmail.com,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
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

On Tue, Apr 19, 2022 at 03:36:42PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is the full series for converting OMAP1 to multiplatform, rebased
> from my 2019 attempt to do the same thing. The soc tree contains simpler
> patches to do the same for iop32x, ixp4xx, ep93xx and s3c24xx, which
> means we are getting closer to completing this for all ARMv5 platforms
> (I have patches for PXA, which is the last one remaining).
> 
> Janusz already tested the branch separately and did the missing work
> for the common-clk conversion after my previous approach was broken.

I tested the full series on the following OMAP1 boards: ams-delta,
nokia770, osk, palmte and sx1 (QEMU only).

Apart from the earlyprintk breakage, everything seemed to work OK.

A minor note, zImage grows about 50 KB with a minimal kernel config. This
is not yet critical, there's still about 7% headroom on 770 to the 2 MB
bootloader limit on my setup. Also the decompression time is approaching
the hardcoded watchdog timeout...

A.
