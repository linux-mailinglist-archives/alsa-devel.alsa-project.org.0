Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E59A51D36F6
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 18:50:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A1EA165F;
	Thu, 14 May 2020 18:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A1EA165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589475023;
	bh=13YkInzwmfXC+4uzSMHtTHtxogyvUnuzvUSpaRaQf+o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C5v7TneVxAVk1VJJC+2iSWPi3lDxoE5Os5957pyjvf6q1yQGEloFLT6sG9LM0AxI9
	 v2+2/pga9dfntiQr0JNG9ja0VYsrS2n34YGCqpdWYdybfxeAZlkqRhxrAY8WJxGai9
	 4EMCKL7dV9lKrJzXe3OfbZ2SFYmsyJ26INMfOom0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C61CDF800BD;
	Thu, 14 May 2020 18:48:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 834E0F8014C; Thu, 14 May 2020 18:48:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1637F800BD
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 18:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1637F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iJrNK5O9"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4BC4A2065F;
 Thu, 14 May 2020 16:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589474910;
 bh=13YkInzwmfXC+4uzSMHtTHtxogyvUnuzvUSpaRaQf+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iJrNK5O9NGBmk6t6rSC7WEqyFG1fOoKm8+OcSJQupftkmzlhIteluJEB5LQwdY0fO
 ZIHJaxDy5hj5S17FYWM6fM/6fCxO0xYDN8U9l1/Vdgm9ZNLPgdkJq3XI+FDjcIOXWx
 95Lx82Ub54w+uY7PFfrkVcjw1DcNsnckmKEl/CIo=
Date: Thu, 14 May 2020 17:48:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajit Pandey <ajitp@codeaurora.org>
Subject: Re: [PATCH v2 5/7] include: dt-bindings: sound: Add sc7180-lpass
 bindings header
Message-ID: <20200514164828.GL5127@sirena.org.uk>
References: <“1586592171-31644-1-git-send-email-ajitp@codeaurora.org”>
 <1589474298-29437-1-git-send-email-ajitp@codeaurora.org>
 <1589474298-29437-6-git-send-email-ajitp@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aiCxlS1GuupXjEh3"
Content-Disposition: inline
In-Reply-To: <1589474298-29437-6-git-send-email-ajitp@codeaurora.org>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
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


--aiCxlS1GuupXjEh3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 10:08:16PM +0530, Ajit Pandey wrote:

> +#define MI2S_PRIMARY	0
> +#define MI2S_SECONDARY	1
> +
> +#define LPASS_MCLK0	0

These look like they could use namespacing.  Is primary/secondary
perhaps something that could be a boolean property?

--aiCxlS1GuupXjEh3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl69dlsACgkQJNaLcl1U
h9BZHQf+NnNftIV3+H/9OLXdIMRFWRkbvO60/+gaZMAkfPciHgKoXQwNANjs+MS6
KkCRShohQWebjaBfakB8D1jqe1Iu8mX7RJ5ZC7h9nNAtZvFCHYjyysX7T+pmmrxE
dkTnm7jCPzlqk3WNGH+eenvXfTkYKecvRlyDUgsHAE3nbwucemebf4CIs4PsjEbG
h0bKFNL2kRgr/AH9QTbSllcmDbD/V+WF0SOO5+kOixYg5lO6iHW8bW2pnh49qp/D
rDCTgGclFkQobmTltDgySlc3T2aIm838esjcculKOrQ4ZRZeYa+UdTCyo/1/UVPd
DvP3oL7jfacTv63JwDQN9IyQq/cZVw==
=lTr1
-----END PGP SIGNATURE-----

--aiCxlS1GuupXjEh3--
