Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BEF1F3D4F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 15:52:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 868AA1614;
	Tue,  9 Jun 2020 15:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 868AA1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591710764;
	bh=QLyGqEIUvJCZktBQO3E8b5CNoUk6xAoFrKqLtbqNglk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TlBXPIG7pmrtmom7nCsDa/ZspIQtM6tIuT96TdW5tgKt7aOHIm5VWgYlwwDGi5WRd
	 qumBAkN0xv0bk0FYBZB/H88Acj3HQrFKetWVjGCAplh6iKblfHNRepa6c4b8zIkI33
	 ypuLeF3yoEz0U5R1u38a+HabY7bXwTiDMKMGlHMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAEE8F8028D;
	Tue,  9 Jun 2020 15:51:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD9B4F8028C; Tue,  9 Jun 2020 15:51:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66149F800F1
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 15:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66149F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SgBCgfOg"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B61520737;
 Tue,  9 Jun 2020 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591710656;
 bh=QLyGqEIUvJCZktBQO3E8b5CNoUk6xAoFrKqLtbqNglk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SgBCgfOg8D/M+dvQX5QNjeGmhKzkxrdjcDxhSSrj0Rjwea5+jRa4nCpF/cyiqPoFp
 SAG3+xF9PTbYhGHopwujbytcte2t2dYZlU11C8YOxHGzo8SoD8XYgQpP8f6MithbKO
 jUoT+p6ERnegqu65UE27VuvmLeA6tjTpMvi78y2s=
Date: Tue, 9 Jun 2020 14:50:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH] ASoC: fsl_asrc_dma: Fix warning "Cannot create DMA
 dma:tx symlink"
Message-ID: <20200609135054.GJ4583@sirena.org.uk>
References: <83e1682e88baf127d25e3470011bd034cfc32032.1591598561.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ELVYuRnMxQ5nnKRy"
Content-Disposition: inline
In-Reply-To: <83e1682e88baf127d25e3470011bd034cfc32032.1591598561.git.shengjiu.wang@nxp.com>
X-Cookie: Be careful!  Is it classified?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, lgirdwood@gmail.com, tiwai@suse.com,
 nicoleotsuka@gmail.com, festevam@gmail.com
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


--ELVYuRnMxQ5nnKRy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2020 at 03:07:00PM +0800, Shengjiu Wang wrote:
> The issue log is:
>=20
> [   48.021506] CPU: 0 PID: 664 Comm: aplay Not tainted 5.7.0-rc1-13120-g1=
2b434cbbea0 #343
> [   48.031063] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [   48.037638] [<c0110dd8>] (unwind_backtrace) from [<c010b8ec>] (show_st=
ack+0x10/0x14)
> [   48.045413] [<c010b8ec>] (show_stack) from [<c0557fc0>] (dump_stack+0x=
e4/0x118)

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

> ---
>  include/sound/dmaengine_pcm.h         | 11 ++++++
>  include/sound/soc.h                   |  2 ++
>  sound/soc/fsl/fsl_asrc_common.h       |  2 ++
>  sound/soc/fsl/fsl_asrc_dma.c          | 49 +++++++++++++++++++++------
>  sound/soc/soc-core.c                  |  3 +-
>  sound/soc/soc-generic-dmaengine-pcm.c | 12 -------
>  6 files changed, 55 insertions(+), 24 deletions(-)

Please split the core changes you are adding from the driver changes
that use them.

The change does look reasonable for the issue, it's not ideal but I'm
not sure it's avoidable with DPCM.

--ELVYuRnMxQ5nnKRy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7fk70ACgkQJNaLcl1U
h9BOngf/aLSe603sBhY25UjUBm5u7bXy02u1WBCRODt4C2xhzRdn/ONB0kSnJZWH
sMhms0bZYQD3+F08frWKdLRZzzfTqjTCJYIUnI53dNTGflHB3eVyLSOwhL4VgRwd
kwjHJACGkDrwncomu6q5hoFNIBnnnz0Ng8hs17CnUmelNFbGyz7oUzLRNYboJy/8
6S5lJ8xXcCVzQshXwALtw1ap0i42G+lagJpgnslaguun5p2/f700o422CQiteofT
Wn6GMhF125HPe/MpKSheTO234UQ3xuPlrE/ZHEiu0cDH5UFWnFeIBeRmkqfSpKsz
jdUXsC+t9AipuS2loQv/KSDyrZG4MQ==
=rIq/
-----END PGP SIGNATURE-----

--ELVYuRnMxQ5nnKRy--
