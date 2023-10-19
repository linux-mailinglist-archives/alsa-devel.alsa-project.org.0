Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A2C7CFCDB
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:35:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA1AB84A;
	Thu, 19 Oct 2023 16:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA1AB84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697726124;
	bh=++oWv5ta62XzNOjHAT+hzm1rccxuAt5Kqi2EPovb/vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QtG1JhgmcfT1vBTQmk6KkaUtoNmEeYLqQVx0h6y7/+tdQk2KN78fiZKnzlczmkp6I
	 aI+W99gDOVmf58hEDsQToOaMnN+jPy54KnFxEtUh+WW29OySpPD+dBK8PiOToWxe8D
	 GWy+/UQnFCMqTNpQlwLHdJ4i/JKjgSmprIGxADT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0557FF8027B; Thu, 19 Oct 2023 16:34:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A2BDF8024E;
	Thu, 19 Oct 2023 16:34:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F525F8025F; Thu, 19 Oct 2023 16:34:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FB6FF800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 16:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FB6FF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dBN1PSmg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66C5A614FF;
	Thu, 19 Oct 2023 14:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29E1C433C7;
	Thu, 19 Oct 2023 14:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697726063;
	bh=++oWv5ta62XzNOjHAT+hzm1rccxuAt5Kqi2EPovb/vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBN1PSmgRs7/BMOsU7VS/UTwztyT1nxB4K/Yl6QIAEVe6T6mn1g9gmZaCJKPkSuRV
	 LmcZassU7gjZx7skhEBkNIuFbMNKzLxSpn9/Md1EKXvXVYp0BCP44m2QxTsg0N1G5r
	 hY0xWyuSptxBn8qXsKTWq8qCmCk5LP16lFwfjGKkCnTohfpZx4QdtYZUK1j8Jcqsaj
	 ZSGydrR1utSlircg3oL9jOkE6DGL+KkiZJkGmW8fD93c+EUzXsNqqm3UyFcY3TJdZK
	 Nt6nrhxtcmMFoYwpE9Q87xyzJfwbD3Sq7IQ/2UwjLylVo90Xvsi4sACdyoQPyM0W/6
	 VvWxa3hnQoP0w==
Date: Thu, 19 Oct 2023 15:34:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: Re: Migrating this list to a different platform (take 2)
Message-ID: <9879e427-5dd0-43ee-bacb-0b0b452ea348@sirena.org.uk>
References: <20231017-coroner-blurt-edffe8@meerkat>
 <8f62db8c-b10c-0256-a56c-28b998d1a3bc@perex.cz>
 <20231019-posture-cache-fe060b@meerkat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X1N5OBS2QtQHT6nx"
Content-Disposition: inline
In-Reply-To: <20231019-posture-cache-fe060b@meerkat>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: KZTB2N5TR3PTC7SKT4V6ERJ6YKWY75X6
X-Message-ID-Hash: KZTB2N5TR3PTC7SKT4V6ERJ6YKWY75X6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZTB2N5TR3PTC7SKT4V6ERJ6YKWY75X6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--X1N5OBS2QtQHT6nx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 19, 2023 at 10:32:11AM -0400, Konstantin Ryabitsev wrote:

> There's a third option -- instead of migrating the alsa-devel list, we can
> migrate all activity to linux-sound@vger.kernel.org. It's an existing list
> that currently sees about 5 messages a year (and most of them are cc'd to
> alsa-devel anyway).

That would definitely work well from my point of view.

--X1N5OBS2QtQHT6nx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUxPmoACgkQJNaLcl1U
h9DwIAf+LUIj3Jue8rbEDh68M9bWLAfNNNqgXYm0GuRqsJUiGrtGJhR22wFd5a5u
R9eDtB9SMtbIDZzwWXBNIYtRkk3iFV5DFnRkyElMXO62NS35TEnyLuTianloZZGp
ZP0RHovNcKi/9BwkYbxEbQ1qAxAZycnY3GXjR493/kf8aO27hqRJ/9S+zwrXIuV4
911sntT40N7zt748BusCWel1taGVQCSWCoE6eEAkQqM+lEJv9VvvJB/1ZGubLryd
KTnR/zfoHMSb5KoHuRY0llVyXZq0757Tkjz70fiw81yZ4SXV+9SJIEaGf1mNoZ+l
SR6lyp+CoJnEaljck63lwVASldO/8A==
=I1Yv
-----END PGP SIGNATURE-----

--X1N5OBS2QtQHT6nx--
