Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F8B171B0
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 08:35:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 885861838;
	Wed,  8 May 2019 08:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 885861838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557297316;
	bh=fr3yq9DzpHRDD0L+ECEkRdOMc8ikfm6pUzov5LIpXKY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IkiuSHymsl4r3fiJwyVeq4dOrff8ALo5Uy1jUxzJYGV2y8j64pcN6v1fTWjICr44V
	 YaPfdBM3eq1Lo4ng3U1beB9udZs2NL9HkuP2Ulhx3X8eOEMep8RNxjDkeMrAACEIbb
	 PmcGORnZ5MS+3OzccYA0DMDxhG4bORfPndd2YRLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D72F896F0;
	Wed,  8 May 2019 08:33:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1577F896FD; Wed,  8 May 2019 08:33:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65AD5F80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 08:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65AD5F80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LiID/Zrf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pPif98ZM/TmDniz8pVQ4TViVTYP/nNXSRfu00PfqG8s=; b=LiID/Zrfqs++wfBerH2J7oDkn
 xDZY0T5AZW5/mzLx1hmP82JWheQ2bPefxmwKRQxUiw1cUJp0kT7Se7az7r5SJ6tJ0v+GV0TAI2Kva
 BO0BX0k6O7tRRs7iqsdq8bLmgJNPOzqtdCmQp50TKzGl2QURcyYR834qmPMNzoOa/wreY=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOG8q-00078c-C4; Wed, 08 May 2019 06:33:24 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 585CC44000C; Wed,  8 May 2019 07:33:18 +0100 (BST)
Date: Wed, 8 May 2019 15:33:18 +0900
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20190508063318.GL14916@sirena.org.uk>
References: <20190507051140.240245-1-tzungbi@google.com>
MIME-Version: 1.0
In-Reply-To: <20190507051140.240245-1-tzungbi@google.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, dgreid@google.com, tiwai@suse.com,
 cychiang@google.com
Subject: Re: [alsa-devel] [PATCH] ASoC: max98357a: release GPIO when
	component removing
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
Content-Type: multipart/mixed; boundary="===============4587135585916553881=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4587135585916553881==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VJvbhUb+lmZn6RCr"
Content-Disposition: inline


--VJvbhUb+lmZn6RCr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 07, 2019 at 01:11:40PM +0800, Tzung-Bi Shih wrote:

> +static void max98357a_component_remove(struct snd_soc_component *component)
> +{
> +	struct max98357a_priv *max98357a =
> +			snd_soc_component_get_drvdata(component);
> +
> +	if (max98357a->sdmode)
> +		devm_gpiod_put(component->dev, max98357a->sdmode);
> +}

This is an obvious mess, if you're explicitly freeing devm_ allocated
resources in the common case something is going wrong.  Just move the
initial allocation to the device level probe so devm can do what it's
supposed to.

--VJvbhUb+lmZn6RCr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSeC0ACgkQJNaLcl1U
h9CC9Qf+P+HfwZQ2NQJVCylX+n5sXt4SFdkuYNUZF2uNLfS0W2EXZJO5SnN9COdu
e2szxEGXPmOT/GMSLE1w2hgarg6fkaShOTd8gAFIEOdMie87Gc8ifnG2Nqatruky
UMYl+8x0gobWIRqF5mfzvXa63WmX4u/vKI63Bxk7ZXq+9w705khfnMDAARuLdIXF
HnR4HWfqMueejJ+wtirKS6gzR233uNm/YrdEV3NGCxAY9PbAberrYwoGHe/MAn/7
z3J6nLeNlbz41C5puDRzUGMq3rbqnxDcvLGSt+AVZCZWDDw41G0adyA2TosTPNzI
8slThEd1QlczqOFQJEpr5rP+b9mxhw==
=UmSk
-----END PGP SIGNATURE-----

--VJvbhUb+lmZn6RCr--

--===============4587135585916553881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4587135585916553881==--
