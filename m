Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 640321004C0
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 12:53:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4B821690;
	Mon, 18 Nov 2019 12:52:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4B821690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574077987;
	bh=tpHzvQeiQ4IMICq7nEQ9gtJ1rnFRJsmJDAoCXsArXGU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FE4qaTjFpSlKwIf6Nd15XzNsQq9yGKp227vFHH6Hz+lU2Y/xsp+JE61hMf/rep2Bl
	 VEcCJZy+20ABS6pswy6KeYUutrAiyZhJo352RyM/c/GktqqMpp89Yl+shp3fbz1mqb
	 dw0G21hMeMinu0C5nddTNZ+nKl0a038wi6DAhSiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CED5F8013D;
	Mon, 18 Nov 2019 12:51:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FCD0F8013B; Mon, 18 Nov 2019 12:51:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D5E54F800F6
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 12:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5E54F800F6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EF191FB;
 Mon, 18 Nov 2019 03:51:17 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 928F73F6C4;
 Mon, 18 Nov 2019 03:51:16 -0800 (PST)
Date: Mon, 18 Nov 2019 11:51:14 +0000
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>
Message-ID: <20191118115114.GA9761@sirena.org.uk>
References: <1573847653-17094-1-git-send-email-david.rhodes@cirrus.com>
MIME-Version: 1.0
In-Reply-To: <1573847653-17094-1-git-send-email-david.rhodes@cirrus.com>
X-Cookie: no maintenance:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v2] ASoC: wm_adsp: Expose mixer control API
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
Content-Type: multipart/mixed; boundary="===============5466626036764630850=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5466626036764630850==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2019 at 01:54:12PM -0600, David Rhodes wrote:
>=20
> Changes since v1:
>   Updated commit message
>   Handle controls without subname
>   Call snd_ctl_notify() in wm_adsp_write_ctl()

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3ShbIACgkQJNaLcl1U
h9B2hQf/ZR9aFyB2gK4cJBAnPgmbX4tTgVj2+RHuoOM+OoC5MgYPHB1mxDrYPLKK
T8mZHmWFUuiyg3bcv9hwV2C+UkRznWpnCpWqWJtX/FhMFw2VrxcrUatNaZesUXaM
eF/h2rYUqRR5PwQu9Jt7Dhte9rrPmKP/THTb4El8la1l0mn2HqfuhNCOclWnzORV
SbhgO5W9ZL0B1MeB9Y6pOPldS8FmjqYsfCqSsZ7MvmqflLpAgLtfWagrvqObcX3q
nW8k6c3UyihLxBL+JRvMB4/9M9NK3l+7eFJH/Ih6mBP01+ZJGEqgosG5sIZHC4WS
EOTS0oetzY3d0hekyg99C8iL0PyetQ==
=X1JB
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--

--===============5466626036764630850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5466626036764630850==--
