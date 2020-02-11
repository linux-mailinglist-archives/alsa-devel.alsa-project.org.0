Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D473158E3E
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 13:18:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B88A91616;
	Tue, 11 Feb 2020 13:17:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B88A91616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581423486;
	bh=aIKTtDxOIEwNX80s/IKofgwsphpdcEZ/6K/uJlZNBQk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o173i42ewSNMrp6msaJrl8gzhtfeZcQmPSjzUdxHQwPvkaE9mwbVgamsS8C+x/0L9
	 TRfvW0tl9Wyg6hqlqea7iknUKEfBvqM6W0sLn5NtFhEyFJJ4acYPHJGwEjn9XXxPKn
	 w/JFlsz9Oepsyz/N6dt7DEy4dPVKBitmSTWHjpfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5DF5F800E7;
	Tue, 11 Feb 2020 13:16:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF3CBF80145; Tue, 11 Feb 2020 13:16:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6D9F9F8013D
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 13:16:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D9F9F8013D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E4391FB;
 Tue, 11 Feb 2020 04:16:18 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D73DE3F6CF;
 Tue, 11 Feb 2020 04:16:17 -0800 (PST)
Date: Tue, 11 Feb 2020 12:16:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200211121616.GI4543@sirena.org.uk>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com>
 <874kvzcey1.wl-kuninori.morimoto.gx@renesas.com>
 <095fdf34-5736-b79a-7bad-56f5a478e939@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <095fdf34-5736-b79a-7bad-56f5a478e939@linux.intel.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH v3 6/8] ASoC: soc-pcm: call
 snd_soc_component_open/close() once
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
Content-Type: multipart/mixed; boundary="===============1655721047988197795=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1655721047988197795==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="byLs0wutDcxFdwtm"
Content-Disposition: inline


--byLs0wutDcxFdwtm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2020 at 08:41:07AM -0600, Pierre-Louis Bossart wrote:

> Maybe a red-herring but is there a potential for race conditions here if
> that function is called twice from different places? Don't we need some sort
> of lock for all the new flags introduced here?

The probe stuff is all going to get pretty upset if it's called from
multiple paths already.

--byLs0wutDcxFdwtm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5Cmw8ACgkQJNaLcl1U
h9Cshwf9EC1H+ac3QlcVkDxKfpUmtBTY3tXnIxl/yAMqYWIOusIRxAZc0JfsSKHm
hXuAC7rJndVNxeaIz5dUxDQnjlvOVsW49qzD21rKgGMnI/u204pr6dCBOd0yuDEg
PybAxiS5xgE/ztFlIknc5WoIe7m7m/RlCJZ3ODN3KRyHpzBOmlwNTWjOmQA+ZTB5
Nn2kbf8hX6Hjk2kdIsjipOJlgrJLBewBD1HTItQvuJP8+6EYrzrBZLMyM9GXF3hf
Fu6Qpo+l/LKYWR6zjLcQ5h4M3l/aQNugE8Go+LPp2fHnCWEO3y1bKYLMhtOhdV1A
g+0WBx6pqk5uWPvo4rdxe7yAOoiC7w==
=ezhu
-----END PGP SIGNATURE-----

--byLs0wutDcxFdwtm--

--===============1655721047988197795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1655721047988197795==--
