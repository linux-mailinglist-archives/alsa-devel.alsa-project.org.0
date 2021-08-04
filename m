Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1553E071B
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 20:03:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B264216A4;
	Wed,  4 Aug 2021 20:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B264216A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628100199;
	bh=p88iTvuxkM9l7hM2G77m+PTe5g6FuVL6G5B/UoxLQzk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rk3Lib1En5AbxMIHowmZDtUBb0js5rJfe8kHFxsy36AsBbUvA4vCgZ/AwCiU2exMf
	 /Sk0HffijNbygqWWrY0Uq+hJIq+1bIjbBPgmYAUiF3sendOC980TU7cPhO/woUyU/e
	 j/jQ4q2I48Q4nQY+IwxKFsGZeA8pIE8gBXehop+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69E85F8010A;
	Wed,  4 Aug 2021 20:02:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54DA9F80271; Wed,  4 Aug 2021 20:02:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDFA9F8010A
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 20:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDFA9F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DMrk0DD6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6975760FC4;
 Wed,  4 Aug 2021 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628100118;
 bh=p88iTvuxkM9l7hM2G77m+PTe5g6FuVL6G5B/UoxLQzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DMrk0DD6FNclnMVAmZJYRQQc1EhFqitanW2r/SBPW43BkpVBc0eTJKRoZN+BEocxI
 vp23wktuvxfmwvzuhzdf/xk+Je40Y2bII/Ch1Bhv0JoNSQl9YDVS6bpMTOPABtSkWY
 JZYUxKM4R6UamGBqKYZkU1BZXBGsTzkDxldq59SYBVpmWb0NAqEY0urXD2HTgZtzk/
 73MhcGizo2CYJ8VY28V5nDnnltf/nofllig7n4GU09RubVKHgItucBib0AXIwlQG+1
 qm1ZNZG8rOUhaA6CU6AGFZEy0g7Shb0IiOnM09Y4IXFSWOPHhIX4ShiN4Xgpe8J+H3
 fuV0Fa+94V32A==
Date: Wed, 4 Aug 2021 19:01:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 11/20] ASoC: dt-bindings: q6dsp: add q6apm-bedai
 compatible
Message-ID: <20210804180143.GG26252@sirena.org.uk>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
 <20210803125411.28066-12-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sClP8c1IaQxyux9v"
Content-Disposition: inline
In-Reply-To: <20210803125411.28066-12-srinivas.kandagatla@linaro.org>
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


--sClP8c1IaQxyux9v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 03, 2021 at 01:54:02PM +0100, Srinivas Kandagatla wrote:

> +    enum:
> +      - qcom,q6afe-dais
> +      - qcom,q6apm-bedais

What do these compatibles mean?  The bedais is sounding suspicously like
putting DPCM into DT bindings...

--sClP8c1IaQxyux9v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEK1gYACgkQJNaLcl1U
h9CVFgf9HBHH7OPjCrD5uA17rPED5WD5V9vFTI2hDMEjKCkh1uN1HHrNwGiXEaB0
374wYHH4R2AMs5jag6HeeyhMtz7y3fECZ1rZcfh96/xMS0KZzUzavSpQiQ5C71ld
NtGgb9762pRC4rre0/lGVDDyhEdzWPUvDFwZoga1fXXIOOC6A8B4+6Tr0fXLDkbo
JCqfQfRisaClCLkmuIOzPtnJ45LmPWdplOYR+27EHojSH2aJX4e3UIkQ6mzsO52k
YqlnW/C3o2iV16p4NmMSwy++cDLkpqEyQio+uG4HqtUU4rkVGt78ObBmN2tdh7kd
3lDU2zhG93z8ZgQdCDEPMTOlyKCvuw==
=i2xl
-----END PGP SIGNATURE-----

--sClP8c1IaQxyux9v--
