Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 625986377D8
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 12:44:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04D9016F9;
	Thu, 24 Nov 2022 12:43:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04D9016F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669290243;
	bh=exRxZHGfCDjuz9/neSi+Z7GQERrKswxnZDhNm6sFeQ0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gj0SHGFW6uaAIPp8AD1fKVwVBapA6m/wh2YoOQPsO5HeJX/qnFhqj0WemGbH6y4g5
	 uo3UU7YT+hZEgSR/Uig+qpZn4LTydD3UgnVtAHuiG9WOJHe8ykdD3bXPoyT6zWwKod
	 yezSd3UAQGBe6me4Myachom3i4xE1/QbRle9D2vE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B897F80448;
	Thu, 24 Nov 2022 12:43:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0B4CF80431; Thu, 24 Nov 2022 12:43:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AD39F8014E
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 12:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AD39F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gD71TT1Q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 824D1B826E2;
 Thu, 24 Nov 2022 11:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EEAC433D6;
 Thu, 24 Nov 2022 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669290181;
 bh=exRxZHGfCDjuz9/neSi+Z7GQERrKswxnZDhNm6sFeQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gD71TT1QVY5ydZ6KGOyFBLx71GXaD4GhICG6LPHnQSDMv1qZUn4YEcqxqDTZyfMBY
 KhtKlNYYlT5rRY+LFCgIY0+ogGf6YHgHaai8zQiLrAU/kvDjm+O0jaYz0nn2LvzbUA
 gSntnJHM8Q2O32KWWuBhD4pMsFXXDKZ/DmzH/60NXrchyHtyN/sWZwFb1xx2F2UBTp
 5EKACIoTrCUYVedm5e4BMF2xe3zwvNOCdNM3Pocn+MWAdptFftk/kUY2Weuz8fC50A
 CJvg7SeQjiuPc9Y7GGCp6WIhzFVjy0Z72WMdSSIJGC7RwG+DsxI9JQWV0P1zeumCLV
 wfphqgRymFqfw==
Date: Thu, 24 Nov 2022 11:42:55 +0000
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Subject: Re: [PATCH 1/2] ASoC: nau8315: add new acpi id and compatible id
Message-ID: <Y39YvzFUZ0ZNvjPO@sirena.org.uk>
References: <20221124055658.53828-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p74LfaqrY1m5KaaW"
Content-Disposition: inline
In-Reply-To: <20221124055658.53828-1-CTLIN0@nuvoton.com>
X-Cookie: Apply only to affected area.
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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


--p74LfaqrY1m5KaaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 24, 2022 at 01:56:57PM +0800, David Lin wrote:
> Add new acpi id and compatible id for nau8315.

>  #ifdef CONFIG_OF
>  static const struct of_device_id nau8315_device_id[] = {
>  	{ .compatible = "nuvoton,nau8315" },
> +	{ .compatible = "nuvoton,nau8318" },
>  	{}

The new compatible needs to be added to the binding document (any update
to anything in the DT binding parsing should have a corresponding update
to the document).

--p74LfaqrY1m5KaaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN/WL8ACgkQJNaLcl1U
h9B7Iwf9HhoZ3F1nvrMTZ3ygws95cIY72n3FGZbp7DHcOKsKKxtKFRYgRbwW3aSR
bViax9d+dEvk5IqqW5dhoU5FIVw4SC/yTcNwEH25VHSOdBuq12QXDY7lWjT1mPZB
tWuydVpFvSdIJlHxSjuXH24gp+S8K+GSbANxMog1IMeY/gzvu2pPI+Syq4BkK9zY
Zi7D7qqmYPeGAj+3k/RaQb4KyGn+a6DU8jRpQZd04w7BYLUiX4EZTwhASH7jnaMs
8tcQ+fS3rel8XFkaI8O4h/8QDrN/ijeC8t+Yt+4QikV7+Gy+gHwmOsfxNOYtc6EB
yspErhksFofAIOHtLjXhD/t9vKpn1w==
=MjaT
-----END PGP SIGNATURE-----

--p74LfaqrY1m5KaaW--
