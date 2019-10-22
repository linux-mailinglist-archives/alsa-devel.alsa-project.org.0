Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B96E09CE
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD7341682;
	Tue, 22 Oct 2019 18:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD7341682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571763329;
	bh=W1LOJ3ApvTMDf/bsALWS9lV1g5OikrMuvT/tD512EQs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rxnCEA1Zuxi3oBjp0FLQhM+JsfdIawOTQb0KaCK6B7jX4/j4vKcBlM0Hx2QNTBG9A
	 iYuewJhqIHiwxDCFn4f5TvpupqS7ZAzkgKXObwQgQKnUr8/8uUGOat/mM6jHnOdRMx
	 oh6P01izDgOxkithtBmSXDyvEyNHgt9VqWnbJV/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04266F80367;
	Tue, 22 Oct 2019 18:53:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFAC7F8031A; Tue, 22 Oct 2019 18:53:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82C5AF80112;
 Tue, 22 Oct 2019 18:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82C5AF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HAB7IrAm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nacQBfY/UGUQ+xuZeFazojMy/19k8SRVGm7rI7SQOqc=; b=HAB7IrAm1LQ+xMpuQEu5HYsr+
 vIj2WroRAhofVTFi/J4crk6vTWm4FDHfJ6F8YcdKeEzKXMNnjkknbCdscW9xYXq7D5eF0zOHNTW6O
 4d5nR4PUaQOa9501MToOpkKSiBSyBSNCG0pAHDpU8Xc1a3S1+153FVKYP3Ia39UVWcauo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMxPe-00075s-2Q; Tue, 22 Oct 2019 16:53:38 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2890F2743259; Tue, 22 Oct 2019 17:53:37 +0100 (BST)
Date: Tue, 22 Oct 2019 17:53:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Message-ID: <20191022165337.GX5554@sirena.co.uk>
References: <1550823803-32446-1-git-send-email-twischer@de.adit-jv.com>
 <20191022154904.GA17721@vmlxhi-102.adit-jv.com>
 <20191022163501.GK5554@sirena.co.uk>
 <20191022164607.GA20665@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
In-Reply-To: <20191022164607.GA20665@vmlxhi-102.adit-jv.com>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 patch@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Jiada Wang <jiada_wang@mentor.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH] ASoC: rsnd: dma: fix SSI9 4/5/6/7 busif
 dma address
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
Content-Type: multipart/mixed; boundary="===============7661178760379965696=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7661178760379965696==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rPH0Y77Oimr1cvNq"
Content-Disposition: inline


--rPH0Y77Oimr1cvNq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 22, 2019 at 06:46:07PM +0200, Eugeniu Rosca wrote:
> On Tue, Oct 22, 2019 at 05:35:01PM +0100, Mark Brown wrote:
> > On Tue, Oct 22, 2019 at 05:49:04PM +0200, Eugeniu Rosca wrote:

> > > It still applies cleanly to v5.4-rc4-18-g3b7c59a1950c.
> > > Any chance to see it in vanilla?

> > Someone would need to resend it.  No idea what the issues are but I
> > don't have it any more.

> How about downloading it from [1] by pressing on the "mbox" button and
> applying it with "git am"? This will also include any
> "*-by: Name <E-mail>" signatures found in the thread.

> If this doesn't match your workflow, I can resend it.

This doesn't match either my workflow or the kernel's workflow in
general, please resend - that means that not only I but also other
people on the list have the chance to see the patch and review it.

--rPH0Y77Oimr1cvNq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2vNBAACgkQJNaLcl1U
h9DFTwf/YN6aXyO0UZfXUnRzppadDN0/xoHh58aU+6oHsmeayHhYXhEMyJaSx0dl
OEBag6Bb4K9fXX7RBbKFfPrDBmBkwMXFqan9vSfIPo4W9neWCDq+IkIcfzX2/qLa
LgPVi6cWiFibNHRcBvupm0oBdfLIesJ76xJNmA+dZ9aSxZv+tFgX8ocshqbYf60C
UUJtfH8or0Lqr5pCV0y42wCez3vGznkN4peD7tnZrzLVwj8oXLbEYlo/FrKQihXg
kdVTyp/gFwUqJ5ARIMHLGJ9SV+91R1ejA9sSD1+C0pj+7Zbhc43IlmJWvMdFFnm8
bGDya1sGnhk+9ivtxgDHvWpd9TFoMw==
=yjN4
-----END PGP SIGNATURE-----

--rPH0Y77Oimr1cvNq--

--===============7661178760379965696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7661178760379965696==--
