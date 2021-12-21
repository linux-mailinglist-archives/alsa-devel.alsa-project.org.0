Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B80B247C599
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 18:56:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 212FC17EC;
	Tue, 21 Dec 2021 18:56:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 212FC17EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640109411;
	bh=11+OOrOy+QxOSlW36IgdACCcHI4Q+D72iaqrukirtrc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pqq2lDagfS6boeNk6o9yigl4DuibJapSKQkTlEPPp6vyT7+IqQV+DSXZ6ORNOK+5T
	 JP0J4J0npTBJ+VQkJMC5pO8d3BDUA3qVmmG1ju+biQDV9288cDFYX9D9uB6eFMFwFM
	 Kj4PwbhuFF1ZyjhkiHTNKzePy59Km7tTLOkukKeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D9F4F800E3;
	Tue, 21 Dec 2021 18:55:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BADCBF800E3; Tue, 21 Dec 2021 18:55:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5774BF800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 18:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5774BF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BtSmvSd2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2C1B6165A;
 Tue, 21 Dec 2021 17:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F40C36AE9;
 Tue, 21 Dec 2021 17:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640109336;
 bh=11+OOrOy+QxOSlW36IgdACCcHI4Q+D72iaqrukirtrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BtSmvSd2/jW204QLdtidI0J4ozoAfeq9RpamCDzJ0+2s1P5+ELfIoer1uA1n04Ixe
 dI4vhLywtR+pTSrmfCjwChuHL+kkGbh6z/6pOXgY3k0kR2H70TO5tevQfvvCKZ+ipP
 GhdQ9QBE10Ab65RGHoeCEYpURrm/tLhpjMZY2h27YM2ukN9i6vpDMaHtwFz7DowWPm
 e4ChEce7P+BclogSzUWTh387z9gvBfZruDAnO2dPnB0SfOMB2ssPAoJV17ln+dBWSY
 E00er5o3+kyJ/VhKzv1w5fXU9d/6GpE3/GuPyQzhPgkSrFOjQnZq0ymx2qVZ74SZnt
 Ae4vSlbMC03IQ==
Date: Tue, 21 Dec 2021 17:55:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH v2 2/2] ASoC: Add AK4375 support
Message-ID: <YcIVEgTOuzKRoGdh@sirena.org.uk>
References: <20211220193725.2650356-1-vincent.knecht@mailoo.org>
 <20211220193725.2650356-2-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fBIqR1sn4Hlue0Mg"
Content-Disposition: inline
In-Reply-To: <20211220193725.2650356-2-vincent.knecht@mailoo.org>
X-Cookie: knowledge, n.:
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 phone-devel@vger.kernel.org, stephan@gerhold.net, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
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


--fBIqR1sn4Hlue0Mg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 20, 2021 at 08:37:25PM +0100, Vincent Knecht wrote:

> +	SOC_ENUM("DACL Signal Invert", ak4375_invl_enum),
> +	SOC_ENUM("DACR Signal Invert", ak4375_invr_enum),

These should really be a "DAC Signal Invert Switch" control rather than
an enum - really it's an on/off control for inversion.  Other than that
the driver looks good so I'm going to go ahead and apply, please send an
incremental patch fixing this issue.

--fBIqR1sn4Hlue0Mg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHCFRIACgkQJNaLcl1U
h9BR1Af+NrdhRclUC9F2gH4p4RpkuDfU0uVKoWvRectyEkS+IxVIVZn5K883FaBY
jeRP3uBYm8C9GD68NOeq/So3Nh+oi7W1RycbtvMPMHtIvmDk4NFCWfSxhdH+hNLI
JiQW1bupwiS5TQBNSoD9Xx2B3i4Yw2FSHUSDDYT3IyxTs83Ya5UVWSV0R5OhWYoi
yQY6uDqjsS/4m7YHpuBHNpxrB+TSUJZsGq1OCHdEXhktGhMvYbHNA9ZWkBmg3PIi
yg16BkTfJEjiHEcjgBPz7OBdH0yO9cm28GURU2jhRoe1jai6MMNYqjVijEbVVVuR
mqaKDfkp4KmKgZwhc2y+2ec8qHJkZQ==
=HTjc
-----END PGP SIGNATURE-----

--fBIqR1sn4Hlue0Mg--
