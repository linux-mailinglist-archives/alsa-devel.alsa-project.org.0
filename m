Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D5518BE2A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 18:36:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D8C7179A;
	Thu, 19 Mar 2020 18:35:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D8C7179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584639390;
	bh=H6+Zt68q6NpwZY74Cv9pAkKGS0V2iIXKJCpMSO5Ui6Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vrUmtFzNRImvvKD0ja3QBvPbO5sH8fVjMA6dxQR1Ab8MmE4NwhdTn+J4NsO1Y+8zx
	 v0opdA3kZrZOh6Z3n9MpCPws/S0ruwBj9FkKnknCpwBVg4lWSA76fH0/YrCk2m/j31
	 Z70XkHCpE4MplSW8zmoRvhZS0CCSjc+AytiKYof8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 145A8F8024A;
	Thu, 19 Mar 2020 18:35:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EE91F8023E; Thu, 19 Mar 2020 18:35:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2E0CCF80217
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 18:35:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E0CCF80217
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB94F30E;
 Thu, 19 Mar 2020 10:35:04 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FD7C3F305;
 Thu, 19 Mar 2020 10:35:04 -0700 (PDT)
Date: Thu, 19 Mar 2020 17:35:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
Message-ID: <20200319173502.GC3983@sirena.org.uk>
References: <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
 <20200318192213.GA2987@light.dominikbrodowski.net>
 <b352a46b-8a66-8235-3622-23e561d3728c@intel.com>
 <20200318215218.GA2439@light.dominikbrodowski.net>
 <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
 <20200319130049.GA2244@light.dominikbrodowski.net>
 <20200319134139.GB3983@sirena.org.uk>
 <a01359dc-479e-b3e3-37a6-4a9c421d18da@intel.com>
 <20200319165157.GA2254@light.dominikbrodowski.net>
 <eef45d20-3bce-184a-842c-216c15252014@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Content-Disposition: inline
In-Reply-To: <eef45d20-3bce-184a-842c-216c15252014@linux.intel.com>
X-Cookie: Captain's Log, star date 21:34.5...
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 kuninori.morimoto.gx@renesas.com, curtis@malainey.com, tiwai@suse.com,
 Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com
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


--ALfTUftag+2gvp1h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2020 at 12:21:47PM -0500, Pierre-Louis Bossart wrote:
> On 3/19/20 11:51 AM, Dominik Brodowski wrote:

> > That patch fixes the issue(s). I didn't even need to revert 64df6afa0dab
> > ("ASoC: Intel: broadwell: change cpu_dai and platform components for SOF")
> > on top of that. But you can assess better whether that patch needs care for
> > other reasons; for me, this one-liner you have suggested is perfect.

Good news!

> .ignore_suspend is set for bdw-rt5677.c and bdw-rt5650.c as well. I don't
> know if that was intentional.

The intended use case is for applications doing audio during suspend
like telephony audio between the modem and CODEC on a phone or
compressed audio playback.  I guess the compressed audio playback case
could possibly apply with these systems though x86 suspend/resume is
usually sufficiently heavyweight that it's surprising.

--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5zrUYACgkQJNaLcl1U
h9DIEwf9FLcdiU91qM0+JTKeKiJu3mL1vlW6iLHqYEhaCUw36glNuoopk/9psyqr
hB6DFa3EJketJQe9qh1VdB6kmTVNYALb6XL8xnXG0S5vbviIFlm/cZjCFm+ZJMCK
ugGjuCb6oqwAjWL/0WVtgA+v7Vw7RQYVpiz+3rq3IdXIFKhTvvN/F804ZgMWkCv8
Qu+s/2EZg3gfln2oPzbKfJiL/5rV8ksQf0kptl5oe4PRRrdaGdlHnuSqYem/da5W
c/i3ub8sriBXvmEEgyDh7J8H0qywfe0w/awxnWoagYyZevMIazW8qI3o5oCU3m/J
o2EEEyz0OhGHeadxs4nmhxCASV4xyw==
=IDeG
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--
