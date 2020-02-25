Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A7016B749
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2020 02:42:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 128D9168F;
	Tue, 25 Feb 2020 02:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 128D9168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582594949;
	bh=B7qwHEdcMu0CUnZ+q0akuPpcmOfSgwgOfoCR1T1NT7Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t+6zuL6BTvRvr2Bq9vjDhbNBIXvR4iYTbrrUEnkhFim2KfFuKm3vOxiesZsP5mjty
	 IWrMU7YRrvh2SNQwj3gHx0Y2WBR9XWo4BZ2m8WPNxvYszClMp01StDu1ppa2z6f3xa
	 sqLhXQVVmLvCwh2Befh+p7LWZvhtAYyuaiUBZeuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CF2EF8016F;
	Tue, 25 Feb 2020 02:40:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFF22F8014E; Tue, 25 Feb 2020 02:40:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F2D9F80137
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 02:40:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F2D9F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ML0JNgG7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P1eEpVjfQSRWTWzKsu/3DgD2/DRCXN7gST3ydMiYp0s=; b=ML0JNgG7sjFAOcEmFDCmdbg2y
 MRbUBfEp9gyIRyjHsQDa+TWUfqQ6/O/eczPY690Zv6qAmrSmD6QkXR6KbdIH9FL5oa410IOByMw6Z
 KvXmX9JQ6dDirgxn8pWiqh4r/LT/AfmRwD9kZeEOIXt/9scQ1lCkc46BGIQpLKyBH7/QY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1j6PDG-0000Sw-2w; Tue, 25 Feb 2020 01:40:42 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 744EA440052; Tue, 25 Feb 2020 01:40:41 +0000 (GMT)
Date: Tue, 25 Feb 2020 01:40:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 7/7] ASoC: soc-pcm: tidyup soc_pcm_open()
 order
Message-ID: <20200225014039.GA21366@sirena.org.uk>
References: <877e1doeis.wl-kuninori.morimoto.gx@renesas.com>
 <87wo9dmzwv.wl-kuninori.morimoto.gx@renesas.com>
 <eb217e1e-6438-b59d-c155-5fe53de542ee@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <eb217e1e-6438-b59d-c155-5fe53de542ee@linux.intel.com>
X-Cookie: It's all in the mind, ya know.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 24, 2020 at 07:22:25PM -0600, Pierre-Louis Bossart wrote:

> you'll see that the intent was to
> - start the cpu_dai
> - open the platform driver to e.g handle DMAs
> - start the codec_dai.

> The second step is not really needed for Intel but might be needed on others
> where the DMA is centrally handled (Omap, etc).

> My concern is that we've modified the order to deal with module
> dependencies, without necessarily taking into account that DMA setup part

> That said I don't understand the initial sequence for soc_pcm_close() so I
> am not advocating for a revert, but more a clarification of what those
> component open/close steps are supposed to do.

It's possible we're going to shake some issues out here but the
ordering has always been a bit arbitrary, especially the CPU vs
CODEC ordering.  We're basically hoping that the ordering we've
picked is the one that causes fewest glitches and upsets on the
broad range of hardware.  My expectation/hope is that for most
hardware the flow control between the DAI and the DMA controller
(which has to be there anyway) will mean that it mostly doesn't
matter, if there's anything that is too sensitive to it we can
always revert and try something
else.

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5UewUACgkQJNaLcl1U
h9BUwgf+JYcqFQs9nxiz+eystXOLPLth69hM52WjfYXi1PDvwNuZWEW36uWFknFO
VpIBUJSGqYQxaK2ZyFNcT1W2M5KBGPrSATdEcz8qSF/Xh5jntCxIitcCFaMe17SY
lmcFV+ocEp0iGo1ZqWnsze7cBnJOCv2dSHUVhDPh/nI4uR/FtXM4ox5PeXirr8ZQ
n9XDUGayn6zUKBMs5vkK0A1uRvYUtXdvuD0SD6l2oOwsAT+GASePTuOYxPcF9N6i
hDTpQSXhgbJvR103Y4fXrw8ing50S2wGvq7INyrkmZ3SxN+K3uH3VSdnfGIvisQb
yE2PlOBWtXNtkJLRe3FBR8LCwALojw==
=cj3R
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
