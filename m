Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDB51CF492
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 14:39:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E1861695;
	Tue, 12 May 2020 14:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E1861695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589287195;
	bh=uDlo9Exmm/b6xQKP3G5CHPi7Uy1tLbtDYkh/Nhxo4Qg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tCSd/aBsZEKAbJO4Ade031J8Kq1oiiwvT5Xx/qX3sN5I0UQidrszRIeqJH07OVQ7o
	 kDRzR56jrbe1mPDG4wnQGsBeGPA+sI9WlwzL12JnkIhHfSrtNbj/Fkb56L9W+6BWfT
	 LccmLHNZJ/Jtf9WCjHBAwbZdNu+SiN0/wPvl0MAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4D98F80158;
	Tue, 12 May 2020 14:38:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C24AF8014C; Tue, 12 May 2020 14:38:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1C43F800E3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 14:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1C43F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B2thKUjM"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A3F78206DD;
 Tue, 12 May 2020 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589287085;
 bh=uDlo9Exmm/b6xQKP3G5CHPi7Uy1tLbtDYkh/Nhxo4Qg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B2thKUjM4ZPlMFVHhrRTOjlAH+a9pqbcg6ruG6LJ9xJo2/xDmqEWdgQPysdu5T/S5
 5j+UiuF2ruXWMcM/esh0PG8xkSDzqz5nhYgaz3Jfl3MzDCzO+nX+Loo6ZJf+kd+gUM
 pbPga4aOzFmFVxGdhMXY+7uiywOg5b0wYCR2SQZI=
Date: Tue, 12 May 2020 13:38:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_esai: Add support for imx8qm
Message-ID: <20200512123801.GG5110@sirena.org.uk>
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
 <a933bafd2d6a60a69f840d9d4b613337efcf2816.1588320656.git.shengjiu.wang@nxp.com>
 <20200501102158.GA5276@sirena.org.uk>
 <CAA+D8ANDHHejFD1rYmFOG24yivpEJa+xO-WpVr=Vzfz9yW9H7g@mail.gmail.com>
 <CAA+D8ANK+Sd=nPeDZpd_=fQRFOdLtKgvsCmfQ_fRU3RCjMY+rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qoTlaiD+Y2fIM3Ll"
Content-Disposition: inline
In-Reply-To: <CAA+D8ANK+Sd=nPeDZpd_=fQRFOdLtKgvsCmfQ_fRU3RCjMY+rQ@mail.gmail.com>
X-Cookie: The only perfect science is hind-sight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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


--qoTlaiD+Y2fIM3Ll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2020 at 10:48:41AM +0800, Shengjiu Wang wrote:
> On Wed, May 6, 2020 at 10:33 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> > On Fri, May 1, 2020 at 6:23 PM Mark Brown <broonie@kernel.org> wrote:

> > > > EDMA requires the period size to be multiple of maxburst. Otherwise
> > > > the remaining bytes are not transferred and thus noise is produced.

> > > If this constraint comes from the DMA controller then normally you'd
> > > expect the DMA controller integration to be enforcing this - is there no
> > > information in the DMA API that lets us know that this constraint is
> > > there?

> > No, I can't find one API for this.
> > Do you have a recommendation?

> could you please recommend which DMA API can I use?

Not off-hand, you'd probably need to extend the API to export the
information.

--qoTlaiD+Y2fIM3Ll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl66mKkACgkQJNaLcl1U
h9D3bwf+L1SDbZMmf3kj5H/WHV+WYYcxZvjpF2rx3puuQVDabgoA6GJxeqw/Y+E1
5yyW83wYPDD8fGV58m6XOxoLG3dkr5XC1+TFhPz5R1GuBOnLZ46HiG5C05SbEzZm
LAMKfH73aIsLtKrRk54PhzI2A2NBfO19TVVxWw4qP00k/xe2AuNQXOBNFq8vW+6a
UfgCJuvJFyizBVuid1eYBz4QTgKf/xbrQEfQAPWI72jFFgs8vzHCbPICl62acbOy
ibciDr6vghSxDewz9DyynJ0Q0SminczxTQ8e4xACqE6yz10Jh6WU07ihBjJndIlR
/ttLTH02Vy9Ail0rfr1jNuHIRa9U7w==
=SUbH
-----END PGP SIGNATURE-----

--qoTlaiD+Y2fIM3Ll--
