Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E701F5639
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 15:52:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B7771664;
	Wed, 10 Jun 2020 15:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B7771664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591797169;
	bh=8GZI2724fyE9k40lHkuRYyAJTNgX7y1yWApYiVyFQfo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E7Vx6WZHc6pxg9Fy3PLDpA56TrYSoz32DPaA8jnvinqnm7RLMTmnrfb8xdyx8/atk
	 JnK39I6jSs8kl6MroC2gU2DDG3KZqiO7oWTxZaa4sjhkmfhxSXsBuM+UTau+w13ARo
	 D8nWL2j1GXJHv6dJCK1xzIEGd9uzuK8mMU8sH+ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E923F800E0;
	Wed, 10 Jun 2020 15:51:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25347F8021C; Wed, 10 Jun 2020 15:51:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6878CF80058
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 15:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6878CF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pmUPluC9"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B799206F4;
 Wed, 10 Jun 2020 13:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591797061;
 bh=8GZI2724fyE9k40lHkuRYyAJTNgX7y1yWApYiVyFQfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pmUPluC9eJZ4izqDHNJF5poHNYcWt3/fzwA4iEMlWW0B3oxzonGDeiFCGERJEFzEW
 U1L4GLbtaRwtAb+/YXamTjXGGVnkI/Y2SQFdmL9qXhZ9lEL8OBAsYhA1gKsFASMk9p
 9R+s7LvDo1lz/hGDdOq9XJDDWC0CQ0XmURdn/2ME=
Date: Wed, 10 Jun 2020 14:50:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [GIT PULL] ASoC fixes for v5.8
Message-ID: <20200610135059.GF5005@sirena.org.uk>
References: <20200610133412.97D6E2067B@mail.kernel.org>
 <20200610134424.GE5005@sirena.org.uk>
 <s5himfzf2yz.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="juZjCTNxrMaZdGZC"
Content-Disposition: inline
In-Reply-To: <s5himfzf2yz.wl-tiwai@suse.de>
X-Cookie: fortune: No such file or directory
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


--juZjCTNxrMaZdGZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2020 at 03:46:28PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > This mail is unsigned because I'm automating sending pull requests and
> > it's hard to do GnuPG MIME stuff from scripts.

> Alright.  I checked the contents and it was OK, so merged now.

Yeah, the tag is still signed so you can verify that - the double
signing was kind of redundant.

--juZjCTNxrMaZdGZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7g5UIACgkQJNaLcl1U
h9BdKAf/XWPNMmwu9y+fYyPn2Oqv3Y7rqPzy1fTDJzCk8u6xEPVqxIbfTTxHbjTS
4HGP4Wsc3f8lGHSTa2zVjKJE4CSsp3g1b/cPrvHyj7fAEooR+07cnfqb8o6w/LhU
fpsx3linmZRt+GNuoyEaGHDZem/1TEs6+clTB65D1dDj9bVExzbMXzN/F5zCU3Bn
3wn/jh1EZRkOL8ScyWPIgYAuaCXjg7Rpp2PhwbdDBK5daNPgxrSKUVQWMhBFJy6E
mdTTv1eGhtcj40+f90X/1W+sFvUWCYfrQUkgTgbR/1od/vAvYkiOarsWZ87azsaW
AuQh2qPAvUUCOp85DLLipmGo/AwCAA==
=l5mB
-----END PGP SIGNATURE-----

--juZjCTNxrMaZdGZC--
