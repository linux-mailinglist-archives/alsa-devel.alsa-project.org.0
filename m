Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA46581168
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 12:46:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1585F15C3;
	Tue, 26 Jul 2022 12:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1585F15C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658832405;
	bh=nbaVwL4kXjzhCUBIrQX/hG3/Kht2aI2sNMsVa672Ivc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KCPPMlFaB8gz4XD7lwTeMTKCA4tQDX2UdFSQqfNPtuIHok0jaxIYDmBCeBfZbhj1i
	 /E6YKhlPfvq7Vhgqz88GINI8EzgS3l9R6moymx+eFw6A40HH+MEH1jg47/8Yb9ijVw
	 EwyOOcPiBkk/jJz5F3egszFScTVAGbhSGVQ7H/FE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87750F800FA;
	Tue, 26 Jul 2022 12:45:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0EB0F80155; Tue, 26 Jul 2022 12:45:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A288F80155
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 12:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A288F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XxOLpDEZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9A6FCB811F9;
 Tue, 26 Jul 2022 10:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D251C341C0;
 Tue, 26 Jul 2022 10:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658832336;
 bh=nbaVwL4kXjzhCUBIrQX/hG3/Kht2aI2sNMsVa672Ivc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XxOLpDEZYuQ9XfYA65yY3O2OtXyOKXgUy9DqmCAwmF2ysmC/2KBkogK6CeMrrESGR
 tFTsHI2EfF4r2GClYoGqrj3ayZdqOvNdaR7hHEDz4cmC1Ws5Ivjg2Dqyf750ROG22e
 LguP347esIRLrWyY8sRpdaBRJs4H9AuxPM6CL9j9rjyvoH0411YEChpWd7IDeXLyyX
 aAQykjNgPasrtLHvNT3IDWbk08cJXJQ4loBdfZep4NzG6LazZGAKqx3n8z37fBP8qG
 BAU1A/dAy2COPUzcZRTBx8QxfOMTfsm518kd6wIr3VVnbGRjmbYgBAKLsFXXdOXoXz
 Ov8F7odvyihqg==
Date: Tue, 26 Jul 2022 11:45:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 1/5] ASoC: mchp-spdifrx: disable end of block
 interrupt on failures
Message-ID: <Yt/Fy1xWUHtpbGMn@sirena.org.uk>
References: <20220725130925.1781791-1-claudiu.beznea@microchip.com>
 <20220725130925.1781791-2-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b+XP6nxpxfg5BBfu"
Content-Disposition: inline
In-Reply-To: <20220725130925.1781791-2-claudiu.beznea@microchip.com>
X-Cookie: Save energy:  Drive a smaller shell.
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 tiwai@suse.com, linux-arm-kernel@lists.infradead.org
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


--b+XP6nxpxfg5BBfu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 04:09:21PM +0300, Claudiu Beznea wrote:

> +++ b/sound/soc/atmel/mchp-spdifrx.c
> @@ -288,15 +288,17 @@ static void mchp_spdifrx_isr_blockend_en(struct mch=
p_spdifrx_dev *dev)
>  	spin_unlock_irqrestore(&dev->blockend_lock, flags);
>  }
> =20
> -/* called from atomic context only */
> +/* called from atomic/non-atomic context */
>  static void mchp_spdifrx_isr_blockend_dis(struct mchp_spdifrx_dev *dev)
>  {
> -	spin_lock(&dev->blockend_lock);
> +	unsigned int flags;
> +
> +	spin_lock_irqsave(&dev->blockend_lock);
>  	dev->blockend_refcount--;
>  	/* don't enable BLOCKEND interrupt if it's already enabled */
>  	if (dev->blockend_refcount =3D=3D 0)
>  		regmap_write(dev->regmap, SPDIFRX_IDR, SPDIFRX_IR_BLOCKEND);
> -	spin_unlock(&dev->blockend_lock);
> +	spin_unlock_irqrestore(&dev->blockend_lock);
>  }

This breaks an x86_64 allmodconfig build:

/build/stage/linux/sound/soc/atmel/mchp-spdifrx.c: In function =E2=80=98mch=
p_spdifrx_isr_blockend_dis=E2=80=99:
/build/stage/linux/sound/soc/atmel/mchp-spdifrx.c:296:46: error: macro "spi=
n_lock_irqsave" requires 2 arguments, but only 1 given
  296 |         spin_lock_irqsave(&dev->blockend_lock);
      |                                              ^
In file included from /build/stage/linux/include/linux/rwsem.h:15,
                 from /build/stage/linux/include/linux/notifier.h:15,
                 from /build/stage/linux/include/linux/clk.h:14,
                 from /build/stage/linux/sound/soc/atmel/mchp-spdifrx.c:9:
/build/stage/linux/include/linux/spinlock.h:377: note: macro "spin_lock_irq=
save" defined here
  377 | #define spin_lock_irqsave(lock, flags)                          \
      |=20
/build/stage/linux/sound/soc/atmel/mchp-spdifrx.c:296:9: error: =E2=80=98sp=
in_lock_irqsave=E2=80=99 undeclared (first use in this function); did you m=
ean =E2=80=98spin_lock_irq=E2=80=99?
  296 |         spin_lock_irqsave(&dev->blockend_lock);
      |         ^~~~~~~~~~~~~~~~~
      |         spin_lock_irq
/build/stage/linux/sound/soc/atmel/mchp-spdifrx.c:296:9: note: each undecla=
red identifier is reported only once for each function it appears in
/build/stage/linux/sound/soc/atmel/mchp-spdifrx.c:301:9: error: too few arg=
uments to function =E2=80=98spin_unlock_irqrestore=E2=80=99
  301 |         spin_unlock_irqrestore(&dev->blockend_lock);
      |         ^~~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/linux/rwsem.h:15,
                 from /build/stage/linux/include/linux/notifier.h:15,
                 from /build/stage/linux/include/linux/clk.h:14,
                 from /build/stage/linux/sound/soc/atmel/mchp-spdifrx.c:9:
/build/stage/linux/include/linux/spinlock.h:402:29: note: declared here
  402 | static __always_inline void spin_unlock_irqrestore(spinlock_t *lock=
, unsigned long flags)
      |                             ^~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/atmel/mchp-spdifrx.c:294:22: error: unused var=
iable =E2=80=98flags=E2=80=99 [-Werror=3Dunused-variable]
  294 |         unsigned int flags;
      |                      ^~~~~
cc1: all warnings being treated as errors

--b+XP6nxpxfg5BBfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLfxcoACgkQJNaLcl1U
h9AMAQf/ZTHs18/rfqRU4HJc6KLOkajyRypWYU9T41QMxDa2A/tPhxvFZcVAWOlH
gTxXGPpvcAci0LFAQVRZAB0Qwe4BIe9Bp11pbpADIIzmbRd9ibaChu2tljfssarr
q05TE4AElzpG1OVce+KmSpxzB8AewceRojlkhnDr3FPmklhNmmKZZCKqrJIZ5rQ5
HHbPTlO4n568YQxYoTgINEfvgTqIK/XrEpZsVRlAbw3OHbmZksnxXPi/kJRs86rd
/USNouYj8KNr208jceC57O8uqmE7nP0dzig3OjIcNPZ+xps863Uw03nTqFfnOtIW
uRXTrfgj80cNEWr2+ddok6ev5vf3zQ==
=BLt+
-----END PGP SIGNATURE-----

--b+XP6nxpxfg5BBfu--
