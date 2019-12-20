Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DCC127AA8
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 13:03:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7027A166E;
	Fri, 20 Dec 2019 13:02:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7027A166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576843429;
	bh=rFzJFOcFHhd0mh2o5rkyYcdXOTmmZYyr/6qsZwJ1tIg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SGrMOTd95jUsw+iXAD1m2Jth+Cr9b06klD716gyB/OMlhIT+loCsKWxhNkV1R9Tmp
	 3AzfTX8Tc/MnJeoMxGxRjETNAAJkYHMyLTkC1l1p+I3C6r6efgyffcJb7BCTpGsJj8
	 7/AeQg8fI2S0xeH6H4aJdTOgSK9YuE+Drab6zy6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D036F80059;
	Fri, 20 Dec 2019 13:02:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E48ACF8022C; Fri, 20 Dec 2019 13:02:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 20C04F8014C
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 13:02:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20C04F8014C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 057D430E;
 Fri, 20 Dec 2019 04:01:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3D843F719;
 Fri, 20 Dec 2019 04:01:57 -0800 (PST)
Date: Fri, 20 Dec 2019 12:01:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20191220120154.GB4790@sirena.org.uk>
References: <20191218162422.GG3219@sirena.org.uk>
 <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
 <20191219123709.GB5047@sirena.org.uk>
 <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
 <20191219130559.GE5047@sirena.org.uk>
 <a10269be-8caf-6e07-71c6-582a1d2c1458@samsung.com>
 <CGME20191219191651epcas5p2ab8031875093df401d9182e7c491eb3d@epcas5p2.samsung.com>
 <20191219191646.GH5047@sirena.org.uk>
 <b0e57646-8a14-e6c0-9daa-28c353dcb77a@samsung.com>
 <31bde14e-1fef-264a-ba1e-fc3051506bf3@samsung.com>
MIME-Version: 1.0
In-Reply-To: <31bde14e-1fef-264a-ba1e-fc3051506bf3@samsung.com>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
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
Content-Type: multipart/mixed; boundary="===============1714805458896616256=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1714805458896616256==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2019 at 10:05:52AM +0100, Marek Szyprowski wrote:
> On 20.12.2019 09:28, Marek Szyprowski wrote:

> > I've tried initially to cherry-pick it to v5.4, but the the code=20
> > didn't compile due to lack of some macros, so I've gave up trying. I=20
> > will check that now and backport needed macros too if you think this=20
> > would help.

> Same issue. I've tried backporting it to each kernel release: 5.4, 5.3,=
=20
> 5.2, 5.1 and 5.0 (with additional backporting "ASoC: core: add=20
> SND_SOC_BYTES_E" and "ASoC: Define a set of DAPM pre/post-up events").=20
> In all cases the lockdep warning and oops is the same. Backporting to=20
> v4.9 requires more changes to get it even compiled, so I gave up.

OK, thanks - that's definitely not the recent refactorings then but
something that's been a problem for a long time.  I'm surprised nobody
else ran into anything if that's the case...

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl38uDIACgkQJNaLcl1U
h9DDwQf/RpDA3CXzUmuNP7lNm2NA589ZoMyxBTqzZ5LEEXZlnhOgrjiX5aYJg8Py
4+/lSkFqCbyXPZ8v09HkgVYeSX7uk35axOOxaNwcLI5s+/APia7vEx+ni91mierJ
rOoOBaKJ+uFhtZ2Zjxr2icu6HsjVbd7uUb5MIQDHjtdZuQ5Q++2E/jlixv/pd2LP
r27kWtDldOALwJbG0eZk5in2q2PdRsA8ZdlQjt7hFlXF9NaqTn4sQ+6DwscmS0uZ
0SUvLEu1OOzOdqq0nrr/GaEwmxsq68S/ZRDoz60LAKDmsO4ByoWdM+7NgT9UrCu7
9C4jPeUPe1CtO/aFXlo3tq/+FgqLlw==
=3XTz
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--

--===============1714805458896616256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1714805458896616256==--
