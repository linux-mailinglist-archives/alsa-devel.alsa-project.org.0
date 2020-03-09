Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C49EB17E623
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 18:54:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61B1B1697;
	Mon,  9 Mar 2020 18:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61B1B1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583776482;
	bh=8GAq+E0J/uJVZ33x5kaKoDW2TOuCQ6gNKc/C8fNKXno=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LDXmytLT2K1NhTIxsvqcmXDS1VqrLRHgXoLmVam1e4384emGm1bQn3WUWtmLAMpOE
	 vPKtnm4SISQQIfC/yTnT1ETrM3/RrtV2+Ox2OUDdr90ojH7fttjQc/ppxVzEsuXjGM
	 5pJl83TJaGsY6R745sbJ3lEiEwhJlUSLmaeBwJdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E37C8F80227;
	Mon,  9 Mar 2020 18:53:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A1FDF8021D; Mon,  9 Mar 2020 18:53:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D5C7CF800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 18:52:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5C7CF800DA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A039A1FB;
 Mon,  9 Mar 2020 10:52:56 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 253403F67D;
 Mon,  9 Mar 2020 10:52:55 -0700 (PDT)
Date: Mon, 9 Mar 2020 17:52:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/7] ASoC: Intel: Skylake: Fix HDaudio and Dmic
Message-ID: <20200309175254.GK4101@sirena.org.uk>
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <9d53337b-b02b-efd7-790e-c3db18562346@linux.intel.com>
 <20200309113844.GA4101@sirena.org.uk>
 <e50a52eb-ea7a-4528-cfdb-1dd9210b5779@intel.com>
 <20200309165413.GH4101@sirena.org.uk>
 <34fadb92-e9b5-08f6-a5b6-3db28842f88f@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PEfPc/DjvCj+JzNg"
Content-Disposition: inline
In-Reply-To: <34fadb92-e9b5-08f6-a5b6-3db28842f88f@intel.com>
X-Cookie: Above all things, reverence yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com
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


--PEfPc/DjvCj+JzNg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2020 at 06:48:35PM +0100, Cezary Rojewski wrote:
> On 2020-03-09 17:54, Mark Brown wrote:

> > I didn't actually look at the patches since by the time I went to look
> > at them it was clear that there was going to be a new version.  Pierre
> > was saying that they added new functionality which would generally not
> > be suitable.

> Ok, sure. Should the 'Fixes' be appended regardless or leave it as is?

There's never any harm in adding them.

--PEfPc/DjvCj+JzNg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5mgnUACgkQJNaLcl1U
h9DjbAf9E7RR5tAMQuWPBqG+lSJbc13nSfmlilVPh35qBQPk7eUCqcnL0e5xftCD
KjB/5g1z2oZ3SFbCMI7G9CGLkM/igLu8dnkG4Cb5rDNzoa7TTe4uG4S3/6IDOOXI
koMrYe8SAJQUjEm/IA+VVmaU8CAKnuu3ZuYLIvT6wtqRm7ehpcqeeoZ8Z6g12vTk
CHcj/atYiQK7nLD3bQUWerF1+Hji3QUBiNjhn/r4zc+xU6AMgRmbnf4+LDtzAoI/
YyRhA9jt2Z3Kete5ERZNkzsmBMISC+FHEfTAc1CtPDsj+uPJuuLcmbpVjRPnOcGX
dITiRqmiK0uQr27W1zQYUv/RX5QwQA==
=b64f
-----END PGP SIGNATURE-----

--PEfPc/DjvCj+JzNg--
