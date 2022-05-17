Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D99FD52A2AA
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 15:05:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EA3EAE9;
	Tue, 17 May 2022 15:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EA3EAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652792753;
	bh=UPUs81sl8LnFQHTF+ddHSkDaGXS+O0BBmVFMU13CG5E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OPVA1SrODS3NcYiIbz5t4+WZXTgepqSvylO1792R6N+XwIgkaUpcqjd9lEHHxRApf
	 hP8qqOIL+/cS3mYljuILf7LPNyfbKSehfPQ3aGf//Pw0KDNFXk80aOXQsP7zjk02cV
	 kTzvEvbtlW5MXr4VZaaaaOPrt+Vleajz+yhOaVcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0D51F80310;
	Tue, 17 May 2022 15:04:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAE91F802DB; Tue, 17 May 2022 15:04:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C343F800F0
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 15:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C343F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Su0vNwY0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B5FE612FF;
 Tue, 17 May 2022 13:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC857C34117;
 Tue, 17 May 2022 13:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652792686;
 bh=UPUs81sl8LnFQHTF+ddHSkDaGXS+O0BBmVFMU13CG5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Su0vNwY0LlWL0zMYdtXtfV6wS/SDWfXHHu0LwgxjCvoDgc/NF2BWNZaJ12wz9hiQJ
 bGxvtQwrl8hN6eRwcd8KOLkumoafyWTPkkwSsiwXi6uw6ukZDnZ92oAQDSWH087IZ1
 iWhokE4PXjMsORHjlA2BXs9i7RZYNBKYEg6ljOTbcHioXzCR4gljW7N+T8XpEg0T2x
 EXYf1yrvT2SyOkYT2OVjgOFB9sLvmrgTUGD8xq2HgSBWOOWA6r+fLMp3UWaWA8ATlI
 ILvV/kY6MnopDdECZGcP3ntgp4v1Tbm7J7EvbPSMzZhKnDipngK8hW6CmUP/8Zr8ah
 b5YWVRNxk/AAg==
Date: Tue, 17 May 2022 14:04:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Tan Nayir <tannayir@gmail.com>
Subject: Re: [PATCH] ASoC: ops: Fix the bounds checking in
 snd_soc_put_volsw_sx and snd_soc_put_xr_sx
Message-ID: <YoOdauC5Q8POpHLe@sirena.org.uk>
References: <c2163c71-2f71-9011-3966-baeab8e8dc8f@gmail.com>
 <20220517011201.23530-1-tannayir@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vsNkSZC5zTfVWt3z"
Content-Disposition: inline
In-Reply-To: <20220517011201.23530-1-tannayir@gmail.com>
X-Cookie: Fats Loves Madelyn.
Cc: Marek Vasut <marex@denx.de>, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
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


--vsNkSZC5zTfVWt3z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 17, 2022 at 04:12:04AM +0300, Tan Nayir wrote:

> The $val in both functions has a range between 0 and an arbitrary limit
> whereas the range specified with the $min and $max can start
> from a negative number. To do the out of bound check correctly, the
> $val must be added the $min offset.

>  	val = ucontrol->value.integer.value[0];
> -	if (mc->platform_max && val > mc->platform_max)
> +	if (mc->platform_max && ((int)val + min) > mc->platform_max)

No, the minimum value we expose to userspace is always scaled so that
userspace sees a range starting from zero and that's where platform_max
is referenced to - we're applying this limit before we start remapping
to actual register values.  The code would be a lot simpler if we didn't
do this rescaling.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--vsNkSZC5zTfVWt3z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKDnWkACgkQJNaLcl1U
h9BWjQf9FV2GSK8eu0451gypoqtGdAfYTGMGEYRV2aewgHbvYWXeSTbAT9c1OHtI
kLZi/TsAqD6Uf3aej22UlqXPx2mIMmqmzZ7fR4D306YN3GGXTBme1XanijtMPKM8
p2GTqXhu6SOyW100X9QHyMjj9JlJIxaczUozsxDJGd/feWo1l7nX14mG+ZT8aT3d
aDNdZfpdZUFDOMiXK5pU6ESIOuDmZVIAvOnvAdZpmhLIm3gLlh4xr1YcULfz0zSl
dW8V48BIxf3fXc/SrpChTP72H33IICrqFOrg/SbWQ2q8rwYb1m61xkmlIEdLth8c
Htj0ChFk+xqzylvQAO5+cbIFSBfrcA==
=p/6+
-----END PGP SIGNATURE-----

--vsNkSZC5zTfVWt3z--
