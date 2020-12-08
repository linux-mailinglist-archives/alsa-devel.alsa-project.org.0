Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9FD2D3083
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 18:06:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3F3C16D8;
	Tue,  8 Dec 2020 18:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3F3C16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607447173;
	bh=4vOM2hPgHrFDdyZpn+0VAXraK8YYeHWHyPRJRhYrL4w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9Pq/M21RvdyIuwyw81YWL4Hu12ntTkYeZi+l5v758F1t/k8Mo61uQGfwUnBLhmfD
	 o1J8BsJACIGx9n0ScvTUC0dLNU5fUYtDRDVSCMux8aJ4WGLKvJImSE3eOi3O+W5+HP
	 mx6BGMQQonDo9Ba2MtXBzA/Ne7ysS1F4hP9BrcH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ED7BF80164;
	Tue,  8 Dec 2020 18:04:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0BB6F8019D; Tue,  8 Dec 2020 18:04:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FEA0F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 18:04:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FEA0F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IWtshTP7"
Date: Tue, 8 Dec 2020 17:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607447069;
 bh=4vOM2hPgHrFDdyZpn+0VAXraK8YYeHWHyPRJRhYrL4w=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=IWtshTP78znOhmhQmuNg1rJ+1pqIGQJn7Y9xvGGdIUTkpfMxJnpvs9OHeZGKWX1oX
 t9k6cy5/I8ug6CyzAKh9eyMQq2L/Gr1VLUxuqOgZOBntDNkbzOyJTxzevadVo9K5c+
 oZmg5s9ks23enzfV0ze+jQnhMhy5nHlPzpUSDkCmtp/ahgsFvs1ZjDatiYnccjfJR0
 E2K4P42m1vEqnJWeiKob4Fz/mDhy/TuL9xX+A+iEZPYpk3mVbNDtxL/rh57k+hd4uf
 rYKOLgDMiRIIoFJoSsoLM2iahLJ3EIZif47oVaGwo1LHenXqYHYdVstQdItAfvR59F
 Xqk80Y6APf4pQ==
From: Mark Brown <broonie@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: Re: [RFC PATCH] ASoC: pcm_dmaengine: Add support for BE DAIs
Message-ID: <20201208170422.GG6686@sirena.org.uk>
References: <20201202085838.1779525-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Content-Disposition: inline
In-Reply-To: <20201202085838.1779525-1-codrin.ciubotariu@microchip.com>
X-Cookie: Do not dry clean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com
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


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 02, 2020 at 10:58:38AM +0200, Codrin Ciubotariu wrote:

> This patch is more or less incomplete for the described scenario. This
> is because DMAengine's pcm->config is ignored for the BE DAI link, so
> runtime->hw is not updated. Also, since pcm_construct/destruct are not
> called, the DMA channels are allocated only if DT is used.
> Underrun/overrun support would also be a nice to have for the transfers
> involving the buffer allocated for the BE.
> One way to hold trach of these would be to use a substream_be->runtime
> different than the one used for the FE.

> Please share your thoughts.

I have a hard time getting enthusiastic about this but I think that's
more DPCM than anything else.  Otherwise this looks sensible as far as
it goes.  I don't have particular thoughts on exposing errors for the
BEs - we could do a dummy PCM, TBH that bodge was used in the past for
CODEC<->CODEC links but it's obviously inelegant and messy so I'm not
sure it'd help more than just doing something like log the messages in
the kernel.  It certainly doesn't seem good to introduce anything that
is visible to userspace but is DPCM specific.

--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/PshUACgkQJNaLcl1U
h9A3/ggAg1ispHsW7HxfoyKlgiXncZefpDgs4m/UErOav+qf6rSQsHPAz79PrgLW
VQoADbxHDWOWuujHLtWZn2TUKLYyj7oX3drpEU3uDuQnNfKGGrN8Q7Pw6jwClZBp
mVpxznG0i4F7+6cPw/p51hU/90b//OrVIrfN5IyOLY4BdNNVT3wzQPCBtSinURJ/
8lwD5WYAerbVldG56JOq28GAEw0cfKOlRyt00eIHcnFS6wuo36T4Gjes5irgmKNe
LDyz0pDQX1s/GMb2kfyuDbY88bHXRw/xkc/IPY7QWLfEVTBcyRabJkSekI0jBaSM
q8LYqep6dgn3J8/eixPTLyojfNU8JA==
=8SdH
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--
