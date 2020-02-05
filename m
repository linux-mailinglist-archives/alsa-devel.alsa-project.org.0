Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C65F1528CD
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 11:03:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93BD81685;
	Wed,  5 Feb 2020 11:02:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93BD81685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580897029;
	bh=lo0uBRkU+em/ZcOMQbCkD6197ImOoG+B3z9z7otbeTc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZOr9cp9+X3QFIVPuxcHG3Idzr/DyQh7ixtnpet+40TAM/pLpppjX1wvYynclx7a3+
	 17EyroExfgqNmsXUMNAJVHJuit8+W9r1ZeWYi4DfyESiEZuSIJFcGbTHm0KPsr6o2A
	 h0Ioh72n/DRolycrziWIRlNbsuK4m8I7cSUdacqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65F9AF80051;
	Wed,  5 Feb 2020 11:02:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89049F80148; Wed,  5 Feb 2020 11:02:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11B17F800AB
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 11:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11B17F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="t3te0ZeV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oBYuPXXv/66fzN1ASv2aU1O7QlQkXjCIjDUBNtWwQko=; b=t3te0ZeVUoGID8glNCTYlLc2Y
 m/BVOnTtbeJ5Oeut5ykyuzhQghXxwnF2PB7S5Pm5QyWiAMDroyLvQsxTpNZIByL7PP1Pbx2J878ks
 gIcWFHWmOWNGjPpGHOXLRnlegLh+h4j322VjzrLdKzFhcl75nwbxwdEbni9QI2iEqTh/o=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1izHVP-0003oo-Ps; Wed, 05 Feb 2020 10:01:59 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 73FE5D00D65; Wed,  5 Feb 2020 10:01:59 +0000 (GMT)
Date: Wed, 5 Feb 2020 10:01:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20200205100159.GF3897@sirena.org.uk>
References: <20200204131857.7634-1-geert@linux-m68k.org>
MIME-Version: 1.0
In-Reply-To: <20200204131857.7634-1-geert@linux-m68k.org>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: wcd934x: Add missing COMMON_CLK
 dependency to SND_SOC_ALL_CODECS
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
Content-Type: multipart/mixed; boundary="===============0403028060207252723=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0403028060207252723==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k4g3xMTzTwvmb7wy"
Content-Disposition: inline


--k4g3xMTzTwvmb7wy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 04, 2020 at 02:18:57PM +0100, Geert Uytterhoeven wrote:
> Just adding a dependency on COMMON_CLK to SND_SOC_WCD934X is not
> sufficient, as enabling SND_SOC_ALL_CODECS will still select it,
> breaking the build later:

Srini already fixed this.

--k4g3xMTzTwvmb7wy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl46kpYACgkQJNaLcl1U
h9CdWQf/aFT0LLxtrjpK2ZraWkMAXbc/uzMv9oyxBMRJkViEi5/GaE8J9XwyGR0L
xNV/jE0eMc6y4xMMkwcjv7Mla/fudCZoYaG5bjPI/xLMYG8MYwsPlLUXtt+1Rpcz
9xEeatoF0rOleTANkzmNYTxDZPOCN2BL7ALgzQJKS1rWsIJumG0KrRni9P88/NlG
y+hBF+N+QBvb7TEpkMHdeLvAZ/tZaV+2HJ0hG+zt3IlTPXmV4pvQ4RWMgTiuxW4e
8kxxC8kq4oEt7Dvn2YxEItUt07ttcEgHWDVm10GzT103a1/+qaISvCEDsFPYuSnW
FzReuyLciaCuSyqzmUUH9fufzkLpIQ==
=Ycyk
-----END PGP SIGNATURE-----

--k4g3xMTzTwvmb7wy--

--===============0403028060207252723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0403028060207252723==--
