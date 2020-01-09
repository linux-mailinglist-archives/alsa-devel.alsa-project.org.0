Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6EB1361E8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 21:40:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 949631788;
	Thu,  9 Jan 2020 21:39:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 949631788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578602411;
	bh=s6v+aZoTtUf34wug+DWwfP0hl0U7/kZWWoNpWTMSuXo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GHHt110jc2yEMZirTHpsbJdglZqhHdqghlgZsycYnKPzw+E/a50h1RlGftDWQ2mZ7
	 iZX+pmJQpoe+2Xtp5wV4m9mevI2qOONmpX2j4jzXWJvyQBTlRKqmIDxCGw8WDUtltK
	 NsXO5/lhaOMgAw/Bw/qmrjklC+Yqa2FYZEgzsiqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07AC6F8015B;
	Thu,  9 Jan 2020 21:38:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05DF4F8015B; Thu,  9 Jan 2020 21:38:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9B01AF800E4
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 21:38:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B01AF800E4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9236331B;
 Thu,  9 Jan 2020 12:38:21 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 188F03F534;
 Thu,  9 Jan 2020 12:38:20 -0800 (PST)
Date: Thu, 9 Jan 2020 20:38:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20200109203819.GG3702@sirena.org.uk>
References: <20191227152056.9903-1-ps.report@gmx.net>
MIME-Version: 1.0
In-Reply-To: <20191227152056.9903-1-ps.report@gmx.net>
X-Cookie: Killing turkeys causes winter.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Annaliese McDermond <nh6z@nh6z.net>
Subject: Re: [alsa-devel] [PATCH v1] ASoC: tlv320aic32x4: handle regmap_read
 error gracefully
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
Content-Type: multipart/mixed; boundary="===============5340220036409612527=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5340220036409612527==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8bBEDOJVaa9YlTAt"
Content-Disposition: inline


--8bBEDOJVaa9YlTAt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 27, 2019 at 04:20:56PM +0100, Peter Seiderer wrote:
> @@ -338,7 +338,8 @@ static unsigned long clk_aic32x4_div_recalc_rate(struct clk_hw *hw,

>  	unsigned int val;

> -	regmap_read(div->regmap, div->reg, &val);
> +	if (regmap_read(div->regmap, div->reg, &val))
> +		return 0;

Is this the best fix - shouldn't we be returning an error here?  We
don't know what the value programmed into the device actually is so zero
might be wrong, and we still have the risk that the value we read from
the device may be zero if the device is misprogrammed.

--8bBEDOJVaa9YlTAt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4XjzoACgkQJNaLcl1U
h9BsYwf9FFgKoSbL5lC50mSEVqCPZLbUHO3dBKRJnmTHcEUvNS5eWPVNpH+cT04y
JmhyR9UvkDd0uD8uGILu33O7WQB2p+0vL++3ZNHxmiuPahdDQIsU4LSOd1KxECjK
0CUOK7TRBEhrsDtzGRJASf+1DO8GRqs5abAjTRAkFPBG4mVUtDmPrIaaqxdrS8IG
QX2WU53Ee3PidUrDbmVFC7LOxN93YlujLBKhuWwVuD2IvIfzYGmDPIsmUAvKX8wD
/+cVC0PrjVec5we3himey5e5o1BwfO8IUK6Fshea6548M90d/oQCioPjxKvLjvNc
B/udO2IZjDYCm1uIFshxEGTtGtQlQw==
=A/xb
-----END PGP SIGNATURE-----

--8bBEDOJVaa9YlTAt--

--===============5340220036409612527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5340220036409612527==--
