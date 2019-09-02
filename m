Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE4BA567B
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 14:43:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2052A16BF;
	Mon,  2 Sep 2019 14:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2052A16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567428227;
	bh=sTfrWk2BlMB/MIvvkurmyAC4vJtwXYxl9VbKg0+sgs8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vsl1BR7HUC6HM1vs0Nzqtj0vFQuPB/HIMnaK7yMjKF/kg/emPaJTRiG8wi2BKLolk
	 aLVitiGuUn0Zym4ML4lS/ZAnq5rManrOQAztaBqyrtXCS9brH/elWA3TQgtv6sHecT
	 c7kx/OSyn3VUI2n+zFMtfWv1HQM14QfIKTeqF9W4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE68FF803D6;
	Mon,  2 Sep 2019 14:42:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D340F803D0; Mon,  2 Sep 2019 14:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BCB6F80392
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 14:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BCB6F80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="q8ijxkng"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4kBJEx+Qu3mSPv+hNIjzoykytvR4h7p7UM0vTM6s1vA=; b=q8ijxkngdjzFHlHeGzQ+04Tbg
 S6qaZsvAE7t3yLIEKlaNgveLU8PEQG2luelC4qffbo8hYlHlt1e6e3nWdmNOq/bgn4pReBd87Yb+d
 TWBi2CoUsD2MmTmBG1rq+jWZbVkwekhCsmOh7OjmPp+5rvj2fNylXm1etnnxXI3aSpWq4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i4lcX-0003GM-F8; Mon, 02 Sep 2019 12:39:45 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B6FAE2742CCB; Mon,  2 Sep 2019 13:39:44 +0100 (BST)
Date: Mon, 2 Sep 2019 13:39:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190902123944.GB5819@sirena.co.uk>
References: <20190830225514.5283-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20190830225514.5283-1-daniel.baluta@nxp.com>
X-Cookie: Lost ticket pays maximum rate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 shengjiu.wang@nxp.com, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 NXP Linux Team <linux-imx@nxp.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>, gabrielcsmo@gmail.com,
 festevam@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: Set SAI Channel Mode to
	Output Mode
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
Content-Type: multipart/mixed; boundary="===============3248590286877877555=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3248590286877877555==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 31, 2019 at 01:55:14AM +0300, Daniel Baluta wrote:

> Fix this by setting CHMOD to Output Mode so that pins will output zero
> when slots are masked or channels are disabled.

This patch seems to do this unconditionally.  This is fine for
configurations where the SoC is the only thing driving the bus but will
mean that for TDM configurations where something else also drives some
of the slots we'll end up with both devices driving simultaneously.  The
safest thing would be to set this only if TDM isn't configured.

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1tDY8ACgkQJNaLcl1U
h9B6eQf/fWHBjGPAP86B03a4INm+HF3NUTJW3RUX7OufxZ6nXwI99zy/47e5hK4r
RrYrDlh5Ybe5Dl6gK1/4VrO/SFMg6PyOJjpjwAijXRjW3y3CqiZe5e9bhLVoIcrM
zAERB9q0o82bPAsKxlCqkG69MKZrHnDPH7pBAXM2kPRyn6QXQwWV8qqE2Rpfkto2
ZprQEwsRlwatAPn4WfHBN7OsZy3BeVZqhT2VLD9GkF0zBdBhZEvO4opbj7cbQHdc
Jdrw3AFvgUYHsjsNx+x1uVVy7DY1r/V2yh8ly8+WMn204eYDR8aKnm5oO0OpoN6o
ibcFAnroXympSUaJvtWjiAzS0QBTBQ==
=Wb+0
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--

--===============3248590286877877555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3248590286877877555==--
