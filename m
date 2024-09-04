Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E52C596BC04
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 14:25:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89EFDB65;
	Wed,  4 Sep 2024 14:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89EFDB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725452749;
	bh=NRw43zX42ozCIh3tpA8n379wVpc9fGBYUv4G/U5n5pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uZThyemiOMh4RhUCqdmFNupJb53W0AieCV2+2we6tKytHCjWlHW477lp0zQEICRkw
	 IDZIDUrWHs6q2JJnsvMSQa9WQ2lIPVFo7Uo2VfIQNY7dbvd+4C1A5XFh8y+fptU46v
	 baRw1iZoP8TKYbofM3H9onMa4Thxv0xN7/31s1ww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25333F805B4; Wed,  4 Sep 2024 14:25:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64ABDF805B3;
	Wed,  4 Sep 2024 14:25:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D581F80199; Wed,  4 Sep 2024 14:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31EE9F80107
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 14:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31EE9F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EHy11RqW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6085D5C5785;
	Wed,  4 Sep 2024 12:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A978C4CEC2;
	Wed,  4 Sep 2024 12:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725452709;
	bh=NRw43zX42ozCIh3tpA8n379wVpc9fGBYUv4G/U5n5pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHy11RqWO6mOvhN0j95yBYvWvOZ0df73huWzEKGuHm8eBoQyws8KMwhavwt/6Da/l
	 pYAMTsQX/43XPE4QGtLD5o/P23HNu+F5p1C8XT94v9l914bJRJtPPSsvmI+krmebEU
	 DbsuBWo7nqKASYIJlAq20EMim6CDcWoOE63bfTbPDlY10krAsCeNP+qvhSoYPO3HQi
	 xyCmIwIZIux9PMp4fmyVX9X80XrGUhcTYPxt33xw+JTP7TDQlRlZnyG2QrtSmzxx9v
	 QekVOdz5QSTahpgC30wpL2A92tOx9VJQaI2CS6IdKguAyGbeL+iMJobZ5LzJ/9IJ3L
	 jUpa2oVuNrSCA==
Date: Wed, 4 Sep 2024 13:25:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC/HDA cs35l56: Remove redundant IRQ handling
Message-ID: <e1aeb66c-ecb3-4778-b306-f3a212caf879@sirena.org.uk>
References: <20240904120700.188644-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dwYiuZQXQUCbdHo9"
Content-Disposition: inline
In-Reply-To: <20240904120700.188644-1-simont@opensource.cirrus.com>
X-Cookie: Linux is obsolete
Message-ID-Hash: CWNRSELG6RYKOH45EH5LLKCKQIWYOQTW
X-Message-ID-Hash: CWNRSELG6RYKOH45EH5LLKCKQIWYOQTW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWNRSELG6RYKOH45EH5LLKCKQIWYOQTW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--dwYiuZQXQUCbdHo9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2024 at 12:07:00PM +0000, Simon Trimmer wrote:
> The IRQ handling in the cs35l56 driver was purely informational. It was
> not necessary to support the HDA or ASoC driver functionality and added
> unnecessary complexity to the drivers.
>=20
> As the IRQ signal GPIO line could be connected and shared with other
> components the handling is replaced with a regmap patch to ensure the
> cs35l56 IRQ sources are masked and will not generate interrupts that go
> unhandled.

Given that the code is there now and has been since the driver was
introduced about 18 months ago what's the ongoing cost of having it?
The information it's providing is notification of hardware faults,
reporting those does seem useful.

--dwYiuZQXQUCbdHo9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbYUaAACgkQJNaLcl1U
h9BjLwf9GlVkug+fLA2NQHbZ7YKMdUwPYr2Q4QVuZ394iIv4v89hMk8BqX5VJbKS
bjD80BOjQ1Mxnc0NOFqSrIMPGIe8oPaOwtnurRrECRFqE+fr4FoatYUFQddHuPHM
HMyCjx+njD4T25li9WB+fhIVfXpxrn1PEGJXWoobbJuZoafbjFuFeRmAobgkfc/M
v/48BmXfzeYYtjxcGCFRXtPU3Eju7TdXZMUhyADEiZ+hNhgQHEG3rdiixTIDIqVa
Tr8tH9P2M3E9h23lCcQ5+XZvZ6kojF4SxT5YsV73001IzBkptBOq/Q2cFv9yKf5O
FEMaro+/KPTAO8JrnTVCmud7ykJJkQ==
=6n19
-----END PGP SIGNATURE-----

--dwYiuZQXQUCbdHo9--
