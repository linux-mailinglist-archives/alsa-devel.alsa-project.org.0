Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E8613AB04
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:28:04 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D67D93014;
	Tue, 14 Jan 2020 13:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D67D93014
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE280F8014E;
	Tue, 14 Jan 2020 13:48:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 908FCF8014E; Tue, 14 Jan 2020 13:47:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E272F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 13:47:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E272F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wuNFl2uW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4GqE2Lx+k2JThlIRuOZwkWMYwse09vSDmRyJ5N5ET+Y=; b=wuNFl2uWonj2S+6POiWKI5XZR
 4NUVe+SH2fp+SGWHoc8NPzlC26hmsxUaZuoImIWN0KxpfX4QevXRtioasxq8Ln8OPxr7lpqmc5BpO
 ZQnXJIriMGj0VXxVl3aDQSJtgB19WAxawavOQcslxGV9YJnMy5C2sitp3Lj26Yw29NUfQ=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irLbl-00085w-9b; Tue, 14 Jan 2020 12:47:45 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id F3D37D01965; Tue, 14 Jan 2020 12:47:44 +0000 (GMT)
Date: Tue, 14 Jan 2020 12:47:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200114124744.GT3897@sirena.org.uk>
References: <1578968526-13191-1-git-send-email-richtek.jeff.chang@gmail.com>
 <s5htv4yfpnt.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5htv4yfpnt.wl-tiwai@suse.de>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, Jeff Chang <richtek.jeff.chang@gmail.com>,
 jeff_chang@richtek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v6] ASoC: Add MediaTek MT6660 Speaker Amp
	Driver
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
Content-Type: multipart/mixed; boundary="===============7084482549366548392=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7084482549366548392==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H88uUF932U8Oj0a6"
Content-Disposition: inline


--H88uUF932U8Oj0a6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 14, 2020 at 08:44:22AM +0100, Takashi Iwai wrote:
> Jeff Chang wrote:

> > +	if (ret < 0)
> > +		return ret;
> > +	reg_data = (u8)ret;
> > +	if (on_off)
> > +		reg_data &= (~0x01);
> > +	else
> > +		reg_data |= 0x01;
> > +	return regmap_write(chip->regmap, MT6660_REG_SYSTEM_CTRL, reg_data);

> Hm, this looks like an open-code of forced update bits via regmap.
> But interestingly there is no corresponding standard helper for that.
> Essentially it should be regmap_update_bits_base() with force=1.

> Mark?

regmap_write_bits().

--H88uUF932U8Oj0a6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4duHAACgkQJNaLcl1U
h9Buowf/UyFuv5m4kkR3mDh23iVqGGfCUbs52vx5O6dxillJ76kZ71N7Vg2LPrOq
c9B8A7CLb2Ao2pTBr3o1ZONyZiRm1L+5OqyeZZzSnUnuECVsQASRgBpssbrUINHV
p5rY6kKIF5dKZGOBjmZWHSNjZ8GgC0BW4Si0P5WH0k7xDHlUsXQHiz47YXWcHQ2d
zjenB+X5Kg74bvJ6uh+5KM0kqhQPKSHw33HR7DejUQQMyQFQtNtQVkebVEXnMM6/
sItgCSyukh8F9TTWI6StXdTeJvcveaa1VUAqu68nImD0VL2im79DbbPzoMks/29G
GORmKiyK82lF0hw6y6zwOcga3GD/KQ==
=xw93
-----END PGP SIGNATURE-----

--H88uUF932U8Oj0a6--

--===============7084482549366548392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7084482549366548392==--
