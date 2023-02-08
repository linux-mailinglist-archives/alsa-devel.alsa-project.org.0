Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A3168EE0B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 12:36:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0150829;
	Wed,  8 Feb 2023 12:35:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0150829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675856201;
	bh=AUKE6M5tMZuXDYA8IUjucWQolhmviuw2K6E1aGJS+5I=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aU/lQN0Tp3hxcopQOF8AhCh9ZLmiguLEqsaLe4j4gggS8JeV1RXVgu3HK8sGOxsAk
	 pdYnhd876tw4+7iQiwjb2DY0EheCTgYNPepGyEyhYqtw3lx2anjVOBB30catPH8Jxd
	 RECPUtq1dOPMruVXok2d4I/zOZnZZJykjoKl98D8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03FB4F8012B;
	Wed,  8 Feb 2023 12:35:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6CDBF80152; Wed,  8 Feb 2023 12:35:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D57CFF800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 12:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D57CFF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uFEGyQnI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 90E54B81BA2;
	Wed,  8 Feb 2023 11:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46498C433EF;
	Wed,  8 Feb 2023 11:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675856141;
	bh=AUKE6M5tMZuXDYA8IUjucWQolhmviuw2K6E1aGJS+5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFEGyQnI/ki1HjHQ5rj5yWlFqkyV3rxAZ1YZHYWsr7hIxiUdF4kXT0JCX7hyDXA4d
	 40nk9fJeyAoehXLh4GRdbjXvf1i6X7wfe4CUIH2AhGHxgJZh0LArOLEIdDqdhw1aU9
	 uAWbzeB5/NCYBasygh5zk4KGlKG81WC3Ux2pE7qSIKTODjSkiBxT+doOm3MC4pRMfk
	 DONTiocCp2uJ5V9D98tSiO5tXwr+8T470wIxlHmJM/RPQGJHRaBU8EOI9nBEdJVZUJ
	 5+g2uUHcRRQxVdcJEsY285sCBTLMhNWD+9UAMHWrZetEcDTdMwIoi8iCsaY4lYt+fc
	 Gmcef5nCWHCmA==
Date: Wed, 8 Feb 2023 11:35:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v3 0/1] ASoC: dt-bindings: meson: covert axg audio to
 schema
Message-ID: <Y+OJB7OPABnPfeq7@sirena.org.uk>
References: <20230208093520.52843-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q8hUcRno+jxdc1xU"
Content-Disposition: inline
In-Reply-To: <20230208093520.52843-1-jbrunet@baylibre.com>
X-Cookie: Walk softly and carry a megawatt laser.
Message-ID-Hash: Z5XV74XISFSTX23VVCZISGKSX3W6GQII
X-Message-ID-Hash: Z5XV74XISFSTX23VVCZISGKSX3W6GQII
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5XV74XISFSTX23VVCZISGKSX3W6GQII/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--q8hUcRno+jxdc1xU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2023 at 10:35:18AM +0100, Jerome Brunet wrote:
> Continue conversion of AXG audio dt-binding documentation to schema

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--q8hUcRno+jxdc1xU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPjiQcACgkQJNaLcl1U
h9BmoAf9EcajJ7S7A4aYay3TP8axqaTlV6e/par8YbD+TMjVAIn3rVhLP/tfYPzT
LUmutr/WdLwRIHyN4+1kB1sanVXRDq8EUHGgoJTsA+Z1RajZFS2ot8xWNLeoZO8b
EGBDTF7+8axEQCw1KG1JQMHoL4lErqeWzOJxwUQfbcmXjndfdUHAnQlS4i91USVA
qW/GQ3F93rXeyQPC/BCjvBBeYwmrf9X6s/flz4YEE24hFYi+qzeqy7cKtZsWEczy
qdU9I7SsK24zW5za4lgHw1QJcmSANztHgvoqte5on59EUhP08u5N2fuSi2Ek+m/T
iwn11JkoQnMg9u0sAq7uTjtq2EgYMg==
=T+/7
-----END PGP SIGNATURE-----

--q8hUcRno+jxdc1xU--
