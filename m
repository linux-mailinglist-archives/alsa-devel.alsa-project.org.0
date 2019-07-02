Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 001035D125
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 16:04:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4783F168C;
	Tue,  2 Jul 2019 16:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4783F168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562076283;
	bh=f2eontFjZSqNP2JPud4CdAi1vf1pQ0+KmnicPKST41A=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GzQR1noWrrnRfDL/GrxT2aXH9U8OfXUmDAJzEnAWmPr03VtRp2vqfAw7Hblio1EvL
	 yHCZpTHOYyemN7wApxa2FlQ/ZmBU44X4xXuu7K9aEPzl6InQKDpSOMGWiOEVq9V9Bs
	 x900nZL5OGw5e1YHADwpGDAJwQRxlhm1T24cKn90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64736F800C7;
	Tue,  2 Jul 2019 16:02:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93060F80058; Tue,  2 Jul 2019 16:02:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E525F80058
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 16:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E525F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="J1cjn6zw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1bt7onZdaroroVUiwTYzttShEdXUqbhPACv/uGvlimk=; b=J1cjn6zw+x8u130+ivpBIdMsU
 gHnMf2Yut6Wng5AJauTWawWOprCaKFQPdMLNEnefZk7CowD5dc5xv/uzyUY+yIM54wdTPKZhhnQoR
 4O2izs820HtlfShqkvOBI+JaZ1XDq6yU+K6SzhTzfIJoqKTiBLwZu9VtIA2CVS6z2kNVY=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hiJMz-0002TP-4I; Tue, 02 Jul 2019 14:02:53 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 57749440046; Tue,  2 Jul 2019 15:02:52 +0100 (BST)
Date: Tue, 2 Jul 2019 15:02:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190702140252.GO2793@sirena.org.uk>
References: <20190702080920.22623-1-srinivas.kandagatla@linaro.org>
 <20190702080920.22623-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20190702080920.22623-2-srinivas.kandagatla@linaro.org>
X-Cookie: This sentence no verb.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, lgirdwood@gmail.com,
 vkoul@kernel.org, robh+dt@kernel.org, srini@kernel.org
Subject: Re: [alsa-devel] [PATCH 1/6] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
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
Content-Type: multipart/mixed; boundary="===============0750215909845492992=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0750215909845492992==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ABYnUdqoGSokwVM+"
Content-Disposition: inline


--ABYnUdqoGSokwVM+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 02, 2019 at 09:09:15AM +0100, Srinivas Kandagatla wrote:

> +- qcom,micbias1-lvl:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: Should be voltage in milli Volts for micbias1 output

milivolts

> +	Supported values are in inbetween 1800mV-2850mV

in between

--ABYnUdqoGSokwVM+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0bZAsACgkQJNaLcl1U
h9BVIwf/ZrtpTqroAjSIn8T3sZSlepCMggF2K9upRobeq7jZHedZ6kcBQpAj1Btx
8RAy15YOLrH16f8ANuYCU9lVEzXn+iwx7yURRlBlt2WJdJah2JjQfLHsIEtPQv8a
wTpKdzieubMK0F0goPA8LYKoX+biHEwZlj2Ud/nUGtW8Ay/n5ZcGFE0ACI2JREXb
N0AT32HtYpUmO1AJq93jo1J11nzezCvc9v0IxVWDHtGoD3iCuao/9n59JNzcLTBb
q+DvYVXqlYWTf2SZTln8e7DLS6Phl4Spte94fxn/d5YVQN2qXGHWNmEAlRPm8VCs
/vR7rdWcd5g2ZBJRa+ak8cJJndmW3Q==
=bP+8
-----END PGP SIGNATURE-----

--ABYnUdqoGSokwVM+--

--===============0750215909845492992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0750215909845492992==--
