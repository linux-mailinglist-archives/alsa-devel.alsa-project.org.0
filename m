Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E199841DA
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 11:17:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE33DE69;
	Tue, 24 Sep 2024 11:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE33DE69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727169459;
	bh=7gdoqhXNNZucpSkE8hBwdCZmsMRtwnSTv00X6OJRbPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sAfc/d/5mnO9/PMJTvLt5bwyXeG1ZKSTbaCiGNOlgTbeZ+xasly+VSdxx63Q12Jjl
	 hMiFbfoikkKS7VMg+POr0Xy34i6ztJTL3+XJWsiSxxy+iSv50a78jE9jbB7emnGniO
	 Hhg1jSNrq61ehSYjqHBdiMrqPdY/xnZWziY+sYmg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57764F805BB; Tue, 24 Sep 2024 11:17:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98AD2F805B0;
	Tue, 24 Sep 2024 11:17:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 870EDF802DB; Tue, 24 Sep 2024 11:16:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02284F8010B
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 11:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02284F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CyjSfPYC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ED5CBA40851;
	Tue, 24 Sep 2024 09:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBEEC4CEC4;
	Tue, 24 Sep 2024 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727169412;
	bh=7gdoqhXNNZucpSkE8hBwdCZmsMRtwnSTv00X6OJRbPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyjSfPYC80yFtddcP80xN8xdKOpBOMSeeTwBzQNm6cDESN6lFDgELD1iAAJWi3vdq
	 cXqf0gcNEeoi1tJhJC5XaYbZq58QQJK4TBdqmTGA4iDYNTxxYnbufCcCozBere/r4d
	 uByVGXbRA3dVdtWZriBXZhueZAq5k/VcqTy4kNMCUz2vrqphaF9oxSG8G3pKX6U2ek
	 0cUPIBWmpXIVHvU0A1Z0PAu5JveTbOUD5tiSKGWPwzDIU324KorqrBgkMy4bx0z+A1
	 LTNPu0UElea6kvFui9Xi6cnZ+eufn6RmfQblT66qImVNspCKfiQqa1GepyqBdfTiBh
	 Buz7va0CAN+Pw==
Date: Tue, 24 Sep 2024 11:16:49 +0200
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: SOF: amd: pass acp_rev as soundwire resource
 data
Message-ID: <ZvKDgcI0DN5Wd8S5@finisterre.sirena.org.uk>
References: <20240924081846.1834612-1-Vijendar.Mukunda@amd.com>
 <20240924081846.1834612-4-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e+4U//sj5bbFZSnH"
Content-Disposition: inline
In-Reply-To: <20240924081846.1834612-4-Vijendar.Mukunda@amd.com>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: 2E4XCQ4HP2HWU7QWUL4W6TXV324FKQBF
X-Message-ID-Hash: 2E4XCQ4HP2HWU7QWUL4W6TXV324FKQBF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2E4XCQ4HP2HWU7QWUL4W6TXV324FKQBF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--e+4U//sj5bbFZSnH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2024 at 01:48:45PM +0530, Vijendar Mukunda wrote:
> Pass acp_rev(ACP pci revision id) as soundwire resource data
> for SoundWire controller probe function.

Acked-by: Mark Brown <broonie@kernel.org>

--e+4U//sj5bbFZSnH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbyg4AACgkQJNaLcl1U
h9AH2Af/W7IK5j+QknLLuZwKGFmupJs/fsjSLXQT1LifiQmhxGUeMtVUB1PB6npu
xsqiCaKrTpB/cgEfo2XdvGVjE2zTU8dhYCxPBwgbR064wUvIWKFDL/CLb9s6Zl78
uWk0ssKWC9GMiTn3QBwWC3+E5krBFlWHrR7e9fo+nOm8eYxtTfRgMq2USLj0rQSv
RT1zD2b9WM+oRNMbcUtSnnv+mb3vw/X8ZXz94wiceARDg9LmCEVAHhstSMcV83dT
frPvBjgENka4YLBvJEqdddO9M6a6cVfaHJBe+Y3UiQ/cbqm3YNikbwcKxO6EKupD
HspJTY72/+wdYio1jYfxHFKRPCRx/g==
=QKWK
-----END PGP SIGNATURE-----

--e+4U//sj5bbFZSnH--
