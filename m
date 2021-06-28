Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D503B672A
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 19:00:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57F9783A;
	Mon, 28 Jun 2021 18:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57F9783A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624899641;
	bh=izByTaFSY/D05L9njblRovpj2pxDUZcGEA2EcpI6IqI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sRHrfdXdgX5+Hry0HF7IVofW52Bp0SeZ6o+S+XSmKvbDfq0XhaJAhCXsL47qBbOmT
	 58/Y6yN2zjKE4+ZB5EVscA4p5bY0+woT2iMDXrekACtlr09hIr6CRGnIyudwNH6Pg2
	 E24fnNkUDa+crZFX4vPuxJ/TaezM44w74ylAbCIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2795F80257;
	Mon, 28 Jun 2021 18:59:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07F1BF80229; Mon, 28 Jun 2021 18:59:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F4E7F8020C
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 18:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F4E7F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WHYuacD1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64E2261920;
 Mon, 28 Jun 2021 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624899544;
 bh=izByTaFSY/D05L9njblRovpj2pxDUZcGEA2EcpI6IqI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WHYuacD1onMjpG0vzyLSDeHIqDQbjXbenx7+/ll908orS0qNqeaxStTKdUsgDaOo0
 xEmtt5c3uk6bRFbzyCmZj4V8C62adBF8LKGNQqBGeqCshkPWJVbXTz4NLKynnd0qEk
 9m8rXmAfMe8ssWaCqGT62H1uqXsFZaf2DZ5TbiCs/CIJJrVo6wXkw6UVDFYByqnbAf
 kMsT0PdZBgAP5Q62EuTEs/5MbyrkA8Koj3281bcNFaYzx5ApmpARITmTNJSN7OTiOT
 P1y0HRLevzmerYyqbTzxHR+epGD8o6xobBZDlIV2sCy1JtywN0NLu8EzFKrDMmj9HW
 CpKsyUuUuiuQQ==
Date: Mon, 28 Jun 2021 17:58:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 3/3] ASoC: wm_adsp: Remove pointless string comparison
Message-ID: <20210628165837.GE4492@sirena.org.uk>
References: <20210626155941.12251-1-ckeepax@opensource.cirrus.com>
 <20210626155941.12251-3-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zaRBsRFn0XYhEU69"
Content-Disposition: inline
In-Reply-To: <20210626155941.12251-3-ckeepax@opensource.cirrus.com>
X-Cookie: Someone is speaking well of you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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


--zaRBsRFn0XYhEU69
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 26, 2021 at 04:59:41PM +0100, Charles Keepax wrote:

> The control fw_name is always directly assigned from the wm_adsp_fw_text
> array, so it isn't necessary to compare the actual strings just the
> pointer values.

This feels like it's asking for trouble in the future...

--zaRBsRFn0XYhEU69
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDZ/7wACgkQJNaLcl1U
h9DTIwf/RiKVO86xh/BJlWIFcibTiJrEZG93HC/R7zE+3CAsVh/ndwjM9qrmT7ZX
fEOcTDlFgE8K+Nb6uN3VsbI+pHprxeCaNw+Q88UrLbf+UC54deCBwBnVt/Pw4laF
iVIsIvEodaDju8xbnDVEakrD6HZvjykZys5DwUgN3KL66msmL/OefXM0t/sFHf1e
zrVhtYDlhd3D0K1bNgmjEeHXHkjP9zagSt9XlvlCZf4SVnDhMFTO3H6r3uatp/O5
jdIW94nK9MdsnDw0IG3oA60jqOTywGvFU523O+5HoualmxWYV7pLP2kBHA07jILY
T0EQUfj+qlSbjG266XUxTF8gKYm9tg==
=uKiZ
-----END PGP SIGNATURE-----

--zaRBsRFn0XYhEU69--
