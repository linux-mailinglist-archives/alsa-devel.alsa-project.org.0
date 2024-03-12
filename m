Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3BF879945
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Mar 2024 17:46:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C861E9A;
	Tue, 12 Mar 2024 17:46:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C861E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710262011;
	bh=GIDja9aBii3rVKEgujvTkdkq26dWlQqOSphipreMf8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C5+Y9rCUyQnE422urguiHMNNE8b9+J/tKJQRwAlhPTlB/HScqYn0k6obMhWTIByVk
	 lXRO2sCFmbUgWjjzVjW1BlO5LeVapRwYk8px5deeuV83jZRvlosbKDRAbBaWXkXBQ3
	 TQksRh8kpkUXVI2w4qiIfHCyE9JIGkwWPerBzpQQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A993DF80579; Tue, 12 Mar 2024 17:46:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9D13F805A0;
	Tue, 12 Mar 2024 17:46:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E578AF8028D; Tue, 12 Mar 2024 17:46:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD509F800E4
	for <alsa-devel@alsa-project.org>; Tue, 12 Mar 2024 17:46:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD509F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f/49XSD+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ACEC7CE1813;
	Tue, 12 Mar 2024 16:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B567C43394;
	Tue, 12 Mar 2024 16:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710261966;
	bh=GIDja9aBii3rVKEgujvTkdkq26dWlQqOSphipreMf8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/49XSD+stWYzIs75s/vQJdYY6j460avHXABtNO4nCPF+/fd2fC7U50ibQY70VmgZ
	 wcmm2kK72RbJRzlH5ItwhO3lwZD/4sf9Xc/1LPTFl2AH+R9XNB4GFEEi+Co6Ek3lAs
	 jOQBe8AgmZqvUV1sZp+GjMI03b8tXvVOR2nNQuvzQkopuyE+jLw9RA3VupiNoutM6G
	 FDmr6u/jwZu/NykJzNrSN37rNrJ2lbfAJ+JbEB1Y9tk3ukDlcmuC6Ix18ojJ37bPiR
	 HWBtwra8EDloKMB3jOU4l77IS4xgJFDq5G5G/7TVXzn19FfzR9QokDsCJ7hxSrIU8j
	 ZyEmX9UYxqJMw==
Date: Tue, 12 Mar 2024 16:46:01 +0000
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com
Subject: Re: [PATCH V4 00/13] soundwire/SOF: add SoundWire Interface support
 for AMD SOF stack
Message-ID: <05bbc2e0-e8ac-4db0-9ed5-7e3ac765f252@sirena.org.uk>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
 <565b9a1d-a074-4bb6-b4c5-2b9be9095a3f@sirena.org.uk>
 <581a81f4-e540-4de2-b17d-51bc192ae6ec@amd.com>
 <ZfBmoe4Rv2zjS7PV@matsya>
 <e6ec31d5-ab6b-4c28-8fbc-c706b56c7630@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CFaOyNoWoTjHqmJM"
Content-Disposition: inline
In-Reply-To: <e6ec31d5-ab6b-4c28-8fbc-c706b56c7630@amd.com>
X-Cookie: Neutrinos have bad breadth.
Message-ID-Hash: DKPECX4675LW27T5JFJGIK5NOQ64BMQQ
X-Message-ID-Hash: DKPECX4675LW27T5JFJGIK5NOQ64BMQQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKPECX4675LW27T5JFJGIK5NOQ64BMQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--CFaOyNoWoTjHqmJM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 12, 2024 at 09:59:09PM +0530, Mukunda,Vijendar wrote:
> On 12/03/24 19:58, Vinod Koul wrote:

> >> We need to send few fixes on top of this patch series.

> > If you had told me earlier I would have pulled. It is late now in merge
> > window, pls send the patches after rc1 is out in two weeks

> As patches already got merged into for-next branch, are you going to
> create new tag for SoundWire patch series for RC1 release?

I'm not sure what you're expecting to be tagged here?  I expect
everything I currently have applied to end up in -rc1.

--CFaOyNoWoTjHqmJM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXwhskACgkQJNaLcl1U
h9A3Cgf/bJwKuZn4lipBC5hIXV/giuTNzFRB1+ufUU1TTXDVei5Wr/WkeJyMBm2J
z0zu02o0hgCSQciCqGaSuUQGvkm0PdZxtZKiUB/TK2Ti4BQXDuGHhPjyY/bgouNv
kjkE5m1e12JgSM4XcIoJOpCrroWbv0uCnpErrMAqnWV3tEGGl7zTJpGM/F3L3hjq
48GQSkc2RV2RAMGCzLWbh32MXIZt8Mi3FiBHUDF9yL5MAYYlsSu5yuQep2JkXmHW
vW0BmdFWhNyEJVVWqmcj0Mks17ImexSoEarCdCFNdy8qVL4aGSSdGXsajPdaSNLd
aL76VToHrZNX+qwRwdg/fhgNJrfpGA==
=Q07c
-----END PGP SIGNATURE-----

--CFaOyNoWoTjHqmJM--
