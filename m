Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23688958633
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 13:55:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C04D17F8;
	Tue, 20 Aug 2024 13:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C04D17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724154933;
	bh=TP9TtVQgR6n4hw0qJHDIBA6p/NB82aSLfZbbvJIyc0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lITJL5V4ogeLQ2iaOtg/vvS7rd8xqNK8BtCEbvMeSt5G4wh+BelNQ/TdHFpXTDs+Q
	 RLDjnZXqq/H3BSffs+uWEoc//r/FqHv6FkFnMHhTJmmKlIdO9UiF1PFP0c15fAhE3Z
	 3jxdEPlAsigfeW5UTN0xzSc+CHAB/SBTZzuQjppE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BE51F805B6; Tue, 20 Aug 2024 13:55:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76DFAF80588;
	Tue, 20 Aug 2024 13:55:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B172F80494; Tue, 20 Aug 2024 13:53:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30562F8014C
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 13:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30562F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=etlVxEdF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 23C54CE01BC;
	Tue, 20 Aug 2024 11:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8666C4AF0F;
	Tue, 20 Aug 2024 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724154823;
	bh=TP9TtVQgR6n4hw0qJHDIBA6p/NB82aSLfZbbvJIyc0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etlVxEdFB3HsVRgybpMy0QxV3pepYuet87GF3D1Fx0AKBdkuJxL8lva5EW1BTOrsg
	 UvaOhXnJAZ21kg1tu+NoR1jy21KMQhxgduw6LCwc8HeG6Xnd8Wnbd7IkZS2s3fZ/T0
	 8CEz6gg68p/diAWlIDUBIYWLdmmupTCocA2rN6kYzlghcEw9qVMSnVJ2Ahd/EJ0L/p
	 dO9f4m1a+bbcO//rYoHMfaBuZB8i/T3EhG4SXTNvekGfixQLgEzcAx2JlJpgYeUD2D
	 gBcoVsUillohgE5TfB0mwRt5wQ6L6M5P5XNdGAdBV4i+sSzhlgdOIUJTyyr8C5B+Fp
	 OrgrVnKVtY9tw==
Date: Tue, 20 Aug 2024 12:53:37 +0100
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
Message-ID: <09a5b041-62a8-4c85-9885-045079db796f@sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <be277abb-af6c-470f-8237-17f45bd990b8@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3npxPyIhAGu7xZY0"
Content-Disposition: inline
In-Reply-To: <be277abb-af6c-470f-8237-17f45bd990b8@linux.intel.com>
X-Cookie: You are false data.
Message-ID-Hash: MW3Q3BNYVIJ74UPIMUHUCRGKJNISGBDA
X-Message-ID-Hash: MW3Q3BNYVIJ74UPIMUHUCRGKJNISGBDA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MW3Q3BNYVIJ74UPIMUHUCRGKJNISGBDA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3npxPyIhAGu7xZY0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 20, 2024 at 09:48:05AM +0200, Pierre-Louis Bossart wrote:

> > This feels a lot like it could map onto the regmap async interface, it
> > would need a bit of a rework (mainly that currently they provide
> > ordering guarantees with respect to both each other and sync I/O) but
> > those could be removed with some care) but it's got the "here's a list
> > of I/O, here's another call to ensure it's all actually happened" thing.
> > It sounds very much like how I was thinking of the async API when I was
> > writing it and the initial users.

> > It's this bit that really got me thinking it could fit well into regmap.

> Do I get this right that these async capabilities could be used to
> enable this faster SoundWire protocol, but the regular regmap_write()
> could still happen in parallel with these async transfers? This could be
> useful if e.g. there's a jack detection while downloading firmware for
> another function.

As far as the regmap core is concerned, yes - with SPI we do wind up
with ordering but that's because the SPI sync API is a thin wrapper
around the SPI async API rather than anything regmap does.

> The only thing that would need to be extended is that we'd need
> additional callbacks to check if the protocol is supported on a given
> hardware/firmware platform, and if there's no audio stream. In these
> cases the async writes would be demoted to regular writes. Otherwise the
> bus would be locked to make sure no reconfiguration takes place while
> the firmware download happens, and unlocked when the transfer ends.

Those callbacks seem reasonable.  We already do the demotion to sync for
buses that don't have async, it'd just need to be made dynamic.

--3npxPyIhAGu7xZY0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbEg8AACgkQJNaLcl1U
h9BhCwf7BrVu6S4wLOF8+95Z3N2BxswzQnSQX7eYOcdYE04H4zXaORGHKClsnMNM
4M4so+loGfrKwPojTpGyORyikP4G4G+sxtPCZZ7poNkwtBYc8yFJa/gvP+pUZkfT
oPyb2QguRJ2jtrvZg3spm1xns7Y6SfNN6XOFRuI8WatCqHvGvweC0QvkjOvIOO7S
3AuD9DrLyee0bZE9BpVYbrk5dC/xaD44d/Domj8PuGZcIsSdlfrsIw/Bvi2rYhcr
yk704B0c5K/BgiKxV4WFwWzspSDgZTyvNaaL/fYa4k/TkFRxX/1Rn8KWEeMFjCI/
UI+vVoLw5Mc+WQIz9veGqInwETZV2g==
=9A04
-----END PGP SIGNATURE-----

--3npxPyIhAGu7xZY0--
