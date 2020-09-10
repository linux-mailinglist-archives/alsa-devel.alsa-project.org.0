Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CCD2647EE
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 16:23:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D28AF16C7;
	Thu, 10 Sep 2020 16:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D28AF16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599747838;
	bh=Sf1qebIUqiaky7hv/BnFelFwbArV0b890mZdIPxHgfk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pMDKziy0N8Lh4pwLkD93kpa76uIzkKYX4ntMI2TcPj5tzEUCbDv5K8Ng2z8LANAEF
	 p8z/YLRTrxXVOkJACvcR30XzdOHIzDFitp3knuEFeNGYl88BgE+lz4ybUMXLhioydB
	 azUIc+3iNsXS5eFaPa9uBB5Dlmj0r+f7PbeDzyso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1FDDF8026F;
	Thu, 10 Sep 2020 16:22:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 856D6F800E9; Thu, 10 Sep 2020 16:22:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AF81F800E9
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 16:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AF81F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BAfnSibZ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 885CE2075B;
 Thu, 10 Sep 2020 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599747727;
 bh=Sf1qebIUqiaky7hv/BnFelFwbArV0b890mZdIPxHgfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BAfnSibZvJFwZ5iViUavWC2EqcP/X1N1HUfi+qrjt0yNALHtsLMs+EZIDJcUzJyqY
 /ZmyEI18F/rIQV2QXTumUdsuxI4Ai9tY7IHyz4uLe8kbjjXw1jxjpU11e71fCtHh0k
 9pGFi9nLMwTB/FL7ASk40CzRyP/ItUCctdwvSoWs=
Date: Thu, 10 Sep 2020 15:21:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: ak4458: Add DSD support for ak4458 and ak4497
Message-ID: <20200910142121.GC4898@sirena.org.uk>
References: <1599747032-20055-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Content-Disposition: inline
In-Reply-To: <1599747032-20055-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: I disagree with unanimity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 10, 2020 at 10:10:32PM +0800, Shengjiu Wang wrote:

> ak4458 can't support DSD512 format, but ak4497 can, so add
> a new variable in ak4458_drvdata to distinguish these two
> platform.

> In hw_params(), calculate bit clock according to different DSD
> format and configure DSD register.

> +	SOC_ENUM("AK4497 DSD Data Input Pin", ak4497_dsdp_enum),

This control name doesn't seem to match up with the description - it's
talking about a pin but the description sounds like setting a different
format for the data?

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9aNmAACgkQJNaLcl1U
h9BvlQf/eYFovk6PSnGjHMoTkXtDd6ZSB8Bjxc2PaaM25GOwNdAcktYXdamyEJM6
8w+4vwJdhd4xAgWbaO9KAOdoyfrGCPqSEmv3Q97DT/gZRQ3xAAlyujp+5M4tE0QI
O9GMTIJsvZO7UtU9izkr8vuwA1W/1HoTmHVmLQ6XcjP3h/z0R8dn2BqxKZKLlN9i
SkbS+otZRdb0bBP3sDSVXdRn5T4RREx3BQEQOjzHEcIhJEuviqrc47/A9VcrUjfs
pf7VFaoeNZCjGUy0CDeLElP3UtQQMMc6RWsPPdIk1QOlMAdy6j3/BYtxa7ubbqcR
xV7s7W5Gf1fTY+siHZzyoPPCQ6M5RA==
=tBUD
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
