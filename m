Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2760622940B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 10:52:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8374C1615;
	Wed, 22 Jul 2020 10:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8374C1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595407939;
	bh=KBex7YObWFkv3ZED+tckY/19Y0OC0cIjEMo2Ccpv9Bg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CkhCpyrUXIjO8FQJuGSKpKMPM8IwAsZyS8879wfElPkFYTgQxstXwV+gWh6R7FwEV
	 FLOZtB4OG7FnD9eOQUVPaaT5c2XBpyhjbzfUIdQFFxAQodsnkXQc7wPvZXO4tPM3Tz
	 Xc2lT5ZKNm145CxTd2imGQzuI+rb04liHZYmckqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD59FF80150;
	Wed, 22 Jul 2020 10:50:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 371A2F8014C; Wed, 22 Jul 2020 10:50:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61536F80087
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 10:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61536F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iJzPYASL"
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6785D2065E;
 Wed, 22 Jul 2020 08:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595407823;
 bh=KBex7YObWFkv3ZED+tckY/19Y0OC0cIjEMo2Ccpv9Bg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iJzPYASLrtpyTXcRKDvZ/DG2+ITva/hZLilKwxh9W9WVvDgyr+Jf7zCm98iQodmP0
 wXVnB3cdXiMmbV1Db++NNRZ35/pzumvSy/HpvIrhnm2t9ibHKi+f3AnTAYeoWSJnFY
 yAsS1ll5wCriS7wGUkQlq5BljvfR5NCn3mALKCKs=
Date: Wed, 22 Jul 2020 10:50:20 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 00/20] Add support for SATA/PCIe/USB2[3]/VIN/CSI on
 R8A774E1
Message-ID: <20200722085020.GD1030@ninjato>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Content-Disposition: inline
In-Reply-To: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-i2c@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Niklas <niklas.soderlund@ragnatech.se>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org
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


--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This patch series adds support for the following peripherals on RZ/G2H SoC
>  * PCIe
>  * SATA
>  * USB2
>  * USB3
>  * Audio
>  * VIN
>  * CSI

Nice. But please update your recipients list. No need to have the i2c
mailing list in there.


--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8X/cwACgkQFA3kzBSg
KbbCjg/9EwkGut+pjFLsSqqQcdsIzTD9kym4OTeB/bHTnHu+yCKyYJ0Sa6ytd/+O
J9JLAahz7QkGnfOSFkz17HGK29XcNocub/8bIAuUBuydV8yQrleXLt/3oOKWOWrt
FC9p8gGr1q0/DLKeCOeIG1ftIaOe22L6bJsuxCzhJG8DetJY0If4fZ+nZc08r6Af
qMClhrnXZDqG7mYhLiWkeeKoiootXREJ8b2NozWKGLkQF0zMpSzQ0H+IwNrj6ElB
OCZHdbRrRLc1oIHmNWosZiFrH20DmVdjRUaZhvP1sBiw7/CdjZAf10OedOF8fv48
PGMhu3HM2FsqzPncnYAiNtTJrwESnDDROinJW8D+mAjFToABbnr1Nhc5iC38elIl
HTsJgC03NEZfZ1k6rvr1t/cYGcHePKzXod1ftEvvmT9093mGLlArZhMmKDFcXiDU
4g01TTz4SetHaOqdzZlPdxu5cJ1YGyMcOQQgBAC1C2vOLGg2Fsqs8VBI/ud/VAG2
XYAILg0D7wbFUd1fMYkG1W4x9HNdVlNXd4cCZWr4Geqc51B/9CQyJPhPJfCMK8py
KNcd8JmzsXN1oXW9E7K1VjHiMCb9TsBswsXXz8nnsfUuE09CpVQGfFqtmS+2nMjV
4VyHziCHbgqRqmlFlzwkGp7gcBcxBywyBwhRobKdGCTwFF+J7VE=
=oXte
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--
