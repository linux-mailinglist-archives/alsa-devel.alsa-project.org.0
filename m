Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E899102BAC
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 19:22:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C2771698;
	Tue, 19 Nov 2019 19:21:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C2771698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574187727;
	bh=rzOJM6MV8/pq8dbudj8kJOe07eP27soUDKWMyXN2R0I=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ihmt/8hXaDroSLOBD2dir3Va6wXhKta6CGb+FGko2bi+xW+51DT/OxZgI8HtEHkRC
	 rdpVtl/cpIPX6neKmuvoI0aUJK/5+T22VUFNbuf83OIZRms54BJDC0Y6s84ddJuxMe
	 FNwwm9BId7Tc5cj09kbj38CUVRnrumUFGzXAYFRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12D1CF80139;
	Tue, 19 Nov 2019 19:20:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AF10F80138; Tue, 19 Nov 2019 19:20:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id ECE47F800FF
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 19:20:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECE47F800FF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9694E1FB;
 Tue, 19 Nov 2019 10:20:16 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04B4C3F703;
 Tue, 19 Nov 2019 10:20:15 -0800 (PST)
Date: Tue, 19 Nov 2019 18:20:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191119182013.GG3634@sirena.org.uk>
References: <87r226x8aq.wl-kuninori.morimoto.gx@renesas.com>
 <33d0b023-1886-32fe-e04a-d87685068343@linux.intel.com>
 <87y2wc6584.wl-kuninori.morimoto.gx@renesas.com>
 <a63127e6-fbf1-af5e-d4f5-5b98c00040b5@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <a63127e6-fbf1-af5e-d4f5-5b98c00040b5@linux.intel.com>
X-Cookie: Beam me up, Scotty!  It ate my phaser!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH 0/2] ASoC: fixup topology dai_link remove
 issue
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
Content-Type: multipart/mixed; boundary="===============6912260607506926644=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6912260607506926644==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XRI2XbIfl/05pQwm"
Content-Disposition: inline


--XRI2XbIfl/05pQwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 19, 2019 at 07:37:09AM -0600, Pierre-Louis Bossart wrote:

> No regression detected so from the Intel side we're good with this patchset.
> Thanks Morimoto-san for this comprehensive analysis, really nice work!

Yes, thanks indeed for this - it's really great work.

--XRI2XbIfl/05pQwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3UMlwACgkQJNaLcl1U
h9CmNQf/UjWSM7r5SYrMcKmqIueBAjCIDU/7B4GSYyXHvGaGGDeYAk+C4RYH9s2z
AF9FK5X2TxWrGDUnHCUl2vZRMzRh8XJGYhLOXuh3C7wVbIg/YX2MfYuNq8Vej7Hx
WcERN4sgxBjy0OgcAZDBCU2AxwID3r0Nkzge8hnk8fHX/zVELEsDBIg0Z3mEnNR2
uESKt0f/uTvYUmyj/z63qGhlA64INd5prHtKEsysHQxgjvA62Vg6ZfA59Y9Od4eW
uoHp3Wj95z9SdlEBeyZsO4H3AebR8FNEPOG1e3CP9TwHaB5CX1kqEOFuQa5CIgbl
ef+y6OyYASm72zd33Xr4uy5OSxbUXw==
=Oa7j
-----END PGP SIGNATURE-----

--XRI2XbIfl/05pQwm--

--===============6912260607506926644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6912260607506926644==--
