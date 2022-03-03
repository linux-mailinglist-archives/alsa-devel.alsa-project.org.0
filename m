Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CA84CC462
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 18:51:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F42A1B0F;
	Thu,  3 Mar 2022 18:50:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F42A1B0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646329891;
	bh=51aBfP9l60XsWjT3AW2tScEWeXi7FkOMBaVOzj6T4U0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oYsoQy3qSiwIZOa0cE8vsPbR9RTJwp/VYytg2EJmnMbm3A8Hi8FW6mAprUCRUjJFB
	 xFxtBXKJqtjcbPWGy4sqpfYKESmG/sgtacM18HiXlYZj6EqgTBZe0A/bVFHcVc4F4M
	 9Klwi+1/PZQAcWYp062GgHJ3Y8dcYLSWaKhDFf0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9887CF80166;
	Thu,  3 Mar 2022 18:50:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 323BCF80152; Thu,  3 Mar 2022 18:50:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF0BBF80109
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 18:50:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF0BBF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aYepwbHZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CDFF961913;
 Thu,  3 Mar 2022 17:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3867EC004E1;
 Thu,  3 Mar 2022 17:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646329816;
 bh=51aBfP9l60XsWjT3AW2tScEWeXi7FkOMBaVOzj6T4U0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aYepwbHZViE06tVzwTabGfx+dND6DkiOL5oHV2vCeJfXqPlEdeWpX+LsiInFpB65K
 TuyTT/GKDIQCIq6JSFe6cHEpxrfX4l3R8xo+Agsk+JFo1k3m1I7k+tH5ho6fDUn5J1
 s9fEggP0XzGvCSRZ5k67BIm7hbcSipLQWoWdalczzXwS5pTynVJrPxwpPcnRWmiqZ8
 IFSdqp4oa0CTPNXmbmGpaZ9l+vON/lCKhqHPb5VRllJ2FeP6iAQvH5dRRJDCpdsgDc
 SGc1FrzJrjWDIUaxWFjS9Z8nzyKfp0n/jL7UyFJ+uhrUXF/zz3mzTVjVi97nyl1Sk8
 UXjter6yA6N+A==
Date: Thu, 3 Mar 2022 17:50:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 15/20] hda: cs35l41: Remove unnecessary log
Message-ID: <YiD/0ZMcSGVRTZxx@sirena.org.uk>
References: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
 <20220303173059.269657-16-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wlaslmZqugs/gzML"
Content-Disposition: inline
In-Reply-To: <20220303173059.269657-16-tanureal@opensource.cirrus.com>
X-Cookie: Password:
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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


--wlaslmZqugs/gzML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 03, 2022 at 05:30:54PM +0000, Lucas Tanure wrote:

> If regmap fails would fail during probe of the device.

I'm pretty sure circumstances could arise which would break things at
runtime.

--wlaslmZqugs/gzML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIg/9AACgkQJNaLcl1U
h9Bwygf/Y5M+R1e68KG9SptbJokKsEqBQC7gRAujY/dvMRDKz/TJ2DkuYo4d2Gsq
827x8cbebcmHHBCFlWP9ZReFuSFAeYY8n39eB3BAKAtuLPMCEasz6kUy4yWIr179
Zbj9U/PMQL6DRIJOLdx9BHfq0Y95xk9dNd96InSsQwy9uVWcVYWSHxgNGnLRJfqW
0lEmLhmGqMpIVDPVB96puHB2asziHmDJPjSTSk4gF0K7nIH/dFHLvn4H9GlAXvUw
dc22X2SGYlPVzG2z8rzZHmGOLvc4qYyORC8b9ui93j8RJwFDqtTX8ZXz+yQD3v+6
/mnzCZZESsxzpqCwqmr8GuOdw9mahg==
=9o+e
-----END PGP SIGNATURE-----

--wlaslmZqugs/gzML--
