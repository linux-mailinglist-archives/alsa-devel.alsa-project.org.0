Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBCF706B6D
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:42:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 697771F9;
	Wed, 17 May 2023 16:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 697771F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684334545;
	bh=RDCkEvIUQQBxIOex2SoU5c1ZdoAutAZwztLEO5uIpXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=trMSEuN5H2enTJ2Y1ZeTBS/lhpYySImGxnAM3uZHTjsDKYJCQx8wxbphwmccauPVX
	 GVJg2MuEcP71GDDBlVSlAmG/otqyUnob87D0fqeiKm3QIrvldjxpNjTr143ZPqmQR3
	 KAtoE0WiaF/dq41oqf7P6VKyR1CRUBuFar7CKf8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0821DF80549; Wed, 17 May 2023 16:41:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EA15F8025A;
	Wed, 17 May 2023 16:41:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ACCBF80272; Wed, 17 May 2023 16:41:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CDADF8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CDADF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uVJfwhdh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8726E63CC7;
	Wed, 17 May 2023 14:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95FBCC433D2;
	Wed, 17 May 2023 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684334460;
	bh=RDCkEvIUQQBxIOex2SoU5c1ZdoAutAZwztLEO5uIpXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uVJfwhdhsUh/6sztZXoJAIApsJo8gqLsNjwZufYMykoHJA3j5/6NEPCzJt6lW7/8t
	 ApGGGHoo/+R7KuOlN3ZwyHq97wbwjlQxDIV3cHQuWmk56PZRdDoVAaCmi7P28aG4cx
	 lAawG42NbsISrbubBCeNSet6mGt3c9a/xH1GM23lbJYsvdBAppGdea2m/Yvp9ODJ0P
	 o6YNz4TqMs64ej3XlcutYza0tRJxynjbDLDSXPqkP170n/3+OG3X1N24Jmx1L+s1lB
	 B+uQxYY2Lcyk3jVxLNNxyMmnqBBUn5T7maxrsy7H+hIvEM+hdwgVJAwoiRx64mwRuR
	 vDNjWHELfJm+Q==
Date: Wed, 17 May 2023 23:40:57 +0900
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/12] ASoC: codecs: rt1316: do not store status in state
 container
Message-ID: <ZGTnea0BFJXaROIQ@finisterre.sirena.org.uk>
References: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
 <20230517111416.424420-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ny1TQaPnYltu5+yi"
Content-Disposition: inline
In-Reply-To: <20230517111416.424420-2-krzysztof.kozlowski@linaro.org>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: ZOEESWIXVGNXG2PAPVKKMNIVVGYSKYW7
X-Message-ID-Hash: ZOEESWIXVGNXG2PAPVKKMNIVVGYSKYW7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOEESWIXVGNXG2PAPVKKMNIVVGYSKYW7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Ny1TQaPnYltu5+yi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 17, 2023 at 01:14:06PM +0200, Krzysztof Kozlowski wrote:
> Driver in its update status callback stores Soundwire device status in
> state container but it never uses it later.  Simplify the code a bit.

Please provide cover letters when sending patch serieses.

--Ny1TQaPnYltu5+yi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRk53gACgkQJNaLcl1U
h9AEYwf9E+g7Ws9RXq3bBAVpcFExa9NqtagYg/tdeBPzpA8SiibttZ6G8CkR2Cfc
DsVxF9FF9Df18BiSq82Ryk84hKePnCqIda0S2NazWONWwn4gd+WOzGFNylqgmwuN
4cW0w0pdY1BrPt6BdeT18ZqJacadarh/xoHCsqbT5E0+xMOFRqMUz2k1F7B3yaHv
h4+Ltv/qu1bsHABEs9g1dma6LyE99U8bMuTJPy3eOAj97fG4P46zEUoUMPo8cRM4
tLeSz3u9tBX1HDnZtz3NHsDRUgds2j3KcRhB6ShrKDhx+kG29y2gTdGUN7v7h51P
ZCX1NH5xoNGKFkagp9/lou811SX42A==
=JxIA
-----END PGP SIGNATURE-----

--Ny1TQaPnYltu5+yi--
