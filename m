Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9C335DDA5
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 13:19:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF4941675;
	Tue, 13 Apr 2021 13:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF4941675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618312784;
	bh=OvNQM6IzRqdh+yn7nQwJNg/YLF9PnNkxrdQ/ThWGjc8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LYZW6xO+y1IiioMvSPGDWPb/GAXVyihoU+c9sh4Xfb9kUa2zPe+10zC4toEKF9ETF
	 Gy/0aQtaLPbGACxV6vfOtG9Y5F6ZeKnTa1ZQKokN/LxrWeWLlYf3tzFmQS6RQvINTc
	 ogfSkayBoi0dXECx2+PXTF/A9ERPujcxfdZ4CVXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25BE6F80260;
	Tue, 13 Apr 2021 13:18:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A444F8032C; Tue, 13 Apr 2021 13:18:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C4DDF80260
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 13:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C4DDF80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="htgGNyWt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3A0861042;
 Tue, 13 Apr 2021 11:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618312682;
 bh=OvNQM6IzRqdh+yn7nQwJNg/YLF9PnNkxrdQ/ThWGjc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=htgGNyWtADlGcCPiJP5fBSZhNRgAP9DbAFrZhvgLiryC1QRZlhGvJXNZDD+IIoBNI
 YUUNKK/nXIE9FpLQXqnHcHRSUiJl03dgeG6ns3XsK3sIdyO22ABpkHgjvuA616eeAU
 wT2975oa+rTorepMsYpRm2/xf2k0xLd6GUTFQ3Wbu9sy3uslPOBpT1Veubj8PJhsVt
 4ykAGmiFYX0Cect+JMR6Eh3OxDz0VGjxseL0INNTq7YDGCCyce8Ws06dhz7G9Cl8T9
 +qPNBcUezQhHnLQgyLUXPgo0brB3b1Pmj2q9VmQ9Rvk3DOqKPCnW7qCG41MiG8sUom
 mvbKSM/MDDwmw==
Date: Tue, 13 Apr 2021 12:17:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: ak5558: correct reset polarity
Message-ID: <20210413111740.GC5586@sirena.org.uk>
References: <1618293991-6611-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline
In-Reply-To: <1618293991-6611-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Shake well before using.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 13, 2021 at 02:06:31PM +0800, Shengjiu Wang wrote:

> Reset (aka power off) happens when the reset gpio is made active.
> Change function name to ak5558_reset to match devicetree property
> "reset-gpios".

Please split the fix to polarity out from the refactoring, the
refactoring completely dominates this patch so it's very hard to review.

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB1fdQACgkQJNaLcl1U
h9AZMQf8C+Dzhlre7G7rflNnG0xa6JsHdDP7W7C7EqGltU5gMyqxmtEyDgrvbO4y
2ww8ck76dmT6S4xm8QWVfkxuSWGFntwg52fZzCqg/lIirPusSY8FI5fEZAhjQTDs
Y9Biodef+9uS23aH4Ga7qwQ6da1tVAPOOVsMwAf6dwVB65qMQIwzvyu1ZXPC/itD
OX1rMqBRVEWzpTBRhd5gqOLCiSran9pTOreC3GxVAZ8H/gPpKbwiZDBSjMMkW8hI
emSeeHsb/qeeuoBd64tFgiS/5l9SRuP/fNeJ0ZebUjWekKg+jZ/REgVAVQgKSuzV
OdpFIr7Si0sE/VHdvtMnG/uH1prYAg==
=85l7
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--
