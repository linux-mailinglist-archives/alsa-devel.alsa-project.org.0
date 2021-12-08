Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 162DB46DD75
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 22:10:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1B52246D;
	Wed,  8 Dec 2021 22:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1B52246D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638997814;
	bh=Nhr8a+1T083m2arRQNZR7McftHPXBYN3WlT9Z9eaZmk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QjxVds36r4i6ZzWCupbVuo2nkb6lY/AXsZmmIx/fO7d/sQpJWPwzT5IDxuRU07s6U
	 QxGuCuY2QdGnlzYu6fKMlHRQnN1xv+yh0NYLlNcM1H+N5OgwPE0g5GedUWWJB0jdWA
	 FEuwOQL579ViYnJcEYzVD6ZFpd6x3u/esgyr62JM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D92F804EC;
	Wed,  8 Dec 2021 22:09:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B99CFF804E5; Wed,  8 Dec 2021 22:09:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55BF1F80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 22:08:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55BF1F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m1PBDOja"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E5A1B8210A;
 Wed,  8 Dec 2021 21:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C36C00446;
 Wed,  8 Dec 2021 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638997731;
 bh=Nhr8a+1T083m2arRQNZR7McftHPXBYN3WlT9Z9eaZmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m1PBDOjaUDP3E0h1I76hKmsAi6s1tKbxYbnLs91sbHMcp9JxE1FOs2u1xLkW0Peh7
 XKInZosNW2DMNAQ3gzp8EaeICvmj9+qdwp4d/+pC2P+ZMA36O9gdho1pBbOFX/8KlA
 AwgxKoAVjxxAp2z6/kRSiJTlOlIVOmfzZy4HtOOVMl/tXmloz8I4LRMrlu+ZfIDU59
 hqnUVNQ9XUO0pVZPyvdHTkSo/MLohc6EoJ3cG4K+Oh1YGnhPajC8LXDt9ONyML01WL
 OM3W7JmxF7sgYAACg+U3aiA4CKn/ZSTJuc23eAHViF8RwcqjEZyr+9umpYbU2A95x+
 XJGJ/THUjaNnA==
Date: Wed, 8 Dec 2021 21:08:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] kselftest: alsa: Use private alsa-lib configuration in
 mixer test
Message-ID: <YbEe3tz95ObwMxoL@sirena.org.uk>
References: <20211208095209.1772296-1-perex@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="R7r1l1UNUadmy4Co"
Content-Disposition: inline
In-Reply-To: <20211208095209.1772296-1-perex@perex.cz>
X-Cookie: Alex Haley was adopted!
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>
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


--R7r1l1UNUadmy4Co
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 08, 2021 at 10:52:09AM +0100, Jaroslav Kysela wrote:

> +#if !defined(SND_LIB_VER) || SND_LIB_VERSION < SND_LIB_VER(1, 2, 6)

This barfs if the local definition is used since the preprocessor will
try to evaluate SND_LIB_VER even if the macro is not defined and the
left hand side of the || is true:

mixer-test.c:66:60: error: missing binary operator before token "("
   66 | #if !defined(SND_LIB_VER) || (SND_LIB_VERSION < SND_LIB_VER(1, 2, 6))
      |                                                            ^

SND_LIB_VER was only added in v1.2.5 so currently used distros run into
this.  I've restructured to:

	#ifdef SND_LIB_VER
	#if SND_LIB_VERSION >= SND_LIB_VER(1, 2, 6)
	#define LIB_HAS_LOAD_STRING
	#endif
	#endif

	#ifndef LIB_HAS_LOAD_STRING

which is a bit ugly but splits the use of SND_LIB_VER into a separate if
statement which causes the preprocessor to do the right thing.

--R7r1l1UNUadmy4Co
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGxHt0ACgkQJNaLcl1U
h9AgsAf+J2ovDjD3qesqpI2me9WifDmIlXWGCrVAcfX9prKCdWbEkrzh89T0/JEC
eMAjUtpx3AtYI9OCW67mP+tIDp/z6qpTCcth2XhV2kxAJvs28T+nuVHEs0Wrd6h/
coPN7n99tQ93CGTfYJSSyRIkG564muLVZCZXUv7KKmlNfWyYzGYO2b5o/+pyQ/Eu
bAVMYxDKKjz/newUBzRKCLxckzyBavSYEomuCuYzi6zLpGyGbT07Tq/jO3qhwiw4
kqt6VeXa/jiIjqPtPBRy+jZqpoHP9E/vOBrkD45nifrZZ8KT5XqVdGxT9BzMEcwv
X/uSB1ldcbY5JfStDr2+v7AIEGGndA==
=JMHp
-----END PGP SIGNATURE-----

--R7r1l1UNUadmy4Co--
