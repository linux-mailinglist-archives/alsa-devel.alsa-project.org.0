Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FDD40976F
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 17:35:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B0701677;
	Mon, 13 Sep 2021 17:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B0701677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631547336;
	bh=BVrxRWHKyUrGv+35tc6x5b7RGSJFUHhIxAEhdcNdIKs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pbXh7Od7KukNy2F0BwZ4OjVCwjfY9IbEj9OJdEqUeY5rvAwwmHGz3liJKDwjD+5QP
	 e8pvkZEDGgwEjbRmEWnh3E80ozjaeVN7xtconJA2D7BBi9/Wb5lDJVpoMSAzvxT5h5
	 st8CXJ5ZtZ7QHk+b5GgksHiuFSiQdVKnP8zPf4FU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79F6BF804AB;
	Mon, 13 Sep 2021 17:33:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 152C8F802E8; Mon, 13 Sep 2021 17:33:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16D5CF80132
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 17:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16D5CF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FakgeYfe"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C236F6103B;
 Mon, 13 Sep 2021 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631547206;
 bh=BVrxRWHKyUrGv+35tc6x5b7RGSJFUHhIxAEhdcNdIKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FakgeYfeGaCUOVDhuplPOuxzkueMRigaWZPbFMdFaWzXE1bGfIIOH1Mm6EF0NCgJX
 Iluf7pmOjapb/XnI4+xibPLH3PNTzPQtwjQ1G+hkJcJfOmoWXgsYh9StzqKB3c5B0l
 Z58aIJ3VTZ8ov0dWfyQjkfnEQ0+E5nZoZ68DRIznchEDUSgnv9OjoUdbDRw5mZzfLD
 zYi7sK5wyxfa4wT+OBkNYTjBRRZVXRPio/dHjMwWBat9Aer4OgGDt55PZngQ0+SPUf
 IfaLvfbRcezowcvk0kZoz1CaRIS40SwyTYzT6x0TImW6ksMk4RdDCn3AQARF/azmqn
 gddnu7nozISGw==
Date: Mon, 13 Sep 2021 16:32:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: common: handle NULL case in
 suspend/resume function
Message-ID: <20210913153246.GI4283@sirena.org.uk>
References: <20210910092613.30188-1-trevor.wu@mediatek.com>
 <20210910102358.GC4474@sirena.org.uk>
 <5fa1e99f1b9097336a3e610dc383170f09036b14.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PWfwoUCx3AFJRUBq"
Content-Disposition: inline
In-Reply-To: <5fa1e99f1b9097336a3e610dc383170f09036b14.camel@mediatek.com>
X-Cookie: Above all else -- sky.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dan.carpenter@oracle.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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


--PWfwoUCx3AFJRUBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 13, 2021 at 01:55:38PM +0800, Trevor Wu wrote:
> On Fri, 2021-09-10 at 11:23 +0100, Mark Brown wrote:

> > It seems like it'd be better to just allocate the buffer at probe
> > time
> > and fail in case we can't get it, I'd be surprised if there's many
> > platforms using this hardware that don't also end up suspending and
> > resuming.

> Thanks for your suggestion.
> I agree it's better to allocate the memory at probe time.
> I think we can still keep the implementation in the suspend/resume
> function as a fallback solution if user doesn't allocate the memory in
> probe function.

If you can't allocate it at probe time you should probably just fail the
probe.

> In the new mediatek SOCs, regcache has been used to handle register
> backup.
> Do I need to add the buffer allocation on probe function to the
> platform in which mtk_afe_suspend and mtk_afe_resume are used?

I think you should have separate implementations if you have both regmap
and non-regmap versions of this.

--PWfwoUCx3AFJRUBq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE/bx4ACgkQJNaLcl1U
h9Arhgf/YT4zF+AifPO22fnvUWMW7ps029xRsDBaUGwyRl4XFu6O90vmI7jjaogy
2fFfMzXc8EoOGWfhZhrhZqkIogzIol1wDrEnHtWLDpdnWBOgejqTG6jh3hbIU4EI
PRKbvL3qTXlzfhz23Qb+BjG4SQaDbVfRbb+e+nE4Om9qw5b199MIDht8Mye8KMgE
Wqt+y6alWGPcl/1RsdRJ8pVWASpQyYmwwbaHnVtGEarrdVOZzmiEL2offMAwiW4G
NDRcFOJcCrpu5eECoF2RM5XeRwzwJ8CxIvKMtlbhbniPDRyBPaLZ2zPGEUfInaoe
8lGIdpFSBHHvIq1QE7w6VAoqpmER4g==
=eZc7
-----END PGP SIGNATURE-----

--PWfwoUCx3AFJRUBq--
