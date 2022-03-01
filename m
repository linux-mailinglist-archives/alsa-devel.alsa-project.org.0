Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD8A4C8BD2
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 13:41:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D3CB112;
	Tue,  1 Mar 2022 13:40:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D3CB112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646138475;
	bh=hv62MHfq4rzzCEl2fTmyE2lMMF0TTQx9kHnlP0mZ57Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q2rE40HSzPCRN4OiyB6h/Cs0ycX4QguENVIJHik+Foh+mcDbEf4mocS3TqmaJak1d
	 oVbsipcRJAjzgFHWvxPPFSveyIC2uKU77Lych2iS4jwxdfULKr+tfu/HlMB4x8rs0r
	 x3mAXZCKmPfRh18KNBWTs6f7dHjA2F1+WVPvtdg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A924F80167;
	Tue,  1 Mar 2022 13:40:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CB98F80227; Tue,  1 Mar 2022 13:40:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF22EF80167
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 13:40:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF22EF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hCkTo8BN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 07DA261257;
 Tue,  1 Mar 2022 12:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C16C340EE;
 Tue,  1 Mar 2022 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646138397;
 bh=hv62MHfq4rzzCEl2fTmyE2lMMF0TTQx9kHnlP0mZ57Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hCkTo8BNi0iiE3Mh2y/NkqcWKbhqtCehGr0gcy3/Ip1/62ExDHQWn726l5rzSAa9Y
 C3rzMpEH6DeQ1/AYJ2dF/hMRRnWiytpnIWliRwxTHII7NIuVtmsTU2cvouHe7JE7TV
 2IDQQKw10mgW2PggXEDAM+Srdev+vDTDpAKSBAfWc5Bm8sMgvdV6V+FmoEftpKfwgg
 jwaYdK/BF9wueTa8Vl3FBOQhJx0K3moy0yExuvVxw6h3dyjpCTl+ucjjo5h0rddDSZ
 /9UARZPdb4NWMkxlUCAfrxgDU60pWKE6g4sZOiLeLU9wHPraEFFgWCVk3nCPsmWLV1
 wqaN0q/nZ/JSA==
Date: Tue, 1 Mar 2022 12:39:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] ASoC: amd: Fix an ignored error return from
 platform_get_irq_byname()
Message-ID: <Yh4UGGuspsc/gAyY@sirena.org.uk>
References: <20220301064920.37788-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uxmg+A5/E9EeDZt4"
Content-Disposition: inline
In-Reply-To: <20220301064920.37788-1-yang.lee@linux.alibaba.com>
X-Cookie: You have a message from the operator.
Cc: alsa-devel@alsa-project.org, tangmeng@uniontech.com,
 Abaci Robot <abaci@linux.alibaba.com>, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
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


--uxmg+A5/E9EeDZt4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 01, 2022 at 02:49:20PM +0800, Yang Li wrote:

> -	adata->i2s_irq = platform_get_irq_byname(pdev, "acp_dai_irq");
> -	if (adata->i2s_irq < 0)
> +	adata->i2s_irq = ret = platform_get_irq_byname(pdev, "acp_dai_irq");
> +	if (ret < 0)
>  		return -ENODEV;

If an error code is being returned we should report that error code
rather than squashing it down to -ENODEV.

--uxmg+A5/E9EeDZt4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIeFBcACgkQJNaLcl1U
h9CFbgf/UYP8faM7a5tWC5+cSxh/9F9ahjHk7TXhiiQvjPIoYkrlThUWycOcaTSX
HJieKH2i6j9k3IjeZZcz37jTDi7xrczrqDXCe4KKEd8yx3+Ez7fnVdZIf71ffzKI
mZfaVT4VxwwImIaJRoDnHbx1a607Yj1AjiJz6fCA+s9LpXq8bF/cGd9TDtbdLm25
ya7GoTU3S/tasM1nU30vcvqXc0hBbZtwvt6I99WM24B5V1dxyUw0SUO4lXj59hSe
HipddydH6lpW/GojwROrEyaxawBNaB0W6GXhXkaXOFHw+nUzrILNp+Okjgf1HUS7
w8ZY4LHBFQ70HxHCzWC5/CRChrVCCw==
=rnGn
-----END PGP SIGNATURE-----

--uxmg+A5/E9EeDZt4--
