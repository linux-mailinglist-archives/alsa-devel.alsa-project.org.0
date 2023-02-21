Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B60E769EA25
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 23:28:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CFEFE85;
	Tue, 21 Feb 2023 23:27:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CFEFE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677018479;
	bh=P06SrSSCbTF2Xgb/8rAJuCEF9liIHWSGJ4BAANKNp1s=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aXKyflLWfAOx7qd97AhTzOhDRHsM5xZJ4NnWb/ObznOvc4f9JHuE+9DDNmcDUx27Y
	 dh3k4n2KS6ZcTwmxm2dhTn0llO9hZj9k95kTd6l4+C9AbE1Tpb4iay8ws3bGmLKeEu
	 02dpX2wtTbqjHZCU+ADNE9Sn2xA4uxrsJd8qtZbw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3BFDF8025A;
	Tue, 21 Feb 2023 23:27:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4A6BF80266; Tue, 21 Feb 2023 23:27:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8E7CF80125
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 23:27:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8E7CF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tf1Ivc7R
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B9D46B810CB;
	Tue, 21 Feb 2023 22:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4B7C433EF;
	Tue, 21 Feb 2023 22:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677018421;
	bh=P06SrSSCbTF2Xgb/8rAJuCEF9liIHWSGJ4BAANKNp1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tf1Ivc7RJbuxndkFsSDprYpWOJFuUVMUrixHOsDLE0cIAeW11Lhkoai/L+JMqFc1j
	 G3IRZ5K26SpWw4f6vFEsYb7fITg6VWoekVGOZ5K5XC6RF4MERwBYvKmhht8wf7ekz2
	 BWM9sYFEHYoFi0C+jtVXHOH0OoTAyjBn6f9B3hndiH8mut1OYojq8r+XWBcW6R/h1o
	 6ORgkSSWbfE+vg3yiBi/rKu0qjTapANCjQ2YJDmlhLK+xmxlv8Bt1leQ9X42ckYZ0a
	 XQPqkaNhx3qwfBIPUIPap4mCKK9bywYWS0ts6FDNFAxvCDWEPcZdrOHfOE9/A84pq5
	 WrXqpa2zYfkgQ==
Date: Tue, 21 Feb 2023 22:26:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 07/10] ARM: tegra: transformers: update bindings of
 sound graph
Message-ID: <Y/VFMl5Darm7YEK1@sirena.org.uk>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-8-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yuk3nqAxVaP3OTyz"
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-8-clamor95@gmail.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: QKNFU7HGVKNOKOHGFCAPJZWSS7TKLDG2
X-Message-ID-Hash: QKNFU7HGVKNOKOHGFCAPJZWSS7TKLDG2
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKNFU7HGVKNOKOHGFCAPJZWSS7TKLDG2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--yuk3nqAxVaP3OTyz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2023 at 08:32:08PM +0200, Svyatoslav Ryhel wrote:
> - fix headset detection in common device tree;

At least this should probably be split out as a separate change
so it can be backported as a fix.

> - diverge control and detect elements for mic;
> - use GPIO mic detection on wm8903 devices;

--yuk3nqAxVaP3OTyz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP1RTEACgkQJNaLcl1U
h9A4OAf8DMi/om6e4mm8TBFtglGASJyWKbwfRlPfnmHfZe9NRFocDsboQo+U6XFK
qxHu7nNOMUpIioEO5BEmw8UI1d3UWv28a2FLvEZODA08cBKmg2G0OPiUTQtb5kUc
eG2PvDWMskSVbzr0eSZBWObIXM4rn/83gvsLwdFJM6PYkUHPgsDtW0wTK+S8dIWK
BwyeF5IodplgwhhC9LQDH5rjGbXHWZIWOBCIQO4d4nhKQH/qDou2CXoENIAmZk0W
fvrnmz/hqv6IgLI81L9Teh7Q+eko/opWAJa9r4I9SCOMW/MLlveyc2oDA0zlI93p
fku7U+Z2zBKL5qyGRIRbhQTNPzUsXQ==
=ZxfP
-----END PGP SIGNATURE-----

--yuk3nqAxVaP3OTyz--
