Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D841804A7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 18:21:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81C37167D;
	Tue, 10 Mar 2020 18:20:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81C37167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583860880;
	bh=7A8AB7nbUwmJqoCigu/5pKPKjfkrehh/y+AgzkWWe9M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IMuCG9K5LCvQtwKTY39QjZq6qA4rgGOoyXAn+JxZLxteDcyne7bITwSSfQEqqyTUE
	 c3TM4Ibaf/+jbZr0XevN3heKOhoMe0rjmlEsvoeaXevnrrVyIwO9KAGQTbdKROcuBQ
	 Rv62newgMFxV75JnMOmf3ggzDEHwLFJRUze7+Qk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A549F8020C;
	Tue, 10 Mar 2020 18:19:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAC8CF80217; Tue, 10 Mar 2020 18:19:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 28C14F800BC
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 18:19:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28C14F800BC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE6131FB;
 Tue, 10 Mar 2020 10:19:31 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CDB73F67D;
 Tue, 10 Mar 2020 10:19:31 -0700 (PDT)
Date: Tue, 10 Mar 2020 17:19:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/3] ASoC: rt5682: fix compilation issues without I2C
Message-ID: <20200310171929.GM4106@sirena.org.uk>
References: <20200310163509.14466-1-pierre-louis.bossart@linux.intel.com>
 <20200310163509.14466-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7vLGWvOrvbSM0Ba8"
Content-Disposition: inline
In-Reply-To: <20200310163509.14466-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: In space, no one can hear you fart.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, Oder Chiou <oder_chiou@realtek.com>,
 alsa-devel@alsa-project.org, kbuild test robot <lkp@intel.com>
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


--7vLGWvOrvbSM0Ba8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2020 at 11:35:08AM -0500, Pierre-Louis Bossart wrote:
> Exclude all I2C-related code from compilation to avoid compilation
> errors and defined but not used warnings.

I think it would be better to do this by factoring the bus code out into
a separate file like we've done with I2C and SPI, it's neater than
ifdefs and easier to get right going forwards.

--7vLGWvOrvbSM0Ba8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5nzCAACgkQJNaLcl1U
h9Ahdgf9GtEefAoubbmCuL4eVgPW9s249eRfX/e3BahOyTV3DbTZChfox+aIrs7l
qa8VxXRM9SZDdU9jEZ4fV0wxZnuWNUxiRkjLDU7SrNWtLiJKLrWwnezRjUxpqnOx
tCcJsMa8Xpu6xQ/flwrN6X6lhYeWiSecazW0SqKOgCE6yi/14scsqi2cyLCpXcS+
Z7vbFWpznCY0e898Vq/2yC7UH1gYOnUDH7zeA1eBT3r7t3sf6SwCSpNJZm2+KrRB
U5Z4rVm5BfJdGNohk4xlEEilLi6EZ99wVqYgAeyuvvyzUJUowipOcO2atW6qDYq3
B4L72fu7iSwaei6Zpk3Un9wwarpiLQ==
=6FvZ
-----END PGP SIGNATURE-----

--7vLGWvOrvbSM0Ba8--
