Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F29D26E4F96
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 19:48:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85C1BE72;
	Mon, 17 Apr 2023 19:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85C1BE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681753681;
	bh=UumL3AR5cGnsjet1Ca8z1G6hDhRj1HkmJ8fDNPrLm7A=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O5dnx0c3DDyXZGHNIz3FKeh1fy6MdWdQri5c8M3v7wrWG2aICid0bxDT4LGcVCSU3
	 Njz4j2yqoP/GEcvH3kEAp/X3xEzo8WLk4prs0+xRMrEsgi2zdliHvMt/Um4RyLGb8l
	 s2UEhglIwsmiC8iIF3P2RFN3PqiIKQnGj2MXSe0s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E08B7F8025D;
	Mon, 17 Apr 2023 19:47:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8C6EF80266; Mon, 17 Apr 2023 19:47:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0764F8023A
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 19:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0764F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Bdx041Pt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 84EE961E73;
	Mon, 17 Apr 2023 17:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AAAC433EF;
	Mon, 17 Apr 2023 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681753620;
	bh=UumL3AR5cGnsjet1Ca8z1G6hDhRj1HkmJ8fDNPrLm7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bdx041Ptx6nbYd7T4nrf6mfXp93+2+GgsJOyR1ea9KCQ5pKd6Zl7Zo/84NappJoxt
	 X30h+ss1L5OC9naLW0k5Hw0bQO4RF75fnFKFLUfpD6Dj68cgIeh4RGCcniJUJhIGzq
	 JnjGhN3t+z3LXlgqk5xQVM7YIGvy71MMu3um6fBkd1hPOA9xP3bS05j09eBQPTB0jJ
	 awwuJeVatmHSZ/LfKyh7B8dwPgUxpLARD2WYucgyN1y7dcFm9Mo9eM+6PBpb+5UUlH
	 ja5QJrteV7+UkLwuYM0C1FsLA/inajHXY8T1CtaIpay4KXfsxzSOYTdyUanrRBNG3o
	 mLJcXS2fy17WQ==
Date: Mon, 17 Apr 2023 18:46:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/4] ASoC: codecs: wcd934x: Simplify with dev_err_probe
Message-ID: <d17093ae-6c3f-4426-974b-c9f9a8c32e10@sirena.org.uk>
References: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
 <20230417141453.919158-2-krzysztof.kozlowski@linaro.org>
 <20aa9662-9cbb-4fbe-b6ed-3a6ba33e820a@sirena.org.uk>
 <c294d672-c2fa-7468-f02d-18d5230a1d95@linaro.org>
 <5d753a8a-b979-43f6-a403-8a51f69bac29@sirena.org.uk>
 <752c2dc1-65a9-a74a-d9ce-7db5ddbea5f8@linaro.org>
 <80be967f-b831-4a73-8474-09bb96bd2c32@sirena.org.uk>
 <1cc83bad-55c2-46b5-ad70-cac160b842c1@linaro.org>
 <7da0f237-b4ba-4c66-8061-a14c09a1e7a5@sirena.org.uk>
 <45907ab4-ad1d-b4ff-a5b5-40e9bfc44e8d@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="orgSy6EAXUzq+s5o"
Content-Disposition: inline
In-Reply-To: <45907ab4-ad1d-b4ff-a5b5-40e9bfc44e8d@linaro.org>
X-Cookie: Two heads are more numerous than one.
Message-ID-Hash: EYZGUMT7FGW4ZKZZXVEFGC7MXJCKNBAP
X-Message-ID-Hash: EYZGUMT7FGW4ZKZZXVEFGC7MXJCKNBAP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EYZGUMT7FGW4ZKZZXVEFGC7MXJCKNBAP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--orgSy6EAXUzq+s5o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 17, 2023 at 07:30:35PM +0200, Krzysztof Kozlowski wrote:
> On 17/04/2023 19:23, Mark Brown wrote:
> > On Mon, Apr 17, 2023 at 06:32:07PM +0200, Krzysztof Kozlowski wrote:

> >> If you prefer, I can mention the message/EPROBE_DEFER difference in
> >> commit msgs.

> > I know you prefer to maintain exacting standards in these areas.

> I don't understand what do you mean here. Do you wish me to re-phrase
> the commit msg or change something in the code?

Your commit message does not accurately describe the change the patch
makes, it should do so.

--orgSy6EAXUzq+s5o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ9hg4ACgkQJNaLcl1U
h9C/cwf8C8PChuzz40kFfDSjF/vdejRXHYYpafw0q6gvpyLrp6azZO+DUtN/fCFh
h2pAAmfULIzRbtTZuoyT9xt0ujyvIz9SpbXdrbBVw1ifhXi0fB+a9KiJcyA54j/F
2upz8mCEtdQ1zr/ERpitk0FghkQaxoWlVQ8e5kPVghyx1bFUuHxC24sUIlw2jZP1
8EhUJxLJ04x8Z0b5dHKt7k3P9cypoiprrhV4pJJGMNppdntQYHI+KMiWPp4z+RAB
lg2QKlO1Sk707Kq9tgWzXa2eJZZXReowVotCAB0tU0keJXYJj+cesgpf7FX2iXYa
I1nMewkAoqXrTKP0PAGtKT/4jbpXng==
=z0j8
-----END PGP SIGNATURE-----

--orgSy6EAXUzq+s5o--
