Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD26AD3A3B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jun 2025 16:05:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DF866017A;
	Tue, 10 Jun 2025 16:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DF866017A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749564335;
	bh=AtbHxQM+yT0CxeKqgpTZd0PmF9wtKhMToPizvcHglSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EheoVBil06WvAxWdNr0WfuruKu2Jm3cSw2IhaZQqduZJ7ycTVBmEMdHXb9oHxz67T
	 Fq6t5nrOL3e+nie0aqOnhr5EMt8RKg8j5qBbT6Fdpl+2nvyx59Gjk8yzzTLHnqSdB7
	 0LB+s2ykhUrsJP4VGjExTpzmc97St6RyyOfztaHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0F63F805C7; Tue, 10 Jun 2025 16:05:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A2DBF805B6;
	Tue, 10 Jun 2025 16:05:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94AD6F80087; Tue, 10 Jun 2025 16:04:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93051F80087
	for <alsa-devel@alsa-project.org>; Tue, 10 Jun 2025 16:04:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93051F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iF85syEl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B5D44A801;
	Tue, 10 Jun 2025 14:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA3DC4CEED;
	Tue, 10 Jun 2025 14:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749564293;
	bh=AtbHxQM+yT0CxeKqgpTZd0PmF9wtKhMToPizvcHglSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iF85syElSBeMtXVea+SaL+xOfPrJvkk+of/zxAioNBPmKRnmi7Q942Dp6FYsjeTi4
	 rniAm9jjPBPhHg8aCaK61kO12O5FKkmi+eq1LGHMfN9ANCxiEVawNy+5nQY67Wrx3l
	 d+SAxqE6da9pRzYaMnv65cHWV47U+PPoI6YlzR4GjhwOGPUttYa5cn78zgCQEa3hPG
	 Xu+fCzVSld1zlTQD1ZGpRpwyRnsY5XZgAJIeL38BQCg9CXnwY8k9/7Cq7D3x6y1k90
	 hHZlEyyCjLnhTxn4YTiI7RDKe0ren4o+wnoU1inN21LKDvpDNI4CuhFLHLsIl3StF5
	 KuiD5UKzrkuew==
Date: Tue, 10 Jun 2025 15:04:48 +0100
From: Mark Brown <broonie@kernel.org>
To: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"tiwai@suse.de" <tiwai@suse.de>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Xu, Baojun" <baojun.xu@ti.com>, "Ji, Jesse" <jesse-ji@ti.com>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"Girdwood, Liam R" <liam.r.girdwood@intel.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"Hampiholi, Vallabha" <v-hampiholi@ti.com>
Subject: Re: [PATCH v1 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Message-ID: <89f0f2ad-b1b8-4553-a041-0a8717c49a6a@sirena.org.uk>
References: <2160affa35c4436c8e6875fa449a0763@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6COyESwXbg8JcPn0"
Content-Disposition: inline
In-Reply-To: <2160affa35c4436c8e6875fa449a0763@ti.com>
X-Cookie: When in doubt, follow your heart.
Message-ID-Hash: DKKB4LMEMU3AUZBYYTABDTCI3WIW4DG5
X-Message-ID-Hash: DKKB4LMEMU3AUZBYYTABDTCI3WIW4DG5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKKB4LMEMU3AUZBYYTABDTCI3WIW4DG5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6COyESwXbg8JcPn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 01:13:23PM +0000, Holalu Yogendra, Niranjan wrote:

> > > +config SND_SOC_TAC5X1X
> > > +	tristate "Texas Instruments TAC5X1X family codecs"
> > > +	depends on I2C && REGMAP_I2C

> > > +config SND_SOC_TAC5X1X_I2C
> > > +	tristate "Texas Instruments TAC5X1X family driver based on I2C"
> > > +	depends on I2C && REGMAP_I2C
> > > +	select SND_SOC_TAC5X1X

> > You need to select REGMAP_I2C if you use it, it can't be turned on
> > independently.  If the device is I2C only then there's no need to have
> > the second option for I2C, that's used for devices that support both I2C
> > and SPI to avoid problems with dependencies on the I2C and SPI core
> > code.

> Many of these devices support SPI interface as well. So I thought I will =
make
> library and I2C interface file. But currently SPI support is not added in=
 the driver.
> Is this okay to still keep this ? please suggest.

Yes, if some of the devices do have SPI support but it's just not there
yet then it makes sense to do things this way.

> > > +	"OUT_CH2 OUT2P Short circuit Fault",
> > > +	"OUT_CH2 OUT2M Short circuit Fault",
> > > +	"OUT_CH2 DRVRP Virtual Ground Fault",
> > > +	"OUT_CH2 DRVRM Virtual ground Fault",
> > > +	"Reserved",
> > > +	"Reserved",
> > > +	"AREG SC Fault Mask",
> > > +	"AREG SC Fault",
> > > +};

