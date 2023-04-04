Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8076D5F6A
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 13:46:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C0591FB;
	Tue,  4 Apr 2023 13:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C0591FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680608805;
	bh=VMElRMGjg/6npF87PapX/PUQfyFG+AI8rzIRICGBY0I=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OGTxuUNNjnRdzrq9DhvRVo3Ga7rg/RnH6zjKFWdHBcTJ5LJaTdfqQu91KKmgaxNwb
	 zCmGQtwGrUavcBD+zb8WmyM7Xjltcs6qemnQtcstHaNxqLQ/O4IrrSjkUL1EOW/C2F
	 DkYpIVoJPwV/vkrge30rYA2DFf50VONv9ZKlVsA8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 014B2F8015B;
	Tue,  4 Apr 2023 13:45:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BFC2F8024C; Tue,  4 Apr 2023 13:45:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E662FF80171
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 13:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E662FF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K6bXH1QG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3FC3761447;
	Tue,  4 Apr 2023 11:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF27CC433EF;
	Tue,  4 Apr 2023 11:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680608747;
	bh=VMElRMGjg/6npF87PapX/PUQfyFG+AI8rzIRICGBY0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6bXH1QGmeYEBpRpfipt9PUMd55OOH0WApO/MybTGGIe+t2HjztKomHVvES70BjS1
	 IrEufaltWFSZOKMz9LWUmLRQm/KHng7rzVr6vuaNElmvJUYFHPM90VZwY7pglJNAN9
	 CFNy7fkgoiinJYvxfm2kSjWQ//LAwvKE3I73QeewzifRTVvYCuZN1+p3Z9B6m+4zTn
	 rrZCHKGrD9lPv2MLSSRSQQe9vlpqluzbdclM2u5zigpzmxhGHM5gxcMuKvMnTO19wy
	 r7sAi988Cbu5crcMC3bV5Es5zssh0Xxmh8FdGycg0NMXVzAAzcvbZX9/5iGTK9XGHs
	 qAyz4TWQBT7oQ==
Date: Tue, 4 Apr 2023 12:45:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH next] ASoC: cs35l56: Fix unsigned 'rv' comparison with
 zero in cs35l56_irq()
Message-ID: <f6e99383-4054-4f14-8cf6-8a9cdd792265@sirena.org.uk>
References: <20230323165825.1588629-1-harshit.m.mogalapalli@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2SZ3smf958ksUSJo"
Content-Disposition: inline
In-Reply-To: <20230323165825.1588629-1-harshit.m.mogalapalli@oracle.com>
X-Cookie: Don't get even -- get odd!
Message-ID-Hash: LZVSNTAB42IHNI7CIPVEII7VVTCLV5SF
X-Message-ID-Hash: LZVSNTAB42IHNI7CIPVEII7VVTCLV5SF
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: error27@gmail.com, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Simon Trimmer <simont@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LZVSNTAB42IHNI7CIPVEII7VVTCLV5SF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2SZ3smf958ksUSJo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 23, 2023 at 09:58:25AM -0700, Harshit Mogalapalli wrote:
> 'rv' is of type unsigned int, which can never be less than zero.

This doesn't apply against current code, please check and resend.

--2SZ3smf958ksUSJo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQsDeQACgkQJNaLcl1U
h9D+VAf/QW9rSPmMvgXDHFAb0ickOpz7arHugaOibeBnQyLyf511JOJCH2NEag3k
lCvj7/K0VFzKQtfV/20leU8BesPa/GILUMMNK4F/8XE6Tj2vsMEBpGxTBalG9XIX
1bR4ixX2d0dt2LWsUBsk1qaw95clJ8bA87hOFJl7c14f8Ikg89fzzzpbrPw1YLP1
gQwNfJ9y/NTViWbPmOuZno1e43xNxUhfa4izJS0wmzDaxwOof/IFwwYsXHRHtD36
w/FClhm+6d8UCWoD2Xg5R/+d6PQZxlozvHJHoKfr6bARgSzhzXRHikDs0r01Gb1G
Jr0IxYdcHpTJ+z6sHVh5Lo01o7dPNg==
=es2X
-----END PGP SIGNATURE-----

--2SZ3smf958ksUSJo--
