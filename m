Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2B318B38B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 13:37:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE05F1769;
	Thu, 19 Mar 2020 13:36:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE05F1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584621448;
	bh=BCpxyOUGGeRFuITbv/mBOXvDx/jK3UsOaDoq1nXethU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q1P9WRHY7rxlK8Y5F1A9CCcdxQ4GkA7Llu5bKuLwnK0twN54mHw/ol25SLBwYwyfv
	 IlickLcyxx2Uy1J26ywekT3f4fJnQoKhF11eU0PRcl9de2TglMtFyILj3WIcQpYcR+
	 I2uvyOkJllWfPOrmZ+NZ3j55zKS0nTNX/lgzRqaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD134F80217;
	Thu, 19 Mar 2020 13:35:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9D30F8022B; Thu, 19 Mar 2020 13:35:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D787BF800C0
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 13:35:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D787BF800C0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF2FB101E;
 Thu, 19 Mar 2020 05:35:31 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4302E3F305;
 Thu, 19 Mar 2020 05:35:31 -0700 (PDT)
Date: Thu, 19 Mar 2020 12:35:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [v2 3/3] ASoC: rt5682: Add the descriptions for the DMIC clock
 rate and delay settings
Message-ID: <20200319123519.GA3983@sirena.org.uk>
References: <20200319074328.25284-1-oder_chiou@realtek.com>
 <20200319074328.25284-3-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <20200319074328.25284-3-oder_chiou@realtek.com>
X-Cookie: Captain's Log, star date 21:34.5...
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, cychiang@google.com,
 lgirdwood@gmail.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2020 at 03:43:28PM +0800, Oder Chiou wrote:

> +- realtek,dmic-clk-rate : Set the clock rate for the requirement of the
> +  particular DMIC.

Lars mentioned on the previous version that this should have units on it
so -hz (I assume, perhaps the unit is different) here.  As he said it'd
also be a bit more idiomatic to say clock rather than clk.

> +- realtek,dmic-delay-ms : Set the delay time (ms) for the requirement of
> +  the particular DMIC.

This change is good though.

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5zZwQACgkQJNaLcl1U
h9ACmAf9EW9eLMjl6lw6EyWKlryPbDmj31Z5QAMk7C8atbkhAO/cairMTFMODMbK
Z7FVtiUlhxrxMVcskaBmWAo8H1ES5O7lfFs9+jnteQHu884hxO+rgE2MKiFkVI0G
yrXG6VqV8laoLNeY3L3T22aFf9/zo0hQS1pSG5TasDKVyrBvn3KCa5pjyUvxBXwd
YLZSjW629gncu4y5nJcolGo4A6lofatG7su4zoJjDsshzcH7AsFuQUdStHiO5DJ2
QnO37IP63yrBLuuwNLAt0ISZlrzQFszsd+Mn8lesRTr3bsxtY+HTDa6GHoKRsg0p
REqfMsmVKmDxcT0Qa46AdY4KydOE/w==
=2TlK
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
