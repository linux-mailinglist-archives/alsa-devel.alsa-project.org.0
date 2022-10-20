Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA03606245
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 15:54:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EB118683;
	Thu, 20 Oct 2022 15:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EB118683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666274098;
	bh=RZeq8W1/V8H33koWZVSAJlRBDQ0L5DUCHyfXwjUWORU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vw8T8KgFJxMgKgfMhwjUZI1ZyUqbU6Spr40F8UhiISnmW77mZpwdHBE3h7BtMMOEQ
	 mnoIlaGbBrnQ3Bfkw/FwHodH91ttQFzvHD3o0p8Ocy4m7EfxhdxyJxMC33ifp24oxU
	 WRFgWJTa5ufpgCuHy3QEaAcEklERKi0xUwdky2ZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC086F800B5;
	Thu, 20 Oct 2022 15:54:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51B08F804D8; Thu, 20 Oct 2022 15:54:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6D9EF80137
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 15:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6D9EF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DY7c+1r7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C54161B96;
 Thu, 20 Oct 2022 13:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6066AC433D6;
 Thu, 20 Oct 2022 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666274037;
 bh=RZeq8W1/V8H33koWZVSAJlRBDQ0L5DUCHyfXwjUWORU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DY7c+1r7C6SUFo2dQ8HFrWvxG5coZth6AKNMQ0V4fAw8nvzI3jvqutWM4tSeb2moT
 XGuHdr8EoTbC7chyBqI/clmtqYhvc18v+6/0wNfcWOnTlb0HbIUtAmRGEOtAwofLLC
 nPY2iy+aGuOIp0Opo2S+kXG4oe+6KwjAtahvvCTSDH/zG/6WNDa91ZRZXczjsRrb6V
 6RI/2IxRC5AKR2+XOoefyNzpmHz0VBPLUq6L5F0kUF/VCbmhIaa81zONqrpp8b1z+7
 6+1oFFSU3o7vb5VyVDSKPpUN5O7aziIqL9P/cICTqybLACsxy3vzMwBNb4XqLlRTAF
 UREIME7UCVlIA==
Date: Thu, 20 Oct 2022 14:53:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 10/10] ALSA/ASoC: hda: move SPIB/DRMS functionality from
 ext layer
Message-ID: <Y1FS8PxChyWe4WfD@sirena.org.uk>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
 <20221019162115.185917-11-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Za8gDlWWAC24pOZ/"
Content-Disposition: inline
In-Reply-To: <20221019162115.185917-11-pierre-louis.bossart@linux.intel.com>
X-Cookie: Today is what happened to yesterday.
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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


--Za8gDlWWAC24pOZ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 11:21:15AM -0500, Pierre-Louis Bossart wrote:
> The SPIB and DRMS capabilities are orthogonal to the DSP enablement
> and can be used whether the stream is coupled or not.
>=20
> The existing code partitioning makes limited sense, the capabilities
> are parsed at the sound/hda level but helpers are located in
> sound/hda/ext.

Acked-by: Mark Brown <broonie@kernel.org>

--Za8gDlWWAC24pOZ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNRUu8ACgkQJNaLcl1U
h9CBjwf/SR7otfKZIsszdKk4yBED75ntF439ao40ZfP0aJlDdn6IkNB0kAB0cfGo
CHSKs19oam44HJdFHgKue71pgdgmgM/bfWmBfXMkhZeFtkEmbGMAnrGTijqNaV++
nsFKg64AoKXmEGB51OtiJtGpHayXUw1/6o+hB48He180eA8u3TjRAJEJmeJlcuE+
pqBmCDkUcDoeVvHGFbDTaCMe4rOQThx8ut5y3uuXskdenFzYTxlXIN3aRN3wX+au
3kLadJsc39GpIY75ez3s40cFFrAwlqOxeZeseNdAMUDJyBpHUMVLAcZa2Y7mSmvT
ebA/ShpLLj2PVNrunLKO42ERITBGpA==
=tcCv
-----END PGP SIGNATURE-----

--Za8gDlWWAC24pOZ/--
