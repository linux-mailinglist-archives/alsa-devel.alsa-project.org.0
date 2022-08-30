Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E45225A6BA1
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 20:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81F8F169D;
	Tue, 30 Aug 2022 20:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81F8F169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661882558;
	bh=0OojOeWriYciWCW7CDS3kKn+DRlqDdnrnDF91OklMPk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLuVGf+cBxJ5Cv2eZgEgaUVfrqcqzjoBi/OPa/wbVo86bPlRJcI841vYmgRRchfa8
	 Pi6gGboZQvLCuNjBFFd9cj5N5lmp37T/6kf1tJxF13JladjB+1/BGyE3x/jKpuaKiW
	 6Ak18bJDXlsIgPs915YyNHnv0dEBkqyTTRCs/tSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2618F800AA;
	Tue, 30 Aug 2022 20:01:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AF6EF8023A; Tue, 30 Aug 2022 20:01:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06658F800AA
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 20:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06658F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Khk4T1th"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A52D2B81D44;
 Tue, 30 Aug 2022 18:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B6CC43470;
 Tue, 30 Aug 2022 18:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661882490;
 bh=0OojOeWriYciWCW7CDS3kKn+DRlqDdnrnDF91OklMPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Khk4T1th+i44VfKwq3RXJb2dAxxojnHAhA3FXFkECpPxArX7mK7MdWrJmw7PrZIr7
 5WgTA8clP9BzfH4tkxD6Q/SVIyA4AhRw6JUi9GASBU7ncgcIFEM2QswBwfyLbmLjWH
 dyuFyI2dCF5s2exJ+dhPiujDAPdT0ouEkwMAbyZSqbghWUE1MO8SiJlHnuWQ2dwmKg
 JH+AajuHyEbHQIDWLNZhz5AS2dEHdn2HfrBEgJK7w2aJYk5BBbvlzEl8rY1Rwg8ZMN
 zaNbOiRxVEjCsQrizFGs++vjbsRLgY53n9k18worQpDE47g3RX8DyLz0bY11w/4XQv
 Tz0HzYeF2iv3Q==
Date: Tue, 30 Aug 2022 19:01:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Message-ID: <Yw5Qd7ZNPIc/o7+6@sirena.org.uk>
References: <1661872039-40174-1-git-send-email-fengzheng923@gmail.com>
 <25072fba-64e2-df11-c8f0-a274037141f0@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dVf75fQWW/SwR7TB"
Content-Disposition: inline
In-Reply-To: <25072fba-64e2-df11-c8f0-a274037141f0@linaro.org>
X-Cookie: Necessity is a mother.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Ban Tao <fengzheng923@gmail.com>, samuel@sholland.org, lgirdwood@gmail.com,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org, wens@csie.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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


--dVf75fQWW/SwR7TB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 30, 2022 at 08:35:09PM +0300, Krzysztof Kozlowski wrote:
> On 30/08/2022 18:07, Ban Tao wrote:
> > DT binding documentation for this new ASoC driver.

> > +properties:
> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> > +  compatible:
> > +    const: allwinner,sun50i-h6-dmic

> Put compatible first in the list of properties (also in required:).

Can the tooling be taught about this?

--dVf75fQWW/SwR7TB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMOUHYACgkQJNaLcl1U
h9CT4Af4wwvuSIZlXbwZfwgqtydzN1X3EMrS86L2JcV+PzlV4zr+e35HOC7vomxq
fbSFJAddJVWTYKIAfu0PpX6ZBO7S+w6/0BBJpk45sQmz7mLgZMOFSnYCcunwBJA1
3JxBST9Jf764020OPDnnWzzWH/nl6cB3B3pqBTXkYQbHB19qfWyRzPepYcuxX41X
NGZRFEs4K/gnyRovZ/8eX570MMdjCkuvFK2B5rdrGrZqk6TRfgyZ1b2a6B9luCy2
/Zn8EyqHOEqDCVZ39gXyRbY3U+kl05pRbtiYAVHC0gLGkf4vc4A88si+W+sRDZEx
E3I4eExDAgQnQKh4Mq9ye3CbGNKq
=QqUt
-----END PGP SIGNATURE-----

--dVf75fQWW/SwR7TB--
