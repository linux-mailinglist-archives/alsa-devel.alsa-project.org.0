Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 898AD5B3F03
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 20:48:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5A1616AB;
	Fri,  9 Sep 2022 20:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5A1616AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662749339;
	bh=KQAifQugDA8mdZXeKVOC1h5AUP6dZ+XfBsejVtQVVyQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yqg7jJPRRdwTEsvFoM7xv+ZHX3k9mcauR9o4204hdl5oWaR4haWl99KN7OYrgcKPB
	 mHe98NMndHouned0DdFhGKPurg35DaDi68KRZ7DELKbbX/t02QZuJgzWf7TO6LVcf2
	 vQZa8m9b68SkgiYr7Cj98u1nnRiIA/lMmfssj/JU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CC6FF8032B;
	Fri,  9 Sep 2022 20:47:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06452F8023A; Fri,  9 Sep 2022 20:47:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EEB4F80105
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 20:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EEB4F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cgis6XqH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 780CCB824FD;
 Fri,  9 Sep 2022 18:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D79EC433C1;
 Fri,  9 Sep 2022 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662749265;
 bh=KQAifQugDA8mdZXeKVOC1h5AUP6dZ+XfBsejVtQVVyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cgis6XqH+8A4x2sfm5RGxquGi/ap8JDpYGVGSK8HwEdDNx9f5uJzm9g44eIHLEtXb
 R187VsPfk5yB/JsY5GwlNxySWc4RTCwZVw0feIPS4QQ1GhXcfYpgGS885Bqy5kaRL9
 avZjnCAVL9s6dAmPYNaoX/y44661Bmk05HgfmWNf6w0v0Y1K1macnFc8tCxGzLk2NZ
 Coh25f8O/4jRgf/a2IP7k7vp+X8jFEhscUUP0am97p9Fy1xWzsYV77DLii59RlxTCR
 zIT0JQgHHROtYIFeIYrWFBIrOFofnUerphTtiUFgOsUf0dMPEv7elJPm7Ac23xEY7O
 DC7lp/fo/BKTQ==
Date: Fri, 9 Sep 2022 19:47:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: sound: ts3a227e: add control of debounce
 times
Message-ID: <YxuKS7S3/aHtDNMq@sirena.org.uk>
References: <20220907135827.16209-1-astrid.rost@axis.com>
 <2b81d814-f47a-e548-83dc-b1e38857e8ce@linaro.org>
 <Yxn9o1MVMPnFO3PM@sirena.org.uk>
 <ac2bcca1-6997-2d17-b1d6-a5e81ced2613@linaro.org>
 <9a72bd22-9298-65ce-a894-540f98745a7e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Jqed1H5o0jXqkowM"
Content-Disposition: inline
In-Reply-To: <9a72bd22-9298-65ce-a894-540f98745a7e@linaro.org>
X-Cookie: FORTH IF HONK THEN
Cc: devicetree@vger.kernel.org,
 alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>,
 Astrid Rost <astrid.rost@axis.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 kernel@axis.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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


--Jqed1H5o0jXqkowM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 09, 2022 at 10:21:30AM +0200, Krzysztof Kozlowski wrote:

> It's more than one property and many other patch submitters were using
> this reason as well. As a result, few TXT bindings grew from 5 to 10
> properties within one year and there was still no conversion to YAML.

> I understand your concerns however I have stronger motivation to do the
> conversion, than for accepting new features.

For me the metric is proportionality - the amount of extra effort we're
forcing people to go through should bear some relationship to the change
they're trying to make.  We can't very well complain that people don't
upstream things if when they try to do so they have to jump through some
tangentially related hoops relating to the existing code in order to get
anything done.  We can and should *ask* people to do additional cleanups
or whatever but creating requirements that dramatically expand the scope
of work someone's having to do are a lot of stop energy.

--Jqed1H5o0jXqkowM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMbiksACgkQJNaLcl1U
h9A7Wgf/ZgdTJKiEDmpaLKTPfTfTsjf1KAym2sQrtDKauo+M6AOHc0PWCDgjnRC1
04Oi9yEs/3/WdJVIqImjQQEfzEfPH3SLekj4cwKGu1KM4Otog62IqZT2Ms3ZhMRR
TOBSy0lNibBQmrDehFTTrYusFwZI+Zri5JBpcEksWu7swxM/BKkteB75Xm0uKZo/
k80IIhTEaY6SBQ+3k/6cgvVJAFIRo1MFkdlOKboL7sZTKKVTE4F4P0Pdr+FlfGel
mYysNGLILSi4Awk9RaeSyiIcZmNSaW6OlOdaH1rFT3dl0Qx8Co7JGjm0SGkwO9uY
e6JJht7Nnigw5VzTrwNoX8w19iRlng==
=tvQB
-----END PGP SIGNATURE-----

--Jqed1H5o0jXqkowM--
