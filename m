Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FA948474A
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jan 2022 18:57:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5218517E3;
	Tue,  4 Jan 2022 18:57:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5218517E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641319073;
	bh=iELEMoO119C4PNCunlvjJ10jDldCWnrlQLzLPplxMms=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RlWGp7eqDM5MAsTd0MtTE5ypERBEt3pF+wFWa3SqsM1sewfGo5X/NnaMuAUwly0Kr
	 u0i7ho81OuVCa3eybCXvXRHOY3nucEk3M8MKAmvstIG4G2CaLIBV5b1BqwvT5ANQOl
	 h4onRkeTN73Z9K0QVa4gUJiZsBffrkoHXqV1Ahhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D36AF8032B;
	Tue,  4 Jan 2022 18:56:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B01CF800FF; Tue,  4 Jan 2022 18:56:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEFB4F800FF
 for <alsa-devel@alsa-project.org>; Tue,  4 Jan 2022 18:56:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEFB4F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YjTl1xu+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 938996152D;
 Tue,  4 Jan 2022 17:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901C9C36AE9;
 Tue,  4 Jan 2022 17:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641318995;
 bh=iELEMoO119C4PNCunlvjJ10jDldCWnrlQLzLPplxMms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YjTl1xu+ntHA4zJjmC3X8ByiNV0lyG2xS8D1thqZgFxp7g2BSR6nQ2Q0B1boxyL40
 crdQB525fAmIQXh1h+ISGLU9Qw6X+R/fYzK7tM8PaacpzUY1K7jOJIQ1+jom2g0p/Y
 7v7HduSonokRl4kRuEaejyIvrzi3/XmpgfNIRtZLUG6TCcGZoYsQQSE2HRpGETyR8H
 T3xoaiypmUOVsp1KGO3B8WYmNsP7pYsWBR/sOnkiqRe/fPf51HMSBGKgs2mTJvptKf
 l1RsiZUxFXfukcj1VsPXbyXxsLXQG/pNuTsv/o/I47qqyr3QM4xF6e90KTeMHkL2Mu
 Jvfv1+pWwkrZA==
Date: Tue, 4 Jan 2022 17:56:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: cs4265: Fix the reset_gpio polarity
Message-ID: <YdSKTrW+n3dlsZ+O@sirena.org.uk>
References: <20211229114457.4101989-1-festevam@gmail.com>
 <20211229114457.4101989-2-festevam@gmail.com>
 <20211229115352.GA18506@ediswmail.ad.cirrus.com>
 <CAOMZO5DcXUR2Z6-cokwizDbAKnEs877AjbX9FEow2RFHfebnuw@mail.gmail.com>
 <YcxX3XFWO9jQWlLJ@sirena.org.uk>
 <CAOMZO5ANC34SoxB9YeiLQo8FsjYana9uXiogtktJZ_ghx9JiQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9gifkRVx7lb59DIj"
Content-Disposition: inline
In-Reply-To: <CAOMZO5ANC34SoxB9YeiLQo8FsjYana9uXiogtktJZ_ghx9JiQw@mail.gmail.com>
X-Cookie: The horror... the horror!
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Fabio Estevam <festevam@denx.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, "Handrigan,
 Paul" <Paul.Handrigan@cirrus.com>, james.schulman@cirrus.com
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


--9gifkRVx7lb59DIj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 29, 2021 at 10:11:57AM -0300, Fabio Estevam wrote:
> On Wed, Dec 29, 2021 at 9:43 AM Mark Brown <broonie@kernel.org> wrote:

> > There might be more out of tree users of course - there's no requirement
> > for people to upstream their DTs.  Probably better to play it safe.

> If someone correctly describes the gpio_reset as active-low, then the
> driver will not work.

> If there is any out-of-tree user of the gpio_reset property, they are
> passing the incorrect polarity in the device tree
> and things are working by pure luck. (wrong polarity in dts + wrong
> polarity handling in the driver = working state)

To be honest I think the transparent polarity handling in the GPIO
bindings was a mistake, it's caused no end of problems especially with
signals like this which are active low - it's a nasty gotcha for
conversion to descriptors.

> Ok, if this can't be fixed, then let's drop patches 2 and 3, which is
> unfortunate.

Why drop patch 3?

--9gifkRVx7lb59DIj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHUik0ACgkQJNaLcl1U
h9CvtQf+KaLr8HuFaYj7YVmC4/IapKlwhMxsxCgd4vvqw9PlMkx0XVbPXDoiA80J
Dge2jjwweXuzJET++MOiBrIVNe0ax5RHERjE3VmtW6y5J4GdlDVCSwclJCJ/CVXI
nMS+Qt1zBbykjHy8WXUieyXnibE8XF1sWvl9eu6xreO2vzeb/l+KH1ENK28/sKAx
fWliuhaehzu7eEpAiaEXGfDDwDNOixp54S08VMy4yxCsiT+FruH2oJfSIK/IwFlc
8ZU9Y+oGvWt9IQvLO9KXGOZYmXDXtVz2Xj5hxtXE1s47ExKOMe3pLKUvZ63DplyW
elMbV2TGokcRfwcdt/huqeYC2QqpDg==
=vvsC
-----END PGP SIGNATURE-----

--9gifkRVx7lb59DIj--
