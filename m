Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5F384580C
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 13:48:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65403857;
	Thu,  1 Feb 2024 13:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65403857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706791705;
	bh=pfyIXZDpe+PzOEhUCcex34QzQ9m9/xSM8przvGPqCHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FT/vm5F9Uhvh/Vcjt4cSTiQCuubP3wsEZbDx9oxwLcjHQwGh2B8947aNtmMAle3sx
	 MlqZtyxErcHHxA88GPiYYkDNQIrexxBoeVGI1ULuJDlU6b3xv3iH+iJvnzhOZTID0n
	 LUYigTMPgBoOfARJmHlIWI6WffYk+susaooxtSjo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63FBBF8057B; Thu,  1 Feb 2024 13:47:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B07FDF805A8;
	Thu,  1 Feb 2024 13:47:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45A8FF8055C; Thu,  1 Feb 2024 13:47:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61CA5F804E7
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 13:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61CA5F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HvgWe6TE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6EF13CE0E74;
	Thu,  1 Feb 2024 12:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412DEC433C7;
	Thu,  1 Feb 2024 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706791662;
	bh=pfyIXZDpe+PzOEhUCcex34QzQ9m9/xSM8przvGPqCHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HvgWe6TExi/6E6ARbS60l912CKcDcS5/FM0uAqpU5v5dJJ1YcgsVuqpbYqPUbj14T
	 WNFhoJ4Q0+7T2UOfhbjO7Q0vBEa5I8GYjVbGRNJTzSykdBJrypLfT7B6k1Pc356JaM
	 MhpYujp+yAp+4CFMYL90ckHHgL4LX31XCLEgnuM0m/90xqlj+yPs/M66zCjPqruzCi
	 L/DjeAIK8G+F5cI4+WYB6nS/+TvZw/16C/DbaAQjGaWSs2AObwHy1kWrOwaUz/Oo6A
	 j5magtUyaKUzXkdEqc2Kzgw7Z2in7FKJZTn7kWhgV+7ZAGoM6VGAE5+W0cdtWC9OCV
	 CDGTjgRsOjuPA==
Date: Thu, 1 Feb 2024 12:47:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 00/18] ALSA: Various fixes for Cirrus Logic CS35L56
 support
Message-ID: <1cc8d9c7-2af5-43f1-a022-75624deae51f@sirena.org.uk>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CDtLnkViadJro5Nz"
Content-Disposition: inline
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
X-Cookie: You can't cheat the phone company.
Message-ID-Hash: EIQV4VUAZX64TTOQ75UZ4XYAND6WZX6R
X-Message-ID-Hash: EIQV4VUAZX64TTOQ75UZ4XYAND6WZX6R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EIQV4VUAZX64TTOQ75UZ4XYAND6WZX6R/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--CDtLnkViadJro5Nz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 04:27:19PM +0000, Richard Fitzgerald wrote:
> This chain of patches fixes various things that were undocumented, unknown
> or uncertain when the original driver code was written. And also a few
> things that were just bugs.
>=20
> The HDA patches have dependencies on the ASoC patches, except for the fin=
al
> patch that removes a bogus test stub function.

Takashi, should I apply the ALSA bits of this via ASoC?

--CDtLnkViadJro5Nz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmW7kukACgkQJNaLcl1U
h9AAwgf8CybxhlcP0vma6wF2MMGIG14ggLVyQOf/7GCmv2SetczhzQxcsJg2O1Oh
X//clpmlLPFK9WZzjZwoJ7vsdsbROiILlNblqzMQO4llCCi4CwaXx2xUyhiIcrTA
UWakVULs7ip7fUiLtTP0ztYDbQji8ly5BIacROzLGoWo7KQrVulLhlf34IU+VI0H
Q3YDZH2KN39ls/UHIDbsh1vRCnNvg3OCziGN063D2CTBFc3fpTCyUAhG/ODyg1Y1
aPSyAy/jTMsGmrRpRTtI8zoM1srKATSA8oNcyhelfZXvA0zZ2zja8GM0ZBiGdye1
EISkvnFnf9gB/+WJPejgAncCL07xcA==
=jCSO
-----END PGP SIGNATURE-----

--CDtLnkViadJro5Nz--
