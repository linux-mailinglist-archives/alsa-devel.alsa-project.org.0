Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6AEA4FF99
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 14:07:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDC3A6038C;
	Wed,  5 Mar 2025 14:07:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDC3A6038C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741180077;
	bh=rRLh86cLFLqmNG+T9Rd6VrXKmn/xHimWelzpVRHuNdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lh2B0EphHUMhu1JgeeqPDWsQV3JcMp/cBMz1gebp2ZzGbe+A+zX5WZOnGreAluZd6
	 cvr9jSi4x6aYH6UmbKbyo5k04G4ewrf0F8BDBDgICrhsm9jiyI/kWjLL8Hv8Ke0my6
	 H2/r1fp32jwnC/VFOtCJaielU5f0h7ckjrhhVw8I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FB2EF805B0; Wed,  5 Mar 2025 14:07:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D3FAF805B4;
	Wed,  5 Mar 2025 14:07:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB7B9F802BE; Wed,  5 Mar 2025 14:07:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FA52F8011B
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 14:07:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FA52F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FTexpU7l
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 006245C6904;
	Wed,  5 Mar 2025 13:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A7CC4CEE7;
	Wed,  5 Mar 2025 13:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741180021;
	bh=rRLh86cLFLqmNG+T9Rd6VrXKmn/xHimWelzpVRHuNdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTexpU7l/PbhsIurlyD8VSoGVgjPlyNTy6nPpW1AnFmov0caF41Jf7gbOJ05x7bGz
	 By4ZYuW9sShoEDy0o+h/bGouElGEmLrq7KbP1Wx+sM2QNqZ5U3vnNxN4vxclMISyEU
	 PH2eGnimZFToswmg70C9j+2SoFsXGjY8t9XPvi8e2btt9y842Mho9dN6+EF8e3s6Z8
	 0hEjToguGOWXwWdb2K0jRZXKmaAhx/GzZ+ZcjiZb84ZdhUPBDEAKZntWczcY4LJRiM
	 IkVax+Orcq+PHlmzVwWSrS1yhAmtkMzjaRUzqdvNcsrBCTjeS4MAgUhePjQTuoh5eA
	 uHPdE+3VFlFUQ==
Date: Wed, 5 Mar 2025 13:06:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 1/2] ASoC: codecs: add support for ES8389
Message-ID: <77f040bb-a1ff-4eca-831b-ab10bf79e6bc@sirena.org.uk>
References: <20250305025610.58476-1-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="odRdCbb20AVtN+qv"
Content-Disposition: inline
In-Reply-To: <20250305025610.58476-1-zhangyi@everest-semi.com>
X-Cookie: Everybody gets free BORSCHT!
Message-ID-Hash: XBFDTZFO3WI55TJAKHJJCTWZHWOFJ7XF
X-Message-ID-Hash: XBFDTZFO3WI55TJAKHJJCTWZHWOFJ7XF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XBFDTZFO3WI55TJAKHJJCTWZHWOFJ7XF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--odRdCbb20AVtN+qv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 10:56:10AM +0800, Zhang Yi wrote:

> > set_tdm_slot()

> We will register multiple codecs inside a single dai_link and differentia=
te these
> codecs by of_node. And the adc_slot and the dac_slot may be different, th=
ey can=20
> be decided by the user.If we use set_tdm_slot,the adc_slot and the dac_sl=
ot will
> be same.

No, the machine driver should be configuring different TDM slots for
each device - that's the whole point of the API.

> > > +		ret =3D clk_prepare_enable(es8389->mclk);
> > > +		if (ret) {
> > > +			dev_err(codec->dev, "%s, unable to enable mclk\n", __func__);
> > > +			return ret;
> > > +		}
> > > +	}

> > Making the use of a MCLK depend on the configuration of a TDM slot for
> > the ADC seems *very* unusual, what's going on there?

> Because we are associating multiple codecs under a single dai_link, we wi=
ll be
> executing probe and init many times during initialization.But MCLK only n=
eeds
> to be used once.So we decided making the use of a MCLK depend on the conf=
iguration
> of a TDM slot for the ADC=20

No, each device should just get and enable the MCLK itself - the clock
API does reference counting so there's no problem with this, it's normal
for a clok to have multiple consumers.

--odRdCbb20AVtN+qv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfITHAACgkQJNaLcl1U
h9DKdgf/dA3DFm9sVUPZw2kDFYD0y+gP8Zdn23GsRYrB8PFUCETklJpv8/5dVyqO
IMfmmCdh7iNUgqPOnYSD3Xc9td9gAaiNN6Bn23fe2bMaLqfRw9Nu5evZsag/LM1I
K+b4s2MvX7N0hR3AGPvyiqerfOMT1BQaC7PILBIPIVfVx6KlIqNYgc1F/c8qNhg4
6TYrGVhzrGfQ8UCDKv06o7Kf4UI12yoT14700f5bii1mz7fSqnExlQbXo6sExsib
aCkrak88ekZCVHdtP9wWZ3ZFtr8A9lE/cimo3C5KfYbLFssfUMvv7zLUBwbQF62x
C9jHK18q3PotRcMDmoJJrr593qrHKQ==
=U/iY
-----END PGP SIGNATURE-----

--odRdCbb20AVtN+qv--
