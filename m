Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0762223AC8
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 13:48:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59F041615;
	Fri, 17 Jul 2020 13:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59F041615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594986484;
	bh=KX5mPfLHuUjnGJeMBjtqTQ1Ck4CB31BE9OJacRIWQDE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUb891kR3qhMCCjf6Bu2Xiey8WZS6dRBH175R3FYUr1XNjq+O21RLgMc9sc/BeyP2
	 ND1pU+al3Z+a1Qn8rGSRk5oCDENhW7Vu48YRvba2r9qtPYHH2GH0nq24TIx4DI30+/
	 ZHfQT5dCUisloY15EoE8JR3oC5SrKVW8v+HdvEg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84022F8014E;
	Fri, 17 Jul 2020 13:46:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCFE7F80217; Fri, 17 Jul 2020 13:46:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A352F80110
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 13:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A352F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DHCB9uLi"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C25B20768;
 Fri, 17 Jul 2020 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594986367;
 bh=KX5mPfLHuUjnGJeMBjtqTQ1Ck4CB31BE9OJacRIWQDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DHCB9uLiov4F0fSB35Lqnoa6srk5KAw9Kka9E9gBd1LAkSsiU0JIXYaz4BR4ium8/
 KVtjkPOMF+Y0iOe6zWU8O563rEp/D3ou24ojmd9e5+p1tNf9oph/oq6tBfpy8Oz+BE
 RJTIrZgqZWeDyNRk5gByfHb1fQsze9zDrIPsr0EU=
Date: Fri, 17 Jul 2020 12:45:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH v3 0/1] ASoC: fsl_asrc: always select different clocks
Message-ID: <20200717114556.GC4316@sirena.org.uk>
References: <20200716232000.GA27246@Asurada-Nvidia>
 <20200717103857.31877-1-arnaud.ferraris@collabora.com>
 <20200717112156.GA4316@sirena.org.uk>
 <5bdf1102-e964-3d44-e673-beb23b0dc970@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline
In-Reply-To: <5bdf1102-e964-3d44-e673-beb23b0dc970@collabora.com>
X-Cookie: No other warranty expressed or implied.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, kernel@collabora.com,
 Shengjiu Wang <shengjiu.wang@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2020 at 01:34:34PM +0200, Arnaud Ferraris wrote:

> Understood, sorry about that. Should I do a "clean" re-send for this one?

It's fine, please just remember this for future submissions.

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8Rj3MACgkQJNaLcl1U
h9DDqgf/eQ2QLdcqzuvznpoDrEQ0LM6SxnFnr3vplVVaQsHOluS09uLqLR+HkP2p
hfONZTrrp2pEVi2rOBUwm8Q9Iw8llcsgfDSY4QIdM3OMW2RBx0eZbZzJuF4GEZG2
q8oKUo2Ytc7Dw00dssXYUqEoYzAuKhcDjO0ik0J/omCjFvqX2h5CODQQRbSTSxQY
HHQlH57XuzZvN48iU5PFISv8azIzQHe/BRJNRa/UC83eoaicJ38sahPkXkIE1vjq
EM2viwQEbYK567qsSO6eKdt+SgrbV87awChbYGrL7f5+b40/NzUjXg5+E3BE+j4G
17XXR4WyhCrLNtECvaAY4KCOPrmq+w==
=maun
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
