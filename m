Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7B86AC8C1
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 17:52:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 203F8112E;
	Mon,  6 Mar 2023 17:51:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 203F8112E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678121548;
	bh=GVS/y+MCIowLXLF6a4iduBGUyMME07hIbPy+mGY4qhQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kqnwVqxynWvY1uK6WTknOL95Z82Qq40+WrtFxeF3m1yQe2Nwj6uUYTVBZNzXjhLcl
	 fHJiayBZgKyEwQYbULBUv6ciTPEC7Gl6jL3CtKLrd61ajIzVWmYXhoK9swPkqRq7lH
	 anMg7NaBTw14PAj81+ayldygN59I/V4U4TWmpF+s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 857E9F800DF;
	Mon,  6 Mar 2023 17:51:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F29AF8042F; Mon,  6 Mar 2023 17:51:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7060BF800DF
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 17:51:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7060BF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OEhbI14s
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 30218B80FD4;
	Mon,  6 Mar 2023 16:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CECC433D2;
	Mon,  6 Mar 2023 16:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678121483;
	bh=GVS/y+MCIowLXLF6a4iduBGUyMME07hIbPy+mGY4qhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEhbI14sE/tmSa23Y3HRKEw+FlapnlHMP0Tr/ds6t8hQR+rt2bjg2JIDC4nBZTY9u
	 bnEse0o2RRMYYRkULM2NunUBvikQ6Cp1YcTMmp3FLkb9LYsCFL0Iol1bFVuqhhkKBK
	 271YX+cqrqRC9Y3sVWqozdrO+ToHQJ8ywi3uwmU4o95upEb/nny1xnO7l7NMGJhH2q
	 JmV12lo2yub9TFNMTE9fbx38iCzwvYi3Yr4ui29g3RKukkxRxpfufP6ndbxsu1V6nl
	 x/+YfDb2x0ZrRs03CNeTObRowG1rZ5BqVn5XjB9AXZYLeth/x2udMaBeyE2zJ/un8O
	 Dxak+Th/MwLoQ==
Date: Mon, 6 Mar 2023 16:51:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v7 00/10] Add the PowerQUICC audio support using the QMC
Message-ID: <824314e0-b459-498b-9a7c-7dd4c94900aa@sirena.org.uk>
References: <20230306161754.89146-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O5OaE2O/CRe4hVyU"
Content-Disposition: inline
In-Reply-To: <20230306161754.89146-1-herve.codina@bootlin.com>
X-Cookie: teamwork, n.:
Message-ID-Hash: W3R6EPF32AS3BIBPCU23GNUSZ566LTCA
X-Message-ID-Hash: W3R6EPF32AS3BIBPCU23GNUSZ566LTCA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W3R6EPF32AS3BIBPCU23GNUSZ566LTCA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--O5OaE2O/CRe4hVyU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 05:17:44PM +0100, Herve Codina wrote:
> Hi,
>=20
> This series adds support for audio using the QMC controller available in
> some Freescale PowerQUICC SoCs.
>=20
> This series contains three parts in order to show the different blocks
> hierarchy and their usage in this support.

I already applied this series, please send incremental patches with any
changes.

--O5OaE2O/CRe4hVyU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQGGgIACgkQJNaLcl1U
h9D0Wwf/T+XbDDJ+a7hIsyWhV5O7eQGUIMp42yn1EGIJovbiv+GGxdWWJH9rKyON
muUMiRiUb1jwUtkZdtfqSLXj/jL5+2UTEEVUGOpp1MANtVFxkay56wtwpLOwXB9d
JSJrgbGOnkejnZzEBo8vFwotGy5ZayuYSbPAY3tbkZoAa7Qwy93eGXPxlhVmoOXj
lO84zg5BNwrtvmwc/FaeLwx6isoBXtGA+qg1+4uZ8L4c2mFVohVdNd4b7H0pqkP+
WKVUA/m4UfJErspOWi7hWL1MHNOfBVzF6TQ5hvNhJCjU1avbk9TGDYrMDC8RCLr1
2bNd1WOHiiLR0lfBX5wiro998wpLTA==
=vRUD
-----END PGP SIGNATURE-----

--O5OaE2O/CRe4hVyU--
