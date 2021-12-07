Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 569C446BE2B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 15:51:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 029182482;
	Tue,  7 Dec 2021 15:50:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 029182482
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638888677;
	bh=ZATyNf3WVgMhUzhfPCepXLkcN7ZvjmNcmN0PLGupu68=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G4ec5py6ckntDEseGqvTcZJC8dfXabK7rqfwWT7L8oTG0tpQ/RbEhnjJRkDEHjFJQ
	 A2k7ZP0uqm5SuCXw2j8Tt7Bka2anGQfFo2zY57JQRlGOubx/6yN72pdKS8u28SB+BV
	 tLApi19rRosk3+572zcWbU0m9u6b+OK9vXWA5s2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3323DF804FF;
	Tue,  7 Dec 2021 15:49:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 235BEF804FB; Tue,  7 Dec 2021 15:49:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF81DF804FB
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 15:49:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF81DF804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oeZmnTtR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 124CEB817BB;
 Tue,  7 Dec 2021 14:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841E6C341C1;
 Tue,  7 Dec 2021 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638888582;
 bh=ZATyNf3WVgMhUzhfPCepXLkcN7ZvjmNcmN0PLGupu68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oeZmnTtRrtKhAhZlTIwlwjqlzmNGARIY0Rk7c0M9IKN/2Y0DjX4oZ2wt/1fxlRX0i
 I1yzzieRBl+BZKAc0Wb16Ap/hiRE0rBHsqnd5JsfSg3t+4wE26UwMUO6rtS7dg9sXE
 Cl6Z4vOJzgnI0VQ+3yLdnUEnKFTv68L8unRWYc2Mm0RSuBGvs5uHXEiq1FQbBF7X+w
 XRnoP50l0qpsEUVwn7tUu2EU6K7pvJ13wCg4AWX6l2Y6uEjHUb89rUHIKlI6MibGdD
 mU6U1rAmcXveM6KMdLjlx2JpmH/6UJPYjOB+3cqua53F3vFWyrHU+vYVtcvRI6rLoo
 gEYGUXiH0jQxA==
Date: Tue, 7 Dec 2021 14:49:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] kselftest: alsa: Add simplistic test for ALSA mixer
 controls kselftest
Message-ID: <Ya90gtjsjiQOxa6A@sirena.org.uk>
References: <20211206160305.194011-1-broonie@kernel.org>
 <Ya7TAHdMe9i41bsC@workstation> <Ya9uvPx37AcOdwLK@sirena.org.uk>
 <s5hwnkgmqhv.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1j0ZY8kvyLv+ERCp"
Content-Disposition: inline
In-Reply-To: <s5hwnkgmqhv.wl-tiwai@suse.de>
X-Cookie: Only God can make random selections.
Cc: alsa-devel@alsa-project.org, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
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


--1j0ZY8kvyLv+ERCp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 07, 2021 at 03:36:12PM +0100, Takashi Iwai wrote:

> I'd like to get a comment from kselftest people about this addition
> with the external alsa-lib.  Shua, what do you think?

Probably worth pointing out that there's quite a few selftests linking
with external libraries already (grep for -l in the kselftest Makefiles)
- eg, memfd wants libfuse, netfilter wants libmnl, clone3 wants libcap,
capabilities wants libcap-ng and there's others, plus the ambitious
requirements that the bpf selftests have.

--1j0ZY8kvyLv+ERCp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGvdIEACgkQJNaLcl1U
h9AupQf+LqSbj7LSvBK0arD4RQ213M46bkg0SE2sdRV8GgYOa93UGIy/0Fne+poO
3yIEdVUpia0maoXWOn1r3n7vmGfp5nilQxHUffrDrAQaajtleA7tTBK09cJqVFx7
V6i8E3KzRIiNLrKGy2RFqYet9gnfL9iw8PB7OsAtHvWPOJ2RZ/idbmOd+RDVvbUS
C+DD4byZzfSYwi91gShTM/Pi92k0XKQOux8rlV7ffreaOqCYScnHBPnzB2NZe/gJ
OiawGeobGfK9rkjz3YiNBfBFTCJ1AdlzGq55GpchYxV6vzVoQ+5uhhFK9UTqlFL5
qJUBGeUsJZiC3XdD03urIwt8EHo84w==
=/36Q
-----END PGP SIGNATURE-----

--1j0ZY8kvyLv+ERCp--
