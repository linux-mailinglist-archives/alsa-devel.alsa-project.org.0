Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DA7967B4
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 284A8166B;
	Tue, 20 Aug 2019 19:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 284A8166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566322855;
	bh=Vn7X2KvbxDuGOagZCeraS0MJGn3+gAI6ZGgGstnGoLM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IR++WQmCJfzHLVntX551dVYtfKqqBjY0UyxZBOQ8MhSzNfPw5u75BUNp+fj6sMzpz
	 eDeEW8TEanF47y6hdnsbjUV7cwkchD+NISYcJRwNgqTYIZV7KaWh5tPRtLd1nm+6lf
	 900bu+y6GOZuXH8Qm6dx9k63bOUVsBXT0NVj0n6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86D4DF803D5;
	Tue, 20 Aug 2019 19:39:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E57C2F8036E; Tue, 20 Aug 2019 19:39:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-f97.google.com (mail-wr1-f97.google.com
 [209.85.221.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1A91F802E0
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1A91F802E0
Received: by mail-wr1-f97.google.com with SMTP id q12so13244016wrj.12
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=m7ao7ORH60h0tFo771t8XxOyJrM0P+fZjWuoPCMruUU=;
 b=Uu90VTgVVDcWbQCDf4oum03R/iyD/FDRAXGdJleyfec+DgQeHFeeWin31GwaoSHMq3
 srisMMs7nzul/862Z8dzcCyveqWF/6Sogm2cDMqQCzNbK+165o7Cy0PvsSqd9BMw8CbQ
 LyiVrE4QMa6zBupsRPXIfY5TIz21pXLpK0Wbg7UfeOaay88LpTqxZEGa7t9++IGRh+Rw
 3c9Qeokv8hdNjpjtXOF5wsRtWkI6H5bxL2rPP5MA759p2h5ofZ9PYPrNuS9iWX1RJ3yj
 JjS+w25/OxJrWXO1xPYm+4opAzm1iXKYd9cPGm3c1QUsbu5k8E/ozJ7V1+c5nkjCPFNe
 irgQ==
X-Gm-Message-State: APjAAAX4mm4sDnrgKx94m9OnTq20dJr7tNeGuZmbU4vh98X3MFUhXEyv
 mHrMuFoUotaxurpcU1t8JeKnE9IqgwgXLUV28H9xjX7FFf0t7Tkqf3xyrW+9A4EtMQ==
X-Google-Smtp-Source: APXvYqzLzv/aLlzn2NHdKvwVs2INSBhJKvCzoIitnolVH0fpSkwLd7iHz1QYiEa9AY9Z0BuWcUR9HGgkrZ69
X-Received: by 2002:a5d:6307:: with SMTP id i7mr36464585wru.144.1566322744775; 
 Tue, 20 Aug 2019 10:39:04 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id f9sm2448wmj.34.2019.08.20.10.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:39:04 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0864-00031g-Cu; Tue, 20 Aug 2019 17:39:04 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 593B12742B4A; Tue, 20 Aug 2019 18:39:03 +0100 (BST)
Date: Tue, 20 Aug 2019 18:39:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <20190820173903.GA5702@sirena.co.uk>
References: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
 <fcf77b3bee47b54d81d1a3f4f107312f44388f5a.1566242458.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <fcf77b3bee47b54d81d1a3f4f107312f44388f5a.1566242458.git-series.maxime.ripard@bootlin.com>
X-Cookie: When in doubt, lead trump.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, codekipper@gmail.com,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 11/21] ASoC: sun4i-i2s: Use the actual
 format width instead of an hardcoded one
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
Content-Type: multipart/mixed; boundary="===============6709041597186278941=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6709041597186278941==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 09:25:18PM +0200, Maxime Ripard wrote:

>  		regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
>  				   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
> -				   SUN8I_I2S_FMT0_LRCK_PERIOD(32));
> +				   SUN8I_I2S_FMT0_LRCK_PERIOD(params_physical_width(params)));

This doesn't build for me:

In file included from sound/soc/sunxi/sun4i-i2s.c:16:
sound/soc/sunxi/sun4i-i2s.c: In function =E2=80=98sun4i_i2s_set_clk_rate=E2=
=80=99:
sound/soc/sunxi/sun4i-i2s.c:360:57: error: =E2=80=98params=E2=80=99 undecla=
red (first use in this function); did you mean =E2=80=98parameq=E2=80=99?
        SUN8I_I2S_FMT0_LRCK_PERIOD(params_physical_width(params)));
                                                         ^~~~~~
=2E/include/linux/regmap.h:75:42: note: in definition of macro =E2=80=98reg=
map_update_bits=E2=80=99
  regmap_update_bits_base(map, reg, mask, val, NULL, false, false)
                                          ^~~
sound/soc/sunxi/sun4i-i2s.c:360:8: note: in expansion of macro =E2=80=98SUN=
8I_I2S_FMT0_LRCK_PERIOD=E2=80=99
        SUN8I_I2S_FMT0_LRCK_PERIOD(params_physical_width(params)));

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1cMDYACgkQJNaLcl1U
h9A5+wf/R8kszzb6oMjGJWYnQJj4y8zrub+Ef7frMS3FakQtrfpNijxNi57HOXai
jJvL1rK1E89FeYJlt5rPq9DJGlWe8dS9dMvhuz7JhsYl5cn+8m4o1LoUbH6Inv5k
95bWW3IC9IBXhd6MiQwBZZpZ79T1UjHu9UfOF5dOEQ059wu8JCYvA0y/PzyH6kq8
w1MO/wGVaEHT/DMsAs66Mp5/3Ju8DAn9ZaE7ZhrgIsBphf/P+/BZHPU/pQjFEVag
f0ayDyQwRU1t26KvNeIRQpnUXV/N7ZF7j/uQ2mUQDTPjViBLS0uzUw/5bklcAT24
w+0X+AVImMFg+yfuBP7oOP25UCjzbQ==
=C0WO
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--

--===============6709041597186278941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6709041597186278941==--
