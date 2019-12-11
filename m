Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0265511B932
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 17:50:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BFBA165D;
	Wed, 11 Dec 2019 17:49:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BFBA165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576083006;
	bh=QD1kYtVyKnan9m8LvNwem9LyOmwApWfNrMmhZQ6pURw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g5Do/+TLQHF1wMB36nszV6hH7L9gt9RH2rIYMDRJCKglo36oEMRTtA/3+PKHY/WpM
	 I0yFcj87fGaIl6smhQWdd+rG6w38xS2iQ6fubRKItOYrXYcANbE7diKdRzpei3MVrT
	 EkSQnDtp3w7IW6Mu/c2jbw4BoUiePKmKbS5NEte4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA686F80245;
	Wed, 11 Dec 2019 17:47:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EF8BF8023F; Wed, 11 Dec 2019 17:47:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D5B28F80234
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:47:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5B28F80234
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F70030E;
 Wed, 11 Dec 2019 08:47:50 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2CCA3F52E;
 Wed, 11 Dec 2019 08:47:49 -0800 (PST)
Date: Wed, 11 Dec 2019 16:47:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191211164748.GB30042@sirena.org.uk>
References: <20191210142614.19405-1-tiwai@suse.de>
 <20191210142614.19405-12-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191210142614.19405-12-tiwai@suse.de>
X-Cookie: Everything you know is wrong!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH for-5.6 11/23] ASoC: SOF: Use managed
	buffer allocation
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
Content-Type: multipart/mixed; boundary="===============0749888936625031916=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0749888936625031916==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline


--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2019 at 03:26:02PM +0100, Takashi Iwai wrote:
> Clean up the drivers with the new managed buffer allocation API.
> The superfluous snd_pcm_lib_malloc_pages() and
> snd_pcm_lib_free_pages() calls are dropped.

This doesn't apply against current code, please check and resend.

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3xHbMACgkQJNaLcl1U
h9AtdQf/SbbHCjvoNrF0CHflfFeKsld7+TSsHqHBlr3Un6xXIWgr6r3GxNnAzOpf
Rmc+JRi8QDpzRAl4deqkvkbeUhJFHRkzuCSd0y/Fhm9odI2847xfKTyoRSMxFio7
aViIzpHFwj6Kw2ZhsDunUyd1o4DbZ2r7YMRYsQgo3bUmY5myKhDHAuLyLvuwEkNw
nqmxbnoOingUJLdklmdg4Xv6OBqJjbYd5O3pwWQsYAzMxw59h3GQp3NsCDnh5sJG
2VopazbjOJ0kvePMZYgOoaDf+hKq5MM9TzIRhaCK/Z94wfbPrb0hijlAxih8jQN8
5+LZ/uMZkQIxZErQBXjmDhnXi9knkg==
=FXIo
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--

--===============0749888936625031916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0749888936625031916==--
