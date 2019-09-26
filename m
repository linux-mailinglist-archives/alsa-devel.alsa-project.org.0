Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4D1BF90A
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 20:17:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E235F1755;
	Thu, 26 Sep 2019 20:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E235F1755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569521868;
	bh=CuA8I/a+FZiku+73H6eE/6NOwSNKRuJwRd2eOaARSik=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TH87lSPGzYcKk7p9gITIMhVvf6h9Rr5OU99FRqdtmYX7fGG5/n/cStfkq4thRGJWK
	 8wsy6MZF1EVU4yO4nV8a3tVt493Up57ynqIRm3seEFybmmvXXc4Ccy7Ce+rqO03d6Y
	 +Tf6rzND3YyUekTl4xX6Vo2cnJcryN7VQlJ4iiRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8A5CF8045F;
	Thu, 26 Sep 2019 20:16:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03E3CF803F4; Thu, 26 Sep 2019 20:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC898F80138
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 20:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC898F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LCzUDgZI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mn8IPYK5fTq/nd7bMLIu9R0D58yWiLZOfaLo4U/dC2k=; b=LCzUDgZIId8seDiOSjLAOjdUO
 Zka4JJZRaFdcdEA1XhJjFpSJeg8i8XRjmTYew9A5h5wsEuxK2l+se/3fuiu9lOigRx0Y2ktXUWP2G
 QBABWxwcoAsnDyxaJ+lOwPrdkC+Zu2snNnSUHkiXIpcKr/0W7wKWTk3SY802MioAB3Grw=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iDYIm-0004PZ-4W; Thu, 26 Sep 2019 18:15:40 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 86B0BD02DD8; Thu, 26 Sep 2019 19:15:38 +0100 (BST)
Date: Thu, 26 Sep 2019 11:15:38 -0700
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20190926181538.GC2036@sirena.org.uk>
References: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1569539290-756-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
In-Reply-To: <1569539290-756-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <vijendar.mukunda@amd.com>, Alexander.Deucher@amd.com
Subject: Re: [alsa-devel] [PATCH 3/5] ASoC: amd: Enabling two I2S instances
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
Content-Type: multipart/mixed; boundary="===============7976473523376236020=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7976473523376236020==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8H5+QmNTcR9iGQhm"
Content-Disposition: inline


--8H5+QmNTcR9iGQhm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 04:37:37AM +0530, Ravulapati Vishnu vardhan rao wro=
te:
> RAVEN has multiple I2S instances:BT and SP.But only BT is enabled.
> Now I2S SP instance also gets enabled with this patch.

This is extremely difficult to review as is, the patch is very
large and the description very brief so it's hard to tell exactly
what issues there are that must be fixed to enable multiple I2S
interfaces.  My suggestion would be that this should be split
into a number of smaller patches, each making one logical change
with a clear description of what that specific change is.

A few specific comments below but really I didn't get very far
into the code due to the difficulty figuring out what's going on:

> @@ -46,10 +28,10 @@ static int acp3x_i2s_set_fmt(struct snd_soc_dai *cpu_=
dai, unsigned int fmt)
> =20
>  	case SND_SOC_DAIFMT_I2S:
>  		adata->tdm_mode =3D false;
> -		break;
> +	break;
>  	case SND_SOC_DAIFMT_DSP_A:
> -			adata->tdm_mode =3D true;
> -			break;
> +		adata->tdm_mode =3D true;
> +	break;
>  	default:
>  		return -EINVAL;
>  	}

For example this is a pure formatting change (one that moves
things away from the normal Linux coding style) and clearly not
related to the changelog.

> @@ -87,9 +69,16 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *=
cpu_dai, u32 tx_mask,
>  	val =3D rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
>  	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_IRER);
> =20
> +	val =3D rv_readl(adata->acp3x_base + mmACP_I2STDM_ITER);
> +	rv_writel((val | 0x2), adata->acp3x_base + mmACP_I2STDM_ITER);
> +	val =3D rv_readl(adata->acp3x_base + mmACP_I2STDM_IRER);
> +	rv_writel((val | 0x2), adata->acp3x_base + mmACP_I2STDM_IRER);
> +
>  	val =3D (FRM_LEN | (slots << 15) | (slot_len << 18));
>  	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_TXFRMT);
>  	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_RXFRMT);
> +	rv_writel(val, adata->acp3x_base + mmACP_I2STDM_TXFRMT);
> +	rv_writel(val, adata->acp3x_base + mmACP_I2STDM_RXFRMT);
> =20
>  	adata->tdm_fmt =3D val;
>  	return 0;

Won't this configure all the interfaces identically?

--8H5+QmNTcR9iGQhm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2NAEkACgkQJNaLcl1U
h9A/nQf/aCxpiLEUD1Kxl47cIVbozOcJU4QYNdUFGgPrUnoYCKI013RSszByaTzt
50c9wKCPY+rsQwVa0Vn9v7LiCDiq50OuEcmknCIFhKqtersy52YJLJB7pu9XNkTD
rfTJiMEIEgaFaa90HAtACaBEvtw9y8K9jqdiOvffmNJUWeMassdjR8GHEJ63U6aJ
OHjcOF3U2jQ49F04lt7EEioY7UNso5Ru4WbYlF4WPvDnZjzzReW9zWiXL0dhitHy
Iw478TOWlDmWbbOcLkzJi8EIqhfshzKxBOmU3JX649T+XghFqhI0s+9ZwWgzSIMF
bw5dMN3uhrrF0ExH7SRRoZPg2T3arg==
=Y62R
-----END PGP SIGNATURE-----

--8H5+QmNTcR9iGQhm--

--===============7976473523376236020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7976473523376236020==--
