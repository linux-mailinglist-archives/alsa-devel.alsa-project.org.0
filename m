Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 219AD787B50
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:16:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C3A784B;
	Fri, 25 Aug 2023 00:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C3A784B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692915403;
	bh=wr6PyYLQMH1FDFPHXkYjeWD/Y1Kihg9mzM2Mg7Nblrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z9YDrnHfRA8dbe9kiYnCXoXiEpHspsXauqpVHggCKZl4UH9nxAIZeQY/viNK1tv9n
	 /VHBhya6S9sxYOptTH/HQA3/bSTPOpKAOqWG5iuk5abCL166eJNLRShEN1wzhltoqL
	 P+jGsOEYIQJzfB3ehTsFDFEmXzuqIuCnSjefLUBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FF38F80589; Fri, 25 Aug 2023 00:15:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AACC9F80580;
	Fri, 25 Aug 2023 00:15:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75370F80588; Fri, 25 Aug 2023 00:15:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F1D0F8057C
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 00:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F1D0F8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g2Jolfxx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A5BE3604EF;
	Thu, 24 Aug 2023 22:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92494C433C7;
	Thu, 24 Aug 2023 22:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692915337;
	bh=wr6PyYLQMH1FDFPHXkYjeWD/Y1Kihg9mzM2Mg7Nblrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g2JolfxxbczZ2nRStLtSdGASRpQ3W943vVGfIQQD6yQ72DVXqTGo9LoaDLrY6pbgA
	 DNtu/oY++3yBERvCOZPf2H5eoxR9/jE/lvtj1ubfAMEm2nRocKxoF6MuXjRv7X5DmM
	 gGqkZbXbmSQpZG0ieYKigIZE09q6kdShAN9TSwabldt54zwuULmCduRCHPTXADPb2A
	 UFFxOlIVzf7BBjzdkAg7BXs00CRKzF4WChRAGuNe8W1krGjQB4KqWvpu4BriZjeQKL
	 HU5LY8XR6YDhU650FDTTTGOXtyrHCRfxMVoMAPC5rcfqrbZepZSUA40yyPRzm27ZHz
	 hV8UQV7mmf9qw==
Date: Thu, 24 Aug 2023 23:15:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 0/2] A couple of ASoC core fixes
Message-ID: <ZOfWhHT7300tpRUp@finisterre.sirena.org.uk>
References: <20230824211241.388201-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0MjQKjjQVt6uTKlM"
Content-Disposition: inline
In-Reply-To: <20230824211241.388201-1-cristian.ciocaltea@collabora.com>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: ICUOGYJLLBRB6Y5UVVNMK3L52XZJ2LZI
X-Message-ID-Hash: ICUOGYJLLBRB6Y5UVVNMK3L52XZJ2LZI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICUOGYJLLBRB6Y5UVVNMK3L52XZJ2LZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--0MjQKjjQVt6uTKlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2023 at 12:12:39AM +0300, Cristian Ciocaltea wrote:
> This is just a split version of the initial patch [1], as requested by Mark.

Thanks but I already queued v1 for CI, all being well that'll go through.

--0MjQKjjQVt6uTKlM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTn1oMACgkQJNaLcl1U
h9A4lwf7BoCSZYfVz2ZDM/97eib5epbICK2hmLNVBMPYR3jTVSjFXZ3FI+Jfqgt+
YpC1frXIgO89cTCP8bp6bcrUrrtdd/99ju/vCGaBkc3oXEPOy6Y+dHjQBQLXuSJL
WmLgo62XNWueb1acsANWyl21TdIu8mpOpL1ZUey65m19IfhAI+EdLDT1Ru/m0aLk
v7mlrW5egoaiy0CeOZTAbaQT81H7OQH2EOBBqPqdsmU27g+xUPqChtM+adar0wWk
zjCl9YeYiWcd9JKO3i7TWXiAAhIzbc1lk9e61b59b7sg76wjd2PcNWL9vi+NoeSD
RBeo3UnDsnN75qPgv09KJR6UCPPVfQ==
=k8P6
-----END PGP SIGNATURE-----

--0MjQKjjQVt6uTKlM--
