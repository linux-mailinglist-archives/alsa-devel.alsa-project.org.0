Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A30E690D7EE
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 17:59:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B09EA4D;
	Tue, 18 Jun 2024 17:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B09EA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718726386;
	bh=sz0YN0y0FVSjHDPfeBoW60WGnfjUu8f2okvfcc2MHlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bJ9d7zTBikeYxFj+EgvAQ7hFu8F+7AlSyd8VGgi3IQPAf5svfhRqOoE4Mnsu/YWSh
	 YVAMKbDKjqJGYcQqDPFI6FisGayYjEOTF1lvd4qPjdHPKbtazZ0iOM5d3U0OmGW77E
	 WsMwNnUQ46BgPKD3E8K4foarFUDzyvp2H5T9bErk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D131DF804D6; Tue, 18 Jun 2024 17:59:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BAA9F805AA;
	Tue, 18 Jun 2024 17:59:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 129EDF8023A; Tue, 18 Jun 2024 17:59:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F8EBF801EB
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 17:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F8EBF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=StR/+jKU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEF4261A1B;
	Tue, 18 Jun 2024 15:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B754DC3277B;
	Tue, 18 Jun 2024 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718726341;
	bh=sz0YN0y0FVSjHDPfeBoW60WGnfjUu8f2okvfcc2MHlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=StR/+jKUNlVdvEZAmn/erjopL4xhu+f9M29jo/xZNGNAUZLes5ueyFEf1gMbhk+XV
	 A/OMRaMbZclI4zSb+VoObGGIU9Sly4lOuuzY0Vo4APTc+BYcys+o3a6AUEAyfw1B6c
	 BYd24NogKShRq7igav6Al55NjhFOuwBKJpC+yi5Q6rp+N3MFcguHWo9AmXifm2IadE
	 8JSOCNK/bFnnU18Oz8p/kJonak2enuO/3tVpE5tZuPecB/epdOSouu++qPIzxdgRj2
	 JMXTNH1CuD6PVCBaoR0Wwr8nCGQZOvMXXqCC9XE57Jb5haoFnAySEKboYmGbYRHvxI
	 VjLsz8hGzpQ2g==
Date: Tue, 18 Jun 2024 16:58:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Simon Trimmer <simont@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Accept values greater than 0 as IRQ
 numbers
Message-ID: <dfa7d5d7-2501-4c5f-a6e2-792c7aeb9bb3@sirena.org.uk>
References: <20240617135338.82006-1-simont@opensource.cirrus.com>
 <917507e5-dc6c-4e18-a7e1-554625de604e@sirena.org.uk>
 <3451fcf6-ff33-4f72-83d1-945b026b925b@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LcvkV2LVLHBdzUd/"
Content-Disposition: inline
In-Reply-To: <3451fcf6-ff33-4f72-83d1-945b026b925b@opensource.cirrus.com>
X-Cookie: If you can read this, you're too close.
Message-ID-Hash: Y3ANOGY56XZWXODOBLX57EOEBEI4VOCH
X-Message-ID-Hash: Y3ANOGY56XZWXODOBLX57EOEBEI4VOCH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3ANOGY56XZWXODOBLX57EOEBEI4VOCH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--LcvkV2LVLHBdzUd/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2024 at 03:33:59PM +0100, Richard Fitzgerald wrote:
> On 17/06/2024 15:04, Mark Brown wrote:

> > Have all architectures removed 0 as a valid IRQ?

> From discussion threads we can find 0 might still used on x86 for a
> legacy device.

Some of the arm platforms were also an issue in the past, though
possibly they've all been modernised by now.  Don't know about other
older architectures.

> But the conversations we can find on this don't seem to exclude passing
> a negative error number, just that 0 can normally be assumed invalid.

Yes, the question was specifically about the assumption that 0 is
invalid.  The status of 0 is kind of a mess, people keep assuming that
it isn't valid and it just depends if users of platforms which try to
use 0 trip up over it.  Sometimes people work on trying to eliminate
uses of 0 but it tends to get you into older code nobody wants to touch.

> The kerneldoc for SPI says:

>  * @irq: Negative, or the number passed to request_irq() to receive
>  *	interrupts from this device.

Which includes the 0 as valid thing...

--LcvkV2LVLHBdzUd/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxrr8ACgkQJNaLcl1U
h9DcJgf/besPBBSWE+U9Elv/LY0aj6BtDK56+ADVsywz9T5PWa+Vba1Eetg1r+Dv
uvxXRyuNqT05o2FCB/Y89gVWR198ikoYvxVn+GtPjo56flVshC2trkVNgN5FHqWK
i59G2+xwbiwQM5rMCQhc5ouej7zVrw80AqWNTcIV63BxoN5gh8zWONukbyjwKAUv
tJblecSBXxpbeI7JwiJR32L9IS21nzYwF7PUaBLOBK0Q48Y+iU0U/5hWLnleEAww
XCIvEHYjv5/RXWvaNNIowJOMdytuluhi9/4JsJ1udUzloqYbFlNZ1dF0v0LsEuRn
abuLr9yaB1q2yJfnXOJ+KSWYIlnJVQ==
=Tyb5
-----END PGP SIGNATURE-----

--LcvkV2LVLHBdzUd/--
