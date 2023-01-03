Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C8265C5A8
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 19:05:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6980E5F17;
	Tue,  3 Jan 2023 19:04:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6980E5F17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672769146;
	bh=ZR7IIxT/ZnYnuHfeakuNO7Lp/ohQpSt0ghu2SgfR1ds=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LfT5bYX03F9iE/abF0/VHjWZu5n6tlFoBuLCz9q8eNf6Z/NfEJnI7ul3R+uXSMbwC
	 It1ru08NAb04rQFke6HWECUArhkVD/AqOclJAtMQVRkBhYhuwsLGz5/RIl3nrP37WI
	 RvsLVkBSEYMZlKD32Bm5+q43FMHJTwlQ0qLcndU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2A2AF8003C;
	Tue,  3 Jan 2023 19:04:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C7DFF800F8; Tue,  3 Jan 2023 19:04:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A73C8F800F8
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 19:04:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A73C8F800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KE/NYrzv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76FCB6148D;
 Tue,  3 Jan 2023 18:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC04CC433EF;
 Tue,  3 Jan 2023 18:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672769080;
 bh=ZR7IIxT/ZnYnuHfeakuNO7Lp/ohQpSt0ghu2SgfR1ds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KE/NYrzv+S4HklSm3cK8xlkV9GQXl4GW/rAzLQbeoTYg5oBP2RlWUFH3tzDaVxyMF
 mg8CmhnaAqcvdEYt1pe/KU5/hZXgLO31XLizgutcxPFA5Ljnm65leJEOQSM3FTHsPp
 GZeEmoYZKAuBkqWGNCrMMCcEwCoeW8jVLMmsn/zriTN0+Zx8VMGDFPbO0WRiizN2+i
 SB0emxaWIAP4q3QHr3N7UYfsae2zQVmuBy+q62EmfAqV039gZ2x1SaeHJ2LS0wbbbg
 e360qUYRHURT8bTUPwHoivTbjcjZxyqQg7e0yY5xO4g5UBTMjSOvsOlGGj6XFekxCV
 8H2Y/lVCwZAwQ==
Date: Tue, 3 Jan 2023 18:04:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: Add FSD I2S controller bindings
Message-ID: <Y7RuMmvNnAx+oyyl@sirena.org.uk>
References: <20230103045613.100309-1-p.rajanbabu@samsung.com>
 <CGME20230103045651epcas5p417960d84f4aa934b0ae1a150ee5fee08@epcas5p4.samsung.com>
 <20230103045613.100309-2-p.rajanbabu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JqE9RGShcf/zQD+W"
Content-Disposition: inline
In-Reply-To: <20230103045613.100309-2-p.rajanbabu@samsung.com>
X-Cookie: So many men
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rcsekar@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--JqE9RGShcf/zQD+W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 03, 2023 at 10:26:09AM +0530, Padmanabhan Rajanbabu wrote:

> +
> +      tesla,fsd-i2s: with all the available features of Exynos7 I2S,
> +      supporting only stereo channel playback and capture.

The driver claims that 7.1 is also supported.

--JqE9RGShcf/zQD+W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO0bjEACgkQJNaLcl1U
h9CQlQf/fBI3mqSLK07/+r+4uheckUiQK5tcJh+cUiIlkwg8BznPvJ9zoZ0QYkEv
r+4pS/ovtdqPcQbdGQrE4jdLiAaGp4LDTPESERoY2Y1/0KMErrPxxbEOML6PhjZ+
7LFPnq8fh/HHh4IGHsYKLD2jwZtphXHLzEKcLlczp6YaubvXESw9G0XOMFSc589N
+wSAxOqV9GX7kq9uQnzr4lS4/FwdqXG4kCW4QEHSg8aqjilG7Ogm7WwhIgGzDj9W
OwptqgijpkK+sMF0DmitVPdYRAURrsLSP81LoEM3tgbPkeS5FyIljOtGcgynpuSI
jOyQHgIlRYZ4A9F9+Wcd6tV2K8kjsg==
=Li2U
-----END PGP SIGNATURE-----

--JqE9RGShcf/zQD+W--
