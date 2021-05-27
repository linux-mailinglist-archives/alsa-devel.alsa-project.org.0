Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC3E392B23
	for <lists+alsa-devel@lfdr.de>; Thu, 27 May 2021 11:50:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB1E2172D;
	Thu, 27 May 2021 11:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB1E2172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622109031;
	bh=ekm3mOa9L6BQjSO6BBcdGz3x7hKHW+AhiWYyZJMXztY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o8lKaHKSfBi2JtHYeL6Gl4mAB/zv9MKwbAGMbEKthrWrADwtb7KfE4MjiibWQ68Bm
	 eJNR0GTeRAhy09XJhZO3L/Or/cdwQ06qBPRyJSMm4AfjxMMy8uZc6jKNgXe2Fefg7q
	 HY2NXLAlaYbvQkQ3H78VlJ3i5vxMmcEkm4U6z0AQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6985F80425;
	Thu, 27 May 2021 11:49:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C6D3F80424; Thu, 27 May 2021 11:49:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_59,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C6FFF80301
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 11:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C6FFF80301
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ileoWssY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F0M6YKJIjuslwrEqzHcCVwYmUO2HBB71MzLKpKRrjls=; b=ileoWssYV/N9kEzsACT6FZb/F1
 b/9lsMCCo4ysXiQnKRk/Le1G4TlNv0DrIfUQcYB5TlUsZKigM0ulWTkj1vE99zUF1/HMHhd11iTR6
 AzQpQWAkKYXioEgSGKFBQaW9suQKygXddQmns+fL/A05CFNAh7vg2AFVgxOY4ZlTiaA0=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1lmCdQ-006LZT-1P; Thu, 27 May 2021 09:49:00 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 3DD62D0E96C; Thu, 27 May 2021 10:48:58 +0100 (BST)
Date: Thu, 27 May 2021 10:48:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] ASoC: rsnd: add null CLOCKIN support
Message-ID: <YK9rCv3eJPVXFMv2@sirena.org.uk>
References: <87y2c4oe3y.wl-kuninori.morimoto.gx@renesas.com>
 <87tumsoe2p.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdXLYvEBE0bVk=8D+GkuaHRUvdTayCQPqTYAkPJEaW8MDQ@mail.gmail.com>
 <87zgwimnuu.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdVhnKeztftOJEZhSg8bXArzUDXAmHSMPVfbMamV3ihw+g@mail.gmail.com>
 <87o8cxm9pg.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUxAOeceORSpmiPAc6Tg=jpm2FTaLjVBVt+oiyWd68wCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="J7jXXUEHh64gT2AV"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUxAOeceORSpmiPAc6Tg=jpm2FTaLjVBVt+oiyWd68wCQ@mail.gmail.com>
X-Cookie: A penny saved has not been spent.
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>
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


--J7jXXUEHh64gT2AV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 27, 2021 at 09:30:38AM +0200, Geert Uytterhoeven wrote:

> It adds a dummy object, which needs to be cleaned up.  Basically you
> are trading a simple NULL pointer check for a zero clock rate check
> deeper inside the driver, with the additional burden of needing to
> take care of the dummy clock's life cycle.

> Note that most clk_*() calls happily operate on a NULL pointer, and
> just return success.  This includes clk_get_rate(), which returns
> a zero rate.

> Mark might have a different view, though, due to his experience with
> dummy regulators?

Not particularly TBH.  The regulator API doesn't accept NULL
pointers due to constant issues with people just ignoring errors
especially around trying to decide that devices don't need power,
it'd just make all that worse.

--J7jXXUEHh64gT2AV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCvawMACgkQJNaLcl1U
h9Cfhgf/TXo4rAddflLHeFKvhaODiye4tdIy7CXSVKld0/Lqzojk6PXdfVEtydtJ
5ZXXuoHNKdBEmjZgi4bQaPOrn1VuagwC2wXFDajcljloxNoQjMAgq0JWjGPfOWwS
Ny9vZZzaZPC98Wum7voR9YUrtJciVuGnFaCCqfIxuvgMoH6vsjV86TuWMkCsG8ys
yuJK6JkRwiqFeN9usKYo4iuaxHS4Zal7l4ss4fvbactpirpBj8sYDbtp7KHDOEJk
p/NXOPqv5bd25J4JQT3FhJ+iqBqldc6WOcLRUpcSQYztSYnGQ/zmvxaifNvSnvuY
WztbBPPVwvAdkcXKUr7VI14fNi7B6Q==
=vtO7
-----END PGP SIGNATURE-----

--J7jXXUEHh64gT2AV--
