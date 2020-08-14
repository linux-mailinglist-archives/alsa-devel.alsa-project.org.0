Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81694244C66
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Aug 2020 18:03:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11C171665;
	Fri, 14 Aug 2020 18:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11C171665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597421020;
	bh=bwt4I1Ivw+5s6OaoKYWYSNGKjE4/A6uymfb27r28z6c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T1b1jTckcCMhU6ohNfANKmD4I/BG64qoHiap/sVUrfKD0ZliVbL14c/iixEgkOaSv
	 t2CGnfxUbw6+dd8nHLtG4XBa3GlZDRh/9XkymO/PQgYwc2X/z85KUTzSDZz431lXVJ
	 CagLxa0n6KGjxrSdG+eWsXs6fjAwCXG7F4gIUh/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D994F80146;
	Fri, 14 Aug 2020 18:01:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EC76F8022B; Fri, 14 Aug 2020 18:01:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE95BF80146
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 18:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE95BF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fgHf/GGP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 341332078D;
 Fri, 14 Aug 2020 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597420903;
 bh=bwt4I1Ivw+5s6OaoKYWYSNGKjE4/A6uymfb27r28z6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fgHf/GGPT4X5Rh3a7QelbgRyOu9jbsHEgWPkF14MskZ4qfuSVe5YhbU4bvrSsNNjQ
 JggiVYC73FnhPU2fZZ+iHhZXVtTw/Jb+a8JNUUCzUfE6Qucl5W+YW+7B04lXQfjyBu
 BoBIz68fhhXmp9nCPVgQAaYoFxAdWulVUbR6KsGs=
Date: Fri, 14 Aug 2020 17:01:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v3 1/2] WIP: ASoC: mediatek: mt6359: add codec driver
Message-ID: <20200814160115.GC4783@sirena.org.uk>
References: <1597401954-28388-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597401954-28388-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Content-Disposition: inline
In-Reply-To: <1597401954-28388-2-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: Non-sequiturs make me eat lampshades.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, tiwai@suse.com, bicycle.tasi@mediatek.com,
 linux-kernel@vger.kernel.org, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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


--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 14, 2020 at 06:45:53PM +0800, Jiaxin Yu wrote:

This looks mostly good, a couple of very small things:

> +	ret = regulator_enable(priv->avdd_reg);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s(), failed to enable regulator!\n",
> +			__func__);
> +		return ret;
> +	}

You need a remove() function to undo this enable.

> +	dev_info(&pdev->dev, "%s(), dev name %s\n",
> +		 __func__, dev_name(&pdev->dev));

This isn't really adding anything, just remove it - it's not reading
info from the hardware or anything.

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl82tUoACgkQJNaLcl1U
h9Azugf+KQT2qjv6S1GYzqybbbwsXf9EyoEnEt+nTpEnAUPp4fJMT8SboJ0j++fD
4je+pUPhMO3oMDD+s7/1npVhSowHCaO1943wiq5X31lTnio2zcYYFiaI577/8E9Q
jcrESOC0PUcLZjuUPGc4I8Ae2yh9uen2vMoJqmSDZaRYKW38a3V3vAjV5Ky51l2/
vTw65kfnt87EVF7X18TiheJmgK3ZYWkgV4ugljUQ8FqWxnnUHtaQUUzF7Th5+khJ
aAQM1NW022CE9MFXd8idK+RvGbWuQZBjv+MIOpy2eE5RpdQvbSUgrC+up6bDntjF
FCirVs8xfLOqqP4ld/eJlZxW2vF3qg==
=eI4S
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--
