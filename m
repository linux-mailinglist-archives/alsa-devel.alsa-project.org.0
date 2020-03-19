Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1ED18B84A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 14:43:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B26BD1775;
	Thu, 19 Mar 2020 14:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B26BD1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584625414;
	bh=38o30hEvqmGagEyrNXlCMAobxn0SdVwqjNnaeQeIwwI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=El8FOIKL+8IAcCJ6GVoQRhzD3FVdPXeRt8jGryPBMFG9UExI+1O+QgM0GB3JoNf6w
	 mGGQkDPei1HfzmWOdw2hfJz48bqyuJ/tqoL/ju5k0j0WvIcfpjyY+iXt8m3FstoD5R
	 qeltmV56HDpc/Clzru+k6BvZgCJcKU1eaDNPUKhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2606F800DD;
	Thu, 19 Mar 2020 14:41:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA3A5F8022B; Thu, 19 Mar 2020 14:41:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1C615F8012F
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 14:41:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C615F8012F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3D7830E;
 Thu, 19 Mar 2020 06:41:41 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 668483F52E;
 Thu, 19 Mar 2020 06:41:41 -0700 (PDT)
Date: Thu, 19 Mar 2020 13:41:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
Message-ID: <20200319134139.GB3983@sirena.org.uk>
References: <41d0b2b5-6014-6fab-b6a2-7a7dbc4fe020@linux.intel.com>
 <20200318123930.GA2433@light.dominikbrodowski.net>
 <d7a357c5-54af-3e69-771c-d7ea83c6fbb7@linux.intel.com>
 <20200318162029.GA3999@light.dominikbrodowski.net>
 <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
 <20200318192213.GA2987@light.dominikbrodowski.net>
 <b352a46b-8a66-8235-3622-23e561d3728c@intel.com>
 <20200318215218.GA2439@light.dominikbrodowski.net>
 <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
 <20200319130049.GA2244@light.dominikbrodowski.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline
In-Reply-To: <20200319130049.GA2244@light.dominikbrodowski.net>
X-Cookie: Captain's Log, star date 21:34.5...
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 kuninori.morimoto.gx@renesas.com, curtis@malainey.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2020 at 02:00:49PM +0100, Dominik Brodowski wrote:

> Have some good news now, namely that a bisect is complete: That pointed to
> 1272063a7ee4 ("ASoC: soc-core: care .ignore_suspend for Component suspend");
> therefore I've added Kuninori Morimoto to this e-mail thread.

If that's an issue it feels more like a driver bug in that if the driver
asked for ignore_suspend then it should expect not to have the suspend
callback called.

> Additionally, I have tested mainline (v5.6-rc6+ as of 5076190daded) with
> *both* 64df6afa0dab (which you suggested yesterday) and 1272063a7ee4
> reverted. And that works like a charm as well.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5zdpMACgkQJNaLcl1U
h9C9pAf/RrCobt9NlyJGaB9AaEXAdgTfVIaiKtTXJ5DhvxWM/1HLH5xPAWkrBa32
EVE4KvTS0DinbpCuAEeJRcQVFEpH6+y+kRnzntxmdsLJFRHzfcLYq/d/robTV221
r5m6o8+hQSDrSPyQ4UXtUuWcaf8BSWogQpdhBYvhd/AU5yLjRiRc5P3p13A8nliv
mLpj3QoOlBMigo3MnqGSFBp1AG6Nroyqt/G9uVsyOEZazhPHVX93NCIf/z5v3KHk
7MKeZjgFbJc5hphI+nZoMa1GuraTXSn0f4tfm99wRRu0Pcb1yoyYWpTiYOKziwXX
wR44Gs0iHetTwjYP+jmjXGeO6rjTkw==
=bKjM
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
