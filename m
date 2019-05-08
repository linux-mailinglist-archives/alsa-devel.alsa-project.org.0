Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE1E172BE
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 09:40:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DCBD1854;
	Wed,  8 May 2019 09:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DCBD1854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557301256;
	bh=F2FgN1nhTPwU/x7eK0V/zEkEzYtOIX5VQNh4R3m+YlU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R2FagUXO+kgfg2xhE9yMVw/+tAClC1+9tR7QGPQ1siGOwEhxtAbHD0iykHYL7dusp
	 AdXuIm4fyX5MZEx52eSzzDgvsAau1HA5LniexVZCEpS7jbtPYRroNINhG3yEsFaFiT
	 QFlYozIsh4U/yB/WT2l+VpZ0Dn8iTRHOWoq8QvVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BE87F896FF;
	Wed,  8 May 2019 09:39:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F26EF896F0; Wed,  8 May 2019 09:39:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A7B1F80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 09:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A7B1F80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NpG4UZkp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rcGh0WO6MG4XNO9hM5CGQV3g0vl7i85mz3ORoIw4Ecw=; b=NpG4UZkp/faf48Hj2lcxFSmBb
 1VQQ4hcEPKpq1YO/EAWwoHbjL8MjDWykM8GXEPRyBo+gIRxKGd+XP+CB3r3PkQW7Xe0SGCGwfQ9Ic
 yyPMxkT8RBXxV9/NPln7xhUPKYyDH+SGghSNQHeenV4ER8cdJQFF9+xQTauavSsbd+Qlk=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOHAL-0007LY-6i; Wed, 08 May 2019 07:39:05 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 2D558440036; Wed,  8 May 2019 08:00:58 +0100 (BST)
Date: Wed, 8 May 2019 16:00:58 +0900
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20190508070058.GQ14916@sirena.org.uk>
References: <20190506095815.24578-1-jbrunet@baylibre.com>
 <20190506095815.24578-3-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20190506095815.24578-3-jbrunet@baylibre.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 2/4] ASoC: hdmi-codec: remove reference
 to the current substream
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
Content-Type: multipart/mixed; boundary="===============0522040482450373952=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0522040482450373952==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YQa7rwQ/GRwZE7J4"
Content-Disposition: inline


--YQa7rwQ/GRwZE7J4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2019 at 11:58:13AM +0200, Jerome Brunet wrote:

> Remove current_substream pointer and replace the exclusive locking
> mechanism with a simple variable and some atomic operations.

The advantage of mutexes is that they are very simple and clear to
reason about.  It is therefore unclear that this conversion to use
atomic variables is an improvement, they're generally more complex=20
to reason about and fragile.

--YQa7rwQ/GRwZE7J4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSfqkACgkQJNaLcl1U
h9CNHgf8DPUPcHpJuCKPN3bSkYe+k+fejr2ZSHO7YjXjHpH77DkAB87qstFvZ3mO
Y99N2oT9nVhdO/Z0SvUx++6583NK1E9Kgymo4yLbsIYAR3z0lGLi494e8QzvCvov
IyVuT4Bsj0HT/l2j1778lIy6QT7zGMtk+Q87LwWb2AZvlxFNkfjKCg3MiilMA6tu
oFt6FJmazbFH+hhePFVsdaFVTEkn+lxJR7cquICuIHhxenGP3c0z6sTBR6Nn41aK
W4ug1it7JnLohbh9qgQkBlo83GWEWKEC9TgiaN2/ByWDBdADgvC6dE9IPVG2xBD0
jelL896tYbN4WASe9U9mW1CDwi2qhg==
=Cq88
-----END PGP SIGNATURE-----

--YQa7rwQ/GRwZE7J4--

--===============0522040482450373952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0522040482450373952==--
