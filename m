Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 250272C110E
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 17:53:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAED3166D;
	Mon, 23 Nov 2020 17:52:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAED3166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606150412;
	bh=158lXazOCoo8QHnhf+9XBqL544AdrMia4bMuOC8qki0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OTp6PIKgK45iQqfijnR0iAlFTtD9UbADLzczEI5gocK5xRZ5KtViCX3hfN/AZjbvN
	 pxeFOVma2jGeTKQ/e7Qw7bkFPcZnXTsa9R84zfggTduxtBJwXMq5wSmZsqPQXQu81P
	 ay6M1Ge9HRInS9moYQ6/AzlC2NF4+fe3D9SHfu2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EAF0F8015F;
	Mon, 23 Nov 2020 17:51:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95F17F80255; Mon, 23 Nov 2020 17:51:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36758F80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 17:51:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36758F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Psvwyc6y"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE59F20717;
 Mon, 23 Nov 2020 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606150308;
 bh=158lXazOCoo8QHnhf+9XBqL544AdrMia4bMuOC8qki0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Psvwyc6yDuLtIWfKQ0aOf76rkBo9HFL9lfagC2N2mfm06muajkILhsOzb63jOzI8d
 x/fycBPK8uyRfflMijPTyNq60y6C4VM8G65EYs2oWsgsCtEnNbJ278S+mXa3799GEw
 3vSRFgfQnHG7f1C3Oruev5Wi99G5IBgvZn9mJQ1E=
Date: Mon, 23 Nov 2020 16:51:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid
 state
Message-ID: <20201123165124.GI6322@sirena.org.uk>
References: <1606148273-17325-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1E1Oui4vdubnXi3o"
Content-Disposition: inline
In-Reply-To: <1606148273-17325-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-kernel@vger.kernel.org
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


--1E1Oui4vdubnXi3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2020 at 09:47:53PM +0530, Srinivasa Rao Mandadapu wrote:
> Fix enabling BCLK and LRCLK only when LPAIF is invalid state and
> bit clock in enable state.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--1E1Oui4vdubnXi3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+76IwACgkQJNaLcl1U
h9DYdQgAgWGFsJC6dNYqraAEb1cWuSo040ixzZMX/z381gtHtGp700nYpqfA25Bn
Y2bBmYuWivTHeX4KRTj7sSqz+HL2btNjvurcm7LpITLXOmVHLJi2FN1SloMfzgmA
/IXlDRwhfjl1CyxvqNaob+8PtkbviFIQC4DjlH0oJjTfhCY9zkXURWbLaPru4Vzp
LcH/2p+KPMfTGtdWe14CyAwED2wvRgGDgviQsdlRcgD5+Zvr2i1sSZ9a17ES60II
35XDRfAm7BKnEA32ZWStLy3j+4jKKncY4nH/+40dMpn1qxZlrnUxVYVuSq3Qm7jF
UPvnkuz+NgSwnR+mVM6QonsdhG1Q9w==
=+8cZ
-----END PGP SIGNATURE-----

--1E1Oui4vdubnXi3o--
