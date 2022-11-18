Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A13A62F974
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 16:40:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30C17167D;
	Fri, 18 Nov 2022 16:39:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30C17167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668786022;
	bh=iz4McvZM/E2o496nT649orB1f9ZWyItmYXL8nqRS8Ok=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gF5JRSucB4XcLTAfHQR9UClxWQxA+8dmE7MidjClhsCrGoksbPCzjqvVVbQSRf6u7
	 U5cxASBDEQ9qi2wxwLfPjURHt8Zk5J5wrL2AwS0nX8xELTCIsRj12dNmR1Qqew/7kV
	 20UaGyC9bto0p7oOLustWTMXLyStW/BdC06A/zLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D82BDF8020D;
	Fri, 18 Nov 2022 16:39:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E14AF801D8; Fri, 18 Nov 2022 16:39:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A396F800B5
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 16:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A396F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s0ioyr4/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76291625E4;
 Fri, 18 Nov 2022 15:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A944C433D6;
 Fri, 18 Nov 2022 15:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668785954;
 bh=iz4McvZM/E2o496nT649orB1f9ZWyItmYXL8nqRS8Ok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s0ioyr4/BLSd6K9vPXPkioUu+r6OHx2WyltYbPuQuV9D3I5ajp32xVnU0/JBAi4ak
 SgOgmftikuBKUn2fBPm6Vsx1LnnUBEeU7iy8GkwO1OqFTtt70zO0sm4pQslPloC+jV
 FZvVTvUbFTvL5zmT6Vcl9fkT99j9gFzzsRvA/ZW5nZANycq1ugvTqv2K5OyuQjbBBS
 jC5xtElKQuoPoyx9OyO8zCfcqx6zvX4cbZcjS0KKuCvIyUTz/aKp1fhsyMo1PB/OPx
 lpp9W+KSTY/Ib6q83/EFHlxDvucyftbP8YB01C+Zr2qyzcZ6fX8nWlrZJ72KV4Ku4s
 8ywbeBckn8+nA==
Date: Fri, 18 Nov 2022 15:39:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 1/2] ASoC/soundwire: remove is_sdca boolean property
Message-ID: <Y3enHzY8XY70/nWR@sirena.org.uk>
References: <20221118025807.534863-1-yung-chuan.liao@linux.intel.com>
 <20221118025807.534863-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pRbbpnwvQFI8Ig1m"
Content-Disposition: inline
In-Reply-To: <20221118025807.534863-2-yung-chuan.liao@linux.intel.com>
X-Cookie: Ego sum ens omnipotens.
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, vkoul@kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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


--pRbbpnwvQFI8Ig1m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 10:58:06AM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> The Device_ID registers already tell us if a device supports the SDCA
> specification or not, in hindsight we never needed a property when the
> information is reported by both hardware and ACPI.

Acked-by: Mark Brown <broonie@kernel.org>

--pRbbpnwvQFI8Ig1m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN3px4ACgkQJNaLcl1U
h9DxmAf/QATOeg5EyZ8P2MRRRpwyKOCKZGE0zoOp9QpnYXH+xHm+Fy44UW4Mpfqe
OEjHDEJQmZkmKRwyGbgnlDLMkqnfuseZAIVCwHQZRzLeQqVEM0DnU8rek2A2wbO/
8q6uDOpvImNxZuRhcSkKMYO8rPzZv2dZFxEJWjts7I/xi1unEwZkFBPH4itmjySA
QWndOIgtq01WIyJz2mYWS0velHGrQrGqDqRg7kwzjMekPzJSE4rJU/WBiXOg+F14
c+sxbz0HptCue1jpogtRcjDpYa/zqZt8ZfJsZHtAtOiF9d1NvhXhIO2SPNREArMF
/AF7QIIKIwW8Bu0P8kKI+IRjPM+53Q==
=Laz3
-----END PGP SIGNATURE-----

--pRbbpnwvQFI8Ig1m--
