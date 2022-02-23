Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8094C45C7
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:17:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 074851B50;
	Fri, 25 Feb 2022 14:16:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 074851B50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795062;
	bh=M0+mVIZ0Lc26AANZRRAz4t6SzyvF92PylFUdbqphFSM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XWtYnziw2tHxpWdglZf0E9YUYX7fWwVRW3CepW98T3AQA75+dTT4rWU+35GZRB+bc
	 axqPjCu/TL3+2zvyLX/bgF27BUM3nJauJrk/5Cc5EW7/3XXN2i1qUxDFqQOmlt379X
	 BKEnjDCs+AquTv89BB+fsCNp7rsIVZMIykvCYvZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 092B8F805B2;
	Fri, 25 Feb 2022 14:11:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 067A7F80237; Wed, 23 Feb 2022 21:05:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 982CDF80118
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 21:04:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 982CDF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="htHMZ4ej"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58B54617B1;
 Wed, 23 Feb 2022 20:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3349C340E7;
 Wed, 23 Feb 2022 20:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645646693;
 bh=M0+mVIZ0Lc26AANZRRAz4t6SzyvF92PylFUdbqphFSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=htHMZ4ejkmVw5UZH147OWWvzPaFhKffm1si8PWKoQ3tnFx1yOLEVU9zQwxK66D03d
 wplmLYlyIr1r52XdFqTtlesPjts/kWIf+iN1ATyktMdKEcaUJvlYonZ1V6H/8HPLI/
 jMTrjWGhifOrhupEC9mn93Sk6u/MBMyXLCtr0HLQ/nz2PeL0MlAZGOz+uRBQ2dNQP+
 1Ic12cGDQBffBc1oiHIM2JMAZUrS567iuIBAS786fIZ1Fhesjvllp4NBTINXzKcMxj
 GOt37pF22BkcR2HDO2jvs15Y7ID8CBJEsV/Q3gpu+i821dkJIfTeyhhFcFWSUe12Qd
 deVfLFRokXTYQ==
Date: Wed, 23 Feb 2022 20:04:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 07/11] spi: use helper for safer setting of
 driver_override
Message-ID: <YhaTWiSQl6pTVxqC@sirena.org.uk>
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
 <20220223191441.348109-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PaAAhqOBo3hBuacY"
Content-Disposition: inline
In-Reply-To: <20220223191441.348109-1-krzysztof.kozlowski@canonical.com>
X-Cookie: I smell a wumpus.
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:19 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Abel Vesa <abel.vesa@nxp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dexuan Cui <decui@microsoft.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Shawn Guo <shawnguo@kernel.org>
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


--PaAAhqOBo3hBuacY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 23, 2022 at 08:14:37PM +0100, Krzysztof Kozlowski wrote:

> Remove also "const" from the definition of spi_device.driver_override,
> because it is not correct.  The SPI driver already treats it as
> dynamic, not const, memory.

We don't modify the string do we, we just allocate a new one?

--PaAAhqOBo3hBuacY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIWk1kACgkQJNaLcl1U
h9DKugf+JTJnnQWx+6mOA4DxLKfWqeASwwB38nUbBFMpWAEhjMvez2XAp0h33Cp9
bH+dZ5NjHjeUoLGkWBHxWiyuu1r4QrqL7E32x/mV1JsG7I2svj0l0XyCx7Xw7lqT
QIFJxxSknnL1YtmnB53Rz55GDGQhIg4ewuv/ayCjk0oBDS6G2WBS2UAx2FWJQg2l
0ALu1QKfCU2DfjLPbmMqLoJb9anvSLyPxe38+Q2dqLx6kUl1WqVWz/Af6dJp9YWY
UDYfURm/JqyzEo/wiM5ZS39VO9Kv8M7EO9MFJvwxdkmM1evQah6crAugVx/WeCQy
4Tv/1RJYx8DyQ53XSPVEVcgh9tSx9w==
=g4g9
-----END PGP SIGNATURE-----

--PaAAhqOBo3hBuacY--
