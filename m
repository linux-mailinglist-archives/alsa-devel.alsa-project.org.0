Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F175A42F8D1
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 18:52:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D3A6185F;
	Fri, 15 Oct 2021 18:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D3A6185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634316755;
	bh=RIPWXigVIiL/KIysb2frOp/h0Gpodru2TBwLYvNjvA0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QDeFQB2onETvJ+vR5pbGtnkUYFfoaMnMi5ztG80nKc4M6jPUr2R3oj5gLab7tqTPc
	 Sc+iFWbCj9+LeJIw6s5Ach5sKcC1qOeKUvoaQCL1PtSHOjPkA8NuRCzHsY1cM9MjYp
	 zVl+8KKsDXitCKZTXziULvmKmphVCuo6saAUeT6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9B70F8028D;
	Fri, 15 Oct 2021 18:51:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C78A9F80269; Fri, 15 Oct 2021 18:51:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A6A9F8016C
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 18:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A6A9F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Rbd82HI+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FA4861151;
 Fri, 15 Oct 2021 16:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634316666;
 bh=RIPWXigVIiL/KIysb2frOp/h0Gpodru2TBwLYvNjvA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rbd82HI+29vw+xRsqztUngZmVZeuHdyB7vrE01gYHgutD5HGl0byYQvLpvLFUJl8k
 2FYL4ZH/3AKsuT0Eyk00tiNajdw3REjKzscPv1u8xe304cDLJzUf844ENqu5ot3vdR
 PgAwlGxY1fTwo3IYhGdRGKnUH+aWjPvjEmQo8S0ZeNfYHPJp+b1TI5hpaJNl1blfDf
 RNnif/yBnhXH292ZHR49Y6d4EigmYDd+Gw7kOwcjBnMyEzz9LWpLTCTkVKsX3c07+M
 vHLIfXIW8RAA5pCEBurGfuJmV40L6Q6xEdBs+fgrMllofDT1oAaoC/a/unbhDQXa+m
 XotdnzWNMFU+g==
Date: Fri, 15 Oct 2021 17:51:03 +0100
From: Mark Brown <broonie@kernel.org>
To: George Song <george.song@maximintegrated.com>
Subject: Re: [v2 1/2] ASoC: dt-bindings: max98520: changed signed-off-by
 email address
Message-ID: <YWmxd/tnHRXUEAxy@sirena.org.uk>
References: <20211015072709.3167-1-george.song@maximintegrated.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qnzJ+0DBWvYa9boS"
Content-Disposition: inline
In-Reply-To: <20211015072709.3167-1-george.song@maximintegrated.com>
X-Cookie: 1: No code table for op: ++post
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 steves.lee@maximintegrated.com, ryans.lee@maximintegrated.com,
 george.song@analog.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org
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


--qnzJ+0DBWvYa9boS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2021 at 04:27:08PM +0900, George Song wrote:
> changed signed-off-by email address to maximintegrated group.
>=20
> Signed-off-by: George Song <george.song@maximintegrated.com>
> ---
>  Documentation/devicetree/bindings/sound/maxim,max98520.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This file isn't upstream - it looks like you've sent an incremental
patch against a previous posting instead of revising your patch?  Once a
patch is accepted upstream you should send incremental changes but until
then you should repost the whole thing.

--qnzJ+0DBWvYa9boS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFpsXYACgkQJNaLcl1U
h9AIIQf6A8SeB3TftCfbbOY4e0oQWkqlTMdDLv3LOQlzGhIShHYNBDgOZzOkaZ0F
T622F+iBFCT/en8TD/TJbZDS1SiYE21A/hEBnsXbXcxfUqsl01gy2IomMp4XQq86
QiXj1QmxCrZ5KvFaFv2cwgRgJaFx5QpMaVjmJJyXlczDJ9NiZ7WmXzhaPXRtCGkV
F1npJhwp70tIpSDiKtcCctctH/8gcc9KaTnC5dyoWHrBITlu3+JP3IuNRvRAvVGg
DcJ/APxrWHLrsh47n32PM0sHjD6SZNnmbI3Qj8XIhMnsNddqR6mDlHIqDSOKKbfU
ZDb612znVSVnEUHCLtSGoK7YnW0o0A==
=aMTI
-----END PGP SIGNATURE-----

--qnzJ+0DBWvYa9boS--
