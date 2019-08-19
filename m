Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F0994F19
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 22:35:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB69D165F;
	Mon, 19 Aug 2019 22:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB69D165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566246946;
	bh=5s8ieEnZO4i4UdTwoV3qpeJpOMA/k7y8W8l4qXUYFtc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oyTlCML+j3EhpTAt8TRHPifQqNc2y3ft5QZhtPLXtUeXgt6MfYXcECMCGxSm2P4dS
	 leTX4fomJmduurcra8p3ClIgdCDgOywDKCbRKq2b96gVgvVg4QBRxyan5TJW7x5hPv
	 xUCeq3GHUZKldcIs5AxMmSrZKxjm2kwYIX9r+h8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EB6DF80306;
	Mon, 19 Aug 2019 22:34:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4310BF802FB; Mon, 19 Aug 2019 22:34:00 +0200 (CEST)
Received: from mail-ed1-f98.google.com (mail-ed1-f98.google.com
 [209.85.208.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF4E8F800BF
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 22:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF4E8F800BF
Received: by mail-ed1-f98.google.com with SMTP id g8so3210447edm.6
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 13:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b0z10yfIcWoL91e6An5oNpvYsTDyoLoFv8vjgDVqT6c=;
 b=RWaTk4qnYWdIB7zZh+87L4HowR4YBfLY+nm/7TGJFPHeuFSGSpFAklDDEPi8L1b0Bc
 4Yt16fwoPGMaIhTr4fOXBbGEazrmiqDVcHtbeEERXb/63TQmIT4fV6IE5bnjLgQmTiVm
 G780+uFDLEV5K0bmqvMpph4BkUYRyC/ObSm1dG6EvV4yjqd6g+o2Da9+e0tTAW8mTrCs
 9Is0ZNJEGcHe1A+GZrNWbxVz4Qp50Q3kSpBubT+A0nT++c4vSKmD6YMRV2H9ofjJ820B
 OEj8Ltak5ujkTrRAic4aEzZ042XtDL7ZjcVjwn5XGX6wHrCQzQLZTuk77U5CNFAeC+5F
 LLgA==
X-Gm-Message-State: APjAAAWJzywaIRCMDm/MMvVXVlJ7u33xqDu/zKx6f4ifiqRe47G2ZXmn
 JEtGxKy9Iux7e6RFhJJfYxfgDWow9dYc7WMC/f6fNmdxDWuLtm3aUZIHCmRbsR+4CA==
X-Google-Smtp-Source: APXvYqx8wHOW9SxA1asCGQPWb7b31Gb6+8dott0u2y5CwiDLI5zjgwvDDWMwgL4WjPIyr/nwolcTIwKo2A4g
X-Received: by 2002:a05:6402:644:: with SMTP id
 u4mr27317681edx.176.1566246237788; 
 Mon, 19 Aug 2019 13:23:57 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id a2sm75513ejx.48.2019.08.19.13.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 13:23:57 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hzoC5-0006hF-6p; Mon, 19 Aug 2019 20:23:57 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 539DD274314C; Mon, 19 Aug 2019 21:23:56 +0100 (BST)
Date: Mon, 19 Aug 2019 21:23:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Message-ID: <20190819202356.GD5563@sirena.co.uk>
References: <20190815154500.29090-1-pierre-louis.bossart@linux.intel.com>
 <20190815154500.29090-2-pierre-louis.bossart@linux.intel.com>
 <20190815164942.GB4841@sirena.co.uk>
 <CAEnQRZAM6VkCewfVYysz-NmPNEz-CSe763Cv-kz9kyNjx8uMtQ@mail.gmail.com>
 <20190819134616.GR5999@X250> <20190819192406.GC5563@sirena.co.uk>
 <CAEnQRZC_YFZJFbbwey8pQcAfUbcKxKjC88i-Zz7sJEG7zbUXGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEnQRZC_YFZJFbbwey8pQcAfUbcKxKjC88i-Zz7sJEG7zbUXGw@mail.gmail.com>
X-Cookie: QOTD:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, Daniel Baluta <daniel.baluta@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Shawn Guo <shawnguo@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0070719299146396288=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0070719299146396288==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 19, 2019 at 10:32:58PM +0300, Daniel Baluta wrote:
> On Mon, Aug 19, 2019 at 10:24 PM Mark Brown <broonie@kernel.org> wrote:

> > Right, especially so we get domain experts looking at things before they
> > are merged.

> So the binding documentation should go through Mark tree right? We
> will update the
> patchseries and Pierre will sent v2, if I understood it correctly.

Yes, please!

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1bBVsACgkQJNaLcl1U
h9Bz7gf9GvqfAtuuz/fm+vQY42IZjRaH1Io0bDIuytyAWzloOe9iSuB2wAUiUmMX
rXyCHwxy6Wih99XxCSoek3lPdL88fFHnOLLt7+/BMUMx6gDaBLxXWl1Z/mN1BzgW
n4pGaHPxgudf9ld15QbKiAXk9jQ04JWnBh6nSoUinE/Fc+Re3Ve3isbdC6Ne+rPD
mFbyis/lLsMOdmPLDjmwgKgDrG3zCuXqa87bwTIQUhSLIwdExA+U0SnUm0N5ypLU
xQDbj1eL5ozvhjhVXDDDG62oWBISx7ConpTYUpQgKYfHzqTymlea0uPjvwYPLvUJ
08BeeRW97A9w/dYT9hSCxrhcvp6KVw==
=2gxi
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--

--===============0070719299146396288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0070719299146396288==--
