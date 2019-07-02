Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0335D112
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 15:57:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90EC1168B;
	Tue,  2 Jul 2019 15:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90EC1168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562075857;
	bh=JTpE5CnIPnAWEssFPJ7C5gd1dMXMXfNwzZ2JpX3YOb0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fLV0cXBxo/TBAdksHzAhNqUcrxnP8TkLVi7wV5SD3BkZkPFkqMgXbookSiRalfU5d
	 d/bSLBswnSKZYp2VcIxn7VKQkaDZ6WOHC/kM87UE9kJDZzUbBy1CTvT+tuUYLLClYk
	 oN2ojMXAy8gadkBGs1/1hDfD00Hqc+HCrv1C2M+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A984BF800D1;
	Tue,  2 Jul 2019 15:55:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1001EF800C9; Tue,  2 Jul 2019 15:55:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4D7BF800C1
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 15:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4D7BF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="G79xDe25"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T1Q+VpjeyZlNwEne8y2hkSC/ONhFvAnTgrUVHUcvIzs=; b=G79xDe25sJCl45zOekFuPBjnt
 GqdZyzwaiLr85kK4dh8LqQTVB7e5AqFw2fVMWHzVZ8DZypcnZ5naOuiEI9FUHFbvjzpdCMtBeR3kl
 w8kgxFZ3IJ9qkZS48xWxqTIzbVoKPKTFfckvg4msXfxxdM4fGW5mSq3HqfEUwim6s87/o=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hiJG6-0002Sq-BT; Tue, 02 Jul 2019 13:55:46 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id B7978440046; Tue,  2 Jul 2019 14:55:45 +0100 (BST)
Date: Tue, 2 Jul 2019 14:55:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Message-ID: <20190702135545.GN2793@sirena.org.uk>
References: <20190618022411.208156-1-yuhsuan@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190618022411.208156-1-yuhsuan@chromium.org>
X-Cookie: This sentence no verb.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jon Hunter <jonathanh@nvidia.com>, dgreid@chromium.org, cychiang@chromium.org
Subject: Re: [alsa-devel] [PATCH v6] ASoC: max98090: remove 24-bit format
 support if RJ is 0
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
Content-Type: multipart/mixed; boundary="===============1358524242256763698=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1358524242256763698==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4OpS+d6oOtUQaRm1"
Content-Disposition: inline


--4OpS+d6oOtUQaRm1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2019 at 10:24:11AM +0800, Yu-Hsuan Hsu wrote:

> +	/*
> +	 * When TDM = 0, remove 24-bit format support if it is not in right
> +	 * justified mode.
> +	 */
> +	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_RIGHT_J &&
> +			!max98090->tdm_slots)
> +		substream->runtime->hw.formats &= ~SNDRV_PCM_FMTBIT_S24_LE;

Why do this and not add a constraint (which doesn't modify any
constant data structures)?

--4OpS+d6oOtUQaRm1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0bYmAACgkQJNaLcl1U
h9DMTgf+PYAum94WJNy/d7fNa5ky+hsLP7iR/oIMWfHTiiNRsNfXCy/3qjz3HleI
B+VON17KVufcU6Yi6GhITx/05AB2mbtk15C8fgFrOFv+GN/bP0jklpx05wo07q81
REn5TG8B3YDD14t1akxcZxdrc63/gIHMZTuZ56g1GRTNeTEd7F3/Vyz/G2p0Csgi
V4DAb54G1b17MrAre6LG9So1NWcUQT3i/rmSIy60AswQK2Za55P2j2UHNySFpby7
I4jL4ujieJ2L3Mb8AE/U49ioJ2YIGp481ABjMxJPB3cYE/BKVZ96WzKCnCDFa9jW
RxxZhCWx051gBV63t6mJ6/UzZESDgw==
=1nES
-----END PGP SIGNATURE-----

--4OpS+d6oOtUQaRm1--

--===============1358524242256763698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1358524242256763698==--
