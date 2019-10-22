Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F529E0957
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:41:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24D7B1696;
	Tue, 22 Oct 2019 18:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24D7B1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571762516;
	bh=DMS3mV0V0p+Y2XjyeigPppJwGfWb5+fVA2xCc4G4XiA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=azt3Pij/eoVNIrmVgli63KtOi7TXoNIPmo7fc/Rd7GV2adoFBlc/aerCoApIjug37
	 WGDtJ1oizJfUV9aFj9NFRYz79Gk6aNXofCaQCPVl4tyM2EzZErpbjFLddIROv2s9PB
	 NmV8kiWkWIsCBU+WJomvBD1kJDKOd3+VfAfjVEiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 424C8F8063C;
	Tue, 22 Oct 2019 18:38:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE857F8063B; Tue, 22 Oct 2019 18:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F2AEF80390
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 18:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F2AEF80390
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="VbxtWlr6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BKcFfApj5RoNNrr6PNcShwRSzBMTqZADkQJDoDqR6ik=; b=VbxtWlr69+jYe4fpFwJUR3x/m
 xF6y8rnYjq2y5yrl4JYSz5aM6gV+LlOxK+Q3HxgUfSVwii3kSkxa8TwPE4z1I0qRCunkheuPrJ2DG
 cI7nUdmZb+r0XO+54Tpeb5HNaPkkmhd+2KLbw7tAX7+uoGjLUB6JCrPUg7m3PXpOJDDKA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMxAo-00073r-5r; Tue, 22 Oct 2019 16:38:18 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id AA38F2743259; Tue, 22 Oct 2019 17:38:17 +0100 (BST)
Date: Tue, 22 Oct 2019 17:38:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191022163817.GS5554@sirena.co.uk>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-22-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20191018154201.1276638-22-arnd@arndb.de>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 22/46] ARM: pxa: eseries: use gpio lookup
	for audio
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
Content-Type: multipart/mixed; boundary="===============6675459701640461112=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6675459701640461112==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rG09A39trvEtf3rB"
Content-Disposition: inline


--rG09A39trvEtf3rB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2019 at 05:41:37PM +0200, Arnd Bergmann wrote:
> The three eseries machines have very similar drivers for audio, all
> using the mach/eseries-gpio.h header for finding the gpio numbers.

Acked-by: Mark Brown <broonie@kernel.org>

--rG09A39trvEtf3rB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2vMHgACgkQJNaLcl1U
h9BajAf/VaPUPbuOM5XFe50jUB4C0hAjngOdu3qVFRYIfGYfbBgT1GqUsq1wJUmn
RkRh//A+Sht8MoKnOh4QESjoY9maJv0XU1BQ73dULQRHOVYwuJtlJOd4oKbvkvwb
jdVs5ZvDGbsf6PXnHBC5rqC1P+zBX/CZ8IN3xrJNlS4Z5vNzWj0ALFTiAN528Cxo
qOVAiwLdGdkC56ACLm5xrHDEPaoGMTgWGx9GYV/c71IbeOGjykBWbepnKnK8kH6d
lvggiHydyKe8fb7bTsv6dJEVul14x1DMBg2rWM226ujhoAbY8gt/DHOCT4Jbzc04
X6wwL7joES06ET3LwI91pNukZe8J+Q==
=ldMH
-----END PGP SIGNATURE-----

--rG09A39trvEtf3rB--

--===============6675459701640461112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6675459701640461112==--
