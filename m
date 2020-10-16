Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2E62909C7
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 18:36:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EEA717CD;
	Fri, 16 Oct 2020 18:35:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EEA717CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602866179;
	bh=R2S+iX+2EbjZrLv8J+rFrVflRurDXYJIoHj7LFwO7UQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FBA57RjlKa0nXLizMBmPEMOQkzrGE81X9KwPzw67s5UJxJyfiU9JsXBrfVxZDbD0u
	 4YRauGIDleGHh7TEJeMOKDOrkEv2+fEWPODoUA3NnVth9qNo16Ag87sjbMPtfzOrJA
	 yydZxB+/LuaAeI2j6XkfDAuHH3dcuEsLAS5IzwbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65F3CF8020D;
	Fri, 16 Oct 2020 18:34:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D34A8F8021D; Fri, 16 Oct 2020 18:34:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F00DAF80115
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 18:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F00DAF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ESb8z3ng"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37B0320829;
 Fri, 16 Oct 2020 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602866070;
 bh=R2S+iX+2EbjZrLv8J+rFrVflRurDXYJIoHj7LFwO7UQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ESb8z3ng4R/aqDsp088tBHQ4gP8RJXuFfw9TqtWeVL44E18KPK/BFoiOZu83RBHxs
 zi0E1KddKABoo7+He+Xo6gRpudtKvwmVFs0WZ+iMf3Fs1bt1kE++2YLGZoykISTAmv
 XmgDYuSPsvqS1EYSZFockFNE0wtWXxTnWR9V2K6c=
Date: Fri, 16 Oct 2020 17:34:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: boards: Add CML_RT1015 m/c driver
Message-ID: <20201016163422.GJ5274@sirena.org.uk>
References: <1602864145-32249-1-git-send-email-keith.tzeng@quantatw.com>
 <20201016160418.GF5274@sirena.org.uk>
 <d286cbda-9dd7-fc8d-22fe-b0d8f6ef41ff@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gBdJBemW82xJqIAr"
Content-Disposition: inline
In-Reply-To: <d286cbda-9dd7-fc8d-22fe-b0d8f6ef41ff@linux.intel.com>
X-Cookie: Pournelle must die!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: matsufan@gmail.com, alsa-devel@alsa-project.org,
 Keith Tzeng <keith.tzeng@quanta.corp-partner.google.com>, mac.chiang@intel.com,
 Keith Tzeng <keith.tzeng@quantatw.com>
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


--gBdJBemW82xJqIAr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 16, 2020 at 11:19:41AM -0500, Pierre-Louis Bossart wrote:
> On 10/16/20 11:04 AM, Mark Brown wrote:

> > There's an unresolved conflict here :/

> Was this patch shared on the mailing list? I don't see it in my inbox and in
> the archives?

I did a reply all - it might've been held for moderation on the list?

--gBdJBemW82xJqIAr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+Jy40ACgkQJNaLcl1U
h9AWvAf/Zf/WVYiZdLEn5UrUbH5lMB36VRDc3x+oy3KwjdcMcgBP13uZeiIbwpMP
etYEQikMiEgkE0GF56sg2IHDt+yt7cpLp/4HXeu3dQMZ/4YJuydJyYHgwO5+Oh+t
Ox1eRRlShmJCsUDNqnCYPB+maXbgvRp+GcxP3ApNGg4yahZ+PoKFVCu6QfiAm2ix
hR/Y+Pt0XZ5rjunSJYpbnRZ26KzSDo5opBe3/uN/fkGonKTNeIFurqV86rpfAAFy
7RtuLSM2gfp0TCEKdz0KqXRI4acVl1aB8Ek2V0BfpBEQPgU8RFp2X2uHLZww5lYl
aHRuQFVPPApUESP85EhZ8s/+GUNWrA==
=bJew
-----END PGP SIGNATURE-----

--gBdJBemW82xJqIAr--
