Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCED5D4ED
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 18:59:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54AE316AE;
	Tue,  2 Jul 2019 18:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54AE316AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562086784;
	bh=aESXZPhtNiMRaObNuxwZmSkfL+tQfsDT6SU5PTUZzyc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B8u1+SuX3HquYstrmAXHDjlUCQ0rGevRs/uNMyqf007tmkQYNirIO/MQ3o9N3bY3G
	 uLN8SEbtTFnjqU8TOWxv8+FND+rCL/pk6k9uKl3q1m18tnCB0zgQkUF5goWKpe1aWO
	 /YYQtduaUapJZ7YywY0o5mTA7gdqjf77b0NF+KIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EC42F80058;
	Tue,  2 Jul 2019 18:58:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA050F800C9; Tue,  2 Jul 2019 18:57:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B286F80058
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 18:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B286F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="VE3UBwBp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PTJMv27FdFMN8eOKebTdXSkSBv3n75YsOvB2JBF51mE=; b=VE3UBwBpkKPW38Q7ZCAyVPtSg
 xfbQ62knRIScKOX9NJNyFl41heQVDn1WxE3F4lAj+iQbtnq+rMapEuyzi/4c5lBHmhH0CU2HcQxnX
 qx5h42g66HBHl95X67n221JvuFSMfBra4PZGnYH/BkgpeEB6OPxYRHy7AiXxFfpo9z3W8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hiM6M-0002fC-Av; Tue, 02 Jul 2019 16:57:54 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id A8E63440046; Tue,  2 Jul 2019 17:57:53 +0100 (BST)
Date: Tue, 2 Jul 2019 17:57:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190702165753.GQ2793@sirena.org.uk>
References: <20190702080920.22623-1-srinivas.kandagatla@linaro.org>
 <20190702080920.22623-3-srinivas.kandagatla@linaro.org>
 <20190702144411.GP2793@sirena.org.uk>
 <2e2a32dd-3dca-5391-1bfa-ab1c1f420e3a@linaro.org>
MIME-Version: 1.0
In-Reply-To: <2e2a32dd-3dca-5391-1bfa-ab1c1f420e3a@linaro.org>
X-Cookie: This sentence no verb.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, lgirdwood@gmail.com,
 vkoul@kernel.org, robh+dt@kernel.org, srini@kernel.org
Subject: Re: [alsa-devel] [PATCH 2/6] ASoC: wcd934x: add support to
	wcd9340/wcd9341 codec
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
Content-Type: multipart/mixed; boundary="===============8069063826626723802=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8069063826626723802==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aX6oBa4COn3eIhlv"
Content-Disposition: inline


--aX6oBa4COn3eIhlv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 02, 2019 at 05:37:01PM +0100, Srinivas Kandagatla wrote:
> On 02/07/2019 15:44, Mark Brown wrote:
> > On Tue, Jul 02, 2019 at 09:09:16AM +0100, Srinivas Kandagatla wrote:

> > > +	for (i = 0; i < ARRAY_SIZE(cpr_defaults); i++) {
> > > +		regmap_bulk_write(data->regmap,
> > > +				  WCD934X_CODEC_CPR_WR_DATA_0,
> > > +				(u8 *)&cpr_defaults[i].wr_data, 4);
> > > +		regmap_bulk_write(data->regmap,
> > > +				  WCD934X_CODEC_CPR_WR_ADDR_0,
> > > +				(u8 *)&cpr_defaults[i].wr_addr, 4);

> > What is "cpr" and should you be using a regmap patch here?  Why
> > is this not with the other default updates?  You've got loads of
> > random undocumented sequences like this all through the driver,
> > are they patches or are they things that should be controllable
> > by the user?

> It makes sense to have a single default map here, I will do the in next
> version. And regarding user controllable, I will go thru the list once
> again in detail and remove user controllable registers.

What is a "default map"?  In terms of user controllable stuff
it's not just a question of if things are currently user
controllable but also if they should be user controllable.

> > > +	return of_platform_populate(wcd->dev->of_node, NULL, NULL, wcd->dev);

> > Why are we doing this?

> I will not be using MFD in this instance as most of the resources like
> interrupts, pins, clks, SoundWire are modeled as proper drivers with
> their respective subsystems.

This is a driver for a single device, you should be able to
instantiate things without requiring binding through DT (and
hence support non-DT systems such as those using ACPI).

> This gives a advantage of reusing those drivers like SoundWire, pinctrl
> on other Qualcomm IPs as well!
> Also I did not wanted to have a custom functions or hooks in the
> drivers, so platform bus made much sense for me to use here, which can
> take care of bringing up and tearing down the devices with proper parent
> child relationship.
> This will instantiate all the child devices like pinctrl, SoundWire
> Controller and so on.

Just create platform devices like normal...

--aX6oBa4COn3eIhlv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0bjQ8ACgkQJNaLcl1U
h9BMJAf+IEFPxTtA+36N+leLsbcLLmWvHD7CHxl9ksLO5f3LYWTOeeedAUSProjR
07HQiUbOsyuyYycS7SEHjQE/qwKJl5yk339Wg7pcIRxcQxnth8usDcmez9lOjXjt
AhOaC8oJWuPdKN/8mp5DzI2W06fvdfgZqZfwk1I4RspAHZXEJvPx2c62b7lBp5s7
Mg8eDoNa66UNOW4DanR3eho1uySOVcJwulzMnrIraqzxr9SeFVlXzFwOuRVtiKO5
s2ub2bfO/4Vt5Tt9OyglfRBRPmj1rL8oI8FECK0V2ZxWWnZHwZ15xPVip9NfYxaD
tVfh6acECVYUb1rsvtWresmJQZGlug==
=CKlN
-----END PGP SIGNATURE-----

--aX6oBa4COn3eIhlv--

--===============8069063826626723802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8069063826626723802==--
