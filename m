Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5535C204B3
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 13:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8EE816D4;
	Thu, 16 May 2019 13:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8EE816D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558006185;
	bh=5BePde+xMOuyPafEJBPvbGTNy8+v9bkMhyk2DRP/VBg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BtKYxUcZm/BmFqOP/Vr33s0Aw8iG9ocqVgbauXaupC38JuREKW/PxWgAsxwHJ+1Vf
	 Cut7pViKz4i/vIIBg6KFvqOmDacyQ9Lh7v4wFxCbzXGgL3v+A0G4ydFGPPnspoXTyF
	 MuGJCV6x/79XQpEu6/5SS0q7iCV9yRUsArzjmj1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6067AF896B9;
	Thu, 16 May 2019 13:28:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C008BF896B6; Thu, 16 May 2019 13:27:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 991FDF8078F
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 991FDF8078F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qexgUKy5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dVusMfbG2Jo9MmKeoL96YpYZkVmGycIsx1/10iU5uWo=; b=qexgUKy5sGtN8oiEm4LVB7Jr9
 cp3losBfgrHOsuKMRclDApQNtL9uPiwculKW65Ux2uytkmOrJ3yoTHyAqhD/UmeM0KiIBzasZAt5C
 48Lm7/azfg/vfCVeKrM4mAc6SJIaPgiyEqZtrgiPJaOFOUfXmeBoCj+RG7juhCByi5yZ4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hREYC-00068n-TM; Thu, 16 May 2019 11:27:53 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 457491126D45; Thu, 16 May 2019 12:27:48 +0100 (BST)
Date: Thu, 16 May 2019 12:27:48 +0100
From: Mark Brown <broonie@kernel.org>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190516112748.GF5598@sirena.org.uk>
References: <c2118efa4ee6c915473060405805e6c6c6db681f.1558005661.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
In-Reply-To: <c2118efa4ee6c915473060405805e6c6c6db681f.1558005661.git.shengjiu.wang@nxp.com>
X-Cookie: <ahzz_> i figured 17G oughta be enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH RESEND V3] ASoC: cs42xx8: add reset-gpio in
 binding document
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
Content-Type: multipart/mixed; boundary="===============3786452925789576762=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3786452925789576762==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L2Brqb15TUChFOBK"
Content-Disposition: inline


--L2Brqb15TUChFOBK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2019 at 11:24:12AM +0000, S.j. Wang wrote:

> +Optional properties:
> +
> +  - reset-gpio : a GPIO spec to define which pin is connected to the chip's
> +    !RESET pin

gpio properties are supposed to be called -gpios even if there's a
single GPIO possible due to DT rules.  The code will accept plain -gpio
but the documentation should say gpios.

--L2Brqb15TUChFOBK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzdSTMACgkQJNaLcl1U
h9AI0wf9H/v9XOHLGG0s1+nmST8FhMRdMALRocSMlNs0hntuI+4uxBG9/dXi2ST1
Id5glMJZn5CDpvgp/RUiuTWBAwfejMgpbwxxLtDbrmdqBolGsO0bpnWoEiZTpOop
gVBPRVGueduh/5HWKPbCn9PRfHuyUKq/0uenLwDGEy9VN4dXP6926tOFzTAIewI2
BoFx+Chib3VXyep6aG6PuFzTPPLo4XeXckbROsUj5WNaOIP46A4E9e7nK3aRqd6M
YpPyJN7v/H7BesUV3v9DLZQLcaSCYGxLvfwl07Dz+zI0a3hRQ5eXohzPxWewfqXh
A6lcsDuR+5dafko56EbffC3HlkMhoA==
=692j
-----END PGP SIGNATURE-----

--L2Brqb15TUChFOBK--

--===============3786452925789576762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3786452925789576762==--
