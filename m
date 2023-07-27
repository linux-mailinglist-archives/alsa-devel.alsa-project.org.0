Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D42765295
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 13:37:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5B9B83B;
	Thu, 27 Jul 2023 13:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5B9B83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690457844;
	bh=ivBrfnksuev81Xr0vG/orlS3M87dt7cmsHbn47jqyjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W4onemSF7BzFh0FUC4SZjjtM3YcMk1x5iR4Dm9lwjqvtSqVDFDZizRPu/m3KZOq9X
	 8qqyuIc1UpvGCqATUGUTIUlqisv0nkDapDQWIHbhI9KZvNtfqj6DsM3UzonnJvdgjp
	 VQvhun4nYlkbyCAAsZ3kLFETadn5qcajTEg1b7ek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 001DFF80544; Thu, 27 Jul 2023 13:36:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A654EF80163;
	Thu, 27 Jul 2023 13:36:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D16DCF8019B; Thu, 27 Jul 2023 13:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09126F800D2
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 13:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09126F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OMMqvdh9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33B0F61E2F;
	Thu, 27 Jul 2023 11:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D22C433C7;
	Thu, 27 Jul 2023 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690457780;
	bh=ivBrfnksuev81Xr0vG/orlS3M87dt7cmsHbn47jqyjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMMqvdh9u+wKoVfc+WgyxCN9r/p/0N5jVJqEex7ccZUBXlRWeIZMI94RRlbF+WOef
	 nGJY8EwrJDZL7VikRRPcFdBDbvaFcBw3KRhC/7uYrf2WjhWzxJm4Lid3dptY4Bpeva
	 JKgwm3ze7geXOnO/v0wILzdpxrfwulH7OLKwzJno4gbNW4XBq9IdAbvO92XYGqIS5Z
	 kY3xc0LxdpgQu4tcAd/0eM8vns0auZdMVjWdk35Vc8kv65jIcKXHOylrdxdXYZ05/5
	 bkr5Bkz9X04Aqr4khQDsiDhm9PCa4KJU7wX/eR2Q1D8C1aKqvAipU/Z1AfTqNmI0lU
	 TCbCkNK15NDpg==
Date: Thu, 27 Jul 2023 12:36:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: "Liao, Bard" <yung-chuan.liao@linux.intel.com>,
	"Lu, Brent" <brent.lu@intel.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Rojewski, Cezary" <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Zhi, Yong" <yong.zhi@intel.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	"Bhat, Uday M" <uday.m.bhat@intel.com>,
	Terry Cheong <htcheong@chromium.org>,
	"Chiang, Mac" <mac.chiang@intel.com>,
	"R, Dharageswari" <dharageswari.r@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 1/2] ASoC: Intel: maxim-common: get codec number from ACPI
Message-ID: <1b5c0524-bdd5-41e2-8799-b699525b7a56@sirena.org.uk>
References: <20230720092628.758834-1-brent.lu@intel.com>
 <20230720092628.758834-2-brent.lu@intel.com>
 <ff55e63f-1c17-12ef-57e6-144a5bea4480@linux.intel.com>
 <CY5PR11MB6257FF6D92D524D389B734C19701A@CY5PR11MB6257.namprd11.prod.outlook.com>
 <c1aadbcf-78ab-0566-84e5-8eaa7b418d50@linux.intel.com>
 <bbf9baf1-d55b-b846-740f-1ed8976b82b4@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0nZ4EJfE/aVtFY7z"
Content-Disposition: inline
In-Reply-To: <bbf9baf1-d55b-b846-740f-1ed8976b82b4@linux.intel.com>
X-Cookie: Go 'way!  You're bothering me!
Message-ID-Hash: QEHUMTTCAFJWA6II6ZGGEJDC34VF7GZF
X-Message-ID-Hash: QEHUMTTCAFJWA6II6ZGGEJDC34VF7GZF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QEHUMTTCAFJWA6II6ZGGEJDC34VF7GZF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--0nZ4EJfE/aVtFY7z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 07:41:53AM +0200, Pierre-Louis Bossart wrote:
> On 7/27/23 5:21 AM, Liao, Bard wrote:

> > The point is that if you remove them and they are still used somewhere,
> >=20
> > you will break the build. i.e. Kernel will not compile if we apply the
> >=20
> > first patch only.

> IOW git bisect is broken and that's a big no-no.

Yes, I build test every patch so I'll notice.

--0nZ4EJfE/aVtFY7z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTCVqEACgkQJNaLcl1U
h9C/hQf+LxkQQHutKl7/U3u1expUOoh4rffkGKzdDOF3cFMYvuZXpC1LQ31kZKCM
wpRU3R7I+4jSwfpl1ukj5FbIFpFUygT9+pBnSsLM5zulec3Jn5cHWd6Pj0oMrl5x
74qfSFzDLOqNIBvt53SugOqY/yP22ivlVQaKG+IkUKxTKibfwEUcbLEu5by99XgY
5FEtU3hKA2ujGY+pGo4W3LPcDHEl8/tliRx4+wKmNa4nsoZcUJWpFx2i1CJzXgkQ
AyCLagEE5q41Lk59zOqSlLUYDWTNsX6bzDi4P/pijZFFOuT4q7vpdoOMDjJk7Q2M
cFT5uzzwQWiq6yeCz3WR+3J01CQb6g==
=8BNm
-----END PGP SIGNATURE-----

--0nZ4EJfE/aVtFY7z--
