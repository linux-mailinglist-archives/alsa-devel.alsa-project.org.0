Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 864B73F4989
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 13:18:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78068166B;
	Mon, 23 Aug 2021 13:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78068166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629717505;
	bh=tNStwYaEeHy8lz8dA+JrAqLbds62/y2FFu5vDhlnlvY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKdmn4usicD3qwUi8/bSiqRXZw38hM1M2XDszwqEBZQj9zLeY28+lfD0eUWCjG14l
	 Mrq/1XGm7rQ584/jekHk86Lmt70c2WXEltAWJqDMW3zHAm51hI2bZKMP0H3vIZsc3q
	 h5V6Jx5S0FpME2k4LmwN/at6yg3y3WfENvj8pxLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C2A6F8016E;
	Mon, 23 Aug 2021 13:17:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6885F80424; Mon, 23 Aug 2021 13:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54555F80217
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 13:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54555F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="upMtDaV0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21EFB610D1;
 Mon, 23 Aug 2021 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629717439;
 bh=tNStwYaEeHy8lz8dA+JrAqLbds62/y2FFu5vDhlnlvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=upMtDaV098grdXPmKExRy3a3ArCr2UqPfmiJggD61JQsTKm+D4CgzqD/kcpmPSPzM
 VTNPf5dtvJqdP3GKwxuA4fQcjq2nZUklD01BxuV2dA9Ve+NupoxRZa/prLGuPvbXBS
 ILuSzkK3OmInEFZ6EA395kgQRFF2f9Cli8oR1fjML8eZJrpywLHjXmhB7FwBb6bt6d
 Z3zgJ/6p+zAc/VqB68bd6S9aJzbRxrU7TcrmMyoRMeRcfAs/SYU8/Wz8JN6RXOE/mt
 Wx1aCSqVZearMN+EmqOVa8Q7KcOB6/uycTnaXz3BfTveRbJHbxDZpVEVIri9uGXYjL
 yAP/ppMFj4jtw==
Date: Mon, 23 Aug 2021 12:16:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: Re: [RESEND 2/3] dt-bindings: add compatible vendor prefix for CUI
 Devices
Message-ID: <20210823111652.GB4380@sirena.org.uk>
References: <20210821082658.4147595-1-angelo.dureghello@timesys.com>
 <20210821082658.4147595-2-angelo.dureghello@timesys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline
In-Reply-To: <20210821082658.4147595-2-angelo.dureghello@timesys.com>
X-Cookie: APL hackers do it in the quad.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, ricard.wanderlof@axis.com, lgirdwood@gmail.com
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


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 21, 2021 at 10:26:57AM +0200, Angelo Dureghello wrote:
> Add vendor prefix for CUI Devices.
>=20
> Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>

Ah, this patch should've been before the patch adding the use.

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEjg6MACgkQJNaLcl1U
h9CVuQf8CyxU+RCV8GBE7yHwAqnnzkCm/JZuaWMwtU8rgCnw/m6Gk/TpogYBNX8V
ZuUB78xlXLrgsBpF4vq0V+uHwPkqlrd4usgedAI+Q5XeBK7XJOvjF/zPnKYE8n4w
dNJ02Fs/KXbJAKwt9NjgNmTPSOgeeOuVVGHl6zP0L9B6JoIuhdtILCxx+klrIp37
oitC5541Nkk+amvWeSEQLXKCm5GOAhezoBvrnbfXgVSzSaqZtbDUiM1XWyH9FS7v
AEmo2xqppvs2s27ZtLRJEROEKpRzCewJSr3TO0u0BbYvH5o799dHeX/Q48IuK5k6
ODJX30zoyI8N3H0+6Z1ziLk/yasoAA==
=MQa5
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
