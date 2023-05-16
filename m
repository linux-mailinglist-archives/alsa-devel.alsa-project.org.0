Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD08705136
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 16:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA99B1CE;
	Tue, 16 May 2023 16:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA99B1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684248516;
	bh=rw01jFzWE+dBQpKmkiy9pElSCaXqj2ETacLAGV1l9oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cs86pgIhkczBHN3wJBg68inDy4Jmj+RkbGnvboN4y8xGSDRMd6SVw3jQ1GoMAVC1I
	 bxfBtr9Kr0cSnc76AziHM/IEpIU6J1eaBXZ+xzWsw2p9bomXb67wbmPDmmnxGwjFzh
	 RxGZTCHOV0b5fZLnevpTM6mfVfHDP+Zw+X4fEsGo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7735AF80272; Tue, 16 May 2023 16:47:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC5BBF8025A;
	Tue, 16 May 2023 16:47:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4F99F80272; Tue, 16 May 2023 16:47:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1174DF8016A
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 16:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1174DF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uHPkdJH2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 314F661B6C;
	Tue, 16 May 2023 14:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E40C433EF;
	Tue, 16 May 2023 14:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684248432;
	bh=rw01jFzWE+dBQpKmkiy9pElSCaXqj2ETacLAGV1l9oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uHPkdJH2fkM20Qy/X/CKY36SBlgoEEA7fx/nrNx4VWH9MW31yTTVmeHG4WUdwLBMs
	 8Ucb3uxPgVPgum5XQ9kXVLJiNdRBGIP55mGU92ptmegHd0hApTjuVEbTaGVE9bezHH
	 esNhPto0FyvH6GHzVgSDCmVQadPuWH+XRiVZ8VVwPNnc4qrMbkV5GQjAUUOkqkovX1
	 LPopTHzxVUs/X4S5hjM7N/C9uUswJmfS+YAGMXWDpZtO0hITsqxyO4Un1SVZjDSEg8
	 zu27hUNLHQjAyIOgopHqu6CElVMRjx+htCYnLxxbOK0UuF855y+du2H9xxWmaq8BCv
	 tutB19X1NTY6w==
Date: Tue, 16 May 2023 23:47:09 +0900
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	daniel.baluta@gmail.com
Subject: Re: [RESEND PATCH 0/2] Improve support for sof_ipc{3|4}_bytes_ext_put
Message-ID: <ZGOXbaq7jILy2a39@finisterre.sirena.org.uk>
References: <20230516132401.205563-1-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j9f+YHhPoyVZmHLb"
Content-Disposition: inline
In-Reply-To: <20230516132401.205563-1-daniel.baluta@oss.nxp.com>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: HQLUM5CIFH4T52AIOBOVYH2X3G65VWY6
X-Message-ID-Hash: HQLUM5CIFH4T52AIOBOVYH2X3G65VWY6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQLUM5CIFH4T52AIOBOVYH2X3G65VWY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--j9f+YHhPoyVZmHLb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 04:23:59PM +0300, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
>=20
> This patch series provides better handling of cases where sending
> a data blob to FW results in a validation error.

Please allow a reasonable time for review, we're only at -rc1.

--j9f+YHhPoyVZmHLb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRjl20ACgkQJNaLcl1U
h9D8aQf+I5WsLa82cUh8ITXa9tQK1ma83k9JpIwd68KZvIPSDmH/1RbVUGv87fHz
Q39FdEpGarPImVJBaOS+tUa1m+dlAKrR3fAqbMl54JrdZ25ikLksXcAoLU2x1//s
oTpSzE3iHBDI6/e0E44oM19x8Up57q2cbn6Dk7olzALVrwVHJRHZDW94Mb0qVffz
D2tflhza/w8FRLvv1xcibl+uGTNy8g4E11ZdAPIkqrS2W/DZwwRC3Ds4gMA2NOdX
Yy6EiddmmS8MRvHirk4q8VCRMGrIILaJZTguLEwNDukwZuP3uhsaHpXVMNsiPbJc
6gWEKLHYvnUPyqtLf0MBuVFcEhGagQ==
=R6fk
-----END PGP SIGNATURE-----

--j9f+YHhPoyVZmHLb--
