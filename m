Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A83712990
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 17:33:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B735200;
	Fri, 26 May 2023 17:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B735200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685115208;
	bh=4m/Qk075j/0+s0pvgQPIintRP272qfoEBrkbGMBlv7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kV/e00Cy9YLbW+9+7zy2rJc3f+N24TOvwqZMtMi9Dh9NzwoTgv567DsOaU5huejUU
	 3DJYpWBiBM7oVXPVrhekZ8lf784E8v8qdGX7Q7a773S1h4qi1MlYQsF31svITzPluu
	 NMxKZVUl2FwG0dfodI44EItaoec809nhknDUGMi8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 751AFF80053; Fri, 26 May 2023 17:32:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C60E9F8016A;
	Fri, 26 May 2023 17:32:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66E52F80249; Fri, 26 May 2023 17:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBBD3F80053
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 17:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBBD3F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c1p3gdVP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 46ACE650D6;
	Fri, 26 May 2023 15:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA2EC433A1;
	Fri, 26 May 2023 15:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685115145;
	bh=4m/Qk075j/0+s0pvgQPIintRP272qfoEBrkbGMBlv7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1p3gdVPBUZmNGSMQR74B9JbAylm7y4PMBRm0b5Uz3vwbjZrwbJNJk7u8Ym9w31gX
	 6qXNxSRN9BWb3zIbenqCdjfF+mngD1Z4tSlT387pSxgGlWsTB0y3yvGHwHr9XEmcin
	 tbTEFHZrmZelDH0TKMZAf/9ontL4q742VzwmIvEDtpr6D0VCfnHQVdyieXATod7RYW
	 0hIOGmaJghcrt/yT9RYM0DDIGRbU4mvg0YlDpXVWEAZqNV7lGepay3l7c7PKEMtZ9k
	 Tl8+NUXVsXaLdKSUBdM/p+PXedsakJ98+veRAws9BM9lkMJbLGmV4nltxugs23qqJ1
	 W/UBP+cDmHDig==
Date: Fri, 26 May 2023 16:32:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>, alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: SOF: imx: Add OF machine descriptors for i.MX
 platforms
Message-ID: <9484d916-2983-40a3-bad9-b2125e48e2b6@sirena.org.uk>
References: <20230525122837.649627-1-daniel.baluta@oss.nxp.com>
 <69c2b7cd-f211-47ef-b42a-609ee792de11@sirena.org.uk>
 <CAEnQRZAseAmOHLBsBQuW+SqEFbT-pbrjpUiPhSuv8Ww2VoJf_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iI8CLd1WBnI4hQJ1"
Content-Disposition: inline
In-Reply-To: 
 <CAEnQRZAseAmOHLBsBQuW+SqEFbT-pbrjpUiPhSuv8Ww2VoJf_w@mail.gmail.com>
X-Cookie: A Smith & Wesson beats four aces.
Message-ID-Hash: BGNOP5VIP52B6MEJN7JJLBA2FIJFK7AD
X-Message-ID-Hash: BGNOP5VIP52B6MEJN7JJLBA2FIJFK7AD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BGNOP5VIP52B6MEJN7JJLBA2FIJFK7AD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--iI8CLd1WBnI4hQJ1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 09:35:40PM +0300, Daniel Baluta wrote:
> On Thu, May 25, 2023 at 8:07=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > > +     {
> > > +             .compatible =3D "fsl,imx8qm",
> > > +             .drv_name =3D "asoc-simple-card",
> > > +             .sof_tplg_filename =3D "sof-imx8.tplg",
> > > +     },

> > It seems a bit sad to be adding simple-card rather than audio-graph-card
> > at this point - is there some great reason for this?

> This is what we used so far and it works pretty well for us.

> Is there a plan to deprecate simple-card? And switch to audio-graph-card?

> We could have a look at this if this is the correct direction.

It's already deprecated, and audio-graph-card (really you want to use
the audio-graph-card2 binding) is much more featureful so will cover
more machines.  If you're doing something new then it's best to use
audio-graph-card for future proofing, simple-card is a bit too simple
and inflexible.

--iI8CLd1WBnI4hQJ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRw0QMACgkQJNaLcl1U
h9AbAQgAgJMjFb+nP+p0Z4yJhUuNKQgmgr/fggzRkMhZohX1wIneM7Kz2y5HDEkm
/AP3OUV/nd2DQX+rBaiLfqVczQ6w5kzCpZFkzVoOGFVp42kLtb7dM6T6HLe8OO8V
gq31L3hchdQ0IrK74FXOShnKqMzxqJmveQk0EM04vX0lHEymn+amwajoxIig1sG4
gXxc6oNiL5IpLA4Ope9jfp+S/URFVtFDu4mPaImfosSvh0Zai2MMmu/F5RfKcN4Q
zEq21yrtl4dxGj88GSVV3w6afjUthhQb3I9GkLLtXDAECSjyf6B1JitSA6/y2YSy
fNhUSTxb4F/LwrpXN9DvZf6wn1gekA==
=Tt2A
-----END PGP SIGNATURE-----

--iI8CLd1WBnI4hQJ1--
