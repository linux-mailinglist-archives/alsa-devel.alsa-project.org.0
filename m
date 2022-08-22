Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1517A59C025
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 15:08:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 897BA16B2;
	Mon, 22 Aug 2022 15:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 897BA16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661173681;
	bh=tc+H2IZAZYCcsk+W/qTN/Gurc56MzvlVN7bbGRvcG/8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSoLQpSAuqSek03UeF+7bRkQon1XD7z2/aoVDjuvz6iPGi69T2Ir+L+Gro1UIINqg
	 i9X3LjMvfXZTgm+v0BEFiYWBu1Xzmp1SXaJRarmivH5DJHz8NWJE07GCIzl2MbCdUl
	 905pAEGVBjmc490laIXOw9J2U6oHaqx9Ekfaidlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BFA1F800ED;
	Mon, 22 Aug 2022 15:07:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71141F80154; Mon, 22 Aug 2022 15:07:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 242A1F80154
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 15:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 242A1F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UWbhguo6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EEE20B81193;
 Mon, 22 Aug 2022 13:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A786C433D6;
 Mon, 22 Aug 2022 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661173624;
 bh=tc+H2IZAZYCcsk+W/qTN/Gurc56MzvlVN7bbGRvcG/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UWbhguo6slX2gCkBvkQDKi4z6EJRsxjArA7HDElXkjZM/QcrN7bJXNogEVMDwzfhR
 wT8xkpFbn/8v1NhEkjj091LbJjSYthE2j7m8R/BjYJuFa+C0sl1ltXbzaP9ozJwKi1
 9W/TlWvxIuY/U3bG8AT8l30zQ4WdyM1ZOcngH8lb3MsczRS7ulh5FimlfTtUZV3oUb
 afQzRsua+Mnsll8h/6ETgCYdNO7/g1legmMBODv1HG6ex5WoQIYHZk7CujwjgG+fU/
 1a9jy4qoQUyQZOqJt+E7gfllyZl8FTgviAzqdMb7LhkdSq5Cq6wOGXIvZSoaj23Nip
 8sPWCHgEN8+uA==
Date: Mon, 22 Aug 2022 14:06:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Add support multi fifo sdma script
Message-ID: <YwN/c0Q8ooBCIB1z@sirena.org.uk>
References: <1660555546-24223-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u43b6UwMPrtGu+8T"
Content-Disposition: inline
In-Reply-To: <1660555546-24223-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Am I SHOPLIFTING?
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
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


--u43b6UwMPrtGu+8T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 15, 2022 at 05:25:46PM +0800, Shengjiu Wang wrote:
> With disabling combine mode, the multiple successive
> FIFO registers or non successive FIFO registers of SAI module
> can work with the sdma multi fifo script.

This doesn't apply against current code, please check and resend.

--u43b6UwMPrtGu+8T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMDf3IACgkQJNaLcl1U
h9BAlQf+L5kP4l9lQLSb9J7A0IJngh/vpXFA7wuR/7oW6SzHZxsyamK1IEPXVijQ
6Is+lGT3ObIPZydx36IzJS+qkTOCIbuNTjeAl12SM/qCOQX4wZzhn80eKO3SKtvK
9PVvmTaFFWvn+ANBeNWDKOXtdawBfBK5K+yLhiTNifOqQZ+8e0kL0TmnOhdecYEw
//MgiNAkSEQV3c8F+u6JmXReT/9J7LLSGKbxTzu2Il8rXRPPbEfrfTxTF9V5BH3L
XAYQYUTdrQ9/1rPXEW8/jAPJxvEOljTT4Q6iFAN5KF2xslmGD7pCuM5FW9ClHuCm
rFKX5gZWGOaQn33E+zDa8HWh+usyVA==
=BNOe
-----END PGP SIGNATURE-----

--u43b6UwMPrtGu+8T--
