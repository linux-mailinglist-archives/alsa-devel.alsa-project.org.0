Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B277E7C86A9
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 15:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D52AE852;
	Fri, 13 Oct 2023 15:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D52AE852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697203257;
	bh=VcB5/8seKLmFDKdT+kSos3+IFwbNg0oQ1SdCP/8TYHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pDwWK4Es+t4gTTfytw9AQpz60NBoH0hqRQn2tC/dKf4NbKz362ydTVurwCDMBg/f4
	 YDFKCtK1/cfmU+JeS9a1OTHcffiPu5GLwP9NvSqATfdSOjGlhWRG4u1w+wsqcdyDRI
	 qkuq0ZatAw9Tw/DNrR5Q4N1n1oziBdpqLIb3Dm0E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22031F80563; Fri, 13 Oct 2023 15:19:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDD11F80166;
	Fri, 13 Oct 2023 15:19:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C117AF80553; Fri, 13 Oct 2023 15:19:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FB5EF802E8
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 15:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB5EF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cbcC9b27
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B29C7620BE;
	Fri, 13 Oct 2023 13:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC540C433C8;
	Fri, 13 Oct 2023 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697203174;
	bh=VcB5/8seKLmFDKdT+kSos3+IFwbNg0oQ1SdCP/8TYHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbcC9b27ZdXTw0KnKGi8PnmGOavWx2Gz8d4m0p5n5/7E9X9+vyu7GPIfIrdLFl0Ab
	 35RfJ7QgW6JBMdhQjh7UBRa8hJtxuUoCwY8bRJzqyD6b1xlBjtnXvRRlUi8Xx0oQkh
	 MZ/Qcs7Ef2LmSkA3+Lp1tuqd7o13UbsXF0jfVrIeWAGf5/dYkAL0b6drKRqjhZOFo7
	 EX0sL86XrC0M3KG88/RmOilU7l/LUjqACrD+sCn6YR3H3U+8y+3v+hgFfpqud6oIPJ
	 dVsxrvWMCWP/jLVu4rABekQRNayIT8VF/I1TCf0YaCxqg5/iJkhXLAgtNkhoVQ0mfK
	 8VqTw0G2zuBMQ==
Date: Fri, 13 Oct 2023 14:19:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v6 02/11] ASoC: fsl_easrc: define functions for
 memory to memory usage
Message-ID: <ZSlD3ee9x3JsZL7f@finisterre.sirena.org.uk>
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-3-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ytqlM95q5yypPr0Y"
Content-Disposition: inline
In-Reply-To: <1697185865-27528-3-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: 5NLP3LNE7EVLSQEF32SOHX5OA5M3GUOU
X-Message-ID-Hash: 5NLP3LNE7EVLSQEF32SOHX5OA5M3GUOU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5NLP3LNE7EVLSQEF32SOHX5OA5M3GUOU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ytqlM95q5yypPr0Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2023 at 04:30:56PM +0800, Shengjiu Wang wrote:
> ASRC can be used on memory to memory case, define several
> functions for m2m usage and export them as function pointer.

Acked-by: Mark Brown <broonie@kernel.org>

--ytqlM95q5yypPr0Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUpQ9wACgkQJNaLcl1U
h9DNngf+M3/aOmhL3QysiOuRsmxBgDZuzkyGRwIBeMdlNnRJ7VM13CfbjkJ0D8Ju
ku9ojR2jE52TiXcKQIoyv4iD+gMIndsFMEOEEI8x984ZsUVkd0HR/L6YtiL5g2qI
y523Dzyvy5kggmINayFGOBActp7aD7hzGUgJ2EqknrmhztzFMoDM/wpvunBAC/+z
2rSabJ8Ss7YcNAyXd619KZFpf2bNoGEXOvMWZLm3lUidNJfMsSzzbVfivTrBByyR
wDY98oN/ssmkuUAMKKGJtyimFc86LHl4VFzOHk88+srmpiE7P8o6iLRu4ioJ8IYW
5VMlKcs7NwJyryTiAvEKLcp6harRFQ==
=oQdR
-----END PGP SIGNATURE-----

--ytqlM95q5yypPr0Y--
