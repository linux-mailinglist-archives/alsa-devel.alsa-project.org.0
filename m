Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881874BDA98
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 16:39:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 000FA175E;
	Mon, 21 Feb 2022 16:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 000FA175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645457978;
	bh=vyhH6QDK2y/VOZf+VqbC/i41rAHGmnbQYzgPlCQvsDI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OoTxzyoxDdh93vmQ6D/oRWZw+QZmFIbix6S/JB5cVMwfFSznnl7Xgn4O/F0Ka+fFL
	 mqrIjjCt6lTczsGuj6NrutO6pwDvDmJKSd0tN+vJ3CUTsR4+VpEbbAcBIbRPLSs+UQ
	 Mx5elIc4mfXRTu9HAzxqCkEKOSsC5IXlUd70GIFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EE6DF800D1;
	Mon, 21 Feb 2022 16:38:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB577F8013D; Mon, 21 Feb 2022 16:38:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C0E1F80139
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 16:38:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C0E1F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XufoZflC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31FAB611B2;
 Mon, 21 Feb 2022 15:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7248C340E9;
 Mon, 21 Feb 2022 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645457919;
 bh=vyhH6QDK2y/VOZf+VqbC/i41rAHGmnbQYzgPlCQvsDI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XufoZflCAf1o8fUH6RfrzWS6ni5BE4oZundMspjLGkd/3bvV0u6Rt1e7l3TMr2q1E
 egfaabk1izjL0TyBrLHFbHrvn40h/XWWIqlAHsBn6n7Vgfr2jnP75lOinHGkQo60Zi
 ScaxlQD0hqkp+MzHQkoVKM3Xk6qjo6AXMB1oqZcNMA7t2sx9HhB+FCd4pcC06rAH80
 neaVYCycYMsx+Ab/tu2uUXUATVZglWuSRE67bKE0M+ZttAxkRoUNzMc8mLl/DqgSfe
 mA6AnMXK2gCI8ehzf1kPCMQpo3CVLoCUUslOu4uZuKS63xqyC51FYgba2JrqPNbHk8
 fFYAh6RX976Sw==
Date: Mon, 21 Feb 2022 15:38:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 09/10] ASoC: codecs: tx-macro: setup soundwire clks
 correctly
Message-ID: <YhOx+nQ/G+HNRXbq@sirena.org.uk>
References: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
 <20220221131037.8809-10-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yyHhfwr2MmYyQ0yO"
Content-Disposition: inline
In-Reply-To: <20220221131037.8809-10-srinivas.kandagatla@linaro.org>
X-Cookie: I smell a wumpus.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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


--yyHhfwr2MmYyQ0yO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 01:10:36PM +0000, Srinivas Kandagatla wrote:
> For SoundWire Frame sync to be generated correctly we need both MCLK
> and MCLKx2 (npl). Without pm runtime enabled these two clocks will remain=
 on,
> however after adding pm runtime support its possible that NPl clock could=
 be
> turned off even when SoundWire controller is active.
>=20
> Fix this by enabling mclk and npl clk when SoundWire clks are enabled.

A lot of these commit messages sound like earlier patches in the series
introduced bugs which isn't going to be ideal for bisection.

--yyHhfwr2MmYyQ0yO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmITsfoACgkQJNaLcl1U
h9CGBwf/Rk/9rLx89vaRjZ9CYWDcfqgqNBJE0kJcU2Dk9g4BnJDHXJR8UxTFFWm7
/6y50AXt6mAVMDoMj50Fv/L44E4GNu99KaUv0Honb0wd+9t4r81nNiJsZhGNL7E6
C1DVpyc9HPICqqXUDX5KByX+UzIh5ddieRvpiB9HVRX90dOrVAy4XND78sTw7UV+
3MUTyENBPgSCX6UiQnuAnZhvQX/5gNbhkedrk7gZ/akArzUL0IIMqO02/Yu/ngPi
jk4f0SKxs+qXIBVDscyvfQZbFeidScPG9ytCsXDJTPB2JvGzlyzQKjg/PJk9iJ51
EiJiSTGuW7Mn1PBPgvtd76jppvkKvg==
=K0xZ
-----END PGP SIGNATURE-----

--yyHhfwr2MmYyQ0yO--
