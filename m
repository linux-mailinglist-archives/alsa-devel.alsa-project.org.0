Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D118C1A0CDD
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 13:32:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70B0D1662;
	Tue,  7 Apr 2020 13:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70B0D1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586259138;
	bh=aUG4dbOPyE3FNO6Yx6gqCIj937P2XJdRoNN45ANKWjs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eRBZ8VZeGzMuY8KQE2gMnuqMSAFG5TNkU6J8PPx7jCw9KyeU0GT+v0lOLURfs+sUl
	 fn6/xtgPxKYTkYw7XD9fmGyPq8nnK0xXx3JhHhvWqo7Ub7b0zML1XM06jop69G3kDO
	 6AyqzcJZy2u+HAPg/gs441KTLpQdPbQdmW9gcomU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DF59F801F9;
	Tue,  7 Apr 2020 13:30:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A641DF801DA; Tue,  7 Apr 2020 13:30:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A192F8011B;
 Tue,  7 Apr 2020 13:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A192F8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Emoth3fv"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 98AB72063A;
 Tue,  7 Apr 2020 11:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586259029;
 bh=aUG4dbOPyE3FNO6Yx6gqCIj937P2XJdRoNN45ANKWjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Emoth3fvvL4Dywrqae968UgZSlx+4x24bamqPoQ6VfX1Q4zxkoIeUfdQjkwUQyhSc
 NGYBBiz7R/POdbgT7Rs3eSLMs1Mv1HBYkMt6/CXSs8ADNhhsijr3ozErBjmdK0X5fH
 A/7ZtackWECUMTk99pMlZ/1Vk5s425DSOLvqZNFY=
Date: Tue, 7 Apr 2020 12:30:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [Sound-open-firmware] [PATCH v2 00/12] [RESEND] ASoC: SOF DSP
 virtualisation
Message-ID: <20200407113026.GB5247@sirena.org.uk>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
 <20200403092842.GB4286@sirena.org.uk>
 <20200403110404.GA23734@ubuntu>
 <29be8be8d9b8700588da693d93b9f10adbb10016.camel@linux.intel.com>
 <20200403180918.GA25646@ubuntu> <20200407112411.GA10133@ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline
In-Reply-To: <20200407112411.GA10133@ubuntu>
X-Cookie: Just to have it is enough.
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


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2020 at 01:24:11PM +0200, Guennadi Liakhovetski wrote:

> After a discussion we agreed, that we shall try to port SOF VirtIO suppor=
t on=20
> top of RPMSG, even though this would be the first ever such use of RPMSG.=
 And=20
> since this likely will take a while and be a big change we suspend this=
=20
> review process for now.=20

OK...  the generic patches (IIRC it was about the list that Liam
identified) looked OK so if you want to send them by themselves then I
can apply them and it's less diff for you to carry.

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6MZFEACgkQJNaLcl1U
h9CukAf+I3T4IuSvvpX3Jkp4rkZ6wb5VC0HWWKqYDDQcYPJHY3B/vbzoUzC2hWQ6
XxDfDEcjmlDw33SbISSETJrWUnMQ/eH4oKCIqVB9gAmek7FtJ0+JBqsya1w64zpK
3isYH8UVYBVBtTbHtTWGT1k8iXNhuaJGUqtdIFTLEoJ2OXHPCR96iYTU+BhOkqt+
0VTXkM9WIQ/FxBNthaWHJolyhpPcgKfcm1J5yJ2o4mUQbC1DvCC/yrxGOStt+qk8
gnjlJS5b8JkpJnKcQIAOcbg+LUncpITTVkDmSBMrerLkxV6Yzq+rp9pWU6pmjWI1
FKr7a4DOYYSbXVt2M7142uuNDqfzmw==
=F9H/
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
