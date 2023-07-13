Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 940AF751EDA
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 12:29:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD579206;
	Thu, 13 Jul 2023 12:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD579206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689244141;
	bh=CrzntzTldU7Ro0kscYLoVmmQ2ktvukltq9bhAgOwHcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uGqJaPwRGaECyLf1nKlYzOARqEqCBVjkIp/ZC/yZefdGssql+a1RiE7drEwMZajhZ
	 eQBUMtz84d5I6/W1loHr3s+92+5KbaisJulR8J0Jcy9rYYv6OkPr7FHhJIEEmtUgwc
	 ykobiKxx0D0mUpv/+sjubn4iscivJ3L0D+PjzyGk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE232F80535; Thu, 13 Jul 2023 12:28:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20A25F80236;
	Thu, 13 Jul 2023 12:28:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 399BDF80249; Thu, 13 Jul 2023 12:28:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 45C18F800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 12:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45C18F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=id+b0040
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7344160A75;
	Thu, 13 Jul 2023 10:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA0DC433BC;
	Thu, 13 Jul 2023 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689244074;
	bh=CrzntzTldU7Ro0kscYLoVmmQ2ktvukltq9bhAgOwHcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=id+b0040kuDr080TnKTvw7Kw9uPzt205rve7ZUuOGI/e+Lg6j1riUfpFBWKhG6FMd
	 HqB0GWHSqnCdDOAJr/6QlLMKGWTKQqPqHDZwSKlf9CzL3QMIbDJYPCleXpwDCuxc9p
	 cTx/PaIAXVO0H9/s/Mxm6ABJ+DB2HW+kWa9yEhaFFgVq/9Pd0EGJEIhKrc0tH52DiA
	 SJzvYmA5Z4cZlvTjN2bkRB3jgsYJAuQLCZH6AX1kEykErL76WNS3DNDnIZkrArAmbA
	 qnpdF7IXONs/Q0EbFE1X/FZxMJCGpTqcSZyAJarHxxLtIZXJmWNZ5YNo9uOoEoGdW3
	 ATa8T4pOZ9irA==
Date: Thu, 13 Jul 2023 11:27:49 +0100
From: Mark Brown <broonie@kernel.org>
To: David Gow <davidgow@google.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH 1/2] kunit: Enable ASoC in all_tests.config
Message-ID: <8fd7bb4a-057a-45e6-91c9-fd77140f4ff1@sirena.org.uk>
References: <20230712-asoc-topology-kunit-enable-v1-0-b9f2da9dca23@kernel.org>
 <20230712-asoc-topology-kunit-enable-v1-1-b9f2da9dca23@kernel.org>
 <CABVgOSku9p34jgHk6-L4KD1dVAKuX06tFqTM2QL0zA8t+Rdotg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LzGK+YoeTYDqG8YF"
Content-Disposition: inline
In-Reply-To: 
 <CABVgOSku9p34jgHk6-L4KD1dVAKuX06tFqTM2QL0zA8t+Rdotg@mail.gmail.com>
X-Cookie: This end up.
Message-ID-Hash: UJG7XDLE2TLB2WCFPQM3BZ3HHMYLX2UI
X-Message-ID-Hash: UJG7XDLE2TLB2WCFPQM3BZ3HHMYLX2UI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJG7XDLE2TLB2WCFPQM3BZ3HHMYLX2UI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--LzGK+YoeTYDqG8YF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 13, 2023 at 12:19:13PM +0800, David Gow wrote:

> While I love the idea of this, it breaks the default UML --alltests
> build, as all of ALSA is behind an "if !UML".

Oh, UML finally works again - that's good.

> ALSA folks, how horrifying a prospect is removing the "if !UML"
> everywhere? If it's not trivial, how do we feel about adding
> "sound/soc/.kunitconfig" containing these tests?

I suspect this is due to UML not providing some key APIs like DMA, if
it's building now I guess those dependencies might have been fixed.  Do
all the drivers build properly if you enable UML, otherwise all the
randconfig people will get upset, it could've been to save all the
drivers from having to deal with UML features issues?

Another option would be for the KUnit runner to just ignore kconfig
options getting disabled.

--LzGK+YoeTYDqG8YF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSv0aUACgkQJNaLcl1U
h9BVRwf/XNnrlg9WGWUCByN6cAPedsu2lHSLkG4ax64j+pbeZeJozEHoXBNkporH
zJ8pR1PnnCevNeHc0UfV4Euw6t0AHN9TRDlwblFLX56IeKWyI85PlDl1N0tghZ9a
bBCrCYV1e4FVYfs68nF1vvRYw6xfe0+5fuGabxW/DzzLo/3kQs+UjQ6D5rayDWiZ
TGeq6dwXiajFla+Pi1EwqWpCgjSRv3+dHldCtu1XlGfDxTz6EL6a9F7BvLfiG/Dd
omGJ1Tw2CwAeED/BKtvdM0Mbe3pJDC7rokGmbDdZSf1uAuYzK6fjKilcIi4VkxRP
A48bunCDf6EvCf4ePqmMSeg4MrVFjA==
=bIG1
-----END PGP SIGNATURE-----

--LzGK+YoeTYDqG8YF--
