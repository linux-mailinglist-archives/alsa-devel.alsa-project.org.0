Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C155F1BC557
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 18:36:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67C591690;
	Tue, 28 Apr 2020 18:35:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67C591690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588091792;
	bh=QYN+AI2dUA6ujirR6L84dRez4kCOvTZCAAYMp7oPUxE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X7nT2QpPI0cgM5LYqYoyekdwlAEasU9CFY/2uA/s8FTqnD/7h3+oF1bMjBmPb68Wk
	 sfEWCQMmpE+8tFm12mDLaO4as4HbPCiw+tDYhM2ILA8IvU7PxAGtp3Z2egtgzNMvYS
	 uKUqvzhTZVf1JUMK8kIjOxRAUIOE2ULxk+faNDpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EE35F801EB;
	Tue, 28 Apr 2020 18:34:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF119F801DB; Tue, 28 Apr 2020 18:34:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA4A7F8010A
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 18:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA4A7F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KvORqMuI"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1861B206D6;
 Tue, 28 Apr 2020 16:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588091683;
 bh=QYN+AI2dUA6ujirR6L84dRez4kCOvTZCAAYMp7oPUxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KvORqMuI+YGMJiC/8mKkh/+Mjnlf1Ib8I6qnItvy6ncRVXdOcBC0QGNwjt340/52g
 9GUq48SJebbO+sJYynAAuxdWQcS+imx3hDb0FXnTp+jkbI4cj3ieDfuT0PxooSndRx
 22SLNGi3PnVbT5O7kYsF5S9v+coa9S/z1B9Urs4M=
Date: Tue, 28 Apr 2020 17:34:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH] ASoC: core: Make sure component driver names are unique
Message-ID: <20200428163440.GL5677@sirena.org.uk>
References: <20200427193306.31198-1-ranjani.sridharan@linux.intel.com>
 <20200428114044.GF5677@sirena.org.uk>
 <e5116a2b2be975f07ba29ea438f100bbe93ded76.camel@linux.intel.com>
 <20200428161451.GK5677@sirena.org.uk>
 <71d8350edafd266eb1db63709e8c3ea7075b3566.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CqfQkoYPE/jGoa5Q"
Content-Disposition: inline
In-Reply-To: <71d8350edafd266eb1db63709e8c3ea7075b3566.camel@linux.intel.com>
X-Cookie: Eschew obfuscation.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
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


--CqfQkoYPE/jGoa5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2020 at 09:26:13AM -0700, Ranjani Sridharan wrote:
> On Tue, 2020-04-28 at 17:14 +0100, Mark Brown wrote:

> > That was in the context of a single DAI link, not the system as a
> > whole,
> > and only for platform drivers not DAIs.

> Ahh, got it. So, maybe I should add this check when adding platform
> components to the pcm runtime for the DAI link?

Yes, checking to see if there's any platform component already would be
good - perhaps we might have to relax that in future but right now
there's no clear use case.

--CqfQkoYPE/jGoa5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6oWyAACgkQJNaLcl1U
h9Chcwf/davATNCPWMUbQMoD3gxCrWZwrlLldAI2HsL9DKaGwAVIrjc1/yNoMcwJ
lZcZmLnqpB08epV5CnZK5bDZMzB16kvy6NNbxBxn4ST4Yi0IXIV9VhlR8veRGr0O
67fonTQMRS8azO5B4TKCklGnCMeFe6wSdaNB8CaRU3RvTRfalWyFHSqPcQ5Rh0Pd
all0/5S8Qjcmpt6Ws8SuFbiDHfuuOy/ZiMExUgrpUHjaiWO4KjY4Re0S956h3IaP
l/7n2tYfpFOeFVOpCSkubLXyZFOxRAGyuocZje30XACr3j91GBPKdl/T8E3eErUs
v8fyhGMYuuJcEvzpaP2FhSN3sM6s6Q==
=kqqb
-----END PGP SIGNATURE-----

--CqfQkoYPE/jGoa5Q--
