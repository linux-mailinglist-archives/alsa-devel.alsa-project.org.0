Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 580F9350099
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 14:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7FEB1682;
	Wed, 31 Mar 2021 14:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7FEB1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617194767;
	bh=zu5+7E3FlVx1B02C+X7ZBz7+D9LN8HEMJnjE1Je3NZo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XMg7lk7mJ9dhEAoDtnTWj1gVoTmMJNsOYnvQrbn0VdN9ZDdbw9mHeewRpmj31YfWn
	 LSFnVL59RTPk0+MZ9mEkp4u5f9ranUpbKqk/jiXJ9zzWBquek9Oro2gQRPp2402yu1
	 q9Jio+caADpWyF8v3J9UtN4AXeDDWhHyf+qDt+X0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4754BF8013C;
	Wed, 31 Mar 2021 14:44:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9536F80166; Wed, 31 Mar 2021 14:44:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54475F8014E
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 14:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54475F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ivif8rLi"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AEFA61959;
 Wed, 31 Mar 2021 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617194674;
 bh=zu5+7E3FlVx1B02C+X7ZBz7+D9LN8HEMJnjE1Je3NZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ivif8rLiEpy+yTQbX5AQrdpFree1FdwAVyRpOZwQyWuOr7yJ0OvozGPzO6OxzoWh5
 BUsDrcq5ZR8R5euuGOtk0eX7ibhoq50adYQU1A+ZD8U8/6zFGmS3hMt92tsIuiExn5
 6nE2sIaEgSEZUxkwG3dNjjxByFGbpdqIzwQLMB3dWkh8ZJF1gHN0jCHMR8ALRdAcym
 4kQZPcpv1ntbTS6iMjGzYGqP72OXRh4/xb6fpgAFEN/Y9z8jrmU/hmBYE3YMfjtyL+
 IyNAuqJh2KhAnOAhZySyVkkBbtltARa/XVIyi13XPbZuOfYZkReX3IW4AfOceCogVe
 yjvgCqPM+nRRA==
Date: Wed, 31 Mar 2021 13:44:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] ASoC: cs42l42: Remove unused including
 <linux/version.h>
Message-ID: <20210331124419.GA12878@sirena.org.uk>
References: <20210326061335.3234571-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <20210326061335.3234571-1-zhengyongjun3@huawei.com>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Hulk Robot <hulkci@huawei.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, linux-kernel@vger.kernel.org
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


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 26, 2021 at 02:13:35PM +0800, Zheng Yongjun wrote:
> Remove including <linux/version.h> that don't need it.

This doesn't apply against current code, please check and resend:

Applying: ASoC: cs42l42: Remove unused including <linux/version.h>
Using index info to reconstruct a base tree...
error: patch failed: sound/soc/codecs/cs42l42.c:11
error: sound/soc/codecs/cs42l42.c: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0006 ASoC: cs42l42: Remove unused including <linux/version.h>

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBkbqIACgkQJNaLcl1U
h9CoJwf/QAjGb6XA/wFK32XB2wDQQzeicvhjhNfxqPyxmO/wmoYc805JcqgbOLTx
i+fBFtquaB5YgPCNDF7Qx+tXsVbLcRsE6IB9Wh5A24qOBZySbh9JzwIB74QkJri8
1Kdd+pblf5HHjreotAi0WRtvFEE0654Q/QK5Llb2sWF/9qTbj8j77AOmT6akewnn
0qzN2K9+LtTYdIa8muL3cLFGVeN6ab7M05jWqUnlCn4yRww26+y4/zhwmcSbMpLH
BGmwc4/r8J7aFTWFG0x+/Tg/GnmYUtvA+oBrF2zCa9ps5Uxbt+TNrBAO5yQvmJvw
Zqy95Udm0SRXT5rOcWzZHQoHrFiFMg==
=QE6g
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
