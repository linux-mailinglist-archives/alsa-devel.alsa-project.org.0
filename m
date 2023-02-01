Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22420686414
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 11:20:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94E3282A;
	Wed,  1 Feb 2023 11:19:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94E3282A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675246826;
	bh=xSgjTUX1wqrAaPENfVdLfXLd5hvVLPmMp7rXoRYb8IY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ExY79h1xRBuvAr+Ghls0JR/Susg9txp0374g+/TLZjhgFGhjskxiTJO4Hrh2vZeN0
	 TgdY2LogOfDOg23mlU+jCfUvk7v/Q5VvKJFKMfyXsW8AV79TffeQ+joTsEG/Pja42z
	 fEbQmj1flkKZbggKsvru4L/MZnQF8oOLjUUTQry8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A98AF8045D;
	Wed,  1 Feb 2023 11:19:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45441F80423; Wed,  1 Feb 2023 11:19:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49EF9F80169
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 11:19:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49EF9F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MOGFu0fQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D47561739;
 Wed,  1 Feb 2023 10:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5436C4339B;
 Wed,  1 Feb 2023 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675246756;
 bh=xSgjTUX1wqrAaPENfVdLfXLd5hvVLPmMp7rXoRYb8IY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MOGFu0fQPnUel34mVi49lcCLYOXTEJSDvTMqrzmDiiMM6eppjJJAp1UMLjAHnFEF5
 d5mJRSh2uHxuW2H25JdFoVVrMHMpv9IhjrSnPzJTrcE5V/eM7OJK9xc/3rgsRvoZS7
 WL6F9GZs5O20gWnfmCACd6qXBcr3T8VyZGHcJz42frAHIzEszPVYLhw5oEgNgOc0W8
 wLHxpXldlE2w8If5GevIsd7ne1Rxakj0CntPnytTxuHC6e7dRLTF3Q8KUlgf4eDxFI
 jsg0svaRcyA6zFkK8+FpNJSsLm2P/xL8TSgwfyWbQQt8BH8Gl25FhZsWB5+90dxu0j
 datdt4OSa3+Bw==
Date: Wed, 1 Feb 2023 10:19:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 14/15] ASoC: dt-bindings: renesas: add R8A779G0 V4H
Message-ID: <Y9o8n5tyXSY60Wg2@sirena.org.uk>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
 <87pmau5ejk.wl-kuninori.morimoto.gx@renesas.com>
 <17542e28-36dd-2bb6-6c04-49df9433a67a@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XO+wdLb7H/tLNR/H"
Content-Disposition: inline
In-Reply-To: <17542e28-36dd-2bb6-6c04-49df9433a67a@linaro.org>
X-Cookie: Oh no, not again.
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
Cc: Rob Herring <robh@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 devicetree@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--XO+wdLb7H/tLNR/H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 01, 2023 at 08:11:48AM +0100, Krzysztof Kozlowski wrote:
> On 01/02/2023 03:02, Kuninori Morimoto wrote:

> > Link: https://lore.kernel.org/r/87zga6t5r4.wl-kuninori.morimoto.gx@renesas.com

> The Link is a tag added by maintainers pointing to applied version of
> the patch. This does not look correct...

It's just a general thing for linking to relevant information, it can be
used for linking to other things too.

--XO+wdLb7H/tLNR/H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPaPJ4ACgkQJNaLcl1U
h9AZsgf/aJMoCoZzoWhCX5NKedEg4lcv11tTss1GItdBbH9UaAeH3pFY6UTeuleS
m3i2TFZs97ujstBmmu0FPiblXk8/bzvNEtOsucN1ffs9IVMYV7PxYPPgOhEdTyZ8
7CcAVHvdQW2HelllA44bsvumWG3X45ENnBSxC9dnA+GUnZVInjusSHSVsZHLffcb
xk3ojzM0rvPSXfdDhdZ66FvLDlgJpjb5/a5obirngrTmUgrlaD2r4o4hypwW/vap
vIDbLm/B+ytozsXnVxTmY6bGux6ZcTymwWAN26xw+mcpUCbvlN643yt+1OkXMhsG
H773cyFsGzDX4kI1dJE/3EhEF6XEbA==
=N61+
-----END PGP SIGNATURE-----

--XO+wdLb7H/tLNR/H--
