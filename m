Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED731D955A
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:34:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03E901742;
	Tue, 19 May 2020 13:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03E901742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589888066;
	bh=hDsRzG+xjeyEaEIrg8oKI1FIBDia0IYq1STBGQcpyPo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GEzjFnhStgpwuUcZMq5nJ5WLh+drRRnXuHu0mbgkm5yF3m6pEwquC/oaWd29u3SPW
	 KnIvS4VcVgpLEP7u4/wHs/eiPx2eDP6AFfGWaLiOP9MhwhJ7XA5RpRGwp0agn7XiqW
	 /c/LnzNzzr/63Ew1CoYSEbgiAi9BJRMIg8DCVD2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19414F801F8;
	Tue, 19 May 2020 13:32:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5836EF801A3; Tue, 19 May 2020 13:32:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5254F800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5254F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yYswN9rB"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6354D20708;
 Tue, 19 May 2020 11:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589887955;
 bh=hDsRzG+xjeyEaEIrg8oKI1FIBDia0IYq1STBGQcpyPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yYswN9rBglveoTWIMxw/GgBRSdce/QP3O/TrEWyAdNvHnSHGyHx6ZYH1fSuo4sV/+
 az/p36C9XjlTTnLRiXXwBnacnGPwVaAnYksoB4GruCi/bbOvtX+Eeo5xiT0AE8Jwq2
 J9m9q4tRv0bH59VaURwBYZwRQKmtnDS3mjD2Zz10=
Date: Tue, 19 May 2020 12:32:33 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH v3 05/14] ASoC: amd: add ACP3x PDM platform driver
Message-ID: <20200519113233.GE4611@sirena.org.uk>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
 <20200518171704.24999-6-Vijendar.Mukunda@amd.com>
 <20200519105434.GC4611@sirena.org.uk>
 <DM6PR12MB26335F2ABFBE88629334FD9A97B90@DM6PR12MB2633.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="maH1Gajj2nflutpK"
Content-Disposition: inline
In-Reply-To: <DM6PR12MB26335F2ABFBE88629334FD9A97B90@DM6PR12MB2633.namprd12.prod.outlook.com>
X-Cookie: Do not write below this line.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "tiwai@suse.de" <tiwai@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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


--maH1Gajj2nflutpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2020 at 11:10:00AM +0000, Mukunda, Vijendar wrote:

> > > +static int acp_pdm_audio_remove(struct platform_device *pdev)
> > > +{
> > > +	return 0;
> > > +}

> > This is empty so can be removed.

> It gets filled in future patch.
> Below is the patch reference.
> [PATCH v3 10/14] ASoC: amd: add ACP PDM DMA driver pm ops

It would be better to add the function when you add something to it
rather than doing this.

--maH1Gajj2nflutpK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Dw9AACgkQJNaLcl1U
h9Df+Qf+Mpqa+Aqa+/iaAiS/tUuL4WN+KWfhs4ioKx1H/sI2PHmYRL2NEq1A6IsK
fsjeiVpOTfOUd/jYPh4+JC6DwBIND5HU+VJqCks2Pp2Ioa+egiIQZ3lA21Y7QYW5
j+5smxGficxkLzbZy/qkG9qS7gqDuuPkdN9fUIN4IQAIoYhHSD0f9NqIC7xvFZQp
LEZY5Z6YijIb6CXqyuDDFLaEScQneq+hs6YTPD93f1eLUFyuslhcsJuOqisT1Yxq
axNSioToTl/6NgsJ9JtBhs3oUdpUeoidIgckiCfR3R7NfUuqWPEK6sGc6I9hebvN
i6jHBV9xJrxymFGunpQwyJU61m2V2g==
=X0C2
-----END PGP SIGNATURE-----

--maH1Gajj2nflutpK--
