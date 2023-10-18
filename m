Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F2F7CE0C5
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 17:09:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AAE51F2;
	Wed, 18 Oct 2023 17:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AAE51F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697641744;
	bh=mBkZiAJw0cAZ+8K45DFZn1KTs545PbO0X/BQKA3Y8Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dXl1rI21JsRbbCY5NJGvMXuTRec5lSzV8c2ZeUMsUfJPf7HRAXwKPrQTXN0YY/JGV
	 CO9UmaJc+IfXb46XXyPiAdHlaGpvsmAYVCJG7P/5krgVg37s0F48H+Jw8t+PvewgPR
	 oodouHmIfKM/Jf2v7/VO4bunGN41UJy9jA1FrI3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F08CFF8025F; Wed, 18 Oct 2023 17:08:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80962F8024E;
	Wed, 18 Oct 2023 17:08:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8BB1F8025F; Wed, 18 Oct 2023 17:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5448DF800C9
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 17:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5448DF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S25cZry5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 10359B82357;
	Wed, 18 Oct 2023 15:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74810C433C9;
	Wed, 18 Oct 2023 15:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697641682;
	bh=mBkZiAJw0cAZ+8K45DFZn1KTs545PbO0X/BQKA3Y8Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S25cZry5EckSmUckAngr1pga2GQsoTavq3XDjyGIfITI3GKBU5hevjH1UeUxdLi+b
	 7rRfl5IWifnWIWbjdDa7VWmTzC0LH+XUv5ccmYAdANSds74BzlmsPFhoFoAQeZgUaQ
	 H0OxSQKRl6Y1Hl+NHJD55QiSu4qf046Gwr3YvewnK38u33gWHDHcOtO2HC8nr2ZWsZ
	 2dDwLswfJMna47Sv2cg7IZOd4BgTGIUSV9x6NAP4MwtQtfAVL61tE9ED/HsWT1r/wp
	 4BBAoisf1U7RXpfoyiWEFAEEc0Kwomq5u6L6Lf1Vxp+OiPKhM7UR5NUN00zQdJWylR
	 3QRUeMEw9Y1bw==
Date: Wed, 18 Oct 2023 16:07:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: wsa884x: allow sharing reset GPIO
Message-ID: <c17f56c1-a629-4b05-b807-42010f206f6c@sirena.org.uk>
References: <20231018100055.140847-1-krzysztof.kozlowski@linaro.org>
 <3aa9e3a7-9417-44b4-87d8-fcf1a8b46daf@sirena.org.uk>
 <84f9f1c4-0627-4986-8160-b4ab99469b81@linaro.org>
 <b7aeda24-d638-45b7-8e30-80d287f498f8@sirena.org.uk>
 <b35a21a2-6e69-4033-8d51-2b67b08ac7b3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0DVAadVcjJVHZ/F3"
Content-Disposition: inline
In-Reply-To: <b35a21a2-6e69-4033-8d51-2b67b08ac7b3@linaro.org>
X-Cookie: Santa Claus is watching!
Message-ID-Hash: 7K4ACCID7PYVFCYEOXCBLAJKUWJZKLC5
X-Message-ID-Hash: 7K4ACCID7PYVFCYEOXCBLAJKUWJZKLC5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7K4ACCID7PYVFCYEOXCBLAJKUWJZKLC5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--0DVAadVcjJVHZ/F3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 18, 2023 at 02:57:59PM +0200, Krzysztof Kozlowski wrote:
> On 18/10/2023 14:56, Mark Brown wrote:

> > I'd expect that the GPIO users should coordiante directly rather than
> > rely on the GPIO API to do the coordination for them - there aren't
> > enough semantics in the GPIO itself to do much more except possibly
> > provide discovery services (which would be nice).  Look at how the
> > regulator API manages multiple regulators sharing an enable GPIO for
> > example, it adds an additional layer of reference counting when it
> > identifies a shared GPIO.

> OK, it is still regulator core, though. Not individual drivers problem.

> Several other existing drivers have the same issue, so this should be
> solved in a generic or shared way.

Indeed.

--0DVAadVcjJVHZ/F3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUv9MwACgkQJNaLcl1U
h9Bv+Qf/Rvb5zyWFaHHrWVDS/7ye9dIL/po1Jvc9RP6d4AYn6QD0oyu/NbUNIHFm
LeB/Xwa73t6cIk7NqGMfpiGr494gsJIZkIYFXA2sRbIViBed9lfXkPIp/lbosz5P
sPjpR/gzT3+PqyyaRdEzXfmc2Ninu10PEvR1US8HUfNntlkGOjgnJLp8mXM0whUm
U+Fbl5W2+2TrIstqes8bJRzBSzpZgM5EqkhXUapqmr0EBVHOn7OjfB1e2/DqA+PF
k3ZedVR9V7xi7S3nhLurr5zS4E8OYUebnt61PfdxqsZjqlQNjEQrQfMtwALjarOg
yOL/dyC9UX7+UUWQlxh5j1GOYjBCdA==
=sw3k
-----END PGP SIGNATURE-----

--0DVAadVcjJVHZ/F3--
