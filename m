Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F6C4ED973
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 14:14:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07A6E18FC;
	Thu, 31 Mar 2022 14:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07A6E18FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648728851;
	bh=CeQSaD2ZJgiMHR36Z3uNdl9NZD72XVSh4ORA9Vi8oAo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qG6E+UEAuKOkpec38q8mE3jN5fT41/Kc6cQAN2Fu4j5m/CPpwNU+Gma9hbvPdDSwn
	 BKR2iM67WGbJ0tIOmjp3Zg/fsuOtl5/FNEeEyaqFz8RJp22fUhVzhRiQLN81AhYfzJ
	 Dtsz8NirRaleuEhvaBdWNnhMrcD9WIIlHVBfXc3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 592A2F800B8;
	Thu, 31 Mar 2022 14:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8E98F80227; Thu, 31 Mar 2022 14:13:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ACCCF800E4
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 14:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ACCCF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jXeZ9XiP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF871B820C2;
 Thu, 31 Mar 2022 12:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76533C340ED;
 Thu, 31 Mar 2022 12:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648728776;
 bh=CeQSaD2ZJgiMHR36Z3uNdl9NZD72XVSh4ORA9Vi8oAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jXeZ9XiPqtxVo7UWztdcobonIUpRqMMtaGcrnLaoknR2fceOQMm1LeUf7ZK0ct5u/
 NeTYa0u1v6khROdXGxiKM0cWylj6ybCOWwUIxnJhkfhQAmfNPZtEAzEKHpy5p24LX4
 WZYEkjl+2JBiMQzs6cLqo935wnZaVr4+fUPM4n3zSbp64Hu2GFmz0ioRGIw0EAzwqu
 jtIhAzoI831Dys28YcBeI4hgg+hibZbMSbk9pf7QStjt9CgKOc42rq3U8fZHA+AwSk
 eieegJHCW9r3q/V/cQaP8PdCU3l0sQejC8z1zIhvePs50VOkN7YUYoGXQ8k2O1DPWN
 3AWS8IbcBt81w==
Date: Thu, 31 Mar 2022 13:12:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v5 2/4] update tas27xx.h to support either TAS2764 or
 TAS2780
Message-ID: <YkWaw7sZta8ueHIJ@sirena.org.uk>
References: <20220330144526.498-1-13691752556@139.com>
 <20220330144526.498-2-13691752556@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="na97ERIPV+fxMmWC"
Content-Disposition: inline
In-Reply-To: <20220330144526.498-2-13691752556@139.com>
X-Cookie: Reunite Gondwondaland!
Cc: navada@ti.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 raphael-xu@ti.com
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


--na97ERIPV+fxMmWC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 30, 2022 at 10:45:24PM +0800, Raphael-Xu wrote:

>  /* Book Control Register */
> -#define TAS2764_BOOKCTL_PAGE	0
> -#define TAS2764_BOOKCTL_REG	127
> -#define TAS2764_REG(page, reg)	((page * 128) + reg)
> +#define TAS27XX_BOOKCTL_PAGE	0
> +#define TAS27XX_BOOKCTL_REG	127
> +#define TAS27XX_REG(page, reg)	((page * 128) + reg)

You should ensure that each patch is individually buildable - this helps
people who want to do things like bisecting for problems.  This means
that you shouldn't go file by file but instead logical change by logical
change.  I think all you need to do here is just make patches 2 and 3
into a single patch.

Otherwise this looks basically good, please update for the above and
also the small issues that Amadeusz pointed out.

--na97ERIPV+fxMmWC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJFmsMACgkQJNaLcl1U
h9DpSgf+K/CAnjYinDnTKQWdJDMIfNDK3cY02NhTKuIMTKlGYKsi13UjpIJglgc1
3dIes9bNa0R4l9ABxJ2IZ7U2oxY2QzdfOXqfexLhkuJvM3amzuu5xaEbIrOuh1Y4
HTLKoeTcn9OLpNWYrarWCn4Rhr38rntnmSqBG5jY+zGaCpmklBn0XIHZDV0cqHKC
xRlBlCnpqCeK93VcG4z86K70ZeZL2bXmmVsbMtPggTCSheVY4Ao6GEo0W5QznHh/
vJOMc9JE5artC0oRP+e0kNbBWUXzg5x9kirmsgW9SJ3L5vTFDU1Pg7jbyu5vp5+p
1Gkl/dSiJ097DMx1Bv0AEChsX+APWw==
=b9Hx
-----END PGP SIGNATURE-----

--na97ERIPV+fxMmWC--
