Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD96A19D3B6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 11:30:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A7181676;
	Fri,  3 Apr 2020 11:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A7181676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585906238;
	bh=CR/tI9v784EEmmkmwUkFyAobZR24aZ12MR0caJOnuig=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=opPmcdbdsRu+pqcoehyctZ3dI8/0NIaBGzFxnH5DyIHfTNLffyNm4+6puWT1HSjFH
	 IiQ03dwp298KA0Idp87rqIpq+2ftge9R907KAaNyjaZNhLghMaeEj5/ep8Z3XcHR8r
	 kamqGBONdM3otAP8dnEaOzJf5+Tou0YBhRlWV+KA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E5B1F800E4;
	Fri,  3 Apr 2020 11:28:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88700F8014C; Fri,  3 Apr 2020 11:28:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B3691F800C2;
 Fri,  3 Apr 2020 11:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3691F800C2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDEEC30E;
 Fri,  3 Apr 2020 02:28:44 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5149D3F71E;
 Fri,  3 Apr 2020 02:28:44 -0700 (PDT)
Date: Fri, 3 Apr 2020 10:28:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH v2 00/12] [RESEND] ASoC: SOF DSP virtualisation
Message-ID: <20200403092842.GB4286@sirena.org.uk>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline
In-Reply-To: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
X-Cookie: Use other side for additional listings.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 03, 2020 at 11:13:54AM +0200, Guennadi Liakhovetski wrote:
> This patch series extends the SOF driver to add support for DSP
> virtualisation to ASoC. It is built on top of VirtIO, contains a
> guest driver and a vhost in-kernel guest driver. This version
> supports a single playback and a single capture interface on the
> guest. The specific guest audio topology is supplied by the host

I've asked a couple of times for documentation of the protocol here but
don't think I've seen anything yet?

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6HAcoACgkQJNaLcl1U
h9DOVAf+MhF4C29w7n5EAVeOGbckTi7XEtpal8K6qXz9Mz7KjBfYn/rtVs6+NYw8
OyrZ5E81rvKKaL6aW+l8DiE48ifpzcl5IVpb0sjvZdZL2WnPw2/d55F27j+KmvQB
QqPwTllNY3LTGA/4E+hN+lk6JBkL+EkkoJwgC97xayAqHa95wl92I3KlcKjfkAuI
br0PQuwx5AWQFawWGWpEpyADBGBlMRDd50CgDxum3w0GatUCEy2WuvKOXAcVeL2L
smtYBwsyfc3eH/MsQV5kKkBRG8Q1EsckKYmLlgxi9U/KO+eOIsT3WxS3XT1o1XCt
OgTRPv7fJUiMbED2J1qxIxDaA/5gBw==
=WZk4
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
