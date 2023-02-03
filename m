Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C08C6898A6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 13:29:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8512DE0E;
	Fri,  3 Feb 2023 13:29:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8512DE0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675427397;
	bh=mYTdB2Xij/3o5p2M+sxGz+Hi0V7347ewrKK7gMJsp9s=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cOMTYxA/E6+8qakiCKN/zChvfoMOTWQvi23aQ2X1Iy+XL0wqafEuKnG9dqfnrX5LP
	 S1GHLCIqTtSO1XWsd4Sn8Pf9a8Lry2n4b2ILIYQc/e1fEt+dTSYLSpOPKM40cHYRUB
	 eINhVp/g9FmvGLMaNym7j3vR1R+bz0OLM7QVG7R0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A447DF80423;
	Fri,  3 Feb 2023 13:28:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BDB2F8032B; Fri,  3 Feb 2023 13:28:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C456F80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 13:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C456F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D0udOCq9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5385A61F1C;
 Fri,  3 Feb 2023 12:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EEFC433EF;
 Fri,  3 Feb 2023 12:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675427317;
 bh=mYTdB2Xij/3o5p2M+sxGz+Hi0V7347ewrKK7gMJsp9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D0udOCq9uJqPzXtkpm+ryU+EHeK+Po7AoWR2egYehW+UNkXQb9s302AQZ/3x/+hmB
 DmiusZSso8E+20oANsQpbakrgECdJgbAfvQwJST/0N7ciqDxfrecQzAhhqwLqX8Bsq
 a7d5/mHtLOIo/ajpIPxIp9V7xVwkrx/gUvYAF31hHQHtJ5VeC5ROYSekKMxNH4X4Wq
 U8gxBXzgzU4/wUzFhi1Ul7kybRCIjxwFJK7L853K88YjA4SfYk3mc4BiPYwJkpcDle
 XF/gyc1DbNUqQYxDVooCjhbHzLM9dOxE2EGEWm80CETT2BU81vNOu0f/LNN2z0w/o8
 ORToIWjIWpvhQ==
Date: Fri, 3 Feb 2023 12:28:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 2/3] ASoC: codecs: Add support for the Renesas X9250
 potentiometers
Message-ID: <Y9z98CXXyI7UkrkZ@sirena.org.uk>
References: <20230203111422.142479-1-herve.codina@bootlin.com>
 <20230203111422.142479-3-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h0liV1/NW0xnlBov"
Content-Disposition: inline
In-Reply-To: <20230203111422.142479-3-herve.codina@bootlin.com>
X-Cookie: No animals were injured.
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--h0liV1/NW0xnlBov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 03, 2023 at 12:14:21PM +0100, Herve Codina wrote:

> +static const struct snd_kcontrol_new x9250_controls_std[] = {
> +	SOC_SINGLE_EXT("CMD0", 0, 0, 255, 0, x8250_kctrl_cmd_get, x8250_kctrl_cmd_put),
> +	SOC_SINGLE_EXT("CMD1", 1, 0, 255, 0, x8250_kctrl_cmd_get, x8250_kctrl_cmd_put),
> +	SOC_SINGLE_EXT("CMD2", 2, 0, 255, 0, x8250_kctrl_cmd_get, x8250_kctrl_cmd_put),
> +	SOC_SINGLE_EXT("CMD3", 3, 0, 255, 0, x8250_kctrl_cmd_get, x8250_kctrl_cmd_put),
> +};

These control names feel a bit icky but given that they have board
specific functions I don't see a way to sensibly rewrite them.  However
I do wonder if we might be better off having this as an IIO driver and
having a binding that lets us import IIO outputs into sound cards - I'm
guessing there are other non-audio applications for this hardware?

--h0liV1/NW0xnlBov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPc/e8ACgkQJNaLcl1U
h9DANgf8Drcef0r+SN0lM5Hjl/HwDavvrxI99u+GtYEKjIhU0tvGOR/va8iwO2H9
ELv+YEOqHmHQu8jafBktqSqFXMo5Ji/BUPt4N4OU0OtDrpzKkM4MvTYREYWLVlLs
AVq125SrM0p7rLLfeKwjUP6QB8qB65nBoIjUazcEqYaHtHeZUJhoXJMskoH6tbCv
3/BD8dylapfR1wKbjIXNgUyMXCVD17Oeul+n0s63ZrxXfrrPXSRD/A/nrl21q1H4
nRfD2uUZfdfmzQ3so3n5DW2AVmnM4TV2uvZbcfgfc66eJAm+koamH8kd6thLIJ0P
vP7HXp8cy9ZBETaseK+rgEMZ7z9uag==
=LGok
-----END PGP SIGNATURE-----

--h0liV1/NW0xnlBov--