> > For ones where the reserved values are in the middle of the set of
> > values you can use _VAL_ENUM() which lets you skip over the values that
> > are invalid.

> Is there some example which I can refer?=20
> I could not find anything in the kernel source with _VAL_ENUM.
> I will try to refactor to avoid this.

Sorry, I meant _VALUE_ENUM (should've actually grepped to confirm).
There's a bunch of examples which should be easy to find with the
correct name, such as adau1372.

> > > +static s32 tac5x1x_set_GPO1_gpio(struct snd_kcontrol *kcontrol,
> > > +				 struct snd_ctl_elem_value *ucontrol)
> > > +{
> > > +	struct snd_soc_component *component =3D

> > This seems to be exposing a GPIO directly to userspace, which will
> > prevent using that GPIO with other kernel subsystems.  It would be
> > better to expose this via gpiolib, then if userspace control is needed
> > that can be done through gpiolib.

> Thanks for the suggestion. But, in our case, codec chip has some GPIO pins
> which are specific to the codec. We do not intend to expose to the other=
=20
> kernel subsystem. It is more of codec chip configuration to use these
> GPIO pins as - for e.g. daisy-chain input, audio data output, PLL input c=
lock source,
> interrupt, digital audio input(PDM) etc. Depending on the hardware connec=
tion,=20

You might not intend to use them as generic GPIOs but some customer
might.  For purposes where they're not actually used as GPIOs but rather
are pinmuxed into an audio data output or something then they should be
configured via DT properties since that's not something that will be
changed at runtime but rather something that'd be controlled by the
board design.  Only the actual GPIO functionality should be exposed via
gpiolib.

We do have a specific subsystem for pinmuxing too, but for fixed
function stuff like this it's probably not worth the effort of using it.

> > > +static const char *const tac5x1x_slot_select_text[] =3D {
> > > +	"Slot 0", "Slot 1", "Slot 2", "Slot 3",
> > > +	"Slot 4", "Slot 5", "Slot 6", "Slot 7",
> > > +	"Slot 8", "Slot 9", "Slot 10", "Slot 11",
> > > +	"Slot 12", "Slot 13", "Slot 14", "Slot 15",
> > > +	"Slot 16", "Slot 17", "Slot 18", "Slot 19",
> > > +	"Slot 20", "Slot 21", "Slot 22", "Slot 23",
> > > +	"Slot 24", "Slot 25", "Slot 26", "Slot 27",
> > > +	"Slot 28", "Slot 29", "Slot 30", "Slot 31",
> > > +};

> > TDM slot control would usually be done via set_tdm_slot().

> We need the slots to be configurable in case we need to swap capture
> channels. Is it okay to keep this ?

If it's runtime configurable then ideally that'd be a control exposed by
the board that uses set_tdm_slot() which offers the specific
combinations of options that make sense on that board.

--6COyESwXbg8JcPn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhIO38ACgkQJNaLcl1U
h9Dpbwf6AhMYhhHJ4gLvh2D5F7evNDXkJmel1fMmLGde0DrqkjGO51JWdurqqz8Z
fpvRYOGdIjazRKWKXI78s6X3ptxqJQTQus4tQkNNodQCS1JS6e6bzBnuckTvIcoC
FAko+O/x60PlCc3u6956ay/1/h9M7kgF7cGrIqBqr2VowK+koJw3XiVP41iVKrtU
mzq2uHihS+RFB9cLGShWNYptyd3q0o//gYPq4TOeizy1pe1cGGS3KNx7HY7PZIpk
eozrq6CTD3Om41B1HRroEhFEK770YhNwnBHuVcdKNGMOpdVge6+SEysIYp2LJONd
7af3QWZXOuWvJmfzTTvdbRDZkCGLSw==
=c6/B
-----END PGP SIGNATURE-----

--6COyESwXbg8JcPn0--
