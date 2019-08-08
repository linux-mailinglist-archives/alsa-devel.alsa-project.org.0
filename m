Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E7586AE4
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 21:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD6E51615;
	Thu,  8 Aug 2019 21:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD6E51615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565294046;
	bh=Mb69gCSZbyDqqGTdXTqzG02R0a7AvIUiWNs22elg/c8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hdqAEHgmRjgg2BkVmR+1wn/w+fGmZZQWFJwNgiCF1pjq6B5MWT38DxwWyZhCmDubH
	 GgqD5GLKNU4kcOMq6adiA4n6MgGLyiC9KR5Mw7QHAFFvz5UWJLkzyjEcNUZXymFO0o
	 d3VAWYVQEm8+hNyR8i5BwOy9sRLSUq03fZfybEX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BE73F80534;
	Thu,  8 Aug 2019 21:52:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09A27F80534; Thu,  8 Aug 2019 21:52:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8EA5F803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 21:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8EA5F803F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iVKOlFDO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1MWRQhv1JoqmBcDEPz0hEreVKta/Mv4QnU98H8se/ZU=; b=iVKOlFDOmWwddtjobr+BdDZW6
 yi04iCpOXEqFxbDYYsmEipmZPg8rHBBwAsU0nL4Ok75LgzN3S4EO5wGYbcXzSaNfZ7GXKJ0Og9v/T
 KwP0bMbCmrihAzqWFAF6GThe9BJcUiyTFktozEqRbs7MgWGONzwyvxaMPMIChKFKJNPts=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvoSO-0003rT-To; Thu, 08 Aug 2019 19:52:16 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 249062742B42; Thu,  8 Aug 2019 20:52:16 +0100 (BST)
Date: Thu, 8 Aug 2019 20:52:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190808195216.GM3795@sirena.co.uk>
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-2-srinivas.kandagatla@linaro.org>
 <d346b2af-f285-4c53-b706-46a129ab7951@linux.intel.com>
 <cdd2bded-551c-65f5-ca29-d2bb825bdaba@linaro.org>
MIME-Version: 1.0
In-Reply-To: <cdd2bded-551c-65f5-ca29-d2bb825bdaba@linaro.org>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, vkoul@kernel.org, robh+dt@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 1/4] dt-bindings: soundwire: add slave
	bindings
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
Content-Type: multipart/mixed; boundary="===============2464776989246162657=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2464776989246162657==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kunpHVz1op/+13PW"
Content-Disposition: inline


--kunpHVz1op/+13PW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 05:48:56PM +0100, Srinivas Kandagatla wrote:
> On 08/08/2019 16:58, Pierre-Louis Bossart wrote:

> > > +- sdw-instance-id: Should be ('Instance ID') from SoundWire
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 Enumeration Address. Instance ID is for =
the cases
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 where multiple Devices of the same type =
or Class
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 are attached to the bus.

> > so it is actually required if you have a single Slave device? Or is it
> > only required when you have more than 1 device of the same type?

> This is mandatory for any slave device!

If it's mandatory the wording is a bit unclear.  How about something
like:

	Should be ('Instance ID') from the SoundWire Enumeration
	Address.  This must always be provided, if multiple devices
	with the same type or class or attached to the bus each
	instance must have a distinct value.

--kunpHVz1op/+13PW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1MfW8ACgkQJNaLcl1U
h9BC6Qf+MpoIdX8BiE+fy8vg1a5ZsWCGWK/V6LMgyk7vx2P8oWJylUyIG9xTvecn
zrFjIwW5t44x8P5ycsmXZCqG8JCU0/qPSQ9Aw4qC1jesy3Ue4Lwtmu0qH5gvFsSg
CKW/bidKNFSCg3t39fddxeawm+GiutGVwnCgnVtkH9tmcONusdDfnDdOLQiQUQa1
CsmQIbGs/BEuF6LF11Ho58rf7UHvuu4oF9mrKszQWdZKTkhNPfjgqy4n8/scVObd
TAbUUo0uixBk2YmmcxrwtF1V9QGPyifPM8LsHlXlxO3ZSH+/fARzkRoBYQlbwRju
aGWXSh12SOwhelEkD1Q19DG25zsCsQ==
=Nsvw
-----END PGP SIGNATURE-----

--kunpHVz1op/+13PW--

--===============2464776989246162657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2464776989246162657==--
