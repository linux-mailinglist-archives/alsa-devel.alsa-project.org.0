Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81768241A77
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 13:36:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9BE11667;
	Tue, 11 Aug 2020 13:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9BE11667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597145799;
	bh=tXSK1bbJjI8f7pE16RsNSU4/vL0xPNkq0yMICmwmV7U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vNXQqmy0cJaNNGrenTtz++7x8FA+R7viWu55KVHqr3MRAx2K6uG9ct6Iwz3ZfZfGe
	 OVnl3SEDpAJ0RDI396TOJWRI+SP3+UPaXli4AYQz4RBZ0Hv/FVqGiVB1Tstnu82JVP
	 NByxpzynXbDE1DuSumpCOkKgA3njfr22xZOtn0RU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AAC6F80161;
	Tue, 11 Aug 2020 13:34:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D4A3F8015B; Tue, 11 Aug 2020 13:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0B66F8014C
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 13:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0B66F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pH40c6yT"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A051C20658;
 Tue, 11 Aug 2020 11:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597145686;
 bh=tXSK1bbJjI8f7pE16RsNSU4/vL0xPNkq0yMICmwmV7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pH40c6yTYqg22uhlT4NSUDlyC96ngKf0rrFT+lKuLnUPSnEmZzI4DU/7BeBTiXgrv
 ZuLMX5dhmPB1MCEWquSnPrmgtTHJwRxj+sJlRXYObCD0aulnGT6FZWQEE0IhPB1wcp
 uIQ7FPzd22LXMgvgvccxjud+Qxl752QjsaNXOlI0=
Date: Tue, 11 Aug 2020 12:34:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Rohit Kumar <rohitkr@codeaurora.org>
Subject: Re: [PATCH v5 01/12] ASoC: qcom: Add common array to initialize soc
 based core clocks
Message-ID: <20200811113418.GD6967@sirena.org.uk>
References: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
 <1596528453-11437-2-git-send-email-rohitkr@codeaurora.org>
 <3e390421-84ce-3b74-a72d-8fc09e908971@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline
In-Reply-To: <3e390421-84ce-3b74-a72d-8fc09e908971@codeaurora.org>
X-Cookie: Gravity is a myth, the Earth sucks.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 Ajit Pandey <ajitp@codeaurora.org>, linux-kernel@vger.kernel.org
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


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2020 at 04:13:03PM +0530, Rohit Kumar wrote:

> Do you see any concern with patches (1-11).
> As of now, there is comment only in patch 12 from Rob which I am
> planning to update once other patches are merged. Can you
> please review and let me know if anything is missing.

Please just post the fixed series instead of sending me a stream of
pings, it must be taking you more time to do this than it would to just
send the fix.  I'm not going to apply your patches during the merge
window, they are not bug fixes and sending me content free pings just
makes me delay the review.

--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8ygjkACgkQJNaLcl1U
h9C3RQf+PBe4o8K1iH4v9zKqTg+1dkOUhKkRgi+zmCmrCy0wnVLIGktdvj8PoOth
GeEGbH6rwDHgoaPShdTLAykiT6SKUWOd6ORFRfQtoMCF1Wi7ZowLA5ewKguKTpN5
rNCSk5wWOHjBR9Iys8swI05RzZngX2gARWUdUcU3TqRQGDhtvM9C8nM46TUFxrG2
e3x7GVEvrWuRmO+4+e7B9x7Ax+raNo3skRiWvASCRi0pItCxRbvJWOS21Q6DTAn0
8ZIAQVkI+DDm2kqnvJfxx6IiNTNL9Bcpf3T9BEKhQbud96OOer3iWY+X5X1RTeoM
jvlXIkOdDhohHWms7RtOxp2Drhu6/g==
=WQkS
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--
