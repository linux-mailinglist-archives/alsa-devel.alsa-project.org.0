Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCCB1442C9
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:10:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C25821674;
	Tue, 21 Jan 2020 18:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C25821674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579626615;
	bh=mJp2yv9kQev+Nv/Zi+5ELUMHo9Sw8a0gXgm5dfp/Tis=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t9XodxOcHf49TwasNIcsnlCY1aaucbqg64kmrrLbkBPumMFLVjTuwy1aevAy9hONs
	 lMUwWmyzBhjLKxLAIe8dW02vzAB0ZbX9iLO0WrVxse+pCczlxYkQhFfP6IYzGeSNgI
	 aiwypbKcEX65yhvwds6Gy4SOH5TOLiWSxtBWB5Kk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B4CBF801D9;
	Tue, 21 Jan 2020 18:08:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 759F8F801D9; Tue, 21 Jan 2020 18:08:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2D1A7F800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:08:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D1A7F800E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03ACA30E;
 Tue, 21 Jan 2020 09:08:14 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7211A3F6C4;
 Tue, 21 Jan 2020 09:08:13 -0800 (PST)
Date: Tue, 21 Jan 2020 17:08:11 +0000
From: Mark Brown <broonie@kernel.org>
To: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20200121170811.GJ4656@sirena.org.uk>
References: <1579603421-24571-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20200121165925.GH4656@sirena.org.uk>
 <DM6PR12MB3868B9744A40D41450155534E70D0@DM6PR12MB3868.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB3868B9744A40D41450155534E70D0@DM6PR12MB3868.namprd12.prod.outlook.com>
X-Cookie: You too can wear a nose mitten.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: amd: Fix for Subsequent Playback
	issue.
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
Content-Type: multipart/mixed; boundary="===============2638352268687222851=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2638352268687222851==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k1BdFSKqAqVdu8k/"
Content-Disposition: inline


--k1BdFSKqAqVdu8k/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 21, 2020 at 05:03:43PM +0000, RAVULAPATI, VISHNU VARDHAN RAO wrote:

> > +     kfree(rtd);

> This free looks like a separate change which seems good and useful but
> should be in a separate patch?

> No Mark,

> That is part of the fix. please let this be included in this patch.

In what way is it part of the fix?  This at least needs some sort of
explanation somewhere, the changelog at least if not the code.

--k1BdFSKqAqVdu8k/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4nL/oACgkQJNaLcl1U
h9DmOwf/R4GKNHq0vWy03y4TCcrfj3Qty8T3/Tj3C/59WeAe9C1dbCHMrv0qrOg2
em7HOBX5PNR8V+SlAwiZUVLVADuyimVqYowdn+FhLpCFECEe7DsBXFdgMFADdq6C
4fFiY0LOi75NFjv+ERMTt5WVU8YSX7irTv/E8Xlb3iySeeYsFQCu71/DXIp4Rwlu
JBqFQVspWAJhoZpcyNRkHssx81Tnw7ebGFk2KQWGAoEL1Q49vGsSHrcMFMF5vnWc
pOlm70Vs+qR5oSYE3iR8FfY+NLwZDnO3yAmzPP1nhZ4S1iZYWLhQ4NYO/b/j7wCi
3skMtLFMJZImXBafHotySP/koVG/gw==
=vEOZ
-----END PGP SIGNATURE-----

--k1BdFSKqAqVdu8k/--

--===============2638352268687222851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2638352268687222851==--
