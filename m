Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B34E7E47F3
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 11:57:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40CEC17A6;
	Fri, 25 Oct 2019 11:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40CEC17A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571997450;
	bh=2dJkPghqfZ+UjfnKdv6J3eQbY/2CXacBK0T4wiYiNHM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dEZhI8O8ko+a5VevwpZGoXhCuDNwfApB/3WOzA+x0sIEWae6dlwGRq4eW9lK9AYY6
	 FZSPO1RirlvzfRrfywP3qI/0pTCeGS3pNwF552h30rw2jOXFLx5hesRT4f/zQtkz3P
	 oFQU/QB1U4ZXLRWG1CFI8ugX/Y/qq6C9+wUEdVa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0859CF802A0;
	Fri, 25 Oct 2019 11:55:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DDDEF8036F; Fri, 25 Oct 2019 11:55:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC6B4F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 11:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC6B4F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="slcb1nAz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Q43EHgrQ37XLYLMbydJx8zVprEj7FoK+fTwNtZOM/Y=; b=slcb1nAzCdIMLaTfciUUpmtL3
 UtW/UtgdkrOEMOD4V8k5X59TpPHtK83Z9BbIavVhsYLtLLNTcH1kOv93zoz4b6zFeIuKCOs21zbm3
 N0PWYo7RE9p5HvAXdtViv1AWSPufgvAdvxSuvIdly5H/8g7yaFPcxEET2W/DMCeS3qhJw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNwJm-0006bs-G2; Fri, 25 Oct 2019 09:55:38 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 73CAA274326E; Fri, 25 Oct 2019 10:55:37 +0100 (BST)
Date: Fri, 25 Oct 2019 10:55:37 +0100
From: Mark Brown <broonie@kernel.org>
To: vishnu <vravulap@amd.com>
Message-ID: <20191025095537.GB4209@sirena.co.uk>
References: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1571432760-3008-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191024114015.GG5207@sirena.co.uk>
 <3aed0c75-80e7-cc9d-59f9-6ef29b665efc@amd.com>
MIME-Version: 1.0
In-Reply-To: <3aed0c75-80e7-cc9d-59f9-6ef29b665efc@amd.com>
X-Cookie: Power is poison.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mehta,
 Sanju" <Sanju.Mehta@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>, "RAVULAPATI,
 VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH 3/7] ASoC: amd: Enabling I2S instance in
	DMA and DAI
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
Content-Type: multipart/mixed; boundary="===============1066329429595129008=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1066329429595129008==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 06:53:16AM +0000, vishnu wrote:
> On 24/10/19 5:10 PM, Mark Brown wrote:
> > On Sat, Oct 19, 2019 at 02:35:41AM +0530, Ravulapati Vishnu vardhan rao=
 wrote:

> >> +		case I2S_BT_INSTANCE:
> >> +			val =3D rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
> >> +			val =3D val | (rtd->xfer_resolution  << 3);
> >> +			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
> >> +		break;

> > For some reason the break; isn't indented with the rest of the block.
> > I'm fairly sure I've mentioned this before...

> Sorry for this but I am not able to find indentation.I have tested with=
=20
> scripts/checkpatch.pl. It shows no warnings.

The break should be aligned with the rest of the block like I said, an
extra tab in - you can see lots of examples of break statements in the
kernel.

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2yxpgACgkQJNaLcl1U
h9D2EAf/WSOT4sEicM8hxRm4Afv0zc8QzmWWpk3kpMbsbHCyqGcZi3zLh98kr8lD
u47RPeWzylVb9VRl9y+sPxFSijyTtzN/QAbhGjEkK4hqE+q6mqsawKdKljlMdFUR
tx8E1yWONkYobWTs94EYAwP2gg6fsQs6qaUTqQWaZB2E5yvxjFsJWNoIpICxVYOR
oGFZzwW/ly8/taJtA5Q5310KIsLxmnl+HcJXQmZpRnZj3pdSUTKj3z9ukwgy9I9U
v1yBS4ghFDjZod4vkFjPEJZpScJLabIrgXFgGI/PCHvy7fkvB8Wz9IabAyfWMmVr
3kT2BFuIxxgXp2xDYxHDxFeahLzuMg==
=fpuJ
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--

--===============1066329429595129008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1066329429595129008==--
