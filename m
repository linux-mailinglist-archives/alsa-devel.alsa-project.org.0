Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD5866DE99
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 14:17:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E1B656E2;
	Tue, 17 Jan 2023 14:16:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E1B656E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673961459;
	bh=4lKWJb/mXJGzfCNp2rf7nwCDRK7HqTC6ZXMnC4L14SM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MPBcNGOq3XqXizVnQ4vuOlrrDa3V7/np/aouxmu0SwCw0UpbtTIrgYllk9bGLgzrU
	 3tPDVH2gz6pTPoBGpxxqIIz89HVPIefD4/xEWhm169gTBnMYSTOTtp25KXKPzCq+OG
	 1d+INTmpLjxo5mn/SItx+8/7Gf+iik4VUMgzBsu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BDA7F804DE;
	Tue, 17 Jan 2023 14:16:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3C4EF8026D; Tue, 17 Jan 2023 14:16:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FA99F8022D
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 14:16:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FA99F8022D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ixj2JGhz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A83006137B;
 Tue, 17 Jan 2023 13:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF68C433AC;
 Tue, 17 Jan 2023 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673961393;
 bh=4lKWJb/mXJGzfCNp2rf7nwCDRK7HqTC6ZXMnC4L14SM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ixj2JGhzPMyRnMt97j0QufhiXrBvR7KjxQT+jIL6N4f2xKj8dXaAE3u0jDEynSXyq
 KziKgQMu6ZTm7iRHeJ7ld6pQDzSklI6dPV8GjAaSmq8LCr6NpqdfA38FETVvYszsMw
 bP3uYxeax6BIkCkErQrpDKNxDaNpkVNhfeptTxR4IFJM2n2Z5fOwv1zx8xpBEE7Mfy
 tU7Zr8U5VOXUSev2aaRqEJrsBXmuJ0qedxyHhKFF5dNKJ9i6t8nrqxo/P4irWTBmGs
 zLiMZl+6UxfRTUVWE1ft7PCjU4BVcFPApxcTs/uLRUV6ulPT6AbS/8E2sfHnySKaAA
 r509fCeGjuDJw==
Date: Tue, 17 Jan 2023 13:16:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: SOF: sof-audio: Fixes for widget prepare
 and unprepare
Message-ID: <Y8afrS+wfZujFRHS@sirena.org.uk>
References: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UkJ9iMLTMGBEewyA"
Content-Disposition: inline
In-Reply-To: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
X-Cookie: Serving suggestion.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, rander.wang@intel.com, yung-chuan.liao@linux.intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--UkJ9iMLTMGBEewyA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 16, 2023 at 02:55:03PM +0200, Peter Ujfalusi wrote:

> Mark: can these be picked for 6.2?

Well, patch 2 doesn't apply so not right now...

Applying: ASoC: SOF: sof-audio: Unprepare when swidget->use_count > 0
Using index info to reconstruct a base tree...
M	sound/soc/sof/sof-audio.c
Falling back to patching base and 3-way merge...
Auto-merging sound/soc/sof/sof-audio.c
Applying: ASoC: SOF: sof-audio: skip prepare/unprepare if swidget is NULL
Using index info to reconstruct a base tree...
M	sound/soc/sof/sof-audio.c
Falling back to patching base and 3-way merge...
Auto-merging sound/soc/sof/sof-audio.c
CONFLICT (content): Merge conflict in sound/soc/sof/sof-audio.c


--UkJ9iMLTMGBEewyA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPGn6wACgkQJNaLcl1U
h9DkFwf+L3Xv9gXE8N+5OePoYG+sKgXW0ccZqjae1yAusNpDIuCqj9/mHZ8bCbVd
8/EdH+XeVAhrKM+Me8VMBB/8oez+6gZiH3eLMRomG5fhNV03Ok/pvGDONyTIalW6
qiFMZzkX/T/VklI9WKtwZFBn3t78k8ybQ1zGgwRdCrdvH5TGzmYqdnB8SyVpc7sQ
s09HTvI85fTTQQinCd5dsov46Z1zT1K+spIa0WyRT1iiUTwouIHBSWmjtwBz5vc1
2q1ixJ1wM2D+edBGqYfIj16zJ4pndKLiCw8FaP3WpsDw5XQBoZAa1Ra2lLU1xudn
kTsJJAOloytYO2aIRfAKttI4cZhCeA==
=LorA
-----END PGP SIGNATURE-----

--UkJ9iMLTMGBEewyA--
