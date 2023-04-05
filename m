Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB316D79DE
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 12:38:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF757201;
	Wed,  5 Apr 2023 12:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF757201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680691091;
	bh=LOuR9TtB86T+Q9WWjShnNVuimPOb5yR1lT9uwWKEgWc=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r82zlgINVQb+Cn63Op3HesEiarqKhO1o1BBRRkMTaR6oBF0WWo1pt3+FuJoWABuYq
	 j7Jr+LhfZ5bkK5eiXjlswPs9GrkU1KDHz//AnCbcEZ6+4xxD9pv7bHLqlgkqJTXltF
	 IAIW7yo8CnwBtsJhGV/Ly/0pzut62zgVM53NUUrc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23881F80249;
	Wed,  5 Apr 2023 12:37:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6693F8024C; Wed,  5 Apr 2023 12:37:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18449F801C0
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 12:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18449F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=svFX32sT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1FF0F625CF;
	Wed,  5 Apr 2023 10:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C689FC433EF;
	Wed,  5 Apr 2023 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680691025;
	bh=LOuR9TtB86T+Q9WWjShnNVuimPOb5yR1lT9uwWKEgWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=svFX32sTjK0xr6iQy6gCHp8S6a6xL55COcW5tySWwoURqAMkjYehwbaPYjZTkcA+I
	 iWRK5tohCB67qhAj2DgLLpMJ2gRW1DH16LpTyDT1Ic1etDHLrjhXXhVqapTousW08m
	 lWiJl3RJelg//Sy0uyAPpIL6g/hEoN6Fdgij/8byOHIfbM1r2BJP6XeJgExpiB3VWP
	 VapAJwvgUglL1IVQkwuHtR5X/iFdVN98j9fMxwFtZc0xUK550bBWfztvR4t/7MoCaQ
	 SiNFRpFXg3A3rMVoLVYErh+rbv/GNEF5AdpM8fSLgnJX7IkfFM1qag1sQ7yKx2V48C
	 xFnxlhKTjxouQ==
Date: Wed, 5 Apr 2023 11:36:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] ASoC: SOF: pm: Tear down pipelines only if DSP was active
Message-ID: <895e14af-9de9-416f-8776-14598c351136@sirena.org.uk>
References: <20230405092655.19587-1-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C32NnwYngeq9oPHf"
Content-Disposition: inline
In-Reply-To: <20230405092655.19587-1-daniel.baluta@oss.nxp.com>
X-Cookie: 1 bulls, 3 cows.
Message-ID-Hash: ON2M22UF3QT2ZBN6P724PGMBOGEVFMEX
X-Message-ID-Hash: ON2M22UF3QT2ZBN6P724PGMBOGEVFMEX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 cujomalainey@chromium.org, tiwai@suse.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ON2M22UF3QT2ZBN6P724PGMBOGEVFMEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--C32NnwYngeq9oPHf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 12:26:55PM +0300, Daniel Baluta wrote:

> With PCI if the device was suspended it is brought back to full
> power and then suspended again.

> This doesn't happen when device is described via DT.

That's not a property of DT, it's a property of whatever integration is
being described by DT.

--C32NnwYngeq9oPHf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQtT0oACgkQJNaLcl1U
h9DIhgf/fx9LD2s9a00ng1ln3S1ybatL2hkNilg5ZkmbzAbWkjPVsKSLcD6B4n9R
JKEJTLxC9mLzy+vKzTRzKg5/pB2AozTCndd8KfhNZJRG3GijD7RxCZu/QexmE15U
QGlV8NWMz6gHWL51ZzpI+rDRX9++3hb+CbD2DlUV45bOQRUqcgGSQI2idaVQ12Cc
aLpnGZ0dGtIF0aXJXiqOdM1qfe4E3pOWVlyUUYUWJbVc99/gVFgBJ/VlyteTJlRs
kJEzliwFh2OPKxbgYt72TDkl997dY0kVcwaRpSpSbzfcNxCzXxLwJLoQ+tvfhbyo
rQpNKag6jdtBxTpbouUH7ALja+8/UA==
=NTeu
-----END PGP SIGNATURE-----

--C32NnwYngeq9oPHf--
