Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D3F20B3C7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jun 2020 16:39:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32A461690;
	Fri, 26 Jun 2020 16:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32A461690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593182369;
	bh=18kzELTvzTWjkjSNJX6G05xuDOB2wb5K896c44xywRA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e8FQK436Gm3uf2mstupknZ9aHrmg1YQtmm3FnXX6hMfFt4SAm1kwdUHwA1tLxWZKF
	 EH6fsu35oWKMTzE4ZUcpf60WydRJCxoPcgsUFKfgArqtEVXjsbrsdk06BY3pi6nGXP
	 17vupue2c2vUduwxUsBjScj3hR/Gfu82JNBycc28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42E5EF80096;
	Fri, 26 Jun 2020 16:37:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D87AF8015B; Fri, 26 Jun 2020 16:37:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A4C1F800F1
 for <alsa-devel@alsa-project.org>; Fri, 26 Jun 2020 16:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A4C1F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0PdSCAAO"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 477752070A;
 Fri, 26 Jun 2020 14:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593182254;
 bh=18kzELTvzTWjkjSNJX6G05xuDOB2wb5K896c44xywRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0PdSCAAOM7/cMWnmQmBnDLgKKErr5BCImr3MlqRKqzq9K126gNWaQKOb1ejXUD36C
 JaAwNv2XbD2Xp0sqmI90NK1nVE0Cj5qjS0/zaCONQr90/J9pVNyxpdTGf+AzErEIEj
 9YUlGdlkXAcjQ+CgNTx+n57S0BKDKMXJeIJYF8iY=
Date: Fri, 26 Jun 2020 15:37:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 16/17] ASoC: Intel: sdw_max98373: add card_late_probe
 support
Message-ID: <20200626143732.GA34281@sirena.org.uk>
References: <20200625192652.4365-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20200625192652.4365-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 randerwang <rander.wang@linux.intel.com>
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


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 02:26:52PM -0500, Pierre-Louis Bossart wrote:
> From: randerwang <rander.wang@linux.intel.com>
>=20
> Disable Left and Right Spk pin after boot so that sof can
> get suspended. Please check patch: ASoC: Intel: Boards:
> tgl_max98373: add dai_trigger function

This doesn't apply against current code, please check and resend.


--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl72CCsACgkQJNaLcl1U
h9Aqzwf/SGf2fgj8jN9fYJ7xeGilqFE9OMNbnJ1MO1ke0OzVBqLabf4aqBDfIf7m
ZiFaz6asXaBTKwwbemx9BwFCgPcQGPHOcchIhyEaVObYSijzQJWSKH0jwXeKTYrw
w0ecwdBdAl5wqrTlqFu0PUyg+rYO7/BpXeUiKOwMW/ajbM4RGbHs6FLjtITUDHOX
laWktBOTttjFWgwP/NotIndRlrrEnwLLxM/FQ6i/nMWls1mGPAXDND/8QAZ4Gjo2
qR88pWIEvsHi+16B7W8cENSAbnEEMaX8HTNkQGk8BeNeluL0TvHoBCDdY/TXhXj4
fXeO95L5qzYenjrymlFppElcgfkUow==
=K2jk
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
