Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B64074291A
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 17:07:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 556AE83A;
	Thu, 29 Jun 2023 17:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 556AE83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688051231;
	bh=474x6sMuA4plncvQ6IrECB4qCG3K40O5a/bmnxALyas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C9IR/ALtPm2AlVrdrzH6Fz+F0LLKwvdedUxfQz0nlKQoyuiofJtjZ64YeARKCjAWh
	 8MCU879wWNsGp9yFDFDAJ7qTf2nATOXigKf7eR/E8bKeHwo+ek4Y1agcMH4yNibzAs
	 0PQjkwKgjizqOHtpAjvE9woqexh0Nx8BGxUrCgjg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDA18F80212; Thu, 29 Jun 2023 17:06:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A44DFF80431;
	Thu, 29 Jun 2023 17:06:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA538F8051E; Thu, 29 Jun 2023 17:06:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3614EF80212
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 17:06:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3614EF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iyTCu0f5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC8C361534;
	Thu, 29 Jun 2023 15:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272B9C433C8;
	Thu, 29 Jun 2023 15:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688051171;
	bh=474x6sMuA4plncvQ6IrECB4qCG3K40O5a/bmnxALyas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iyTCu0f5QA4FVNSB65EEfJPxXlmulwlUJtsO2jbv8BLlni96QEeX5EDltLkShm/PJ
	 Dd/2N6fgVXAy0GHo3lYMFSpbOAOrp3feuxigkYqZAndvycDVeegiz+O9bL9yKN6PBq
	 i4SIAcnevtO7DClmCfpIyv0v/gp6kXA0vDI9a+f0rJ+QiPaz+k1imVqXjMH5MVag86
	 LG3r7jEbGyS+U/Ngrdp7QcfR2uzgFIjiJbXDXMkFI7iTPxmdKdJ4j37Fzn8YiBraAP
	 Krfzykyro4RR5xPjPS0vrl5kqcAdYzXWlCnnuW4p5o+N3rnzzDe/tccoNlbk7xQae5
	 6OiE6XsELxhkQ==
Date: Thu, 29 Jun 2023 16:06:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mediatek: mt8188: add constraints for PCM
Message-ID: <5995e77b-ea8e-4e88-8ca2-f716df9c9579@sirena.org.uk>
References: <20230629075910.21982-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9vDzboGe8Rh5zM2x"
Content-Disposition: inline
In-Reply-To: <20230629075910.21982-1-trevor.wu@mediatek.com>
X-Cookie: Surprise due today.  Also the rent.
Message-ID-Hash: VERXVU75HTYVKULYSCUPIDGMWZ2SRSIE
X-Message-ID-Hash: VERXVU75HTYVKULYSCUPIDGMWZ2SRSIE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VERXVU75HTYVKULYSCUPIDGMWZ2SRSIE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9vDzboGe8Rh5zM2x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 29, 2023 at 03:59:10PM +0800, Trevor Wu wrote:

> For certain projects, only a limited number of parameters are necessary.
> Therefore, it may be beneficial to add constraints that restrict the
> capacity of the PCM.

This commit message isn't entirely clear.  The effect of the commit is
to restrict the configurations supported when using a nau8825 but it's
not clear what a nau8825 has to do with this or why we're doing this in
general.  What exactly do you mean when saying that "only a limited
number of parameters are necessary" and what makes this the case?

--9vDzboGe8Rh5zM2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSdndsACgkQJNaLcl1U
h9Aj1Af9EDUZJPIpv75r4jnUe38kpi7YWD4SjRP7RAdggjnFr3VblTudJeMsxBfP
Xg9arOq/KEIqU3qGGn0ejdO0SOUF/cCS5ZUyNTcIMr3IWGUlWEn2mSZDP01MbnGg
DrIv5lNYZ+LXxdZD4UPqIcuEp/umRN7mTp3nQxX3AqIo2BWplzSKE9yIYF4CrZvx
XU2ZpGqV3RIR2G8avJlLdC16KL3gOQqLzPkPEctHFP2u24hnnkobgwEvBPlR9Xuy
/TvMv8XRH3FcVqoKf82e23q0hl7W1g6DCy5N7ShqD/lRqlIjGWcUbIiaffP8f+rp
L/kqu8AfVJw33IGr4CscKIVH29kFcA==
=i7Ra
-----END PGP SIGNATURE-----

--9vDzboGe8Rh5zM2x--
