Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F41B48643E
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 13:17:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEAA91848;
	Thu,  6 Jan 2022 13:16:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEAA91848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641471469;
	bh=rcJG/6ps6XGR1VcVUJMzmKcG+dn6CG+RScaQVlFKeic=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O7AhfEJB8PlYhCuk/7kvh6QMygET4GFosecdJBVO4NkXdjrlaKk0Mkaz93GKzrnH0
	 S1fO4We/ZMkczwf10pHbIfynU90ZH4pxLyJr6SdksOcUKldW07VaMxadAcrqlXqo9A
	 jPPuRlPDy54TBQdiry/T+ClgIA1nBMw6lpNlNoTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A378F8007E;
	Thu,  6 Jan 2022 13:16:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C803FF80155; Thu,  6 Jan 2022 13:16:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16DF9F8007E
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 13:16:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16DF9F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s7qRUxLP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA9A961B89;
 Thu,  6 Jan 2022 12:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF66C36AE5;
 Thu,  6 Jan 2022 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641471393;
 bh=rcJG/6ps6XGR1VcVUJMzmKcG+dn6CG+RScaQVlFKeic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s7qRUxLP8I2nGga1KECf7Ek6LZcl7/teEe48BnJOwP64t/ozIixgpoizm5fyDAj4U
 coZ596jT5Vp38RhOMnAiYg9J5qi+CzrJybaiFD8x42iN77mrEyrTusp0rKB2nNpR2Y
 XKsiobr5o7QnfPh9uNhxpwd+bMfg7VIPTC9SwpZxbnVyBKzsBbgnb+cr2d5qg/DN9d
 pnIW6aHlPAzytgoI7aPPBAmJTVLARX9nCviGQS6bWVCTfsVPhpezwwJuTy5BKIdUkz
 qOD6DpOyPKgPYuYP2RaYb/n3o12aYP5OE/pMsNM25nqONKORaA/JdBzkwLBcO+cBri
 i3SrD5A4/Pakg==
Date: Thu, 6 Jan 2022 12:16:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH 1/5] ASoC: xilinx: xlnx_formatter_pcm: Make buffer bytes
 multiple of period bytes
Message-ID: <YdbdnFA5wXooBFYz@sirena.org.uk>
References: <20220105225146.3517039-1-robert.hancock@calian.com>
 <20220105225146.3517039-2-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="N7Xh3XzrdYpTPVvy"
Content-Disposition: inline
In-Reply-To: <20220105225146.3517039-2-robert.hancock@calian.com>
X-Cookie: I think we're in trouble.
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 Devarsh Thakkar <devarsh.thakkar@xilinx.com>, michal.simek@xilinx.com,
 maruthi.srinivas.bayyavarapu@xilinx.com, tiwai@suse.com
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


--N7Xh3XzrdYpTPVvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 05, 2022 at 04:51:42PM -0600, Robert Hancock wrote:

> +		return err;
> +	}
> +	/* Resize the buffer bytes as divisible by 64 */

> +	}
> +	/* Set periods as integer multiple */
> +	err = snd_pcm_hw_constraint_integer(runtime,

Missing blank lines between blocks.

--N7Xh3XzrdYpTPVvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHW3ZsACgkQJNaLcl1U
h9A46Af8DKHC8IHKyrkDk5BClRH6gGzugiTuE98vzd8Pe2DO9QsokejsAb4RH9PL
7sLNnbRDgdaVwfeCGCXZY0JIRV2eAm+pZUrcS9CkhkbekJPKUdSzWpRdaiNBVjaF
8x9HCLwhyoMYQHCB51qXECJnxal7vNABdBPT1a6mm8wHscwKoka18uKeUTDyjSH1
foSRUBlGJ1qQsh7Gwe17tNMHJLKc8yK9bU4W3Yxk07ANOBgZiAloh1eobjP7+eMj
5naKZtcT7yM88+UScSTB9w8rnTdKsqMF4nrWalKBc4dCq/GJf+79R3DHkZHsVbqL
qhz3IAqKYWPyHBW7a6qiFQk/c0JwTw==
=vT7L
-----END PGP SIGNATURE-----

--N7Xh3XzrdYpTPVvy--
