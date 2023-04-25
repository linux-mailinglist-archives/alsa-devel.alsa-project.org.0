Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0816EE5B8
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Apr 2023 18:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E84D105A;
	Tue, 25 Apr 2023 18:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E84D105A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682440094;
	bh=QlVrH6yTUUUu3PEKmzYtrouSSUrjj5b/iY6JsQdl0io=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FWkWzXQd7D4I3PXEU3OdX1aaexqo1egKPGKc6iWPBur/VdaScfesgTPNhbrjffwqy
	 KbJ0TlaqGt29igoLyBlLbKtbIlBTNK/yjhpxw2HSkCRnn581GkgRoLjggYnORxilra
	 cPSd05PDJCfHLOfTECUJfVeGefs8TKSfuMxccoRI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08156F8018A;
	Tue, 25 Apr 2023 18:27:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB935F80236; Tue, 25 Apr 2023 18:27:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6510F80137
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 18:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6510F80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H6wIUSzB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 67A0362640;
	Tue, 25 Apr 2023 16:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3208AC4339C;
	Tue, 25 Apr 2023 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682440028;
	bh=QlVrH6yTUUUu3PEKmzYtrouSSUrjj5b/iY6JsQdl0io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6wIUSzBiku2NQOIZJv64SXdY5NMKaThSqTGvdjkezsTTaXmHzccO2q1aE1ettSuH
	 Fx7TAo6KyOftw6n0MkEy6nBx6XqmTcZ1JRyNUBX5Rjbqfv9gO8uu+cVV5OH5dphElk
	 o4It0nCuexb6dX9ekALVvhaEivNHGf1Omhw1n/+F7EpfY6Hx5Wij6wnDFLu3mTU0u2
	 +cisrqGMUqzQadG5+V1WlTZJ3dBOWuGkE33Fg9nevh5tMJEkVH+c/dS7Kcy6O7wzx2
	 daNVm+lOaW1De4FmyVHmapDuNw2vEEgX9RIvHdSPWYhPo7CbL/cfoNcvxivkHx1Lt0
	 pSLzmeo3eUg+A==
Date: Tue, 25 Apr 2023 17:27:01 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
Subject: Re: [PATCH 1/9] ASoC: Add Chameleon v3 audio
Message-ID: <c42ea55b-fb2f-417e-882a-a06f7660ea22@sirena.org.uk>
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-2-pan@semihalf.com>
 <e64b438e-1205-4e54-b8c0-1b9a5d074752@sirena.org.uk>
 <CAF9_jYTyhJZaCk1zN93Rr5AXAmpk4nu6z0Z9+RQb4HxGQ=zZLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BUSc4oJN6UGUA/g0"
Content-Disposition: inline
In-Reply-To: 
 <CAF9_jYTyhJZaCk1zN93Rr5AXAmpk4nu6z0Z9+RQb4HxGQ=zZLQ@mail.gmail.com>
X-Cookie: The meek don't want it.
Message-ID-Hash: XN4WOM6UJEY65XWMIDZOZ2G6ME4ILUSJ
X-Message-ID-Hash: XN4WOM6UJEY65XWMIDZOZ2G6ME4ILUSJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XN4WOM6UJEY65XWMIDZOZ2G6ME4ILUSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--BUSc4oJN6UGUA/g0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 05:59:52PM +0200, Pawe=C5=82 Anikiel wrote:

> > > +config SND_SOC_CHV3
> > > +       tristate "SoC Audio support for Chameleon v3"
> > > +       select SND_SOC_SSM2602
> > > +       select SND_SOC_SSM2602_I2C
> > > +       help
> > > +         Say Y if you want to add audio support for the Chameleon v3.

> > It woudl be better to have a separate selectable symbol for each drier.

> I'm not sure about this. If I disable just one driver, the entire card
> fails to probe (even if some audio device doesn't need that driver).
> Does it then make sense to be able to deselect some drivers? Please
> correct me if I'm misunderstanding.

Consider what happens if someone for example reuses the I2S controller
in a different board.

> Having said that, I did try to remove that logic and simply delay
> hw_pointer by one frame, and it appears to work (the playback seems
> fine and without glitches). However, I'm worried about calling
> snd_pcm_period_elapsed() and then reporting that the hw_pointer hasn't
> actually reached the end of the period. Is that ok to do?

It should be fine, things should be working off the hw_pointer.

> > > +     reg =3D readl(i2s->iobase_irq + I2S_IRQ_CLR);
> > > +     if (!reg)
> > > +             return IRQ_NONE;

> > > +     if (reg & I2S_IRQ_RX_BIT)
> > > +
> > > +     if (reg & I2S_IRQ_TX_BIT) {

> > > +     writel(reg, i2s->iobase_irq + I2S_IRQ_CLR);
> > > +
> > > +     return IRQ_HANDLED;
> > > +}

> > Really we should only ack things that were handled here and report
> > appropriately, that's defensive against bugs causing interrupts to
> > scream and shared interrupts.

> What do you mean by handled? Should I check the hardware pointer and
> check if a period really has elapsed?

The driver is checking for specific bits in the status register but
blindly acknowledging all bits that are set, and reporting IRQ_HANDLED
even if none are set.

> > why is it not being added as a CODEC?

> Do you mean I should put it in sound/soc/codecs/?

Yes.

> Also, I used the name of the HDMI receiver chip (IT68051), but really
> this goes through some extra processing in an FPGA, so the result has
> little in common with the chip itself. Do you have any advice on how
> it should be named?

If it's genuinely unrelated to the capabilities of the actual chip then
just putting a standalone driver in the platform directory is fine, but
the code should be clear about that otherwise it looks like the code for
the device could be shared.

--BUSc4oJN6UGUA/g0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRH/1QACgkQJNaLcl1U
h9Dm8wf/ZxJq2tRHct/ObrsIzabxytFaYqIRHRmGSuIITeQw0Nwp0PUV9AktEYHU
LzkBnrkXvhWx3B1+uyWz4hhJLDgV4ZwS45eSGIog/yxESvzksdo0Gyzpl567SvZ/
/36OW0kNKkiZzaYjkO+xuqSD3JAzTpBZcNoNjFvBemy4EzTm+aiJ/d1OgcAiiup6
/smFYy8Myt6tABsZonxkrWekTj4kEu3f94/eSOA/sEt31qwaKfkdm7UCOAK8Boxq
8Vqne9EVAKvBTv+YFJEuRUB4jcgZAj82FuqHZoHLskH5DG2iuhy0HKDT++MlOTRu
L+2iDVwsc42urmsjklqbShXcIIGXNA==
=4k1U
-----END PGP SIGNATURE-----

--BUSc4oJN6UGUA/g0--
