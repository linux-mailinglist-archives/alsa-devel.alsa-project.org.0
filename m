Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 645287B36CF
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 17:27:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B96BDDFA;
	Fri, 29 Sep 2023 17:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B96BDDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696001275;
	bh=lDhaMhZT4eROF80/UUA/0Uxbim5qKJVk0kbddzbxy5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RYry9GRjyjAPQd3Rfv7wzGPAguhDSZim9xlT+3/YAWz9Srex/TUDgf1HEE3tMUAQE
	 Mt8v/7/OvIU7M3ZKrUrrWsKBUmKqIHxmW30WVwsXh0fgo9lyxnpJMfpIgDNl/ashNO
	 EUAt7czVgwxWkQjPSREpcu91fTBKYHlhwENdS+qU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68F72F80579; Fri, 29 Sep 2023 17:26:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED6AAF8016A;
	Fri, 29 Sep 2023 17:26:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55F16F8047D; Fri, 29 Sep 2023 17:26:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 002A5F800AE;
	Fri, 29 Sep 2023 17:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 002A5F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EAVdYtcd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B6947CE243B;
	Fri, 29 Sep 2023 15:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919EBC433C8;
	Fri, 29 Sep 2023 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696001192;
	bh=lDhaMhZT4eROF80/UUA/0Uxbim5qKJVk0kbddzbxy5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EAVdYtcdU7LbMT5mB0H40Y++kEoixqMQmO92aqFWb5/089IhYoVt2GYxEYF3uh9vL
	 Q9eK8bRTs1e1NiTLWTG+ElyrswOnyjU9F5Ck2f4CnSli2X6fh4T9AFbxeahccx800M
	 bWIl9mPuhQYBX2ad5MhCLLVvucA4vuPs7AN4FaMpLPPA3bo+e4ehpCyYQAcC/mWfoj
	 MyKVBpZPwQBdFF1Wvien2+ycV6tzuwTNBRwyePjUVpD9s8RgjJt9suptarx0pKUGpn
	 93MaPdMngBav8czmpcmZGkV+pDB3TCxPkidVBf4wi8IbZC9B+s49qZuvSl3JI7cX3Y
	 JtCxKw3W4tHGA==
Date: Fri, 29 Sep 2023 17:26:30 +0200
From: Mark Brown <broonie@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v5 03/12] ASoC: SOF: Intel: hda: start splitting the probe
Message-ID: <ZRbspls+UDl1g9Kw@finisterre.sirena.org.uk>
References: <20230929145123.233838-1-maarten.lankhorst@linux.intel.com>
 <20230929145123.233838-4-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nNJvjSCekUlNJmUN"
Content-Disposition: inline
In-Reply-To: <20230929145123.233838-4-maarten.lankhorst@linux.intel.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: QM7GVWT6JYI5LRNY34SVNMOHUQMM4FCP
X-Message-ID-Hash: QM7GVWT6JYI5LRNY34SVNMOHUQMM4FCP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QM7GVWT6JYI5LRNY34SVNMOHUQMM4FCP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--nNJvjSCekUlNJmUN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 04:51:17PM +0200, Maarten Lankhorst wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> This patch moves the initial parts of the probe to the probe_early()
> callback, which provides a much faster decision on whether the SOF
> driver shall deal with a specific platform or yield to other Intel
> drivers.

Acked-by: Mark Brown <broonie@kernel.org>

--nNJvjSCekUlNJmUN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUW7KUACgkQJNaLcl1U
h9Auawf7BMxLdqOC4O+3unPmYXu0UREWcv1GvxY15x+dxyY7G/UbwROjXwNBbQon
eU5Na3quTlz4vosPRD+tl/0JWKxgs1DN0sE2YSCd+wSDD3D6fQ18RP+g5bnBllFr
4FVEZoKmvnC//vVsGVU1odH3iD66vmLVT7RiMkthuAyH0cZ8QGMEk3LVjV4EffCo
G5aAZ0DwOjQ0V3GOMBOE0JIu4kHR4rsYdqiTiUV7S67kYcuWocpq0XaXOQBTcz5v
6kqZlEbmYr+FAw//sd527ZEee1OrkaiATXfmk1QMwAiKolqim9MkVUuipcOwL0Zr
xr52aSvKJ3JWyqVG+9R2yvI4tzzUtQ==
=0WSI
-----END PGP SIGNATURE-----

--nNJvjSCekUlNJmUN--
