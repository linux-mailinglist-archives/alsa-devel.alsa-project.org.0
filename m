Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FCE86194A
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 18:21:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26880820;
	Fri, 23 Feb 2024 18:20:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26880820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708708862;
	bh=T3y3bvy64o+ZYZ7fO4C4nj0LTrwniTjzjpka6LToHr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t9X7Hw+HTx9yhl2HpWKNXGpu1ByTHuLLM6GT/nO7RDpTEWGAF4gqqgwSd9AOmP/df
	 uwzJ9Nw6nMn94Z8JSt13N/7zhylGDv0QsGGyCGao4bpXgkp4u1cYjOuM5YrjLUjCCd
	 9fo3vIPMGoptBtmUFbPykQN9daIRzcwEmrJzi/Ho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5878FF800ED; Fri, 23 Feb 2024 18:20:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6649BF80571;
	Fri, 23 Feb 2024 18:20:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 635CBF80496; Fri, 23 Feb 2024 18:20:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCCDFF800ED
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 18:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCCDFF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j2wHc/gq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2320DCE2CD0;
	Fri, 23 Feb 2024 17:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00988C433C7;
	Fri, 23 Feb 2024 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708708812;
	bh=T3y3bvy64o+ZYZ7fO4C4nj0LTrwniTjzjpka6LToHr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2wHc/gqwUx4LU7n5jV4YJGxdYvcIIlVOlZgIu0Gv7+6tjiPvHaqsXIvFAFgkCVVb
	 Yyb/b9rxiY/iKEy++S21TC79mUB1hinHwv7463qyAbYlphTWnY9FePw+xQS3z9HZgC
	 erlaHvgN7pC3nKiH8w6yEFYasWS47UJ8hYOmqdr5BlLO0kTbLE/K5vUImKcC9QQAyF
	 dSGCaDa/euhWKFmSmaTcRwFYjVAXcdVBwehQ2m/EWxnbtNfoOXlZoYWenZafd4aCpZ
	 fWdtzy/CyFgRqvvRJrHmHa+TW4J3dJlbBQZaZyAsHk3JiwPTe5lD4lCKqk3+sgzLSo
	 EoJk8CpQwCBKw==
Date: Fri, 23 Feb 2024 17:20:09 +0000
From: Mark Brown <broonie@kernel.org>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"13916275206@139.com" <13916275206@139.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"bard.liao@intel.com" <bard.liao@intel.com>,
	"mengdong.lin@intel.com" <mengdong.lin@intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"Xu, Baojun" <baojun.xu@ti.com>, "Lu, Kevin" <kevin-lu@ti.com>,
	"tiwai@suse.de" <tiwai@suse.de>, "soyer@irl.hu" <soyer@irl.hu>
Subject: Re: [EXTERNAL] Re: [PATCH v9] ASoc: tas2783: Add tas2783 codec driver
Message-ID: <ZdjTyccCDoD9QYpi@finisterre.sirena.org.uk>
References: <20240222074000.659-1-shenghao-ding@ti.com>
 <10f53a13-a0ff-40f9-b089-f5baacdb76b6@linux.intel.com>
 <5c7127256bf54fcd921fc1ec83f3e527@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JSSHE0FUht8S9Os8"
Content-Disposition: inline
In-Reply-To: <5c7127256bf54fcd921fc1ec83f3e527@ti.com>
X-Cookie: You might have mail.
Message-ID-Hash: QZOY3TV2ZTEGBAEDUOU5IF4D4LAKQSUK
X-Message-ID-Hash: QZOY3TV2ZTEGBAEDUOU5IF4D4LAKQSUK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZOY3TV2ZTEGBAEDUOU5IF4D4LAKQSUK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--JSSHE0FUht8S9Os8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 10:12:49AM +0000, Ding, Shenghao wrote:
> Hi Pierre-Louis
>=20
> > In the SoundWire spec, the unique_id is *LINK SPECIFIC*, and only used =
at
> > the bus level within the context of a link to help avoid enumeration
> > conflicts

> > If you are using the unique_id as a SYSTEM-UNIQUE value to lookup EFI
> > data, this is a TI-specific requirement that needs to be documented.
> > That also means you need to double-check for errors so make sure there
> > are no board configurations where the same unique_id is used in multiple
> > links, or by devices other than tas2783.

> This code only covers the tas2783s sitting in the same bus link. As to ca=
ses of the
> different SWD links, customer will be required to have the secondary deve=
lopment
> on current code. I'm sure my customers have much knowledge to handle this.

As Pierre says I think we really should have some sort of defensive
programming here, even if you're going to leave multi-link systems to
future work people will still have older versions in distributions or
whtaever.  While I'm not sure the consequences of getting things wrong
are likely to be that bad (I'm expecting bad quality audio) it's also
going to be kind of hard to figure out if we just silently pick the
wrong calibration, especially if it's actually a valid calibration for
another device in the system.  Other vendors (eg, Cirrus) seem to have
figured out a scheme here?

--JSSHE0FUht8S9Os8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXY08gACgkQJNaLcl1U
h9CDTAf/bo/BBm0FaalBPQlGYIf6F1SuRLsnvDOwApCG85Z6wSol1qV1EdXwsRHM
4ijYqyHPymwdgpesQnl3LhgpuZ2m/eMk8xXOqOtjC/yCLN0f59uCAmw7XglxhQsP
WmS/0JEZ3Xv2+JcddbErmCdrWi+uJQkiJuhUYkxpx9p0gao5pYarIOoNyHC9vCFF
K+Cxv/YKjuQqakXNVGTfvC7ywD7iX3tT2UVtlAFm8VnFr9W44jkggE9MzyJPP9xb
yvqkqyrcKIEUCGSdMJLxXFTiT1N3cfWPN2/kjJ933DZMEHp2L1ytio4p1lionLE7
+KMiDfhfNZabb3w0gy+dU7MI71OnbA==
=aP7c
-----END PGP SIGNATURE-----

--JSSHE0FUht8S9Os8--
