Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DAF298E40
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 14:40:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F357616DD;
	Mon, 26 Oct 2020 14:39:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F357616DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603719624;
	bh=+nkoyj7yQTKFExiVobUJ42WV3wBkEKoQDjVeQdK1uug=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AN+zIo5hT+eQWepAlRGDYoRv3KaWeljdGdoVxp94mqcaDkc3YGNgCD97mYHAwc+Zq
	 juzKfqExF4aUUmztatvwG6DBgW3vzJU0QPOUrNaKt705nBNuO85Wa2/dCz9wJFRHD3
	 4RvuL13aZF+cBSMmRrDX3thdBj/JmGad/gIkaZkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78C62F80249;
	Mon, 26 Oct 2020 14:38:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 383BBF80212; Mon, 26 Oct 2020 14:38:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1997F80086
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 14:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1997F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IzjepBlC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 722F121BE5;
 Mon, 26 Oct 2020 13:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603719524;
 bh=+nkoyj7yQTKFExiVobUJ42WV3wBkEKoQDjVeQdK1uug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IzjepBlChROEPkQZXalULKXWZ6z0gcY6RHrUBqmueM940tkxh4zgu3aaoHDuPjOeM
 1RPIJOM67NJy8KBEjo+X4zUUm3Wp0xn/qy5+/f00KV7DyBM3w1Tz/YHtCkZgvZEhRV
 YekLsrViYQLPDnDdel3LexZ5PHxKndmJAv17TMsM=
Date: Mon, 26 Oct 2020 13:38:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/7] ASoC: audio-graph-card: Add plls and sysclks DT
 bindings
Message-ID: <20201026133839.GE7402@sirena.org.uk>
References: <20201016173541.21180-1-rf@opensource.cirrus.com>
 <20201016173541.21180-3-rf@opensource.cirrus.com>
 <20201026132704.GA19204@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZRyEpB+iJ+qUx0kp"
Content-Disposition: inline
In-Reply-To: <20201026132704.GA19204@bogus>
X-Cookie: Safety Third.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-arm-kernel@lists.infradead.org, nsaenzjulienne@suse.de,
 linux-rpi-kernel@lists.infradead.org
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


--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 08:27:04AM -0500, Rob Herring wrote:
> On Fri, Oct 16, 2020 at 06:35:36PM +0100, Richard Fitzgerald wrote:

> > +- plls: A list of component pll settings that will be applied with
> > +      snd_soc_component_set_pll. Each entry is a phandle to the node o=
f the
> > +      codec or cpu component, followed by the four arguments id, sourc=
e,
> > +      frequency_in, frequency_out. Multiple entries can have the same =
phandle
> > +      so that several plls can be set in the same component.

> Where do the values of id and source come from?

The device bindings will need to define them.

> > +- sysclks: A list of component sysclk settings that will be applied wi=
th
> > +      snd_soc_component_set_sysclk. Each entry is a phandle to the nod=
e of
> > +      the codec or cpu component, followed by the four arguments id, s=
ource,
> > +      frequency, direction. Direction is 0 if the clock is an input, 1=
 if it
> > +      is an output. Multiple entries can have the same phandle so that=
 several
> > +      clocks can be set in the same component.

> Are these really common properties? They seem kind of Cirrus specific=20
> and perhaps should be located in the codec node(s).

It's very common for audio devices to have very flexible clocking, to
the exetent this is Linux specific it's issues with the clock API not
being able to handle clock controllers on buses that need clock control
to access rather than conceptually.

--ZRyEpB+iJ+qUx0kp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+W0V4ACgkQJNaLcl1U
h9AVQwf5AeZ5FzIxFAqR5KS3Q6dg/QnmdfAqWm5oroiARb2nuHh+2WKL2jFKLyiR
/mycXkP/S3TVoedKycpB4pAWXpyk0bYpsbZDolvZK8Yqygx8JKtxjzhw5N2fubCn
uKsxDBOuWxK8T4iQUqPI0xlA6CoziSx8jVT8xYEuuQ040IUmyR361aK6OTGxr2p3
Yq/fQyZeswr4i09lwsNk2BpDGKuVaKonvsLqGULZ+j10YQEOi6HKajvxbiyB0/yS
316Siu3n1TpYzclqs4CNsXVa1st0abkNSRvkVKajZo3/8MpCknXIRUI5aGD+cTx6
5MDUXLhvotazUVdZ886Vuqoig378yg==
=qTFO
-----END PGP SIGNATURE-----

--ZRyEpB+iJ+qUx0kp--
