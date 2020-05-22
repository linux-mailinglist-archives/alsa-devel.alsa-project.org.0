Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0811DE51B
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 13:10:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC51B1881;
	Fri, 22 May 2020 13:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC51B1881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590145802;
	bh=bIHJaG5iemRX6gaZmHvv9BNrNgZLSGZUC919UPUBGTY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q+x6pKM7otobFx5tctqfTR/L+/ugEkwxPQF2IVgBiSGpVyMIIOVBHQ44UJMUH8XHP
	 BiBDda3B6V5O4OE+yFeb0zcFf3QjbrXf6/CFCsJiA889wOjAr1ACgbP1SnLrzWSAlt
	 JXxoznaADwXo3VR4CCEnknpjbSjPZmynuackcNK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1ABBF801F9;
	Fri, 22 May 2020 13:08:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF275F80111; Fri, 22 May 2020 13:08:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EACB1F80111
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 13:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EACB1F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0MFbpk+E"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C2E0206B6;
 Fri, 22 May 2020 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590145693;
 bh=bIHJaG5iemRX6gaZmHvv9BNrNgZLSGZUC919UPUBGTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0MFbpk+ElFzl+/gU0fhGCZmAo8+Z2cmtDBTiJUSvjlbaxICLSfZj3S9n+EFrL5bvS
 Ywq2Phkw3nYaUB25uiTEi0del0GMaaJiGxWnR2GZ1lerfqPYsrZnCL06s8GeOAiCJ0
 xKEmMC+Kltsqp1E3wd15vlDqiW+zzhQ39KqT467A=
Date: Fri, 22 May 2020 12:08:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH v2] ASoC: amd: put off registering mach platform_dev to
 avoid -517 err
Message-ID: <20200522110811.GB5801@sirena.org.uk>
References: <20200522081738.11636-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline
In-Reply-To: <20200522081738.11636-1-hui.wang@canonical.com>
X-Cookie: C for yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com
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


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2020 at 04:17:38PM +0800, Hui Wang wrote:
> If the mach driver's probe is called ahead of codec driver's probe,
> the kernel will print -517 error message although the audio still
> works finally:
> acp_pdm_mach acp_pdm_mach.0: snd_soc_register_card(acp) failed: -517

This is just a bodge which will be at best unrelaible, it might work
around your problem right now on your specific system but it may well
introduce issues on someone else's.

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7HspoACgkQJNaLcl1U
h9BoQQf/Xp45HQkhgO3Mfw386E5DY3rRRdebkon6RMeIbhGL+KwjX8zTZQUonwiy
xfNUYPZSSnw0a6+4fhC1txnQDi2MxHsaft2EYCY1rqlbtzqF29WrGCzkrY6M3JAm
yXgR0bqYIrhn6vW95dFEbrnVT1t7Pij7ebqBGUtyDPlkaBZT312zDOlj2a0GJv7y
IXUHHcN00ybVmOsRMIyP+bcb+XFk1Xt6GQmdjbsK3JJyEGCfgxAQzo2Sd+I/iUlT
4LLNUKtDoz6nbgadiYXaqIuag6pC4/6aVJPQym6Sz0TBHfwCDQ4sRmSC0g2Wx3Cq
mt41i5FXdv7qHceqNElXilve6hkVLA==
=7kUk
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
