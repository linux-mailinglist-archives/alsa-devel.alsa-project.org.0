Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BA690390A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 12:37:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E51811549;
	Tue, 11 Jun 2024 12:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E51811549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718102272;
	bh=nds2TJge5Z4TpoZDLAtUnD28Qvbmk5QsBVyZINMe6lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BQmC6WgSduyv74esfofzHGc6DXk/MZ/OTpOS42iHB6KzzDz/wHcgnU9bvIvTKldn8
	 Cfxj2agRm+B4XzsZbbDNWlDNI4N18KXagQ0nKisxbEyBgt6CZsIcE+b0zQ69H+VIwJ
	 Wf8AD6tqI4hUriT2xfQNmkv7tlJayG55U4TCjw0M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D5AFF805C1; Tue, 11 Jun 2024 12:37:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22F9CF805B4;
	Tue, 11 Jun 2024 12:37:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACA9BF80589; Tue, 11 Jun 2024 12:37:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CF6DF8057A
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 12:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CF6DF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Bf4D/jow
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A0222CE1379;
	Tue, 11 Jun 2024 10:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E442C2BD10;
	Tue, 11 Jun 2024 10:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718102238;
	bh=nds2TJge5Z4TpoZDLAtUnD28Qvbmk5QsBVyZINMe6lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bf4D/jow1a8Ng/Hil+lAqb0dut/RYwZPvQ3FPZbbkJ7aCG3CveDoJ8iAXzFOI8uEE
	 9yDRNNq0FPsUcFhikkmpU/E5w5feE7DXdPkDNYG9myT/DRd/Z6y6hSguT5PToyK+P4
	 YsIIdY5FwPBIolZReklyVMjMCN/HQe/fKvVJxqsGGDNknEFWJJjyxvCBI+N+Hz4b6L
	 ejwQ53ezYu29at7MPLf3bzifn7TzIPlM2VP2jVzLwlOwrQJjfdnhIyJ+1XBCzpDGqb
	 Yo4pdYTi13dJlDfvejmLRB2pxjXOTtTR2aWrT0nfBqElFPYYSgETvleS1E7ztkPUUV
	 wvZ1spKxyGKaA==
Date: Tue, 11 Jun 2024 11:37:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [Patch v2 2/2] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT
 binding
Message-ID: <Zmgo239qK_hi5Z8B@finisterre.sirena.org.uk>
References: <[PATCH]ASoC:fsl:Addi2sandpcmdriversforLPC32xxCPUs>
 <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pmKDFPdi4BGueWVw"
Content-Disposition: inline
In-Reply-To: <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: EI4ZO7MLZDTAH3DME4SHHKMHKRJ4Y6CI
X-Message-ID-Hash: EI4ZO7MLZDTAH3DME4SHHKMHKRJ4Y6CI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EI4ZO7MLZDTAH3DME4SHHKMHKRJ4Y6CI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pmKDFPdi4BGueWVw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2024 at 11:47:52AM +0200, Piotr Wojtaszczyk wrote:

> Changes for v2:
> - Added maintainers field
> - Dropped clock-names
> - Dropped unused unneded interrupts field


> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

Some of the dropping of clock-names was missed.

--pmKDFPdi4BGueWVw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZoKNoACgkQJNaLcl1U
h9Bg/wf9FyJJF7rPVkdR+i37hUYzzoNUoE7vaCl2WvvG5hjhTL5MdU6XdKMBsAM1
pN4nQeJ7X+zozGaPqwucwfbyg0MN+0LVOvhugSIVGSCY2hDKEDlQoGaPvj5wZVOo
4baY5NtBKZX6UfdsEp/JhNf9sA7thdZKXKAqt0v78ncgpyF+0Xlbu5key3Z47c4W
fPQGPexS6kgG7+x3DPn6b3SKVBdeRDOajyFXzabE0Kg/0zEIo9ns5ycI4/lzby0A
IF+GEw4DfF8RyPnPrGjsxl2F3GS4+qJHRAwk5zFbIEPC9WILwwJ8TgkfxqmlU7bb
E1TX4jDGVqFB09TRVdAjbycxlkBL0A==
=UIHv
-----END PGP SIGNATURE-----

--pmKDFPdi4BGueWVw--
