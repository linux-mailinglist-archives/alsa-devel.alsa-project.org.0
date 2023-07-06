Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D049749B54
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 14:04:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1182741;
	Thu,  6 Jul 2023 14:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1182741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688645041;
	bh=h9LrxEnYQVUI2MkYbCyF11apaeJLH2yAAAdmse5JAiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wh9YsbVlHrAzl0UGKSS+tTaq+0b3tw+FxOyfkmCh8A2T0BUalfhBwLzQZ5TUaCC29
	 WX1l9vMxhIbuOe/O8vyZIK6cTC5eWxn0rNt0VxyzY3FWXPk4WfABCaFs/cOY90QWeu
	 kZqXqD8GDXX1Ik+rDrd4laAfI3X3A7qinLiiMF70=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BC44F80132; Thu,  6 Jul 2023 14:03:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7CA7F80100;
	Thu,  6 Jul 2023 14:03:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1CD9F80125; Thu,  6 Jul 2023 14:03:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 23EADF80093
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 14:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23EADF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kgNGcSYc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6CF76618CE;
	Thu,  6 Jul 2023 12:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96F7C433C8;
	Thu,  6 Jul 2023 12:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688644963;
	bh=h9LrxEnYQVUI2MkYbCyF11apaeJLH2yAAAdmse5JAiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgNGcSYcVE3AYRdE7H5V5oVuZshVvy40hrtdXktEGVucVAOLL46WDITONePSeKoF+
	 d6uL6r+0bGKEO3p8ByHwgUyqZla17pk98qO0LWHtPo+mwmcSWYi3Y+7Zq5z7+zXV2f
	 0nj08ntYMRPHtY4ioUOYb+vl1I69A2+pQYOIwAG5WcGJGDFZw+pHtJJmVjLeNpFPr8
	 Hf0p9hK6ShXKXDMVgJolstggzMi7wK/T23G2SERuqk8RcKIx+fCQq9bolIEQXuBcfY
	 jYkDUCCWXCfIrne3ltvC3uBt6b105Q1Q0Og+odusezuXA1B3YzL1mrlSgrdlO2UTVk
	 JU/e+u5jGTYOg==
Date: Thu, 6 Jul 2023 13:02:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com,
	dmitry.torokhov@gmail.com, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/3] ASoC: tlv320aic3x: use BCLK instead of MCLK if not
 in master mode
Message-ID: <eeba3297-acdb-45ca-a80d-40d8b3a90231@sirena.org.uk>
References: <20230705190324.355282-1-andreas@kemnade.info>
 <20230705190324.355282-3-andreas@kemnade.info>
 <15d3fc6e-d294-4968-bc7d-66307efc92db@sirena.org.uk>
 <20230705215611.5f96584e@aktux>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UomsMsmcZLuNBQaC"
Content-Disposition: inline
In-Reply-To: <20230705215611.5f96584e@aktux>
X-Cookie: Being ugly isn't illegal.  Yet.
Message-ID-Hash: C4ZFX2JFQXMITYTORAAIA64DAZV7LNWA
X-Message-ID-Hash: C4ZFX2JFQXMITYTORAAIA64DAZV7LNWA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C4ZFX2JFQXMITYTORAAIA64DAZV7LNWA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--UomsMsmcZLuNBQaC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 05, 2023 at 09:56:11PM +0200, Andreas Kemnade wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > It would be nicer to set the clock via the DT bindings, ideally with the
> > clock bindings...

> I found no path from these simple-audio-card things to provide a clk_id=
=20
> to set_dai_sysclk. I would of course prefer such a thing. Do I have overl=
ooked
> something?

Since we already have clock bindings we should use those to configure
the clocks, there's several drivers that have added this support already
- look for clock providers.

--UomsMsmcZLuNBQaC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSmrVsACgkQJNaLcl1U
h9Aiigf+Ou9AA4di16Yf4y+H1mj8NnkVAid2OFXa6NQ0mptBZxo5im31eX6esarn
GnrzN6qYs06qcNO/mOZepRaEuSgIUZlWLqaMAdOawiCHVgSuqkYHGtpTbZnjxDOP
KSoqrumSBJOtyoKIh3ZT2YxrWcD193dkFDXILJB1jbpSQpMpe7D09Jgj1uCys0Xs
JO6U5l0/pc5gZSmPpQnKNk2kDA/Y5ec7C+TXdffpc9T98s9xFHBq2lkVAfz+1T96
ARQcsL9sa9rxo7L1opX98iqszsQ4roWK7WfdcGeUWt4tpF+6bLNuKc8jT8ZGPCmq
RYMPCFF4pCILcLF1sIjozgLtc3OiAA==
=RAi2
-----END PGP SIGNATURE-----

--UomsMsmcZLuNBQaC--
