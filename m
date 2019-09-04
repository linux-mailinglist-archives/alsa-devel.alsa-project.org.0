Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38887A8195
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 13:58:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B92A81658;
	Wed,  4 Sep 2019 13:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B92A81658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567598306;
	bh=1XaiG5Z4wIezCuDAXz/E6SURYdf+CSk52Fa5nx5sI70=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FbNkcs5o1Qwi36QUDh13y0By3u+Ka9JKMzBiadVTMbwysPEnGyTSQdcKj4OJO1AnD
	 v6uo098CwKTatKx9qStevrRocbznjIy8E2+RvTO5j9W6SZuTWTt2OnO53GjTtduLRQ
	 ZemTaTdo6S4PdaU1hszYvVOTHpNDrBKTj4ekGrng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3512EF803D6;
	Wed,  4 Sep 2019 13:56:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39607F803A6; Wed,  4 Sep 2019 13:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BE68F80171
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 13:56:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BE68F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xlWeFFxH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DBbsf8r5uOYzN+tf0BF20JNGTJbY9WmlICsBkr1a8NU=; b=xlWeFFxHrCDMBztiXN9rlo8jH
 8JrGmZ3VaD7B2cqQBHxSC2Q4Cny4Pt5Lw7NvWRLwE1/6EkM5oPKFAihJ9ss0ZnQFOn6LCsAaKa+oC
 wc/QPCRUrPrgEADCudEqA6s0uJe4jDxcUw4thuNr6vZNPZ9Edzuyw2jpVDjzB6T5jGQLE=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5Ttn-0005I8-RR; Wed, 04 Sep 2019 11:56:31 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A64EE2742B45; Wed,  4 Sep 2019 12:56:30 +0100 (BST)
Date: Wed, 4 Sep 2019 12:56:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Richtek Jeff Chang <richtek.jeff.chang@gmail.com>
Message-ID: <20190904115630.GA4348@sirena.co.uk>
References: <1567494501-3427-1-git-send-email-richtek.jeff.chang@gmail.com>
 <20190903163829.GB7916@sirena.co.uk>
 <1a776762-ee65-7344-4bca-c82e16badffa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1a776762-ee65-7344-4bca-c82e16badffa@gmail.com>
X-Cookie: Help fight continental drift.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] [MT6660] Mediatek Smart Amplifier Driver
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
Content-Type: multipart/mixed; boundary="===============8820289793133034738=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8820289793133034738==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 04, 2019 at 03:07:06PM +0800, Richtek Jeff Chang wrote:

> > > +static int32_t mt6660_i2c_update_bits(struct mt6660_chip *chip,
> > > +	uint32_t addr, uint32_t mask, uint32_t data)
> > > +{

> > It would be good to implement a regmap rather than open coding
> > *everything* - it'd give you things like this without needing to open
> > code them.  Providing you don't use the cache code it should cope fine
> > with variable register sizes.

> Due to our hardware design, it is hard to implement regmap for MT6660.

You definitely can't use all the functionality due to the variable
register sizes but using reg_write() and reg_read() should get you most
of it.

> > > +static int mt6660_i2c_init_setting(struct mt6660_chip *chip)
> > > +{
> > > +	int i, len, ret;
> > > +	const struct codec_reg_val *init_table;
> > > +
> > > +	init_table = e4_reg_inits;
> > > +	len = ARRAY_SIZE(e4_reg_inits);
> > > +
> > > +	for (i = 0; i < len; i++) {
> > > +		ret = mt6660_i2c_update_bits(chip, init_table[i].addr,
> > > +				init_table[i].mask, init_table[i].data);
> > > +		if (ret < 0)
> > > +			return ret;

> > Why are we not using the chip defaults here?

> Because MT6660 needs this initial setting for working well.

What are these settings?  Are you sure they are generic settings and
not board specific?

> > > +	if (on_off) {
> > > +		if (chip->pwr_cnt == 0) {
> > > +			ret = mt6660_i2c_update_bits(chip,
> > > +				MT6660_REG_SYSTEM_CTRL, 0x01, 0x00);
> > > +			val = mt6660_i2c_read(chip, MT6660_REG_IRQ_STATUS1);
> > > +			dev_info(chip->dev,
> > > +				"%s reg0x05 = 0x%x\n", __func__, val);
> > > +		}
> > > +		chip->pwr_cnt++;

> > This looks like you're open coding runtime PM stuff?  AFAICT the issue
> > is that you need to write to this register to do any I/O.  Just
> > implement this via the standard runtime PM framework, you'll need to do
> > something about the register I/O in the controls (ideally in the
> > framework, it'd be a lot easier if you did have a cache) but you could
> > cut out this bit.

> In our experience, some Customer platform doesn't support runtime PM.

Tell your customers to turn it on, it's a standard kernel framework and
there's really no excuse for open coding it.  If there's some reason why
runtime PM can't work for them then we should get that fixed but it
really is *very* widely deployed.

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1vpm0ACgkQJNaLcl1U
h9D/Wgf/fF6J63LckawJfQOykVgSmyHQqs469Lx+ZiWwED24peJ4nfDP41ehqc2N
jIXIbNv3uhy0SKfDxmczPs6zHyy+XgWw3pHOHVQR7SX2ZBIU/JwBYSYtmJiZW9yo
GWU/tn7Yql2ApiXs1VRjJfCeiHWCpPg4WTAGOjP2LUeALkQasMQI9nwtqEoJWSyz
tZ15Q9sb3HyKa1Pl0qmh4IPIIQvCtpvD3DdTyHs8OZGFlWzUg5WC17sjRLpbqgxd
d75ADeY84KntmV55haCavSYQGD5cjIMD1pWRc5Ln0yOUKO3H3gwUHqgOgafmUbmc
cTfAzmpdBvy1P5aHKQZ0z6uU7LT39g==
=jNHe
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--

--===============8820289793133034738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8820289793133034738==--
