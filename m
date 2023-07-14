Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8795753C00
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 15:47:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB48586F;
	Fri, 14 Jul 2023 15:46:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB48586F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689342460;
	bh=jlT4MOwW+4v6VFl73qUifFGFB4+CTofOHXfzIaWF/9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gtwbHsran+Fsp2yjYG5e0KJQvGUEDkZgDOCSCqMy166WpN3G4U+NStMrz6WlqLwNT
	 Ka2pPDw5FQTmH2T/CbsyvFCaN+6OpOvs6jU+j5c3KH+HSZGFuFanVRTwaW3nEhZ/t4
	 /V6x+ZiV06Lc2OLosHKWW0Ojp2mTd1xSlSzXF8Go=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCCC0F8047D; Fri, 14 Jul 2023 15:46:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96785F80236;
	Fri, 14 Jul 2023 15:46:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F8CFF80249; Fri, 14 Jul 2023 15:46:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B616CF800D2
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 15:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B616CF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kt4460wH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AAC0E61D21;
	Fri, 14 Jul 2023 13:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D64C433C8;
	Fri, 14 Jul 2023 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689342392;
	bh=jlT4MOwW+4v6VFl73qUifFGFB4+CTofOHXfzIaWF/9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kt4460wHZy6jp9LP/QLU8ZGR/X5P937Fr7HjKGNDU1l3sY4pSjmctutPhFTKiAKSd
	 2QbjPRwd2v8FZ87+8moRdVgsiRxkoAmRaWKnDZBSqLkyd7+5FgmK0MzLEF7oSmE73s
	 ysrrRC5zs+jQ+h+jO6xPWAXH7CRPZuiK62xdVuuG1CJ42G7u2yKWQklGiUbonraRsL
	 EFBmq15aFUz4RrvsdaGF7QdWjy/45kKnsoctdwlOCmoR1kFJCKhK2yAnIwKCtwtzyc
	 xheQ3nVoTMnutcGhfUmiXNVmxEqQdhS87coryquiKsxfrOMzcW6X18xVknPDWykINg
	 Jq/ZivuZqcNWQ==
Date: Fri, 14 Jul 2023 14:46:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Lu <luminlong@139.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, kevin-lu@ti.com,
	shenghao-ding@ti.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ASoC: tas2505: Add tas2505 driver
Message-ID: <9358b427-faa7-48be-b386-bf1287906873@sirena.org.uk>
References: <20230712044321.48530-1-luminlong@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fkB7w4zBomSv3qDK"
Content-Disposition: inline
In-Reply-To: <20230712044321.48530-1-luminlong@139.com>
X-Cookie: Preserve the old, but know the new.
Message-ID-Hash: ULFO7LRNI5UZTRZTGM4DMG3WVKCTUDWB
X-Message-ID-Hash: ULFO7LRNI5UZTRZTGM4DMG3WVKCTUDWB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ULFO7LRNI5UZTRZTGM4DMG3WVKCTUDWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--fkB7w4zBomSv3qDK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 12, 2023 at 12:43:21PM +0800, Kevin Lu wrote:

> +	val = (ucontrol->value.integer.value[0] & 0x7f);
> +	val = mc->invert ? mc->max - val : val;
> +	val = (val < 0) ? 0 : val;

Please write normal if statements, it helps with legibility.

> +	.num_reg_defaults = ARRAY_SIZE(tas2505_reg_defaults),
> +	.cache_type = REGCACHE_RBTREE,

Please use REGCACHE_MAPLE for new devices where you'd otherwise have
used RBTREE unless there's a particular reason - it's more modern.

--fkB7w4zBomSv3qDK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSxUbIACgkQJNaLcl1U
h9Bm9Af/Vmv/c7d6mMKNRJ+Kq/VFegwM1YkIGeForVA0+QYnx52ji0YoqOW82WHH
ULAUcg7xy7NcVbJCwUbOEYC5O9ZgxG1pnzYiu1vFJa5Z0i8wF/HkmR577K2qPrjY
44bFdOHrE9dTB4XiRK1Bxe8Q67oylR2z45qnt2nqrCCLdnJgDqwVrSgaDelNBWM4
KUBWI7rNee8Iy+CPGMA77stRPX/mNeeRNAYKmofnu8HZ677SpglczskoSDBMyC8m
MTeuSk5I58N8pWyAufMROBrNuQiN5FL7NPIKQ2K9OO7n7Im3InF7+wxv2PkjKvcI
hb6qU4y1IYxjA/CT50+lkLemlGum1w==
=4jrU
-----END PGP SIGNATURE-----

--fkB7w4zBomSv3qDK--
