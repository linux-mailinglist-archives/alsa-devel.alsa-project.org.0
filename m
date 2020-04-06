Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 908DA19F439
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 13:15:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3879E822;
	Mon,  6 Apr 2020 13:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3879E822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586171730;
	bh=MtJm1ZXy274Rt4S8/t5pgen0tFyzkY5ae3KXw6x6In4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J9YG4CG9RjSdVWN6UL0qdSCop1fbX31wpttHc4WeVec6isvKkvalBytVERVA0aXYZ
	 hlkxRjX+vpOQtAJ6WaL8NFuzfMbcP/C+mw/pbkM2t7thBEiJU6xxpn0InFs9ZuhE8B
	 +5MILk6nAb5iWTH7uDYbaGTcrn0L0vY2lGgAl6ac=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E410F800CC;
	Mon,  6 Apr 2020 13:13:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5B1AF80143; Mon,  6 Apr 2020 13:13:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C504F80121
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 13:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C504F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lNHthtXX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 711A9206F8;
 Mon,  6 Apr 2020 11:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586171571;
 bh=MtJm1ZXy274Rt4S8/t5pgen0tFyzkY5ae3KXw6x6In4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lNHthtXXVAZNLmOMZ96NGSDiYyfoZhPYjEMJKtUifhay6eh9SXGgyIehffxgM+sxh
 B8Rs4JGbzAnLTxPe1UErYuV9SemkVmkobtrBLQ96RC1+maODilYaeozsPW6/X7gyCb
 dJrTUI2RhDh+0wHqRGtnSahzuWKdo2K5t+GZz32U=
Date: Mon, 6 Apr 2020 12:12:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: common: Silence EPROBE_DEFER messages
Message-ID: <20200406111248.GB6837@sirena.org.uk>
References: <20200406003656.2383978-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline
In-Reply-To: <20200406003656.2383978-1-bjorn.andersson@linaro.org>
X-Cookie: Serfs up!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-kernel@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 srinivas.kandagatla@linaro.org
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


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 05, 2020 at 05:36:56PM -0700, Bjorn Andersson wrote:
> The Qualcomm sound card typically depends on several other drivers,
> resulting in plenty of noise in the kernel log due to probe deferral.
> Silence these errors.

This then means that if something is missing a depdenceny it becomes
impossible to tell what the problem is from the logs.  Please at most
reduce these to a dev_dbg().

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6LDq8ACgkQJNaLcl1U
h9AnqAf/WP5/shM+o0NVDoSTzFDUIwsFx0+zD0HAUSjwRszIvxR7LzYmyk4crsOI
izVV3xQVPYb1Ra+nGtGTEdJbU5UqJ5H7GDAHFCE0D4/eb2VP8qPCWYv+GWt9ipZz
lopYieoo8ws+7qnd6l/DMfSjj2Ik7eSsIPUMmL4YOiUACTF1ypqtAzG0NF5bs0pR
jtgllpDgeOwJwHKel+Lz7edKrHxqaQtPk5LdlxOqGbQU4Mm3isGP6oRAROn0p+iG
P08qGMACi1nUfCe31/lym4z0bTOd9QCy7OXe/oIqJ2DvLdnZ/ASbRweGUWSbnxBU
JljNw+dvdosofc2QP/WFVlg2jC9p+w==
=gEl1
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
