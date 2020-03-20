Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8890B18D4AF
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 17:41:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E323844;
	Fri, 20 Mar 2020 17:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E323844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584722502;
	bh=0BNF32Ot9S3paqwF1C3COqOTGVZ/vjexQUsZ36K3iI0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ojMxEjfOukSSzGiH1Kc03uHyvT0K0rsogD7XGE39NqBrmbzIabaXdV+SV1mArrsLE
	 ndWlqHs/Cejvr9KBjh77apquHL2l8G4fPYo/a7jAmvlh99ak3m6d5ZiEoB/sVXgWKl
	 EMeg8+RuCvRaWU9FD/oL2U9ghAP2m8PqCO9siaBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05D07F80162;
	Fri, 20 Mar 2020 17:40:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B365F8015B; Fri, 20 Mar 2020 17:39:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8B60AF800C0;
 Fri, 20 Mar 2020 17:39:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B60AF800C0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 443831FB;
 Fri, 20 Mar 2020 09:39:50 -0700 (PDT)
Received: from localhost (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED9833F305;
 Fri, 20 Mar 2020 09:39:49 -0700 (PDT)
Date: Fri, 20 Mar 2020 16:39:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH 06/14] ASoC: SOF: add a power status IPC
Message-ID: <20200320163948.GD3961@sirena.org.uk>
References: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
 <20200312144429.17959-7-guennadi.liakhovetski@linux.intel.com>
 <20200313143956.GJ5528@sirena.org.uk>
 <20200320115203.GA2130@ubuntu>
 <20200320121952.GC3961@sirena.org.uk>
 <20200320132732.GC2130@ubuntu> <20200320150727.GD2130@ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VV4b6MQE+OnNyhkM"
Content-Disposition: inline
In-Reply-To: <20200320150727.GD2130@ubuntu>
X-Cookie: Laugh when you can
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org
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


--VV4b6MQE+OnNyhkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2020 at 04:07:27PM +0100, Guennadi Liakhovetski wrote:
> On Fri, Mar 20, 2020 at 02:27:32PM +0100, Guennadi Liakhovetski wrote:

> > No, this isn't a completion - it's a counter. I've used atomic variable=
s=20
> > before, I cannot remember seeing any difficulties with their correct us=
e=20
> > described. Do you have a pointer?

> Actually I'd even say this isn't a problem. I think it's safe to say, you=
=20
> won't suspend and resume your audio interface more often than every 10=20
> seconds. That makes under 3200000 cycles per year. Even with 31 bits for =
a=20
> signed integer that makes more than 600 years. I think we're safe.

The problem is that atomics are just incredibly error prone - for
example they're just a plain number, they're usually counting something
which is not being locked so you have to be careful any time you do
anything around them.  Their lack of structure makes them harder to
reason about than most other locking primitives, often harder than it's
worth.

--VV4b6MQE+OnNyhkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl508dMACgkQJNaLcl1U
h9AwrAf/eWl+Yb8qB8Fr4u5YFzbxMd1qzAcjCqwrHb7QunWcMmllBJOAYCyPin/C
3n84GcOZezV6APmoZXx6W8KrrMlYBo5BMHXp8vXCzZ36B3UQgdqjLMsFr4pQxp8H
BKYXtow+NC9B2/h3HpegWkQ0wSAF2ohd3VI5k7OhPwz2MhWeNO30bxQx7dkxFPtE
3c3EFq77PB662iGDR4YnKuc1MUDblfMtPg/Je866pg0ZCNgQ7Bq9TVxQzWrF+R4b
tOsZdeYwGO4Zo7Vj/+9GoVw5kYo30961PXjb9Kywa3rHLuGXXNYC0E4yEyOEKQbw
dow3mx9kcb6v0fCeINu7R6hxXru/Jw==
=6VtB
-----END PGP SIGNATURE-----

--VV4b6MQE+OnNyhkM--
