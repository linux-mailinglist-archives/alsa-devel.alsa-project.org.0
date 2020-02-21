Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A9A168443
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 17:57:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2FDF16CD;
	Fri, 21 Feb 2020 17:56:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2FDF16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582304246;
	bh=S/BpOi5B7fUj5UR+I6/VosoOE7/wYYHXw7HeqdF4ZJQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LZgJVFYtVcXaNO3ao7OcMwmcPOtNml12e4q4eFY+NejrtV7ez781cJNk0a9Hq/wXZ
	 j0eEHkdEon7DCQcUtXG+7BpGCXWVGO2bAGm7t2HZtLKohmXS1hlMwkJhDztvbG39II
	 k5kPwkk6rbjPA9XmRLWOnhHXDOBRtkVNO0sUeunM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBAFFF80273;
	Fri, 21 Feb 2020 17:55:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88973F8025F; Fri, 21 Feb 2020 17:55:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B7694F8011D
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 17:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7694F8011D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B070830E;
 Fri, 21 Feb 2020 08:55:37 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 266203F68F;
 Fri, 21 Feb 2020 08:55:37 -0800 (PST)
Date: Fri, 21 Feb 2020 16:55:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
Message-ID: <20200221165535.GG5546@sirena.org.uk>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
 <20200221130005.GD5546@sirena.org.uk>
 <316ce0d5-318d-0533-ef06-bd7e8672f893@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JkW1gnuWHDypiMFO"
Content-Disposition: inline
In-Reply-To: <316ce0d5-318d-0533-ef06-bd7e8672f893@nvidia.com>
X-Cookie: Dead?	No excuse for laying off work.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org,
 Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com, tiwai@suse.com,
 viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


--JkW1gnuWHDypiMFO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 21, 2020 at 02:31:05PM +0000, Jon Hunter wrote:
> On 21/02/2020 13:00, Mark Brown wrote:

> >> +	srate = params_rate(params);
> >> +	if (dmic->srate_override)
> >> +		srate = dmic->srate_override;

> > How does this work for userspace?  If we just ignore the sample rate we
> > were asked for I'd expect that the application would get upset.

> Tegra has a hardware sample rate converter (though driver not yet
> upstream or part of this initial series) and if using the sample-rate
> converter, then the actual rate captured by the DMIC interface could be
> different from the resulting sample-rate.

The ideal thing in a component model would be to represent those sample
rate convertors directly to usrspace so the routing and rewriting is
explicit.

> So we want a way to indicate to the DMIC it is capturing at rate X,
> while the resulting sample-rate is Y.

> I am not sure if there is a better way to do this? Ideally, the DMIC
> would query the rate from the upstream MUX it is connected to, but I am
> not sure if there is a way to do that. So right now it is a manual
> process and the user has to configure these which are not ideal.

Is there any *need* for these to be user configurable?  What's normally
happening at the minute is that either the external DAIs are fixed
configuration and the DSP just converts everything or there's no format
conversion done and things get passed through.

--JkW1gnuWHDypiMFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5QC4YACgkQJNaLcl1U
h9BuAQf9FRu14PuOOZ+O9sauEIcPzDlfRncn0yonqpoiOL8kSVmvII1P6SzUxVjG
KFT1ryG8Jk6CHEYPsfj5meLFRtbk+gB/l/j4+UoVvLdEy6SGGuadmkktdEJucjRG
FOHdt2hfaLzIAZKebaESc7yfGhrQ+2B6W1+FW+SxxpZrN4J8FeugjB31LOhCaKZo
ZGxy4cHJYjQRWAPKz5fHsjOkHU7Es0ZpqZ+jKq3j/IGQtaNy/T+j+x2kQohcWN7f
Bt3DpnlXTOy+iKdk2+7kvWZdo7Cqwydu8IuzvE9cyJc6xsLecENvaOdcbAPwtwvy
AScUw0aer+7MukF/p0KS8880tO3ilw==
=lUQu
-----END PGP SIGNATURE-----

--JkW1gnuWHDypiMFO--
