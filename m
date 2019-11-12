Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4A2F9748
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 18:36:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26D5C886;
	Tue, 12 Nov 2019 18:35:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26D5C886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573580161;
	bh=aYka5dobQ9Oud8Y4e1k56GMjEFBwEKIsE//9zfuZeHg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nZWG/MQFvasLnaL9MBHz9gDGjCN1PNAdqLjj4ttcZSaBOr3TxIMIZ/hcawYIAJlgT
	 f1y72qn0U7GFQJErd2CPGsXKMiF0yE3GoApEPVr60Z9aR9M5pIeSMLCbV+AiOIIe6D
	 Zrj6TNarIEYwass243WTMEekUzYlyxZ/CBrUY1Ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82F58F8049A;
	Tue, 12 Nov 2019 18:34:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBA5DF80483; Tue, 12 Nov 2019 18:34:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5DE0F802E0
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 18:34:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5DE0F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="gWj6gCs2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=04vAy7mLQ2lEwpnO2BErnDX5znyn19+arzcSdIbWoBo=; b=gWj6gCs2y/sbPH64gK83cyF+j
 twPmn0uewUHATjtmGGGuxW/S1EDcyzS6a0C7bLngl7BobdmS6PU4zn4/sNrmFiHgzNGRiN2UDD01T
 0VluTqPtaKXO1y1RkufxgzB13IyczE8CX3gxWeAhQGK02cqDMUTDlIfEdSpRY9H66Dvnc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUa3O-0008Ly-Cm; Tue, 12 Nov 2019 17:34:10 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 98232274299F; Tue, 12 Nov 2019 17:34:09 +0000 (GMT)
Date: Tue, 12 Nov 2019 17:34:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Eason Yen <eason.yen@mediatek.com>
Message-ID: <20191112173409.GI5195@sirena.co.uk>
References: <1573532538-30602-1-git-send-email-eason.yen@mediatek.com>
 <1573532538-30602-2-git-send-email-eason.yen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1573532538-30602-2-git-send-email-eason.yen@mediatek.com>
X-Cookie: As famous as the unknown soldier.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 chipeng.chang@mediatek.com
Subject: Re: [alsa-devel] [PATCH] ASoC: mediatek: common: refine
	mtk_afe_fe_hw_params
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
Content-Type: multipart/mixed; boundary="===============8077701948550078566=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8077701948550078566==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Encpt1P6Mxii2VuT"
Content-Disposition: inline


--Encpt1P6Mxii2VuT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 12, 2019 at 12:22:18PM +0800, Eason Yen wrote:

> 1. Add the following function to refine mtk_afe_fe_hw_params
> - mtk_memif_set_enable
> - mtk_memif_set_disable
> - mtk_memif_set_addr
> - mtk_memif_set_channel
> - mtk_memif_set_rate
> - mtk_memif_set_rate_substream
> - mtk_memif_set_format
> - mtk_memif_set_pbuf_size
> 2. extend mtk_base_memif_data struct for new platform(mt6779)

It'd be better to split these two into separate patches, they're two
separate things.  Ideally the refactoring should just be simple code
motion.  Right now the patch is a bit difficult to follow.

>  static int mtk_regmap_update_bits(struct regmap *map, int reg,
> -			   unsigned int mask,
> -			   unsigned int val, int shift)
> +				  unsigned int mask,
> +				  unsigned int val, int shift)
>  {
>  	if (reg < 0 || WARN_ON_ONCE(shift < 0))
>  		return 0;

This is an unrelated indentation change?

> +	dev_info(afe->dev, "%s(), %s, ch %d, rate %d, fmt %d, dma_addr %pad, dma_area %p, dma_bytes 0x%zx\n",
> +		 __func__, memif->data->name,
> +		 channels, rate, format,
> +		 &substream->runtime->dma_addr,
> +		 substream->runtime->dma_area,
> +		 substream->runtime->dma_bytes);

This is going to get noisy, dev_dbg at most please.

--Encpt1P6Mxii2VuT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3K7RAACgkQJNaLcl1U
h9BVOgf/RJ9QQbtlE/1cjYex/YS7artXYBg7EcJLvABZQcJLc1IH6iK2Ov8CQRNe
ozdn/rmpProjd28/8Pc3Dc8fU9rY7CzshEAPX7sT8QplUOmHyWD+aoJs7Hw7ACCJ
QrNZ3be5yh6Xng2LzZM9N+Hr5yJyjnELcFvwj7r4EijioTLPTaR1cce3LoNjBmyV
428s26enFSmBs/vXkHYxYyhMapI6e5+knDEXJ6gNDuaM1Vz1y+EuuvLRCMVOsYo7
iQF9/Y5Ka700ptA4XDAJSNwreI3r9CVnfKtmmOFrC6iQl3E0BJMeJfbS48/TA08D
y4mnwJ0np18D3+h73Nrnby7juf03pQ==
=6ikF
-----END PGP SIGNATURE-----

--Encpt1P6Mxii2VuT--

--===============8077701948550078566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8077701948550078566==--
