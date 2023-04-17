Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE766E4F2A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 19:24:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C593EDF3;
	Mon, 17 Apr 2023 19:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C593EDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681752260;
	bh=wkeg5+i1e32gX2mRBlDeKCM1OhqUGj6JLGniF9eUzR8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AcqWfyaT18Bo7qyKfnUTezeWSoe8ugt7yb+U/Lu3WssmJ4x00WAIVDQbBVGqsKIgD
	 AbIuh1vqCgrOFhKQ0/OTHGO2Xg0cumjOupmTLEfMtkxRTlJJ+tyt+59qgXxo+4ThqM
	 4Qesm24c4Pkpbxh+HVlcCjuJmLdOt8FqFljk6xD8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39FD2F8025D;
	Mon, 17 Apr 2023 19:23:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89CB9F80266; Mon, 17 Apr 2023 19:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFA48F8023A
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 19:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFA48F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jZTQ17mf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7372C61169;
	Mon, 17 Apr 2023 17:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055F5C433D2;
	Mon, 17 Apr 2023 17:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681752201;
	bh=wkeg5+i1e32gX2mRBlDeKCM1OhqUGj6JLGniF9eUzR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZTQ17mfcj1W4J9vzCSL5U3pyj7Ae1ts53GIi8pgOXnoTeZ+fP3hfuX8A6RytZnsJ
	 YN18jVESO6j1t/we3x7fIeWiCV7O4t00eqS5gg6bKz7+qhCj0clOKCoeBWU2/PcDiq
	 l/zO7dhHNLhnHF24JavnYDbfh/X/gZ5Ed4klTKT0rGbUYawl9EV1oHAysE39pUA8b9
	 jPW4q62LQvrTmXagfKp0FT7RFRUnIv8aKJPyUYNYQZmotdKlQXdiwhc2BGA2kG1HKa
	 nH35PO8neXKIXm9RdTbR6fJHIr7t/J6l+zvaaO0fzU1n4n3EsWfaBV5Rd5gpSivnOe
	 OK02oE/573M4g==
Date: Mon, 17 Apr 2023 18:23:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/4] ASoC: codecs: wcd934x: Simplify with dev_err_probe
Message-ID: <7da0f237-b4ba-4c66-8061-a14c09a1e7a5@sirena.org.uk>
References: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
 <20230417141453.919158-2-krzysztof.kozlowski@linaro.org>
 <20aa9662-9cbb-4fbe-b6ed-3a6ba33e820a@sirena.org.uk>
 <c294d672-c2fa-7468-f02d-18d5230a1d95@linaro.org>
 <5d753a8a-b979-43f6-a403-8a51f69bac29@sirena.org.uk>
 <752c2dc1-65a9-a74a-d9ce-7db5ddbea5f8@linaro.org>
 <80be967f-b831-4a73-8474-09bb96bd2c32@sirena.org.uk>
 <1cc83bad-55c2-46b5-ad70-cac160b842c1@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2eytpMUzOpYcD15r"
Content-Disposition: inline
In-Reply-To: <1cc83bad-55c2-46b5-ad70-cac160b842c1@linaro.org>
X-Cookie: Two heads are more numerous than one.
Message-ID-Hash: JKDSAFVL7F56IM3SIZ3NKWZRFTFBEJMX
X-Message-ID-Hash: JKDSAFVL7F56IM3SIZ3NKWZRFTFBEJMX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKDSAFVL7F56IM3SIZ3NKWZRFTFBEJMX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2eytpMUzOpYcD15r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 17, 2023 at 06:32:07PM +0200, Krzysztof Kozlowski wrote:

> If you prefer, I can mention the message/EPROBE_DEFER difference in
> commit msgs.

I know you prefer to maintain exacting standards in these areas.

--2eytpMUzOpYcD15r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ9gIMACgkQJNaLcl1U
h9CZbAf9FNdeT6PP5Su4F8e7QLUDQqxLl/p8ptGVQfMYq+bdL8cy60Px4p3/b8OM
b5y2tSixtmE6OERzR3qZ8IaX/0nizP2PumOJtUaipyBFdQE131qLvwx/6RbcL61g
IjiG1Yu+Tn7FZdMCCTqIMq1yDnZbHx4wZ0tuYYgEl1gjH5wrIMxvZu0f6zw/O8Jy
MBq31U+MvNPyr4hAG2/DrDUQ4H2hCnxiGzWId0eN6l+/m5Le+FlWi87FT5ZkbxWJ
bp7QoVnTMRCBKR5WMUV4bUTZbNMC8bVCELv8xZIlzvL16WxbnN0vERxyjRSJKJlX
VnBiR4rAEVpyJjHvcMoMCuJVzl0I9g==
=j0TA
-----END PGP SIGNATURE-----

--2eytpMUzOpYcD15r--
