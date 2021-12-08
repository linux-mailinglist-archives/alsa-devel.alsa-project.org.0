Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE5146D564
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 15:16:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02EEC249A;
	Wed,  8 Dec 2021 15:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02EEC249A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638972966;
	bh=7z26PP8HWRt0fOrNVLCcjPbHQ+P6Gq9iCx6EvNvW9uE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rL7Bl4oRvCX9Ct9InBvYIrzW0YKmHxYnfc6JG8UI3yuwVvQLevmuYeGZb9f/zllI7
	 jasVMkSJKWj+A5rDmrw/ADwWKGQju2qizxo5RXX3SIu0jfbGE218I4dfhCGEpGpJol
	 wFoLBrFvY8KflfZHs3auDuwsUSncf5nWMVHuRy68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FD7AF804EC;
	Wed,  8 Dec 2021 15:14:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DCADF804CC; Wed,  8 Dec 2021 15:14:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBC6FF80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 15:14:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBC6FF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GRcSQ5WB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 517FDCE2047;
 Wed,  8 Dec 2021 14:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF211C00446;
 Wed,  8 Dec 2021 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638972880;
 bh=7z26PP8HWRt0fOrNVLCcjPbHQ+P6Gq9iCx6EvNvW9uE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GRcSQ5WBM6hJOzvvxxdbxN1DlvZVQMwISH1hzyyD49pWpAi+5YLUCfbPbCJhV8V0a
 4wFR16pPbbEKWupPJ9tw5rgaYc0/oLTQ6VCCsE4ub/SoP2E0JYzvfe+eL1wu6QNyP1
 UQpy2W4KTwoDDJoUYCvmSD+8sjtIzJD9Zja3KBYk10QRj+G+/pAxOWizFztqjh2JCQ
 8xZp4tC/o5EbX8XHzJcWrydLyJGeeFOB7DUb1AOXoJrgTVW8p7tyHXuMmb7rmg+Cf8
 Y+MP1XtSWAUWkesDrXmCEt5Lh3ujHQrlzuSojit0OaYT/9WD12BjLzK8MZnzLIsHxn
 k9XM3rU+LWANA==
Date: Wed, 8 Dec 2021 14:14:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: [PATCH] kselftest: alsa: Use private alsa-lib configuration in
 mixer test
Message-ID: <YbC9yxBeYdcQ9j9d@sirena.org.uk>
References: <20211208095209.1772296-1-perex@perex.cz>
 <76f28e78-0e9d-45ce-96a3-5c36f880ea6b@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Y6EQkDWcLeAjBQmy"
Content-Disposition: inline
In-Reply-To: <76f28e78-0e9d-45ce-96a3-5c36f880ea6b@www.fastmail.com>
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


--Y6EQkDWcLeAjBQmy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 10:55:41PM +0900, Takashi Sakamoto wrote:

> I'm not positively for the patch since it can take developers puzzled due=
 to
> the symbol dependency newly introduced in unreleased version of alsa-lib.

Shouldn't the version check and local definition avoid that issue - if
the version of alsa-lib doesn't have snd_config_load_string() then we'll
use a locally defined version of snd_config_load_string() and not depend
on the alsa-lib symbol?

> It's better to check the version of alsa-lib in Makefile to avoid develop=
ers=E2=80=99dole
> if we have enough respect to embedded developers, especially forced to wo=
rk
> with legacy userspace. (and it often occurs).

Or just avoid using fancy new library features - if we need to limit the
test to only building with bleeding edge versions that gets restrictive.
TBH this is probably even more painful for people working with
enterprise distros than embedded systems, if you're building everything
for your target it's not usually too bad to drop in an updated version
of something like alsa-lib but if you're using disro binaries it's less
idiomatic.  Either way it's a barrier though.

--Y6EQkDWcLeAjBQmy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGwvcsACgkQJNaLcl1U
h9CFZAf/XW0hzolZYnySr7GSN/hpeVNw7U7OKtr+UuctxVrwP5IfoKXYC904Exi0
ysElgzTGbSlLNEHplU7xFncFtbxD3u9Fjo9xnHjX5WImozSXB/d0FeeeV4p8ZOqV
AWgtPtc32Xu8q8LOGyKSz8KTCjQ3N+4qM6Y0Of4wMFMdiBbUcd70MWwPcbqaZGWo
XA1eRj0DwVZA8+j87QXeab2gYcFMexW0bHN0i6k/v+sQDinivAA/M5xrBvThLTC1
eCCuAHgh/6ljblVDnK0DZ2VLqMrfDDf5CKxe5XYGxND/39tiUgAy3EpV2HNYUHWA
ZDokZipm9yQWSCOOHl9pn9cS8xgBrw==
=uxt+
-----END PGP SIGNATURE-----

--Y6EQkDWcLeAjBQmy--
