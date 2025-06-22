Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E1FAE32E3
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jun 2025 00:50:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E17A601FF;
	Mon, 23 Jun 2025 00:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E17A601FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750632648;
	bh=cvu6N19m8uS8iIw0DRHDACPtPlwOiPbUKoUbm0G3FgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WmWubo5LbsoF/GiQZ98ycgQIgFr4ZQAg7+XlI3iK5PAyvhO9YkBeurCYaT4hPAc38
	 wJa6tJimeP0Q9VhM885K+juibpk3wEM/FMb4xH2jwMYhf+Dm6EI4kxWUhSE06FwC5/
	 OO61qK4IuPHOW0UEkceFvW3Xmt3f1Kmyj4pcrl0g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7274CF805C0; Mon, 23 Jun 2025 00:50:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06113F80087;
	Mon, 23 Jun 2025 00:50:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9236F80424; Mon, 23 Jun 2025 00:50:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB690F80087
	for <alsa-devel@alsa-project.org>; Mon, 23 Jun 2025 00:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB690F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y9QTKvS6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8482D43E41;
	Sun, 22 Jun 2025 22:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD594C4CEE3;
	Sun, 22 Jun 2025 22:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750632604;
	bh=cvu6N19m8uS8iIw0DRHDACPtPlwOiPbUKoUbm0G3FgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y9QTKvS6IGmHSQCltwqRcKsogSJER1B15sBFiNo1UJZec7SLvxF0IBkMglu4BNYcr
	 IcZ5VknT1nattXxHSK+zpVxfoeEm9PeMwCB3bqH6hjpT1KzJngkUbsr+SlawhXqueo
	 30nh9v+AjsSyItjXEebqk+KVcIn2hRka2KXumU6W5ihRFlTF+un/kaXS5INVMqAU8y
	 TWDKly9asTC+u0c+44KdgisljD2OpcpGoZVV2uZKQJx5QoQOe+1q5PwOGv6g9qaV2/
	 TNEjp2TmSz2/z62FaKgYqIlpf3nPxTO2sTzqE1037a1ZSrRIKLfkYlXwQhOcHgK5Xe
	 Gv9t8z5lHmecA==
Date: Sun, 22 Jun 2025 23:49:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Yuzuru10 <yuzuru_10@proton.me>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: add quirk for Acer Nitro ANV15-41
 internal mic
Message-ID: <4721358b-d2bf-4846-b338-9e2d25ed25e2@sirena.org.uk>
References: <20250621180223.14677-1-yuzuru_10@proton.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6UAVJj4U4opW4FS2"
Content-Disposition: inline
In-Reply-To: <20250621180223.14677-1-yuzuru_10@proton.me>
X-Cookie: Yow!  Am I having fun yet?
Message-ID-Hash: QSCX4MSJ7IAL7C3VSMDCUCRM4LK2LQRO
X-Message-ID-Hash: QSCX4MSJ7IAL7C3VSMDCUCRM4LK2LQRO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSCX4MSJ7IAL7C3VSMDCUCRM4LK2LQRO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6UAVJj4U4opW4FS2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 21, 2025 at 06:02:28PM +0000, Yuzuru10 wrote:
> This patch adds DMI-based quirk for the Acer Nitro ANV15-41,
> allowing the internal microphone to be detected correctly on
> machines with "RB" as board vendor.
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--6UAVJj4U4opW4FS2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhYiJUACgkQJNaLcl1U
h9CS5Qf+LtqvH/9/ZnksoVBl4LYBscyDElTVfJgVSNJII/h1VJBwPHkfL9stm10t
LW/sxQD+/KbxZTlkAjrwbwX5m6563ki0iSPbumaaHs8WoC57ZExNIH1/mAqVwZEF
zuhZZroN2HjT3FUFHa38BKE8VrodiwRCSTgPKmEYFEUrf4PRRcUsxOGLeBO4QdwF
UY38kcnfS4VyX43T90jV1EuQ+dLoaQ1M2+EivIuvbIrEWI7xitCPMMaVgezueiGE
/dtnXW2mLITGo8ohUDv/Xwnf9pp3fsRTa6u4NTmr6D1FH+1w+v4C2f1cU1ETG0cP
AhlfH/3nYYaIz7dS5MbP7TI6qEEx4Q==
=eGN/
-----END PGP SIGNATURE-----

--6UAVJj4U4opW4FS2--
