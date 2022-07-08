Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A6E56BD03
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 17:45:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3080983E;
	Fri,  8 Jul 2022 17:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3080983E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657295158;
	bh=C2o8pnQg49NHc81qJegDak3fh/DbNuvU6TDy4IEp1nA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZV2wYAjeOn7FYJqz0I/7kjL9xA/Op15WW4i0GmlIjj09JxmXLCJn4SvRj6nugyBz
	 RfQU6dAgpjUE2S3LDtyq6bDkEuPeORlm/Lx1EBpWz6uKaVWBS4EMnJx0EdTiylLxjH
	 kxrf/MpXMYt06Nf817OYwkHlHt9Y5hoCxW4Cmtyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DDC2F80166;
	Fri,  8 Jul 2022 17:45:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88221F80166; Fri,  8 Jul 2022 17:45:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADE40F80166
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 17:44:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADE40F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p7HdZb2I"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CBABB60EAD;
 Fri,  8 Jul 2022 15:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E99C341C0;
 Fri,  8 Jul 2022 15:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657295096;
 bh=C2o8pnQg49NHc81qJegDak3fh/DbNuvU6TDy4IEp1nA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p7HdZb2IKyKj9aV2OP461sfgSCAkq3EKwTxkbBaYF/Szefi7nIFHxlyaMEsx7+F6D
 UZU9X7z0fq+M+W5iJMpZilXRCizHYQuf3ibCdW0cIpmO+9q8BQpv9iygbLvDCYO51u
 aaAG/0YXh13eQmaNE28AKgL/zz3pUS4g6iHrAV81stosCBlrtlrqalGWgOsBENvONF
 swb1jyVXKyUypm7jLgoTdHeXzfRjuoBFlvFdAjZPRXFJYK4XUmf4QJVpzYZguWw5Lg
 4cdbRX1s8GUSjh0sJOqO1KoB3sKtEQZrKGNqRT2hi8RxJNfA8FfaC0yacpq7Pp777N
 h+xBq5OuLDAwA==
Date: Fri, 8 Jul 2022 16:44:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: Intel: Mark BE DAIs as nonatomic for hsw and
Message-ID: <YshQ8N8Rx7Hizk8B@sirena.org.uk>
References: <20220624134317.3656128-1-cezary.rojewski@intel.com>
 <ac2b7d8b-a5be-4fac-169c-eaca185c9746@linux.intel.com>
 <3d9b45c0-b415-21d9-6af5-68fa1001ed17@intel.com>
 <34b54e4e-8997-c2b7-fdf0-24a1b95121ab@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bcVYb0lY7rinzLlw"
Content-Disposition: inline
In-Reply-To: <34b54e4e-8997-c2b7-fdf0-24a1b95121ab@linux.intel.com>
X-Cookie: Baby On Board.
Cc: hdegoede@redhat.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 amadeuszx.slawinski@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com
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


--bcVYb0lY7rinzLlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 27, 2022 at 09:45:30AM -0500, Pierre-Louis Bossart wrote:
> On 6/25/22 03:29, Cezary Rojewski wrote:

> > Warning is one thing, but will you be also getting rid of the
> > if-statement in soc-pcm.c that actually forces nonatomic=1 on BE when FE
> > is already declared as such? If the if-statement stays, I believe the
> > declaring BE DAIs 'correctly' in the way to go.

> I meant just removing the dev_warn() only.

> See https://github.com/thesofproject/linux/pull/3723

Is something going to be upstreamed here?  I don't really mind which
solution is adopted here but right now Cezary's patches are the ones
that were posted upstream.

--bcVYb0lY7rinzLlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLIUO8ACgkQJNaLcl1U
h9Ckgwf+Irg6zg2BsL8c1Oiv+50hqBPXRBjaBs3OV1bfLZC+BdndYzLyY1gyO2qC
ty7mmAskWzLVTp9+ofRukWK/6hPt6SQkGp2JMxaxHXgU+tnV+GeGttRDfzgqnh9d
TeZFZAsMWrJIPE3GYdx1KJyke9g4nNCPh+N5e184XMss/Tn1r2ozomvEubnBOBaE
wyfP60qhNjKqihTFzr1lXEBMUShqrifhIIzGwPp8A+PeDzRSXEwsKGoSyoxU1n36
1TaqdnG+S7EIvH+9liMZ0HYlt3iYX12f0N9VWVhcIWW6SpDG90XeY7wtvH/apZz0
kahZqQ1zmuTPBBFSksFdn1GXXnC5WA==
=teEq
-----END PGP SIGNATURE-----

--bcVYb0lY7rinzLlw--
