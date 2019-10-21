Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 489BCDEE61
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 15:52:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4AEF166C;
	Mon, 21 Oct 2019 15:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4AEF166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571665945;
	bh=uWy+lLhZsGMoEyPqMNZzkXf0LHxA9u8h3v7BxS0zphU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n8VYA1ZCWGWeSVXKRra0t+ORYXSwWt0SakNkPIfICCsW4iDZYVIWAfrEJOGE1N+T1
	 rQ7tNtPOVVf5Ol41blGfdPkk4jXH1kLk6yXyAJxarO7NItPtzCjMcMaJkG4gh0FHxe
	 UU0PLqZAMw1U832Yri8IDUf/gLrFmC4DrKzQEzjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D8F8F8036F;
	Mon, 21 Oct 2019 15:50:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00C5BF80368; Mon, 21 Oct 2019 15:50:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FD32F80112
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 15:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FD32F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="a/rSfFvy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aEu1uJJTKafM7jVw7dAgeyLCE5JqgyFPy0YM24aRC+U=; b=a/rSfFvy+yPWsunq+u0NBQ2Sy
 7twL6/L0qz7NtWlv1zjGaLKz8G2pVtdWoW6piUuHvn3mOKxYv88pJ3BpV4xwYgm/G28mb+yi4u3Yn
 z1+d+NA8V5oeNKrw5nfJFsG0lE0la1gyxAP1NF8IDXh3sZFi6+j9TVlUZ5x9jAod0IDzs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMY4w-0004GM-Cg; Mon, 21 Oct 2019 13:50:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7719B274301C; Mon, 21 Oct 2019 14:50:33 +0100 (BST)
Date: Mon, 21 Oct 2019 14:50:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <20191021135033.GF4691@sirena.co.uk>
References: <20191019070254.23870-1-tzungbi@google.com>
 <20191019143504.1.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
 <659a3d1f-a8e1-268d-5e95-b328aeed601b@collabora.com>
 <20191021114303.GC4691@sirena.co.uk>
 <a4e1530a-b706-2a73-e0b3-ad56cf9085bc@collabora.com>
MIME-Version: 1.0
In-Reply-To: <a4e1530a-b706-2a73-e0b3-ad56cf9085bc@collabora.com>
X-Cookie: Why are you so hard to ignore?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gwendal@google.com, drinkcat@google.com, alsa-devel@alsa-project.org,
 cychiang@google.com, devicetree@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@google.com>, robh+dt@kernel.org, bleung@google.com,
 dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v5 1/4] ASoC: cros_ec_codec: support WoV
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
Content-Type: multipart/mixed; boundary="===============6046603910314160384=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6046603910314160384==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Content-Disposition: inline


--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 21, 2019 at 03:12:50PM +0200, Enric Balletbo i Serra wrote:

> Ok, I was off the latest two weeks so I didn't catch it :-(. I'll try to figure
> out the better way to avoid conflicts knowing that these are already queued.

So long as they're easy to resolve it shouldn't be an issue, Linus
doesn't super mind fixing things up.

--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2tt6gACgkQJNaLcl1U
h9BF/wf8CTYyYmc413jqwsQxB9+4R2QOYPA9MG7qBRZ+z0NinvCl876PH7YNk9Tw
9CshD9oIKe3LRpyRsAHHlwI38yAAB0n4+/p1UYuQEB/bNoM9P85OIaH/Qj95GnO1
Pbm4y44PVUPv46aGRPSXt1RtkGVZhRVj4j/IOFu7JkQGT/ZnMHVpzwHAV4uCxlij
oQjH+C/lWeQsBxEBMio/5nryhSRRb3qXWQPGVSrSNLDci08llkQGGBc3A4jTQyKh
9k7QO5lopV2ThKdiQv8wSTc1lWTRxDWHORq0RgIrSQCMVrif9SA/hF4FAKRcLhyN
VSbdH6IbO1dzKpZmtq7z/nKI3l4AiQ==
=dZWZ
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--

--===============6046603910314160384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6046603910314160384==--
