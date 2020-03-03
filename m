Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 968711775F9
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 13:35:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 272E11683;
	Tue,  3 Mar 2020 13:34:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 272E11683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583238915;
	bh=2rCSLxe62hKFmu9Wq3m9gb95gGynLEiWwhZ3yjr9GzE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Euate91WgI/mOO1cOXylg9o078kkhH+R1//FEgM/TzIc/6pz740n2aC1EXg8A4juk
	 gcv4b9n3UtegDdz0GmIA3wwBYvWfk+ZUaOsEg2vjy6cvRe8eVopuJArBE0GTqyk4te
	 AOTfKcpUObX27bxu33FDnYLvX/yDeeRqiZ2LkWoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 363D8F80266;
	Tue,  3 Mar 2020 13:33:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95E6BF8012D; Tue,  3 Mar 2020 13:33:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D11EBF8012D
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 13:33:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D11EBF8012D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8B93FEC;
 Tue,  3 Mar 2020 04:33:23 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A66D3F534;
 Tue,  3 Mar 2020 04:33:23 -0800 (PST)
Date: Tue, 3 Mar 2020 12:33:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] ASoc: amd: use correct format specifier for a long
 int
Message-ID: <20200303123321.GC3866@sirena.org.uk>
References: <20200303103903.9259-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Content-Disposition: inline
In-Reply-To: <20200303103903.9259-1-colin.king@canonical.com>
X-Cookie: Drilling for oil is boring.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Akshu Agrawal <akshu.agrawal@amd.com>
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


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 10:39:03AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently the format specifier %d is being used for a long int. Fix
> the by using %ld instead.

Someone already sent a fix for this.

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5eTpEACgkQJNaLcl1U
h9AKuQf/U01aci745PIHD/iQ86xIE2c0Ph5wIDFYgVS45kaTlPwBGX6iX72t/5tT
/BesrakIoU6wHxO5wNQst+QuxCauSfQTqwuqtA4k4P/sizM7M5NPcoxeM/uECmGf
Z91qqtfZq492X6yWceLwhCt9SA+5xzJ1bKdeETaOGaiJ594qhD/4+22WjhuibSF5
FHcllXvFPVKZCVGB0QOAVtUpBK0NQfRBsjshPlNLwMsop+dXJSfI3YhrhiIq5+sS
41UM1RDsJu3jGE6Lld3dBl5BgUdxR5yxudSuCqPtliEYnKyINev6qqWrrGoiwZ4B
SbuwgxiOqB11TS0lW97afaTVtdAETQ==
=tEk3
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--
