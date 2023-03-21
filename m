Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 618EE6C32BC
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 14:23:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45C6C1EF;
	Tue, 21 Mar 2023 14:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45C6C1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679404991;
	bh=6nQmTXWR0S5yZAO/vh9jjHZ8e6HnzfqVY7IbBOcHD98=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c78oKysSORYfaklM6NM5YIWpnXRjvh1bfKM5lQp/ICqbgxuaN6oJ6CfxyQiJqmG4n
	 0+2CX7qvaha9JTMqyO4weRpxzcFTS62BvOVDWyaRZ66reS/yiFsHZvvYntyTk0+KJT
	 agL2HkKLhkK3xfUrwWqHC8gyUT3GDp2bFZ7odJZA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6E0FF80254;
	Tue, 21 Mar 2023 14:22:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DDC0F8027B; Tue, 21 Mar 2023 14:22:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00867F800C9
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 14:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00867F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IogLwT03
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC6BA61BBB;
	Tue, 21 Mar 2023 13:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9C3C433EF;
	Tue, 21 Mar 2023 13:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679404931;
	bh=6nQmTXWR0S5yZAO/vh9jjHZ8e6HnzfqVY7IbBOcHD98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IogLwT033y5KY0sEFYrePVyrpD/N7OIvRDlrC1p1hfhU5OympYUhOIxEjPufXraKm
	 4uaW4oOp+iHIM/DapN1B5HEmFbzIFjmFMdD29Q0B0gX1BaaVqtvAG8dE7qARlNLMo9
	 XNG4c84zR+JBic2jq8DtdWDyTVuoetX0c35821RLP4UhBE8sF7vmmREfkdk6Y4qbIZ
	 QEB/VY96BlWHnz4SbUdk97TZ6IoV0GSw44yxItISmOGId/Hitq9Eym29EnJFoS5O8S
	 Kb5j44ouix6KCCasa5HvkvSvY9opaFER5fcr1qC9KFnqbnuA5YlcGLSSVU9tKuYJFK
	 +SyIPYTHna8tw==
Date: Tue, 21 Mar 2023 13:22:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <13916275206@139.com>
Subject: Re: [PATCH v5] ASoC: tas2781: Add tas2781 driver
Message-ID: <e9134abb-5caa-45aa-b623-e1ceb40223d1@sirena.org.uk>
References: <20230321113130.25853-1-13916275206@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0KwVVK9qwawOe9aF"
Content-Disposition: inline
In-Reply-To: <20230321113130.25853-1-13916275206@139.com>
X-Cookie: Will it improve my CASH FLOW?
Message-ID-Hash: 33XGU22GTJ2JLJOA65CRL2Y2LPTLAQB5
X-Message-ID-Hash: 33XGU22GTJ2JLJOA65CRL2Y2LPTLAQB5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com, navada@ti.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33XGU22GTJ2JLJOA65CRL2Y2LPTLAQB5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--0KwVVK9qwawOe9aF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 07:31:30PM +0800, Shenghao Ding wrote:
> Create tas2781 driver.
>=20
> Signed-off-by: Shenghao Ding <13916275206@139.com>

Not looked at the code properly yet but as previously noted you are
adding a new DT binding so you need to send a patch documenting that
binding along with the driver.

--0KwVVK9qwawOe9aF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQZr3wACgkQJNaLcl1U
h9A6Cgf/dONTG2ih8NwPlAV46YcR7SHyEM6ke3V0bNPQrib8DgEyj9w86A4dskHF
2EpQaQOVpGTgjS6pYH2srs2i30iV7yYLb+a1rSCt/QzBzJL0bolEskKXCHCqk/+L
+yMBi/zXMpIZtXaBZ9LWFt+7s07/CaaBtrxam4yMs8gM/YACW6RRZXIjCXX90Rc5
zkXIkHHxN01RZlcXf8sWqpeB8hn71MdWr0bKzlBCk8/xs7ygKffLmB9PyYASoepZ
S1E6uxk83SBXDaf5xFEwxD3cHucGrretW8yvy06vdYfrvTEKsac6afts/TWDtHmJ
VFRyjEqZHbMQZgBaQaaLm3nIdsGVKw==
=30hx
-----END PGP SIGNATURE-----

--0KwVVK9qwawOe9aF--
