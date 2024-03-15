Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6514787CE8B
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 15:11:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 660B6208;
	Fri, 15 Mar 2024 15:11:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 660B6208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710511891;
	bh=cSKcgQGBh20ZPUHLj2EAJ/ss1NKMNE4QqnTTiZmJLD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nBv7Gjh1jLq1rwPH8qk/98d2A3NYh/uN549gBCUDfxeetveJNxdqLHs+UBeZTrOMK
	 4dkXl71sAwF9OquvsFn40xFrL6CyjFdq8uekbo/sZetLa6/udesymxTN4gcey+UhAh
	 9h8+dk16CSoPYKQnnnFhF+NdCrjlWTzEV+sHhal4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E88E1F8025F; Fri, 15 Mar 2024 15:11:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 997EFF8057D;
	Fri, 15 Mar 2024 15:11:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C57FEF8028D; Fri, 15 Mar 2024 15:11:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B0F4F800E4
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 15:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B0F4F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QO1jshuj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D6636CE20AF;
	Fri, 15 Mar 2024 14:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371BBC433C7;
	Fri, 15 Mar 2024 14:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710511861;
	bh=cSKcgQGBh20ZPUHLj2EAJ/ss1NKMNE4QqnTTiZmJLD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QO1jshujASEKiNLMcI1DJqNOpH9QtkNvUXpUB6LNoScSsxelepVChKq5FWXIWPX6P
	 LV+Sj0EoQ7+rMkX1y2E7JT3yb4nSx4/mQy+ao+lsqdLa/qsRojTeBi3ZBDNY1hhetz
	 mjV1caKitMry2KtiI/239jAZsNMRNjGiNJFffZRUpmyYJzI17eq1UphCKS5n5uUq8G
	 RO4shcxApHQ3zZc7CV5cKbUPiBTAHZMlT4fAnoJoRv2hhFo7I5gxDU0HbjMghzCeyZ
	 F28MQsmgk/C4VUPZR1MY+H1x8cFdK/Fk7Y3RNMvQuJhxxfppL1m83O0CKiVDrKJu6D
	 jzwWHCyT1ib9A==
Date: Fri, 15 Mar 2024 14:10:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com, christophercordahi@nanometrics.ca
Subject: Re: [PATCH 10/13] ASoC: ti: davinci-i2s: Make free-running mode
 optional
Message-ID: <b8645e61-2a3c-4aaa-ba3a-7c492ae7c6ed@sirena.org.uk>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-11-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ogBFfzYzRWRHlUNe"
Content-Disposition: inline
In-Reply-To: <20240315112745.63230-11-bastien.curutchet@bootlin.com>
X-Cookie: A well-known friend is a treasure.
Message-ID-Hash: LU6SKYK4AP2I6L3YS7HMANWKL7AFCD7Y
X-Message-ID-Hash: LU6SKYK4AP2I6L3YS7HMANWKL7AFCD7Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LU6SKYK4AP2I6L3YS7HMANWKL7AFCD7Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ogBFfzYzRWRHlUNe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 12:27:42PM +0100, Bastien Curutchet wrote:
> McBSP has free-running mode where serial clocks continue to run during
> emulation halts. This mode is always enabled by the driver.
>=20
> Disable this free-running mode according to the 'ti,disable-free-run'
> device-tree property.

This sounds like SND_SOC_DAIFMT_CONT rather than a DT property.

--ogBFfzYzRWRHlUNe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0Vu4ACgkQJNaLcl1U
h9BndAf+NWs8zav3YqeFZOANYiZ3y1vsX4faHjK5ItpsqFTAzG6Q8iv7WPoO4Kkp
Zmp7XSyCA7Q8F5KL/uaLt3jJ00JJnsRd4RO+efjMpt6c1EIQFxnQ+8DC4YAAZXo/
E6/aI+2uJeGWo6sdhvtgoXI9LKP+MMhRpaeQwEa1vS3PD2wisZHx4aIMvZExRGX3
6/i7hzU6kAykhVIA1wsMJGXW6rgtro1R2oIg9Ut5/ps+JaDdDOTWAf6HLqRemHAg
YISt4xrmlRMcG38TdC5/WHGwh19mFfu8AdyXQa6AZwNuX2wC43so5Np9/vdwpqqd
bG1nVwSPOtq79c5j1Hjk6aOuChRW+A==
=02bW
-----END PGP SIGNATURE-----

--ogBFfzYzRWRHlUNe--
