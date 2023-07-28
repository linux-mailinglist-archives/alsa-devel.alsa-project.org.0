Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB80776760C
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 21:07:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0FA3844;
	Fri, 28 Jul 2023 21:06:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0FA3844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690571224;
	bh=uvi0bATcHujY6DvXBu4/fcOB4Yc3DjUaV91qV1I79VQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZlWk6iNPJOu/yaf296e+utJ85L2f0/Xw2DpE9eSiTRlf13CvkKS4EPgrhYBy4oqiJ
	 sveH7l0KdyfhSLsfIozsdOlS3VsxYfNPk7zDxIfMPnzHpDudr/u0c0KChXGTgwZMUX
	 tkL0U9PdXSPdn0HHR7kBGWGgQPEuZpd0fUe4T/6o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C0BEF8019B; Fri, 28 Jul 2023 21:06:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B85DF80163;
	Fri, 28 Jul 2023 21:06:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A36EF8019B; Fri, 28 Jul 2023 21:06:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17785F80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 21:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17785F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UeR8dNB6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29259621D3;
	Fri, 28 Jul 2023 19:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B4BC433C7;
	Fri, 28 Jul 2023 19:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690571162;
	bh=uvi0bATcHujY6DvXBu4/fcOB4Yc3DjUaV91qV1I79VQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeR8dNB6wZh7BOsUGBe8c9Teqh+jZNiF+aAwm8T3PEIoNwCY+5+FPEXZn8DFuW6V9
	 XegaV2kHvQS4hJvnln69dp3tyS8MWcFea0zb89vLdZnnYf02d2mMGtkuoTjHsyswT6
	 MMPOaTrtiWB/jUkcKkVnqhPAWC0Lt20mRAYg+eOMa/gflFYkX9fb90IcXjD7eUHsoJ
	 S0pU7+h6Pnqw1qLydXkdWhiX1vQxL2A+au/0O1V+bRe2LL6SyF/iFLXLj1suQXJ+ak
	 II4N5R48GC87Uda/sc8HWXvbO3tazp7aaAT+fao06wCZJcBWu0qdvIJDZeHShLODGb
	 4+tS3F96U0GNw==
Date: Fri, 28 Jul 2023 20:05:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Justin Stitt <justinstitt@google.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: Intel: Skylake: replace deprecated strncpy with
 strscpy
Message-ID: <e60cc955-87ed-45e3-aec5-8ba6705dee1a@sirena.org.uk>
References: 
 <20230726-asoc-intel-skylake-remove-deprecated-strncpy-v1-1-020e04184c7d@google.com>
 <20230727-asoc-intel-skylake-remove-deprecated-strncpy-v2-1-152830093921@google.com>
 <f0f0ebe4-55fb-4861-a94c-77c82ec600c5@sirena.org.uk>
 <202307281153.B9D0831710@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0CLOAGmPChQYeQM2"
Content-Disposition: inline
In-Reply-To: <202307281153.B9D0831710@keescook>
X-Cookie: Ontogeny recapitulates phylogeny.
Message-ID-Hash: IJXAT6FSW5PI34RPSZXDM2CCE4L72CNV
X-Message-ID-Hash: IJXAT6FSW5PI34RPSZXDM2CCE4L72CNV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IJXAT6FSW5PI34RPSZXDM2CCE4L72CNV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--0CLOAGmPChQYeQM2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 28, 2023 at 11:56:08AM -0700, Kees Cook wrote:
> On Fri, Jul 28, 2023 at 12:27:24AM +0100, Mark Brown wrote:

> > Please don't send new patches in reply to old patches or serieses, this
> > makes it harder for both people and tools to understand what is going
> > on - it can bury things in mailboxes and make it difficult to keep track
> > of what current patches are, both for the new patches and the old ones.

> Hm, I see "X-Mailer: b4 0.12.3". Is this a default behavior of b4? (If
> so, that needs fixing.)

I've not noticed it doing that for my outbound patches and can't find
any option I tweaked to make it send as new threads, nor can I remember
configuring anything.  There is a b4.send-same-thread option since v0.13
but it's default no according to the documentation:

   https://b4.docs.kernel.org/en/latest/config.html#contributor-oriented-settings

--0CLOAGmPChQYeQM2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTEEZMACgkQJNaLcl1U
h9Ct+Af/T7a2K03kKbmE3CZlrTeEc/9UoIzWu826PaLwb+bN2MkLIcLQgYsNhPMZ
mZevyeMs2vdVYdereur4vUo4/7proNHZLpIZkvRZqg2gCEJeaJeKbvgmTp0V+1Nw
TWSFyzDzLY1fPuqNL0BzHaJtxKioS2AtUWJo+kXgBK1USKMk0ufVEKv5kf7zVHHP
B6sa7nppmwWvP1mGwTxO2QOYHax8dNSh1F3z5EUH+5eKy50dZRwgCD75dSTu5ktp
PQkXFLUWuxaF1zHUqoi96HaAshfz7vq09wqGNppTycfiphmjjIen5xyfoYrTKJCF
srtzRDZE6v0YThqGgMykopRlEu6PLw==
=Zsm0
-----END PGP SIGNATURE-----

--0CLOAGmPChQYeQM2--
