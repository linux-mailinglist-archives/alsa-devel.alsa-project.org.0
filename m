Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6319783FE3
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 13:46:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AD04204;
	Tue, 22 Aug 2023 13:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AD04204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692704802;
	bh=MirI7WFJqbzZP+o1PS5JUAE3PTXvaZM8yhv/B4WwiiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SJsPad8ulP1y+kNRQHCw1sLwdIW3Ha57lSYvc+2m71YTkOK+ZOGiBaMPsLXnNK2OM
	 Wb+IdL18/dt9ZqgPR4k5QQjICTVIrSybY/+/R8VxPDOnQ0/06sTKw1tYbrrcI0/b8J
	 j8SZ5AdZ3qagyxMJDXeBWsTZ2ahOrS6k1YZ+wXKs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D84F5F80537; Tue, 22 Aug 2023 13:45:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79851F800F5;
	Tue, 22 Aug 2023 13:45:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95934F80158; Tue, 22 Aug 2023 13:44:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEA79F800AE
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 13:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEA79F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=md29PFr7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0361F65305;
	Tue, 22 Aug 2023 11:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76106C433C9;
	Tue, 22 Aug 2023 11:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692704672;
	bh=MirI7WFJqbzZP+o1PS5JUAE3PTXvaZM8yhv/B4WwiiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=md29PFr7vr5/llR1qWFR3O0n/ZnHiVZa7KfqypeX6hmQQxLCiclDg7ucXwxVXXg7A
	 RJbu7S8G2iKJ9sKegW/w079a63nM9De4nVaGORIZXrjITyB5Fwbs11aR3w/+82puSr
	 HhWdRuwcLjdu5fDFKwbeYOak4orjl7ppuhzooAFIs8FDi0DlMwPIdQck8fWz/0gwEJ
	 xn+vel8ulD9kzVDOUJrjS8Rp8+O2D7OgQMT0+O73IDEwX4E/UQz5/bjVVUNk9+ufMZ
	 HJYUTxVYxcpAYgTi/jJExntL4w8DWkR0ptJyfhjOFUZQD66feYl2P/6Sji55ImNWbB
	 ptIUFaS18YOsg==
Date: Tue, 22 Aug 2023 12:44:26 +0100
From: Mark Brown <broonie@kernel.org>
To: AS50 WTLi <WTLI@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
	KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
	scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH 2/2] ASoC: nau8821: Improve AMIC recording performance.
Message-ID: <9594bc07-ccaf-4f40-a988-a33491cea7c4@sirena.org.uk>
References: <20230816080006.1624342-1-wtli@nuvoton.com>
 <20230816080006.1624342-2-wtli@nuvoton.com>
 <2f72d241-7617-48c0-a0c9-86bd14c50ac8@sirena.org.uk>
 <5129f779-79e5-3c0a-aeca-ce558393f2cc@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pl7C7D3cmDRMFxGL"
Content-Disposition: inline
In-Reply-To: <5129f779-79e5-3c0a-aeca-ce558393f2cc@nuvoton.com>
X-Cookie: MIT:
Message-ID-Hash: DZNUPU3ITIU4KUXDFLORORN2S6EJX637
X-Message-ID-Hash: DZNUPU3ITIU4KUXDFLORORN2S6EJX637
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZNUPU3ITIU4KUXDFLORORN2S6EJX637/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pl7C7D3cmDRMFxGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 22, 2023 at 06:49:50PM +0800, AS50 WTLi wrote:

> Okay, but I have a question. After correcting the patch, do I only upload patch 2/2 or resend the entire patch?
> because I saw Acked mail by Rob.

Please resend everything, include any acks or other tags you've already
got when you repost.

--pl7C7D3cmDRMFxGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTkn5kACgkQJNaLcl1U
h9C0CQf+Lqh/3eJWWArHN+sBdV+pZx1TpHGWjNRXwBlG/zRveFRMPakbQ40AkVvD
K6e6UCbL7snOJv3OEwAJkj3j7Ew8vkjlhRenZJrosFf85CGr2+MeSS678gVtlaCe
R93CnpK+0K4qaD6UHUB0QMS47qww3TUJn51DFvTNtv+qrPV49wdXImpjA4yi7WXm
lBP/5DMQA3iFarvl9b36R0l4+V/oqLsLEHfttyc/auzkQMwVSsYJA/x6wIuhUDYT
8r36q0ohef0ukemaPaqZS6jn+UzPn6O5Io+9ejAdOSF/PFXfjq5nlhCklxFZw6QC
h8zqnzA+/b8xwKep/gWGrpmvgE+8Rg==
=sCVo
-----END PGP SIGNATURE-----

--pl7C7D3cmDRMFxGL--
