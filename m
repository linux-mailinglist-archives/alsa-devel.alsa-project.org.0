Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7B3165D29
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 13:01:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17F2A16A9;
	Thu, 20 Feb 2020 13:00:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17F2A16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582200092;
	bh=DgIDC6AkM6u7D6TFw5trf2GMUZytPlcHAL4yQI7PLyw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LwGkPz3wQv8FE3RDDS3l6e2ALvJyezPIawASRr1NW9ociFjojKUSk2VilVoeJ4wTi
	 cEaY856NxjOdHZRpvg1kGHcjiVwEMWWWZr0Vr66XwKOIfsqX4Yd834oACY9Rg2IIao
	 DMxMj+hqzXYq9sircy4QqyUARc7ab5uWH5Dru7wA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 316A5F80101;
	Thu, 20 Feb 2020 12:59:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E5FDF80148; Thu, 20 Feb 2020 12:59:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9658DF80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 12:59:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9658DF80114
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AC9630E;
 Thu, 20 Feb 2020 03:59:43 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0F503F6CF;
 Thu, 20 Feb 2020 03:59:42 -0800 (PST)
Date: Thu, 20 Feb 2020 11:59:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC] Volume control across multiple registers
Message-ID: <20200220115941.GB3926@sirena.org.uk>
References: <20200219134622.22066-1-dmurphy@ti.com>
 <2f74b971-4a6a-016f-8121-4da941eeccef@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline
In-Reply-To: <2f74b971-4a6a-016f-8121-4da941eeccef@ti.com>
X-Cookie: You are number 6!  Who is number one?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2020 at 03:11:47PM -0600, Dan Murphy wrote:

> I was looking at using the DAPM calls and use PGA_E and define an event but
> there really is no good way to get the current volume setting.

Store it in a variable in the driver's private data (there's a number of
examples of doing that for various controls, the process doesn't change
just because it's a volume), or if you've got a register cache it could
be just as easy to do the register reads and combine the values.

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5OdKwACgkQJNaLcl1U
h9A0RAf/W6cdjwyRlUnVVDMRW9E8OYU778ZcT/8O3eYOjfj3OliJKZes2TIivLM8
FdRFixhp7U/o0zx3SRlCj4NcwGh5JNXGp5NU26NhEwUlB4WrvGEZJboN4cNTd42z
woKw/OgNgoBjaB79q4OWG8ms8/Wos+Pf2Kft4ihHoAGYfL4udV2CAbcwf0zvfjaU
gI3vDSEwT3C4PIRmwumO2AVW6/23YBuJA8ftoD2hzZPw9xwImpNHayXHKYo3arwO
0hwIF6njdvkMHjTjkrJSPwdcbiRU1AIYTbuFkq0A63tVzVueEn0UKlRAMKDDUX2s
A92V04yL3sc7xYYS2OxKi6O3fkGciQ==
=tSQZ
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
