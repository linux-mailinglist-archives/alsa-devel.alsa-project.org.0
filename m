Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F27179ED1C
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 17:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C232D852;
	Wed, 13 Sep 2023 17:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C232D852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694619254;
	bh=w4eOXdxxEVpvJRthlhaH92nifcMz3GmSivudS7jagvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rLMlgB7Iov6mIKSjiv1gUdbZMtcMdNf8f1VPDBqd0g9IQ/4ZTk3vy/u7836EoP9g/
	 b8Lfjpdu5TAKGpnqUOPPECOBCjVb83441b7F7f7XsQm7UwFSVZ+Xj1qm/9dYCMD8rB
	 n5JeYf9jU9jzdHZT4wooyQXBxObl4jM2McJX7IEY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37B21F8007C; Wed, 13 Sep 2023 17:33:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3A25F801F5;
	Wed, 13 Sep 2023 17:33:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80036F80425; Wed, 13 Sep 2023 17:33:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33DEBF801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 17:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33DEBF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CSdc05sw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D9EFDB82189;
	Wed, 13 Sep 2023 15:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB9CC433C8;
	Wed, 13 Sep 2023 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694619186;
	bh=w4eOXdxxEVpvJRthlhaH92nifcMz3GmSivudS7jagvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CSdc05swdFI+Usg6TPK+loCrKdjcCDoD1l3eV91+bwpg9zqRnvz5+aPx2ibFa2Fo+
	 uRXQRALXPUo+Ctds8aJoAih2KTot+U3jqSStD6Ik+9HHGu73OA7p0UXd476CdW2ebO
	 sq7OXF18Qa4JIGGYdSmXiZeHIrRv2Lp/1p4E4FTtArHa4yvdivVEZsS3XuE3c8a7tK
	 UkuqyAMJOc7oxW6WwGVXFKy+fnXsrgER+81eHlo5tvcZ1abF082K1Wahmkkkt4hXM+
	 Ixh57M0SW2OStwN98jdOiHFiTDnEKlVpltLqON9IY6n7Aln2jSEuwLkRHH8rDaoxIG
	 hxNzcOcJ7MpmA==
Date: Wed, 13 Sep 2023 16:33:00 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Takashi Iwai <tiwai@suse.com>, kernel@collabora.com,
	Jaroslav Kysela <perex@perex.cz>, Shuah Khan <shuah@kernel.org>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kselftest/alsa: Mark test plan as skipped when no cards
 are available
Message-ID: <ae381a70-3236-4792-9c3e-19d67a4377a1@sirena.org.uk>
References: <20230908181242.95714-1-nfraprado@collabora.com>
 <0fa0901e-d271-438d-bc2b-11399ad3b07c@sirena.org.uk>
 <868a8f08-ba39-4550-8e7b-0572ea03c4e7@notapiano>
 <ZP8kLM5ln2YBCHap@finisterre.sirena.org.uk>
 <a12b1144-bea0-4bd7-a429-da800dc8f568@notapiano>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HVlTO/OC556kjwhz"
Content-Disposition: inline
In-Reply-To: <a12b1144-bea0-4bd7-a429-da800dc8f568@notapiano>
X-Cookie: Use extra care when cleaning on stairs.
Message-ID-Hash: 5ZVY6IKL3JRNPSYNBDLBAWM2RQGKNWAT
X-Message-ID-Hash: 5ZVY6IKL3JRNPSYNBDLBAWM2RQGKNWAT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZVY6IKL3JRNPSYNBDLBAWM2RQGKNWAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HVlTO/OC556kjwhz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 03:23:34PM -0400, N=EDcolas F. R. A. Prado wrote:
> On Mon, Sep 11, 2023 at 03:29:00PM +0100, Mark Brown wrote:

> > So, I would interpret the overall result for the suite as being "No
> > errors were found in any of the cards discovered" if there is no
> > configuration file specified which enumerates the set of cards that are
> > expected (if there is a config file that's a different matter, we know
> > what we're expecting).  I'm not sure that the different behaviour for 0
> > cards is super useful.

> Right... So what we want to be doing is adding a config file for every pl=
atform
> defining the card(s) and PCMs expected, so that when they're missing a te=
st
> failure will be triggered which is even more helpful. Although I've notic=
ed that
> only missing PCMs are detected currently, but I imagine it should be poss=
ible to
> to extend the code to detect missing cards as well.

It seems like a reasonable approach for systems that do want to have
this confirmation.

> I take it the intention is to expand the conf.d directory with configs fo=
r all
> platforms currently being tested then? There's only one example file ther=
e so I
> wasn't sure.

I think it's a question for people working on individual systems if they
want that coverage, for example I don't really care for the things in my
CI because I have higher level stuff which will notice any newly missing
tests so I don't need the test to do anything here.

--HVlTO/OC556kjwhz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUB1isACgkQJNaLcl1U
h9B5dgf/cLXB70t6XRr3Q6R/yRGtT8S2hofbEAcc5/fjzyJfBGpuC9e2QDtn43LX
nz2xx0PD72h2gg4yD3s80zc4wiGHOSaPAeDVCS/7VmxA37k18yP7pinIl/0LM+3s
6vAOZvpQCRqNjIWJo9F/2/FfUVTKkYZ6rhXPfsTLG2de4U2oTe3zi5qc5/4hBpTh
PteqY+OK6m6/27zm3uva3vJml6vnpeofBwo+IHp6+RYLMcF1xWw3rJFv4VlOSGOf
GgbfY5xaOqnTHaCGVGRqQhQXRly3/iKRqv+goyPm/s/0PFgQfzIWtot9O0+0OIum
4v44q+DWxTLjtgGlJh0VINsZdWiBFw==
=ivXT
-----END PGP SIGNATURE-----

--HVlTO/OC556kjwhz--
