Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4204EC300
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 14:08:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 845161ACE;
	Wed, 30 Mar 2022 14:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 845161ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648642085;
	bh=mGIdFN2hBOqp+cqvzAkpx41arTM1NYj9iwoDe56VnbU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F+3KNVJVD1xLkM0vbZ2AUz6zvODalQIVkHpdBiGCZ+J+vJVhmI7xo4omg2lH9LZxO
	 4Tw7DbDpwFApkpuvpAfirrVmLOiuVnE0n4Y20miSp1EDTSZQd/0OK/zGG2zZYmKqdy
	 h/jzLzZKdYH4BZZiZ6XqQ8Edezy6l9pTAKY7CDnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA8CFF80253;
	Wed, 30 Mar 2022 14:00:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0230F80519; Wed, 30 Mar 2022 14:00:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DDE9F80425
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 14:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DDE9F80425
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m2ETwEIV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3EB77615E7;
 Wed, 30 Mar 2022 12:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53970C340F2;
 Wed, 30 Mar 2022 12:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648641652;
 bh=mGIdFN2hBOqp+cqvzAkpx41arTM1NYj9iwoDe56VnbU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m2ETwEIV+o9p39koZgMWirI+rgblDUpfDI6vNBx/vYoss+7XlcOBAST/AK7yM4438
 HqVJ9FluaNHAJe4IGJ7MBYVq1qIHV9sTDtZ0JzVBBdgQEYeBFgs9+xWZMsyEmtrJt7
 ZEy8NPJsAKr+yDujMUrLDsB/rJ8CKtdcNre/6ujebWCknjQj5xFcJNoo1N5TNRbd5h
 vGcCG/K1rsJzQfqrRJtddx3NvFmvEFCBl+GmKQ463FBOSWmAzkVlE1G5AZr9WlQIOA
 jWfSrQCanvt4au0srg8O+70kqT1kR+dyIN5Gb6j3Ca5sfV94zCtF9MAk8eHcBGUNhI
 miNqrxE9x8RtQ==
Date: Wed, 30 Mar 2022 13:00:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.17 58/66] ASoC: Intel: Revert "ASoC: Intel:
 sof_es8336: add quirk for Huawei D15 2021"
Message-ID: <YkRGb9uDhWV9GQfn@sirena.org.uk>
References: <20220330114646.1669334-1-sashal@kernel.org>
 <20220330114646.1669334-58-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="utOV3yk5eFjiGqrz"
Content-Disposition: inline
In-Reply-To: <20220330114646.1669334-58-sashal@kernel.org>
X-Cookie: Two is company, three is an orgy.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--utOV3yk5eFjiGqrz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2022 at 07:46:37AM -0400, Sasha Levin wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> [ Upstream commit 1b5283483a782f6560999d8d5965b1874d104812 ]
>=20
> This reverts commit ce6a70bfce21bb4edb7c0f29ecfb0522fa34ab71.
>=20
> The next patch will add run-time detection of the required SSP and
> this hard-coded quirk is not needed.

This is reverting a commit which was bacported earlier in this series?

--utOV3yk5eFjiGqrz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJERm4ACgkQJNaLcl1U
h9AI5gf/XYRZRk5VaiBgcNnLN3y2HWSpoxCbcV8Z5WTeqckhdWB5gRYS90qlr+Vs
6l9fFJF96dq2CfbEneiOv+q1v4J0qI1wt9evoLODgebiq/JrFb+bf5jySjMuqk7Q
ffhx+AtSB0ZHFHVStm2NCiLXVfU4lY5o/ZAjKPPHbuD8bTncqz9Rxas10dUp2WzC
kB6xIrs6ZQeI77nevWv0TyBzbPlh3tAcg11TH+OraCOl70AqrdyAKXl7krqLd5A7
vV5IoU86gM5wK+Z0eOwvqqwzABwogd56dJ7Jv4yDVjcaX1/g4TdpLU52CKHzzsYu
YclGwQS+jGSdFPlfEvUvL/yNIWbYpg==
=wWkO
-----END PGP SIGNATURE-----

--utOV3yk5eFjiGqrz--
