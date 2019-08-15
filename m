Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E56E8F13F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 18:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B4DB165E;
	Thu, 15 Aug 2019 18:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B4DB165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565887896;
	bh=gOc9OuU4g5xvHZfW2iA6NFhmIuibHZvHRECxRz6Sy60=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XjhomE84pNGfhshGVf3wDPcP26g9n9iG706epiic0o4pfOsAGq557r/7x/QHEfFQo
	 WL3XBzpK3uUB4wQlzcUP2nRJ2bi+rRTKgix8KhwWKIZYgeL6DCgn4AHq6G9wndZIjx
	 h3TJ8MDaRgSf8m4ga3vnLPB7WgJQN1gGEeKY+w0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 765BBF80273;
	Thu, 15 Aug 2019 18:49:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85124F80274; Thu, 15 Aug 2019 18:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f98.google.com (mail-wr1-f98.google.com
 [209.85.221.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 892DBF8011F
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 18:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 892DBF8011F
Received: by mail-wr1-f98.google.com with SMTP id b16so2780613wrq.9
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 09:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q84H7VgOCdGbCnODHVItMZp+53BQYwGMSUuiOLpEEac=;
 b=cjbM8pL8VQ9N23ybw62PMB0AzU9umEkM/JfArGJ5eUQrnfbxqE6LRXbfJQ0hrSNUqi
 91+DiiJIWTCXNhuUDARhWYq/3wfFtgfUsmYsbCjW3OqurwmYiGq66j3CLtQjG1kUnB2B
 1aUN6x4e/nWqRmKsUZWktuGANmhavISaMnYo1/EnftzY4csJdHktJ3Ddn+fkyXjpx+EK
 b+d7BXHELZJ7+UlFvNM2lnprzX/ev9+nzDLtBm1mKAyHE7lZbl/MvLnhNw2gXzuLQfMs
 WYBKsxUAWBFn+yPLwCYeUmwDgR8AnzYPT/Aw6injk420OdgZ2r/HXX6uT8/70uwCw7Qp
 JcWg==
X-Gm-Message-State: APjAAAWxZKTJPxrlEqltMIFtQSM0HowlZ0vKKAl7n+rv3gWhzO1iXU8J
 GnBSNEq1e/PLzn1eER8VOGAJgYkbn0Y2aIFMy6/HgS87ozkZrdC8YxQhluYVeOVN0Q==
X-Google-Smtp-Source: APXvYqzTXqCCYON1meJ6FRhZJhOk5PXePXItvInV2qQnD+AWFPsnSPH01+raxjR+PZO8CFDNe3GjNaH2iKdg
X-Received: by 2002:adf:ce04:: with SMTP id p4mr6492762wrn.227.1565887784466; 
 Thu, 15 Aug 2019 09:49:44 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id b74sm7602wmg.8.2019.08.15.09.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 09:49:44 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyIwa-0004sx-0f; Thu, 15 Aug 2019 16:49:44 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A54432742B9E; Thu, 15 Aug 2019 17:49:42 +0100 (BST)
Date: Thu, 15 Aug 2019 17:49:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190815164942.GB4841@sirena.co.uk>
References: <20190815154500.29090-1-pierre-louis.bossart@linux.intel.com>
 <20190815154500.29090-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190815154500.29090-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: MIT:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: SOF: Add OF DSP device support
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
Content-Type: multipart/mixed; boundary="===============5864071999345727624=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5864071999345727624==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2019 at 10:44:58AM -0500, Pierre-Louis Bossart wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
>=20
> Add support for device tree based SOF DSP devices.

I'm not seeing any binding documentation here.  Binding documentation is
required for any new device tree bindings supported in code.

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1VjSUACgkQJNaLcl1U
h9C9ogf/azqPJo43SmwR3YnM0sdSvQEQHwfDsGNdMofxB5q4EvmkGrkamUZCew65
FNOC7HDmnb4FqsXDUJuXyE3h45cvExWvFMsYr2t5umAMWSg8E4Ak2/O8hmlhfnVS
tWHNAXSQN2TRdVTLs+uD0FlOiSUw6LZtoJ+wvc2DfxpbHlZLWDMwXQ9V5ZqMywwU
l/n0IEuJajcNIFeGuGxFiChVOGD9xl52qslU5H5EvprV0WjTjinT9O3dQFULjFxQ
78/GgAkMbxt0Q2DZD8bunviqy2ikKLqzURoS1qo0M00Hqwr5PhHz+trIlliXtGpZ
K50KGKtmcYho1CWfLFJNGinGFhmoeA==
=MXcA
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--

--===============5864071999345727624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5864071999345727624==--
