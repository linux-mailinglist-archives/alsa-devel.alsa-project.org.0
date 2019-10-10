Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACDFD2C1D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 16:09:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EC82167E;
	Thu, 10 Oct 2019 16:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EC82167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570716551;
	bh=AiIY9T339yqse4xCH9TS2NYFwuE+yeTc/zbaawJMKF8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tr59v/t9t/UIH/IDafqAUAwVWdWLGfG8eHL+A3vkwEG40U6Y9wPNeMe2KcN7oP5Hb
	 CXv4Gwp4q7AdXpeD9KsmROeILDVH62sUgWs5SQVKyEtX1zSv1e9RDsJq29f23oLlKR
	 rTiV15r5brKTvvX8NlFKw2sEkmICdZUJgccFzy+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B299F80322;
	Thu, 10 Oct 2019 16:07:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 737F7F8038F; Thu, 10 Oct 2019 16:07:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13180F802BC
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 16:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13180F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="XBlRU+Hm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jprzLUN5TWMf29kj3lpm6Qz9sRhWgPtnQmWPSzkns+Q=; b=XBlRU+HmReBKeRdg0rg1WzYj3
 bbjaw1LZ4a25of0N0BSFErs9808fVOap7MMsVr6RSRwEEq6yc5DiDtXKjCq6eoM/Ez38X1zXhEum4
 dlIu1jOm3wYxCX3emgULFsGK6IIa3vp/u1A55aLNSsMSmr0PnbDTS0jPqpAt07qYN0kAg=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIZ69-0001W3-BL; Thu, 10 Oct 2019 14:07:21 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id D5764D0003A; Thu, 10 Oct 2019 15:07:19 +0100 (BST)
Date: Thu, 10 Oct 2019 15:07:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20191010140719.GU2036@sirena.org.uk>
References: <87r23mgxl7.wl-kuninori.morimoto.gx@renesas.com>
 <2a28be44-91ad-c140-062b-4d14982042e9@linux.intel.com>
 <87pnj57a2w.wl-kuninori.morimoto.gx@renesas.com>
 <70a91c94-3c4d-6f78-7a71-bb8bdbc28b6a@linux.intel.com>
 <87lftt72ad.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87lftt72ad.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] Question about DPCM FE vs BE
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
Content-Type: multipart/mixed; boundary="===============0475087061300408563=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0475087061300408563==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cSR0C1VPqnPvPj1n"
Content-Disposition: inline


--cSR0C1VPqnPvPj1n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 10, 2019 at 11:38:34AM +0900, Kuninori Morimoto wrote:

> > The idea of domains/constraint propagation is not mine BTW, it was
> > presented by Lars some 2-3 years ago. there may be a note somewhere in
> > the audio miniconference minutes.

> Yes, I guess it was ELC-E.
> My work (*) is to helpping him/his idea.

> (*)	No categorize CPU/Codec/Platfrom
> 	modern style dai_link
> 	soc-core / soc-pcm cleanup (on going)
> 	(Semi) multi CPU support (will post)
> 	(Semi) no categorize CPU/Codec DAI (will post)

I just dug the talk Lars did up the other day funnily enough:

        https://elinux.org/images/e/e7/Audio_on_Linux.pdf
        https://www.youtube.com/watch?v=6oQF2TzCYtQ

I'd posted something similar as well, the main issue is someone
getting the time to actually work on it :/

--cSR0C1VPqnPvPj1n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2fOxcACgkQJNaLcl1U
h9D+1Af8CjcCgiKrZyCKdraStejPt8BUNeEikiAjinMd8SeLavBo0S5eYAvxAz7v
YHhUch4Xy3m27Qx6WNqH+sK4c8oWyeErK4AYlDZEAy0jNTLiEcGJL3X3QQb3qQgN
RV1wwU21OhUocFnnOaTgBHsH60x9I8hRXYc50Y4mT9n12q03IB452LyrUWZoCNVw
upCzYW9b+z+Vh0f8pDAli+2rKkiaprI9qdPOCScCNpRRQhq5NKpQ23y2w5VAR98r
1KbQe3W9jPmZez6O18bjqTmzazp008y44N+H/HUZynnU4ktJYZDHgupE8DN798PT
eSd1WwPoNnSZ81wN/DRZriUnMRsiCw==
=6KjL
-----END PGP SIGNATURE-----

--cSR0C1VPqnPvPj1n--

--===============0475087061300408563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0475087061300408563==--
