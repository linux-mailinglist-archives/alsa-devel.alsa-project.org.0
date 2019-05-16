Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF2220D7E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 18:55:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0667B1699;
	Thu, 16 May 2019 18:54:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0667B1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558025744;
	bh=kyovgP2nH7ltT5DF9WsilsgXvhuIQe9e6SxGRxxKNXg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IC0FMXK44pJqcTFHeu/FKYU9xSgxI5zE46nmWsVUFzDkcr2YaKOJZ7xd3sIK6/t7u
	 8AdDb6tcMfTP2FeOsWhOqRfmhm9gbxyiMzJtQ+s4DLplIUZvekdY72pdJC1QYi12rJ
	 jEBAD9lrwyR3ZRsSlah+oNpg0mwThThn8ckStJsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98876F896E0;
	Thu, 16 May 2019 18:54:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E561F896CB; Thu, 16 May 2019 18:54:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D57A2F8078F
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 18:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D57A2F8078F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="XYnUP/h6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VkFNzLKE4kl1CvHrPz9yn/s6HJV6YwA2NLY66fTp9J0=; b=XYnUP/h6DYKuIcn7ZZt2d5KzI
 neFlnwfwa5xbxp+HzV4XNTtcA+UAql1Vbdc4nSWn+SQoQtBAM+mbcvHg+XKyMHz9e3OevtFIIwqci
 CfWTrJQTSY1ZCTqbsUyxrytgMd9xgLdlri4ZpY+kvFssCwZ/IrTgMNjG8N5jnLe+DMWaI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hRJdw-00076A-7k; Thu, 16 May 2019 16:54:08 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id BEF01112929C; Thu, 16 May 2019 17:54:07 +0100 (BST)
Date: Thu, 16 May 2019 17:54:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20190516165407.GJ5598@sirena.org.uk>
References: <1558011640-7864-1-git-send-email-viorel.suman@nxp.com>
 <CAOMZO5C1jm=7tiui221B-N+ptEknK_ZdHvrjvSHfvQ=W-K54Qw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMZO5C1jm=7tiui221B-N+ptEknK_ZdHvrjvSHfvQ=W-K54Qw@mail.gmail.com>
X-Cookie: <ahzz_> i figured 17G oughta be enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Viorel Suman <viorel.suman@gmail.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, Colin Ian King <colin.king@canonical.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: AK4458: add regulator for ak4458
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
Content-Type: multipart/mixed; boundary="===============2702292951225159513=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2702292951225159513==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SLfjTIIQuAzj8yil"
Content-Disposition: inline


--SLfjTIIQuAzj8yil
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2019 at 10:14:42AM -0300, Fabio Estevam wrote:

> > +       ret = devm_regulator_bulk_get(ak4458->dev, ARRAY_SIZE(ak4458->supplies),
> > +                                     ak4458->supplies);
> > +       if (ret != 0) {
> > +               dev_err(ak4458->dev, "Failed to request supplies: %d\n", ret);
> > +               return ret;

> This would break existing users that do not pass the regulators in device tree.

It won't, if you're using regulator_get() and there's just no regulator
in the DT the regulator framework just assumes that there is actually a
regulator there which isn't described in the DT and substitutes in a
dummy regulator for you.

--SLfjTIIQuAzj8yil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzdla8ACgkQJNaLcl1U
h9APjQf+Lv8THYJ4esni1vNmG69HpD0BrrnTj4bJszGYZmzU+NUA1KpHwSgphVPx
dNEm9YVRL58Ap8OQ6R46L0vKKwjv7O2PQHVAVpuH94fJEkdnlRLYppoEof9hODaa
sIVb/mjegYSgclH+zisPqB4DrB9TFX55fkDl7I4JI+6IBuCCX6pGAmDC83VmgPhv
CBgNmyBfE6Iim+g1AKFLo6UJK8Ygn1KKRAfEmNVdN4Q+Zo2GcynfnznEHiUR3gCc
1iw2fGSjM4xOm42TezfFo+AZKBrCElE8jWQfInD3dQtbhJUtVljxIjOe1/ywebWi
qW8LBq1eK2SLwtpuk9lL4BDPZpj4LA==
=79lT
-----END PGP SIGNATURE-----

--SLfjTIIQuAzj8yil--

--===============2702292951225159513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2702292951225159513==--
