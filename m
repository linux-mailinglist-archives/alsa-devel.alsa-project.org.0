Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC86A252180
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:04:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74DC316A8;
	Tue, 25 Aug 2020 22:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74DC316A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598385849;
	bh=9BFGQrBVGwKkcS5++4f44QQmctuXCZMD3MvnoANhqaE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QMLf2/LO7zjSz6i+wROOEj6+KWKN54xsibi2E9wYXnQY4I1mk1nySZP1fLE0/qS55
	 utn8Gbr8DzhMZwdUVBz2lY69Pzaip5Zi4KrjFpPNIxthEHAjydS+8hVAZBjBCspYHG
	 siPRg/Nm59PLSN3Ffv4r3913eWoBMdClhtG2yH0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37F6FF8027B;
	Tue, 25 Aug 2020 22:02:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCB51F8026A; Tue, 25 Aug 2020 22:02:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1BA3F800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:01:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1BA3F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GAySD+XM"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CEE442072D;
 Tue, 25 Aug 2020 20:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598385715;
 bh=9BFGQrBVGwKkcS5++4f44QQmctuXCZMD3MvnoANhqaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GAySD+XMelBy6xMUpOIqw4YpRkgDbT4b4mDBDHcmzKzdvZoX1y8uMEkmJRnt9M/3J
 vUUbAchCmMJyuGVSIpK3iw5IDCGbLy5HNFw3elDGvG1F2CTvLsPTAbz/HNhbVUeqG6
 dxoQLX56Im+R5kSZilq/m0C+5rYKGuN8/wuS1am0=
Date: Tue, 25 Aug 2020 21:01:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao <srivasam@codeaurora.org>
Subject: Re: [PATCH 5/5] Optimise lpass variant structure
Message-ID: <20200825200119.GJ5379@sirena.org.uk>
References: <1598375788-1882-1-git-send-email-srivasam@codeaurora.org>
 <1598375788-1882-6-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0FRtVia6Q6lt+M0P"
Content-Disposition: inline
In-Reply-To: <1598375788-1882-6-git-send-email-srivasam@codeaurora.org>
X-Cookie: Don't get to bragging.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vsujithk <vsujithk@codeaurora.org>,
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


--0FRtVia6Q6lt+M0P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 10:46:28PM +0530, Srinivasa Rao wrote:
> From: vsujithk <vsujithk@codeaurora.org>
>=20
> lpass variant structure has I2S and HDMI register fields, which are used
> exclusively. To optimize memory, replace with union to select either
> I2S or HDMI register fields.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--0FRtVia6Q6lt+M0P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9Fbg8ACgkQJNaLcl1U
h9ALOgf/Q++4zJDPt4TU4W9oHkQIZCvfQJMKc660SOgV0anLwXafEPGpcSmNY3zu
5D2MW7A+6NBByXFp0BBGwqjlzOTKK71zef/OxrHl+suzaW/XWe2rDb3AF5oQU01i
/jPDI0aGAZ7+4yR23sEVtgGb++1yTXTNIbBQWRxKSxC+cQaj0dsP8KfIJZGf2PO9
67Exr6RYsqID8IoFuFXSnux1FiCVzzGLgejwfnkH5baqGmA7/ck7H3ehIavVWed4
AxF30mewbt4QOlghFcCtFQwgZqDCE1fD/OUxO0GW+Sf9i6BGW4P3G3qXYOVGpXL9
RluWkG1MsxgEcVsF59UP9OHeFAn1SQ==
=8Cu3
-----END PGP SIGNATURE-----

--0FRtVia6Q6lt+M0P--
