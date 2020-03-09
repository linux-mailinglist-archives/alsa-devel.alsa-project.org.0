Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C887817E51B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 17:56:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 654C71682;
	Mon,  9 Mar 2020 17:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 654C71682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583772964;
	bh=kU/9LkE7mPZ4GC+4dMcpbDDP/D1tGYyGtfXn/1zliAk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kFpGrsMl9Ncuvo8LkKP2b1NosPXbEVKHe/baE0Kml8bw9BBtecATckAuEilmythyf
	 svv/W3g/fSzU5ByPrICwnUZsaBhMPKzsDntDmbP8RvP+1M9paOQL6S+1CRBdwHAyW+
	 Z/mfev756xI8zX0IsFlYvTxCz+2hRcWWzbrAgnQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7446AF801F8;
	Mon,  9 Mar 2020 17:54:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1777EF801F7; Mon,  9 Mar 2020 17:54:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 907C9F801A3
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 17:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 907C9F801A3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E194A1FB;
 Mon,  9 Mar 2020 09:54:15 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63D1A3F534;
 Mon,  9 Mar 2020 09:54:15 -0700 (PDT)
Date: Mon, 9 Mar 2020 16:54:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/7] ASoC: Intel: Skylake: Fix HDaudio and Dmic
Message-ID: <20200309165413.GH4101@sirena.org.uk>
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <9d53337b-b02b-efd7-790e-c3db18562346@linux.intel.com>
 <20200309113844.GA4101@sirena.org.uk>
 <e50a52eb-ea7a-4528-cfdb-1dd9210b5779@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a8sldprk+5E/pDEv"
Content-Disposition: inline
In-Reply-To: <e50a52eb-ea7a-4528-cfdb-1dd9210b5779@intel.com>
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


--a8sldprk+5E/pDEv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2020 at 03:02:25PM +0100, Cezary Rojewski wrote:

> Mark, what's your take on backporting these to 4.19 LTS? Do we abandon the
> subject and "just" merge (once reviewed/ approved) into 5.5? I believe
> addressing all the issues mentioned on 4.19 is important.

I didn't actually look at the patches since by the time I went to look
at them it was clear that there was going to be a new version.  Pierre
was saying that they added new functionality which would generally not
be suitable.

See Documentation/process/stable-kernel-rules.rst for the official
rules.

--a8sldprk+5E/pDEv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5mdLUACgkQJNaLcl1U
h9DZ2gf/Zm6kaB1CqHuqxzdUL5bhxEtvxA/j13lodjtM70ALUUct6nd1q9AQwQHl
PGUll0xtrca4ftLBZFmbCK0ju+935msvPXIRX7Z1HwFeWkizR4whusEEyJtUYnI7
JRx4qcf4pJvB48os4ywrmUeEfqjb+J48WNbXGzkdqOsEz6ViaSZ3L+MtW3ovNbAq
A5IeCnGdxwSXDL7s88ZMZ85/4YRZh7EsnE1Bj6NN7e5luDDhdfsQbLUoeohS2ktx
2Z3pWPcDlgfoBHlX3Ku5uZmCHPW0+rxqDgyQSqb4Bc6i0mt7y+i7iWEYDcHYR+9K
J1qaRE7MRpDNO7KuzJD8/Mi6Dmm1mQ==
=L2tP
-----END PGP SIGNATURE-----

--a8sldprk+5E/pDEv--
