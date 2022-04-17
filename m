Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 006D2504947
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Apr 2022 21:21:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8913E1693;
	Sun, 17 Apr 2022 21:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8913E1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650223294;
	bh=KRvPTo/FdL1/iKe08CuK1+LYmXFRrFJPx+tskT6KavA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hl6asnpr/iA08DO1/u8OA6HQD42/QsRWFa+vGIzBu0MN6Mm/L0lOf8Nw/aGnG+I4M
	 wchzOVn6AKTvdXRyfco4VBwdLEK19Stwy8Rx+HeV7Z2qH2WoddIDXswaMB9B2rE8ca
	 S7vSo4WYWRANtKojk+Egxn9toi5UBIPqYBkOuU4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6765F80253;
	Sun, 17 Apr 2022 21:20:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D94C0F80155; Sun, 17 Apr 2022 21:20:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE2AF800FB
 for <alsa-devel@alsa-project.org>; Sun, 17 Apr 2022 21:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE2AF800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bm1/lmXI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F16760C8B;
 Sun, 17 Apr 2022 19:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9345C385A4;
 Sun, 17 Apr 2022 19:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650223228;
 bh=KRvPTo/FdL1/iKe08CuK1+LYmXFRrFJPx+tskT6KavA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bm1/lmXIUn8bsjrwBiMCEH8HXKu4uLNm7NBqU08fjE4dzzcJcsn7NSEO7AYQ39y3R
 xKwq9YhL6fnkQ6Ojb95m/LNjlUrjbZm/CJgofX9UJu+PAbl5fPE4CjQXmhP/bnJm7a
 6b5sfixyNToqtJNr4qjA+euOKLGBQPiYyaZF62kx/CoFwE8ogjTSOXYGti2oJPqbp5
 DQqobfRIFFwRwcZqRcBTFAvVIW8qN11gr6pMaaYUhgM7rqz/I8OvghxiGaS/HuWAbC
 ralkkNs/fyeJxv/meMMUn3/5vA/8LLhwPimEJInZM+KVTnnAUiUDXikpPOWpat/DtG
 5IpG0MosHCk4g==
Date: Sun, 17 Apr 2022 20:20:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Adam Ward <Adam.Ward.opensource@diasemi.com>
Subject: Re: [PATCH] ASoC: da7219: Fix change notifications for tone
 generator frequency
Message-ID: <YlxoeBcyzXNOBTq4@sirena.org.uk>
References: <20220416125257.197348-1-broonie@kernel.org>
 <VI1PR10MB316749E7B1C0F429EA486E56ECF19@VI1PR10MB3167.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="91qry57xum710lzQ"
Content-Disposition: inline
In-Reply-To: <VI1PR10MB316749E7B1C0F429EA486E56ECF19@VI1PR10MB3167.EURPRD10.PROD.OUTLOOK.COM>
X-Cookie: Stay on the trail.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--91qry57xum710lzQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 16, 2022 at 07:25:20PM +0000, Adam Ward wrote:
> On 16 April 2022 13:53, Mark Brown wrote:
> >  	mutex_lock(&da7219->ctrl_lock);
> > -	ret = regmap_raw_write(da7219->regmap, reg, &val, sizeof(val));
> > +	ret = regmap_raw_read(da7219->regmap, reg, &val_old,
> > sizeof(val_old));
> > +	if (ret != 0)
> I think you may have intended to confirm success here

Yes.

--91qry57xum710lzQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJcaHcACgkQJNaLcl1U
h9DXJgf/QsojAAgf+y7cZg70l81jwFAnuDi1j3e73ZC2YWaiC/YZ2ba7xS31od60
VP9cNf4h8rjhTTkGl5EELCSoMpuLxlbh98IT0yKr+xFvswEHAh/lZLF9jXGElnTb
cOaYXOqdCG3s9/YU/99s/YXBZCGhdIq0J0Bf6iMlai2qtA5xqTe07UJ/KUwLzF1C
ydrIxqFiejKdMn5n+fn5stJOrJL7XO1zzIWNAQ79oJWY0OZZYyN8HLvKert4arHT
600ZBG2G4zHo0VXiIkXRlYpgxxp9StQ+kzX+T80Q/b92dOOHJx7JI1yiusRoCZNc
olgjpj2SFYNwM2iGkE+G58QerrcbmQ==
=DO/Z
-----END PGP SIGNATURE-----

--91qry57xum710lzQ--
