Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDDC3E071F
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 20:04:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 998F916A5;
	Wed,  4 Aug 2021 20:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 998F916A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628100241;
	bh=oaA4FqiXPhWxp+xL4uDYb9Z0nalrZT31dcrE+MtQpp8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SaJnUdnoXWd5KZ8KNAwzpD8e0KApLMKrNkSRZNRhAGIUY3eLal2ORi6qIfB154I+6
	 +aPSxz4q3ODdyYrruHnkX5F8FfXDKD+qyX5jFI62gCiqczWI6epFB3PL1rU9pev7bA
	 LUZP7q++rTTd4q44qWxEnNQQ9IUuGao5sBJUP59g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0EB7F802C4;
	Wed,  4 Aug 2021 20:03:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3F31F80279; Wed,  4 Aug 2021 20:03:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49798F801F7
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 20:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49798F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rOGnn+gr"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76C4260F94;
 Wed,  4 Aug 2021 18:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628100185;
 bh=oaA4FqiXPhWxp+xL4uDYb9Z0nalrZT31dcrE+MtQpp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rOGnn+grTByD754V2VmaJqELPqiyIzPMfei8Fr+xGz78yEQHuJXjCEbA9B8h9IcZ/
 PmHO/BTgQY/vkdwSqjQOvTcPaWLCNazJ7+PcBhhe7CxLE+i0WHooIxBaM8weUxVazH
 O0asDJWwXVF2w9OLMpzXQTD+Paz9L+/VOiKzxqsvEq//9giHfKpUVlhRVdiJBaRe+q
 /OnKYgnantKvRqDpsHzgtHlpVddh2wAC1y9DoGx8RQnC7YD2dN/nPZss/4IuMVqume
 QC5TLczYo56gdk5V3DpzP1811UGxJQXX55BU5bTs2kvzFcOsC/Y10Hpw1W/TtV/B3R
 biUVUYPXrj4dg==
Date: Wed, 4 Aug 2021 19:02:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 12/20] ASoC: dt-bindings: q6dsp-clocks: add q6prm
 clocks compatible
Message-ID: <20210804180249.GH26252@sirena.org.uk>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
 <20210803125411.28066-13-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uAgJxtfIS94j9H4T"
Content-Disposition: inline
In-Reply-To: <20210803125411.28066-13-srinivas.kandagatla@linaro.org>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, bjorn.andersson@linaro.org
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


--uAgJxtfIS94j9H4T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 03, 2021 at 01:54:03PM +0100, Srinivas Kandagatla wrote:

> +    enum:
> +      - qcom,q6afe-clocks
> +      - qcom,q6prm-clocks

Again, what do these mean?  One of the goals with DT bindings
documentation is to be able to relate hardware to bindings.

--uAgJxtfIS94j9H4T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEK1kgACgkQJNaLcl1U
h9AY9wf/dCOk7p6eUyR3ejUvHWmvonp1MSGju3SI4goxKkua7f9quxR3KEBXbzAH
gCVD0mnR8fPzhC9OwmJMgn5PcOTJpnlpehiAzs6ZqWvbcePTEAuoB7HY3DiF3avR
+P1MH7RwzbF88VVwYhp2JnjEa3ezpOSd0PZdTdLVqc1sdGthrqezFJaice7I0e5Q
tNpXzCgUJ3w7d0arxg2emHNUDHDf/lzvgKRoqAY4gYc2qLfZwryzJDHKkdmZi+xh
Vkf3dEQJVCIkIbLWt5aJiG2sFl6VJjf/G3eJx2+3vFxmVLHszCBNFed5rsYtrf3S
RKUvD7OdXyhkP/CInnomxmlWGb/yAA==
=mvMf
-----END PGP SIGNATURE-----

--uAgJxtfIS94j9H4T--
