Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D75567935
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 23:15:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3832B16A2;
	Tue,  5 Jul 2022 23:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3832B16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657055718;
	bh=tM3Y0PjqNoMYIXHgfUZVzlLb92QWYsPd7cmjz6Jh9dk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bNgB2D/vSNz6lOtCWBjnqwaDFq4nOCiIFHbpLuSBU0ZOAQeng7Y+6+Vt9/4XywrsY
	 gpQ6zYZfy1EVe79abKwAoRJiJZCUwCmJpCeMwnWWI3GUF6aIsXRxfJbpKnBUTX6t08
	 O02qh0hmscde6oJ2TbyUboLP21GiV2TMlP3rIMIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3432F80212;
	Tue,  5 Jul 2022 23:14:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 893BAF8012A; Tue,  5 Jul 2022 23:14:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FAB0F8012A
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 23:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FAB0F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MgfCx/80"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45BFD61CC7;
 Tue,  5 Jul 2022 21:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F787C341C7;
 Tue,  5 Jul 2022 21:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657055648;
 bh=tM3Y0PjqNoMYIXHgfUZVzlLb92QWYsPd7cmjz6Jh9dk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MgfCx/80fWnbVR/dxr47PRvwzTtcQ1a5c0Y4Ar9ALWvv4rrmkdc6aTOUHjXtQTY1t
 0/ZVro2mx8ABmys8IZMc1Fma43BqE3TpZbr/WIzBxHEHIf3N2/Mec+CbpyuMlQp7xU
 34VzZMk7NMiZ83qoakNZO02RPIq8XokmqXXQF582P3SJ16Dn442usbAwB5BiR4lyx2
 VJJAR32WU2JX642WuV4IEdPEQhXZRqNuoZ3u/Nu1Wf3CxrhN9IsjThhnHu3qRzn2xk
 QiFu6WlrzWGc1jCmpjPKP7Kese8OyDycfPQHWAzudCvm5KYQg/MQUWwCT7Gmd7yIsa
 Ovxox8NQRf0Yg==
Date: Tue, 5 Jul 2022 22:14:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] ASoC: sun50i-codec-analog: Internal bias
 support
Message-ID: <YsSpmi5oS0po5Cv2@sirena.org.uk>
References: <20220621035452.60272-1-samuel@sholland.org>
 <3139722.aV6nBDHxoP@kista> <YsSl+JOmMpGLK1Xc@sirena.org.uk>
 <1819721.tdWV9SEqCh@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iFZaAzCh3SOfFu3b"
Content-Disposition: inline
In-Reply-To: <1819721.tdWV9SEqCh@jernej-laptop>
X-Cookie: Only God can make random selections.
Cc: devicetree@vger.kernel.org, arnaud.ferraris@collabora.com,
 alsa-devel@alsa-project.org, samuel@sholland.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, mripard@kernel.org, wens@csie.org,
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


--iFZaAzCh3SOfFu3b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 05, 2022 at 11:04:54PM +0200, Jernej =C5=A0krabec wrote:
> Dne torek, 05. julij 2022 ob 22:58:32 CEST je Mark Brown napisal(a):

> > I can if the sunxi maintainers like, but normally changes to the DTs go
> > via the platform tree.

> I am sunxi maintainer. Wouldn't my branch generate warnings, if I have on=
ly DT=20
> changes but not bindings?

I guess, I think people tend not to worry about it so long as -next is
OK.  The issue with merging things through subsystem trees is that it's
very easy to generate lots of conflicts which tends to cause more issues
overall.

--iFZaAzCh3SOfFu3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLEqZkACgkQJNaLcl1U
h9AQZAf/frcrYF+gmNPeu2uFxUpNDw56EVnbALGZzBK40MfZlAghi7S8G4LcppkD
QJNkx/W/7mVjv60O+OvqY+9sq1v6NNmxWVtY26OdpE+qcrOA9wTfHcfMQxoiM1/o
bNcnjpOHdIfhamam0jD0+E3OdtyRbkF+1YDmMZGrT82dQKRlBXdLKmv7x/PHBTFz
zdIf6nPW9+p2CudZLnRgb2xDpWk486f/toymBqYqH255j0sOh+Irdp2ut8L63uOz
onJq+Nh0MYAsUcc+/d3b7UEQpDXerhEyYLnSd9bKpB7Kn0O3JBDiDSct5nsV3QFC
Elh3zbuoCBbWUpWNAxDeoRzg9s9ejQ==
=ld9x
-----END PGP SIGNATURE-----

--iFZaAzCh3SOfFu3b--
