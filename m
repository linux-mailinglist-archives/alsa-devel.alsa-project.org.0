Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC391F77F1
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 14:29:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07CDB1681;
	Fri, 12 Jun 2020 14:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07CDB1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591964993;
	bh=ncMPaD4x7wzZV+qowE0+m2KtMfiPQApWLlMfwu1FgDU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pKxzbLRwalBcmRw6kDOTSaxU7lVrgZQ7Y71dQNymh7VEFcmsDr20/NtZWIAdFn3/O
	 IfHV1kkh0oZXibObusHV0r/U0mdpI2FMFyCRpd9NocFJMwcnRf4N2gCSK5NRYQUKOo
	 rCF9ho/zx9J3RfaWHzY1UvInm1lhXHXy4ahM1Qig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22B7FF80058;
	Fri, 12 Jun 2020 14:28:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 040AEF8021C; Fri, 12 Jun 2020 14:28:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD421F80058
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 14:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD421F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hIAsKX4R"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58D052081A;
 Fri, 12 Jun 2020 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591964880;
 bh=ncMPaD4x7wzZV+qowE0+m2KtMfiPQApWLlMfwu1FgDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hIAsKX4R1LaQNFBFADVYhnWU2IJbUFKqGIuVHtOa+LA1qHWDpyzLyzqZ0gRZe4Uco
 +D5ifAB5o2/KdMAMSf62QbtZFwbRBnmuBGTOqRLax1YbtbLJXjs7pHGY7MgeW8n//y
 O2wEybC585I+qLAvXoAtIHg9CDEYag/Y5zYFATYY=
Date: Fri, 12 Jun 2020 13:27:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v3 3/3] ASoC: ti: Add custom machine driver for j721e EVM
 (CPB and IVI)
Message-ID: <20200612122757.GF5396@sirena.org.uk>
References: <20200612085909.15018-1-peter.ujfalusi@ti.com>
 <20200612085909.15018-4-peter.ujfalusi@ti.com>
 <7f2c4297-3ad9-5b8f-c9a5-5120078120c6@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FeAIMMcddNRN4P4/"
Content-Disposition: inline
In-Reply-To: <7f2c4297-3ad9-5b8f-c9a5-5120078120c6@ti.com>
X-Cookie: As seen on TV.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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


--FeAIMMcddNRN4P4/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2020 at 12:27:17PM +0300, Peter Ujfalusi wrote:

> > +	if (IS_ERR(clocks->target)) {
> > +		ret = PTR_ERR(clocks->target);
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(dev, "failed to acquire %s': %d\n",

> Looks like I have extra "'" in the prints...

Apart from the issues you pointed out yourself this all looks reasonable
to me.

--FeAIMMcddNRN4P4/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7jdMwACgkQJNaLcl1U
h9AFuAf/QQTYkt2gQ+jespg63weznQYk0ssXoebt2m9iNQNRFaGLpmqKNn3lj0KG
V0x7spEYXKSbVHrfSY7zAxwsvArrY6W3jbwPBEqCDtnHtCG3tTO3Gy9p3x+iJedU
WUojc8srqGDh70REYmQAhGQNEJECulHW2Ed1/ZTCiz0hERlty1kFx3XbYUkUSvcA
suAVMJAFF2evebQV0r47V7/TqNR08VQoW/8vWDkWfhTILWsK59CjDd3CPPkE5Bt1
1VybBgG/AZp/oV/zX5uceG2toHuNMyzS++qA8XqwGvD7d5r2OyTz2MyJcZ2cIrgX
C6kNGFamvaNBJsUq4Leun5wiL7CxxQ==
=XNBU
-----END PGP SIGNATURE-----

--FeAIMMcddNRN4P4/--
