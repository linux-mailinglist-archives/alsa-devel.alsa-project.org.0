Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 567857B8C4C
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 21:09:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ACCDAE8;
	Wed,  4 Oct 2023 21:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ACCDAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696446580;
	bh=z8q9WQnLCGbK8w2/hCp6xPfP35wCO0KBvWTQAtx1ACc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tb6PdE2I2GQ59yFp1/bQ+cFUo4oQ1PguT+BzolEQLSvF98gM6c7Uvfr/S+1UTjfkX
	 gIo716qSoNYJi6o/8RpFUhSWZf7ZbgSDBqkkM0u12qBpcwCkEp3S9VVrzsCkGkRDli
	 nd9SHVFhfoJIR6MEIqx3jkLsGbLoVx3Ib+izQAPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2717F80310; Wed,  4 Oct 2023 21:08:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 622DBF80310;
	Wed,  4 Oct 2023 21:08:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C35E5F8047D; Wed,  4 Oct 2023 21:08:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82AA9F800C1
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 21:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82AA9F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BsdvoO2+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5DD4BCE1E5D;
	Wed,  4 Oct 2023 19:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E01DC433BF;
	Wed,  4 Oct 2023 19:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696446514;
	bh=z8q9WQnLCGbK8w2/hCp6xPfP35wCO0KBvWTQAtx1ACc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BsdvoO2+tSeEpeT+wbyLwgBePSJh50QAg5hT651xp9vHI96MWfVTSIvJA8H7HSsav
	 cANW7E0He5qhHnC5EAInOL4AsOWN+Olu4h2C9W6D5Zmu2pFRQ2or1IP+hDwJRggKIG
	 8oDHJUph/RfCfttP7mPSgjxeAPGJKHwfGo3AgEv/+7NYNw2XZsnbe2q7xBwODo58vD
	 bWR1EDu3qec6W2wQnHQcETNSktY1uKSryZi8UIBUxs9X7KfUO3h5eDGwtc0iMQcFw9
	 /WrqIhcHQBAnbaRP4SnRUhjWXF2kHFEPeb+U7z+jRM0XMKsFNjVE09jW/gaOD6Moqb
	 mHgq9LUW12oJA==
Date: Wed, 4 Oct 2023 20:08:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] soundwire: fix initializing sysfs for same devices on
 different buses
Message-ID: <c7e9aef7-d90d-4eb5-b4fd-72857346dcad@sirena.org.uk>
References: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
 <6628a5f6-ed22-4039-b5c2-2301c05c7e3e@linux.intel.com>
 <2023100453-perfected-palm-3503@gregkh>
 <624b044a-1f0f-4961-8b57-cb5346e7b0d3@linux.intel.com>
 <2023100452-craziness-unpopular-7d97@gregkh>
 <04c5911a-a894-44b3-9f0e-fe9e6de203f2@linux.intel.com>
 <d648c3d1-53ac-4021-ac7f-6a81f1a72dd3@sirena.org.uk>
 <bf4ee895-293f-4bc3-ac4b-30df6361e973@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jPpsDvd3ypYAmiPv"
Content-Disposition: inline
In-Reply-To: <bf4ee895-293f-4bc3-ac4b-30df6361e973@linux.intel.com>
X-Cookie: This space intentionally left blank.
Message-ID-Hash: 4RQGU2443SYTTDYGHBRNVTIQAP2H5W37
X-Message-ID-Hash: 4RQGU2443SYTTDYGHBRNVTIQAP2H5W37
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RQGU2443SYTTDYGHBRNVTIQAP2H5W37/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--jPpsDvd3ypYAmiPv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 04, 2023 at 03:00:40PM -0400, Pierre-Louis Bossart wrote:
> On 10/4/23 11:40, Mark Brown wrote:

> > FWIW DT is much less affected here since all the inter-device references
> > are explicit in the DT (modulo needing to work around breakage) so we're
> > not hard coding in the way ACPI so unfortunately requires.

> Isn't there a contradiction between making "all inter-device references
> explicit in the DT" and having a device name use an IDA, which cannot
> possibly known ahead of time?

No, the thing with DT is that we don't use the device name for binding
at all - it's printed in things but it's not part of how we do lookups
(unless there's something I didn't notice in the Soundwire specifics I
guess).  Lookups are done with inter-node references in the DT.

--jPpsDvd3ypYAmiPv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUduCcACgkQJNaLcl1U
h9DtVQf9E1QE9QxbJsHcy6ZNkCNbvskvokOqadTQX9lvcIS3emkiN65JK+oD5D9u
XOjh5OjUmolwPIvKggNJbTNdh25/e3ama+JYh0xeT9jM605vR/9UdNCXxuGm2Y4k
SLFoFvCxDZ1CZ+HEnZnlIPrOX2+afXoLezCHleEvCZbMzmMCcrFdmIGk2fOA+BTj
6Kr00wCESeg/kJGYUqmWuHNu/15U3TryRBv6r9l4VYTQYr62xk05pBt5KS2iC9UQ
aSACeVfLXF/B9X2KZwsD83deIBFj7FL9cwNrG4LLMneihfvJlFAswdK3qYZYyDXK
VAhMd3hpWTPMd4uq2JEpC90gyiY1ZA==
=60Fx
-----END PGP SIGNATURE-----

--jPpsDvd3ypYAmiPv--
