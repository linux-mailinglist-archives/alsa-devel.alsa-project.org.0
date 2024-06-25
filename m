Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA6691664F
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 13:36:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BA9C83E;
	Tue, 25 Jun 2024 13:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BA9C83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719315397;
	bh=Lzvh54ejNRs/3U2uQ4TihMOCOJFouHZ3Yy6+wW8a1+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l5EXf1x9WUmzYcM4hBDlQUCJz3ahcMTK9E6xNxM4Dle6oLiK00ZaL0yezDd7FZNiV
	 mKdIKaeoddlXEHX4ubzMkRBeOsYA1WQv87HLkfPZy72VbFxkcNmkKfbW31lANWOtg4
	 vgGYALpU+sQBJCu4imutrr+j9My96h9fD0pdj0Q8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED8FDF805BE; Tue, 25 Jun 2024 13:36:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 429EBF805B1;
	Tue, 25 Jun 2024 13:36:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C49FCF80495; Tue, 25 Jun 2024 13:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A5C7F80154
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 13:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A5C7F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K4DGKifH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7BB6FCE1A30;
	Tue, 25 Jun 2024 11:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590F0C32781;
	Tue, 25 Jun 2024 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719315352;
	bh=Lzvh54ejNRs/3U2uQ4TihMOCOJFouHZ3Yy6+wW8a1+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4DGKifHjmUqaryRGF3YWRZ7uXDYKMy2xtjNkaZBs1dL+FpCAEHKh1yHkRz0fXoYp
	 C4ijUx0HFXChL3ncGC3VqyB+ctUb8zLjG0aOuz8SI6JTZq3w1yBlXRuvub3P4w5Znw
	 V7We/BViOZAbBhPzkhFXSlCn406wy2rbdSAMoa3k8iNJtrCvNoEeJroaLmpiyGheky
	 VRkAheC3MvivheLEH6YfQjSSUi83TPT1jCJ5zOIy+O1c77OiVog5nk7YmFO0LchcmA
	 LxWRkx+9M2d3MOsSD9PoKuvEQUm4Mpxpn7xMlaBybT3NYByuX1yzPEpKV4+ZEbi152
	 J0t6Nh6l/CLyg==
Date: Tue, 25 Jun 2024 12:35:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com
Subject: Re: [PATCH 2/4] ASoC: codecs: ES8326: codec can't enter suspend issue
Message-ID: <f652e057-efee-4a32-9b12-62a360d6db42@sirena.org.uk>
References: <20240625081256.2941-1-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rMDQFe1vt6eV+lKJ"
Content-Disposition: inline
In-Reply-To: <20240625081256.2941-1-zhangyi@everest-semi.com>
X-Cookie: Results vary by individual.
Message-ID-Hash: ZL7PXQSN2KKM56XP6FKFLLNEBFIPFNJL
X-Message-ID-Hash: ZL7PXQSN2KKM56XP6FKFLLNEBFIPFNJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZL7PXQSN2KKM56XP6FKFLLNEBFIPFNJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--rMDQFe1vt6eV+lKJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 04:12:56PM +0800, Zhang Yi wrote:

> > Should mark the widgets with snd_soc_dapm_ignore_suspend() to allow the=
 device to suspend with the widgets enabled.

> Thanks for your advice. But unfortunately codec didn't enter suspend afte=
r marking=20
> the widgets with snd_soc_dapm_ignore_suspend(). We will modify the trigge=
r conditions=20
> for enable_micbias and disable_micbias to solve this issue

Really?  We should fix that - that's the use case for this feature.
What goes wrong?

--rMDQFe1vt6eV+lKJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ6q5MACgkQJNaLcl1U
h9CYWgf/Uxu0imcpQ02UIRxQbfHpjMDrJ62wlu0sor94MSgFu8zxdQXtw4fIS2Jb
ASWRfkyjTdDL0CXRf5L0ZrzoyD+RDqKvhgpaTNuTHkK9HAS4bcGIQIu9yheXP47a
cNF/JU8N11s/trjuVfAH6lKx3XSwb/TUsZbqpjhbRoNrWrAT9SWBVKn5P8QdsNrE
kD4NLI6y7kChBp83wI8VoIrnaglCvCqxinYCak2MPNs/B2G7C+lykfTueTBa2inc
TpHQ6cmaWmPDCdx1Un9MwP88S0/5Wxncz7th37FK4/X6Z41x+549t2fM4r+nr2mU
1USt/VbzDngDlWJgbXhTmb2bFxQjGA==
=W33y
-----END PGP SIGNATURE-----

--rMDQFe1vt6eV+lKJ--
