Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 930A7958AC0
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 17:10:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE3387F8;
	Tue, 20 Aug 2024 17:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE3387F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724166603;
	bh=KiHywWfuUc+o/StRBaQwmAr/5d75+0UNF/dulRFDC9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e6z8Vm3wUrVHn1CDNty6N0otesUD6JK+4HzJkB4idDHb8E2sJuRMwnknQ2PeixE84
	 RPi2LdVnsJws+2O5+NKvp2Y3Mjbvra0sNnpXJsOFUA3AKXIBPNOtu2Q0TU587Me0Rf
	 DfDiNODbJjdrTA31RGiwqjZ4vFmkWiyfZUi6Z4x8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1164FF805AA; Tue, 20 Aug 2024 17:09:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB642F8014C;
	Tue, 20 Aug 2024 17:09:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41971F80494; Tue, 20 Aug 2024 17:09:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7AD9F800F0
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 17:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7AD9F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NrBPsUFa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3DD20CE0A1D;
	Tue, 20 Aug 2024 15:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF86AC4AF0F;
	Tue, 20 Aug 2024 15:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724166556;
	bh=KiHywWfuUc+o/StRBaQwmAr/5d75+0UNF/dulRFDC9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NrBPsUFa15qG1SwQRydjwJx6NwTz9RGv34gGpaTiZWei6rlWKMEXJJGEYIAsEYd4e
	 oH35ZUlYgdioL0w7+JTMISl3Zf38XGwSvW5CU6pOxks4kfS3YETzwu0FxoKXHl3nKp
	 oWHz1E3QAF8Vjmqtqn2kNJKzTIA6r7hsVdZgYnGFEBj5IvAkRsmtYAo2g73B/kf8/o
	 xY2ovV3Qh+sMLsgwVHaX8D8uzsE8XHjEj+q1Fk9ce74l2VqXIzFHRDYVhrs/u+fOSi
	 JXJ1DVx7vW2Rigbp6aUdwkkZVXrpuzDLCTd4AbDrSytcTFbA488ArmGYh3nQv4Trnd
	 dHZBHge2GcLFA==
Date: Tue, 20 Aug 2024 16:09:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <c3f0e732-7118-4868-8b61-a9c288aee1cc@sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <be277abb-af6c-470f-8237-17f45bd990b8@linux.intel.com>
 <09a5b041-62a8-4c85-9885-045079db796f@sirena.org.uk>
 <fe930297-a6f6-43cb-86cf-d49939dc5090@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OHDe/+eYMNW5Bw4n"
Content-Disposition: inline
In-Reply-To: <fe930297-a6f6-43cb-86cf-d49939dc5090@linux.intel.com>
X-Cookie: You are false data.
Message-ID-Hash: 3Y3IAA3YSNNH3AJFIP3USB7BOMFUNLHV
X-Message-ID-Hash: 3Y3IAA3YSNNH3AJFIP3USB7BOMFUNLHV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3Y3IAA3YSNNH3AJFIP3USB7BOMFUNLHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--OHDe/+eYMNW5Bw4n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 04:58:30PM +0200, Pierre-Louis Bossart wrote:
> On 8/20/24 13:53, Mark Brown wrote:

> > As far as the regmap core is concerned, yes - with SPI we do wind up
> > with ordering but that's because the SPI sync API is a thin wrapper
> > around the SPI async API rather than anything regmap does.

> ok. I am struggling a bit to adjust the plumbing that was obviously
> defined for SPI.

> The regmap async_write() doesn't have any wait, but there's a notifier
> that needs to be called by *something* that waits. I think the SPI layer
> has a set of kthreads but in our case we could just rely on a a
> workqueue after 1ms or something and do the wait then for the DMAs to
> complete and finally call the notifier to wake-up the regmap stuff.

=46rom the regmap point of view the expectation is that when the caller
wants to know that all the I/Os have actually happened it should call
regmap_async_complete() which will do the actual blocking.  regmap
itself won't autonomously wait for anything, it's up to the caller to do
that (presumably it will at some point care).

--OHDe/+eYMNW5Bw4n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbEsZMACgkQJNaLcl1U
h9BTaAf/Sg96OU2OZYHZQtScOCZXaX4NSWY4h4fmi8obkPYGy+sk7iMAyBOU1w0b
/MvV8GHE53CBkj6mlamTFY/2KwXIvbTXOJ4HPfqqPLBr881d7ywMEfNl23GF3SZx
qsQNCvRkYr4No+j0YxqDDuNlvgxnhx3UqwH0QRT2Oa0cmQhsI7KH7pT9CUWBUY50
7vjtSUv5VIglZX8mut4JyaNSkKxeUFo1JDM3F7JN+bR2YzCKJeVTvshQtVbS0Nl+
1/tfvS+5gzbLbSwQ7yesWgbiYUWpDf+r0yib1GrGl5xdasqNKcbt+5Y5iu6+h/39
mUQKmtqzE+oHOHGCSOm+LvHNzP1M8g==
=43Eu
-----END PGP SIGNATURE-----

--OHDe/+eYMNW5Bw4n--
