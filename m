Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A12B4225B5
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 13:50:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299D41669;
	Tue,  5 Oct 2021 13:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299D41669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633434648;
	bh=OYKLoUxga2Z9QEKV7pqLX90gCdbIV7CSTh1BJVCbJoM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CbdxpRkJvzNJ4qQq+8CKbdnEgskXKmZvwm/IfxzviEJPE01EPFh9IQv7KsJQchkOk
	 3vueQ9bsN/7LBJIuaggsgNdAgvgu/+O5MUruiDZXUEF413N/Q4gloSMnCoGxNtB+HP
	 rRLSteb1U343cfikvcKAdUYXRFcfIqUSf8Uezgzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80864F8028B;
	Tue,  5 Oct 2021 13:49:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78826F8027D; Tue,  5 Oct 2021 13:49:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 797ACF80154
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 13:49:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 797ACF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CYThp0I2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF56361244;
 Tue,  5 Oct 2021 11:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633434560;
 bh=OYKLoUxga2Z9QEKV7pqLX90gCdbIV7CSTh1BJVCbJoM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CYThp0I24XkY1HoLCdXYs4Haf9/qWmESYx39fldrtD26bgsa1Dkp1SGek6xVMyXW2
 z+UJpkigdK49F1AYblHNRnNTXqj6Rs80gGyXXR6Xh/Dq67bYzzlpNd3fIuYpU/6H7e
 f8tRClr7CuNwPIwdEaKnF4bwJy3yPQ9oMjxNRZY3tJOjL84uYvkXZ3KCxhcXQfTgu2
 TPz5CCwdj1eSsLedfVyKd6wkkfP9zmm1GrTYrs+C/8FPlPFmMgp7wbOBOqYiDdSoU8
 x3h17eopCN7WqgBapnZdnq2Jf4tLRRLBPuq4hv7wFXNcZCWLPhxhf27dxaL6ra+0Mk
 2KC5ehL3rAQww==
Date: Tue, 5 Oct 2021 12:49:17 +0100
From: Mark Brown <broonie@kernel.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: rt9120: Add initial bindings
Message-ID: <YVw7vbpu4TS+7Su8@sirena.org.uk>
References: <1633396615-14043-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1uf5R5Qh6EaOZEfX"
Content-Disposition: inline
In-Reply-To: <1633396615-14043-1-git-send-email-u0084500@gmail.com>
X-Cookie: A is for Apple.
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, cy_huang@richtek.com, robh+dt@kernel.org,
 allen_lin@richtek.com
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


--1uf5R5Qh6EaOZEfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 09:16:54AM +0800, cy_huang wrote:

> +  richtek,use-dvdd-1p8v:
> +    description: Indicate DVDD 1P8V is used, default for 3P3V or 5V design
> +    type: boolean

I would expect this to be done through the regulator bindings, they
would allow the driver to query the supply voltage.

--1uf5R5Qh6EaOZEfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFcO70ACgkQJNaLcl1U
h9ABHwf6A3xy1bgkNIerD9TnHgMwpJijHvMW21OjyqwDF+uG7yxxoG3Div1cwEAY
fbBFC5RMEB+oR4RsKiY7+dwC5niavCbgH//Sv7Ylk+oi9UeWRXnTV7cDIZ6TSBBh
xmJprY83kaDlasiD+wWoES3v09jy+TRCWHluCp22Iv2+ZoP5ljT6EUFWeJ/t5FQc
5oI3zoIXHJCSpbKLjf7s5UUdF69SeAKj5CA9QeaSKR6FkV5tGsyUKII0+mKy0PzC
iBrp/xxKCAets2qxF8AllbjtKvNUt0lyDw54DZAzweZ44Cxr1Cfht1JudKGmCJuP
ZYQoeMTMN8x/39hHIxq7dCLdQ87V2Q==
=Ukfp
-----END PGP SIGNATURE-----

--1uf5R5Qh6EaOZEfX--
