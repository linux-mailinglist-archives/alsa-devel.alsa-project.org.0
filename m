Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F215EBFE4
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 12:38:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 902DAF3;
	Tue, 27 Sep 2022 12:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 902DAF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664275093;
	bh=4N6WKH/3dxI6M6RbsWDJhZfD/BEokUj4BWJv4Wu0EU0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jWckYnc21EFMHqkwt90qzP3GhrsoGiSu4DfAxbX9XclR/Pgg9kdAEi/pfr/hczKvT
	 kb5ON/vBa0nfMuXCG9LMz6b4ZFdVzqT0s0anJdv+DCc+gHn2mZ14WL18jSAVxRb1oK
	 YFzTsluceOQxpLVsx8AlUDWudMRTw3KOkHYuU4JU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DB85F80496;
	Tue, 27 Sep 2022 12:37:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B22CF8024C; Tue, 27 Sep 2022 12:37:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CCF2F8025E
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 12:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CCF2F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AY+QpZ4Q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A06ACB81ADD;
 Tue, 27 Sep 2022 10:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2825C433D6;
 Tue, 27 Sep 2022 10:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664275029;
 bh=4N6WKH/3dxI6M6RbsWDJhZfD/BEokUj4BWJv4Wu0EU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AY+QpZ4QlPtYpboQIKabFDadUEpFguTdO83MQp1mdSnhFGEAicwIMUbjnk/xblaAG
 TB3D9tw+qhhQ6oTXmsgbJrKVOSYKR+JmtqgKnPg3AJR3Ua3E3urASywClIoUr3+IvK
 FNdW39AujXQjvfZ1o3aw0Yv83PsG8Stqe4j0j+dPNmLCW9HZUbLOoBOPLa4mScyngp
 w/FE0MT4n/zKw1YfHLrH706NQ2WI4R5bqr0uNdgfWI3swAlFdZ3YVweHGkSxEwpd1e
 zvlp9LxXN5h3yHaNaxNLHgGTVIH+T72BRnEYYkT9p20JUNAI8f9d4NcZ77GjFexeZg
 Cbmwfdr7eEDFg==
Date: Tue, 27 Sep 2022 11:37:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: sound: st,stm32-sai: Document audio OF
 graph port
Message-ID: <YzLST/bYxqd0S/i4@sirena.org.uk>
References: <20220927002004.685108-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Du9wpDWt1y+c5xqH"
Content-Disposition: inline
In-Reply-To: <20220927002004.685108-1-marex@denx.de>
X-Cookie: Vote anarchist.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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


--Du9wpDWt1y+c5xqH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 27, 2022 at 02:20:04AM +0200, Marek Vasut wrote:
> It is expected that the SAI subnodes would contain audio OF graph port
> with endpoint to link it with the other side of audio link. Document
> the port: property.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Du9wpDWt1y+c5xqH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMy0k8ACgkQJNaLcl1U
h9Andgf/QmV0+vIA5bfdtCHk18ybF0TXlpGWK3K7FAt3k4uJwPybU+rISAH7EiHB
JkO5dhxqhmjhBMX4nKTAmZUkJKa64n68ZIyBxXgpVCiBa69HeWZYEMPSEW3lTfX6
RmdFdabCPxtGh+RUdU6rG+VtusMQ1maA6THru9KERBlCWSuQfjVINpIikbIMJ4YP
GdGga62WSKhUwivJy5JtpJCsfcfFHMiSwLRRYpHKzo5UpHkPMyn74LBxsslZ/v2W
jtyV0L39m6sR2Mk0UvYD3FdSLxgzHcNABgXXDn+iqr7t9C4W/EjEyQb/T6aj+7NN
BX+AbFS66KGjeJufKynzBTdxtBA2/Q==
=iQWe
-----END PGP SIGNATURE-----

--Du9wpDWt1y+c5xqH--
