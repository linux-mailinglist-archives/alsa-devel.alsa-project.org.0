Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A747A172B7
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 19:40:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03FAE60226;
	Mon, 20 Jan 2025 19:40:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03FAE60226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737398447;
	bh=+MudjSmF7fW+w06pV5PazmgiC6VurOyNw9MTfBu0/cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WryfMoM0Y0kIfTZ2m4GjGkGQLpQZaiVJCYNk2eAOah5uTJjzpQ6W8IvmsLuXwdzML
	 w/g0rxYfMyyFrMBI4GOy/l7XkeLuFE+Zf0BWgyUMIrqd75RAn/DdEoR8L3qJ/DgVzb
	 lDX1ITl81HAsxAOFsYwVab+nZrNGMaTDFI+C458Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DCD6F805B6; Mon, 20 Jan 2025 19:40:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1614F805AD;
	Mon, 20 Jan 2025 19:40:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3471F80482; Mon, 20 Jan 2025 19:40:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 604EBF8007E
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 19:39:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 604EBF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rCR+YyLS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E92DC5C5B7C;
	Mon, 20 Jan 2025 18:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C52C4CEDD;
	Mon, 20 Jan 2025 18:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737398393;
	bh=+MudjSmF7fW+w06pV5PazmgiC6VurOyNw9MTfBu0/cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rCR+YyLSUSKqx1PIuBuTlcB3h09CHQ8rJ0C1n8wa+P9W0t72D3L6+J7jgPTPLTFzp
	 fRXUiJ1YoNCrkKpRlvaMqBvXOD1bYdieJdZoGUxDoYhOxZ9lLXsUT9ctknSOkwePZL
	 VpniPz+LTMFtavvpxy9bAmPKI0syASZzx4t7IXfRZoGjx/qswg1ieTN7CAHgvg06Iz
	 5FaC2N+5UBSzQqj5EyZMkTg/EoPu1ZlsAHlvLFPri3QzTCFf4JgtV4Q7Ui0SxcYLUH
	 mKIgHb7TRHW5sS+rbkk9apVqRwUQKmQqTCxTZbWWPWoyYE+SbS7kwv6nxjGQbhkmBC
	 ygBM46yiZlpjg==
Date: Mon, 20 Jan 2025 18:39:48 +0000
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 12/23] ASoC: amd: acp70: add acp ip interrupt handler
Message-ID: <208098f6-1022-437e-9ae2-964e9bc89942@sirena.org.uk>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <20250120100130.3710412-13-Vijendar.Mukunda@amd.com>
 <4d6cf5b7-8f47-4cb8-b302-c02f3b037d6d@sirena.org.uk>
 <08942c1b-3933-4ddd-b730-44d436a81e94@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="66qPjD8/FQ1KJfYC"
Content-Disposition: inline
In-Reply-To: <08942c1b-3933-4ddd-b730-44d436a81e94@amd.com>
X-Cookie: No lifeguard on duty.
Message-ID-Hash: CGLW5AAN6MLXL7E5G7NJO7WDN4GLPTY3
X-Message-ID-Hash: CGLW5AAN6MLXL7E5G7NJO7WDN4GLPTY3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CGLW5AAN6MLXL7E5G7NJO7WDN4GLPTY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--66qPjD8/FQ1KJfYC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2025 at 11:48:00PM +0530, Mukunda,Vijendar wrote:
> On 20/01/25 23:25, Mark Brown wrote:

> >> +static irqreturn_t acp70_irq_handler(int irq, void *dev_id)
> >> +{

> > This really does seem *very* similar to the acp63 code...

> Compared to PS, in ACP70 wake interrupt logic added.
> New register fields got introduced inACP70 compared to PS.
> Please refer below patch.
> https://lore.kernel.org/lkml/20250120100130.3710412-18-Vijendar.Mukunda@amd.com/
> Let this patch series go as initial version for ACP70 platform.
> We will revisit the code and implement common helper functions in the next cycle.

That does feel like quirks and new features rather than a completely
distinct IP.

--66qPjD8/FQ1KJfYC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeOmHMACgkQJNaLcl1U
h9DMUAf/Xh1HKTAdPM+MavYeHWvsGnoD8fqMZ7XKQq56riuHNPZKEFzM1EunMlhg
B12EM9ki0gfT53xEC/3o0aDGs3CNcfIvxtiaEqBjyc1Px9PfKe8NdC47TMneo2us
Ig8XqPInr+Zvpb6Hv8Pq7QxvmgVD7ygC3CgLCgXdsVqxwUsTp82tFAVdjbpkEB2P
2rJ2+9ZTOi7rw5uKhuqoAo/zBFCcMwpR/lGE6HHPSZEaTC/Eo0TbsadUqesk279t
aZzreBA1zO/PhAKRgp6Jq42FU+Hlv6pM5oQ0Fme2wkcEz93tiawZ1DxVbz6tZQi2
uml9vJL3xUamrpQnz301crEBrHbMlg==
=WilK
-----END PGP SIGNATURE-----

--66qPjD8/FQ1KJfYC--
