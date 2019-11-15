Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F495FE269
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 17:13:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9F141672;
	Fri, 15 Nov 2019 17:12:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9F141672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573834389;
	bh=+M2Te0yZB9Pdwkil4pBwO49Eh4EYoOB0Pe2O9rlJW8s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thKMm0N07sJswaF+y0YkqdgZGjpHCR7eOOQu0agFhGabhDup3TL5avpp8kU6EbvZj
	 3ngdtYEPVMIxoKoOLQK232tv33/EcSeQ38Ygv4SNog3eWHXLI20kMsdY9itsRfgDHA
	 eB7PaP7XegItwaNnQfms6A2Q095WFQKXZ6mBJR8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FFC8F80106;
	Fri, 15 Nov 2019 17:12:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4D2FF80104; Fri, 15 Nov 2019 17:12:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C70FEF8007E
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:12:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C70FEF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Ut9of72I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a6s56JhDtI/Y8dfJlPMurASdhnGwtfFYnXMKce5BDck=; b=Ut9of72IPWl8JG6PSw0cbyGcq
 V5VGrWD0LG8ozMn4a0iykI3QVN+VCBw0Qbb9jf/0RTWjOh3y4fDurcGw4Dyjx9kC/2qOaIQ2NjlT9
 lTGDgrAVBkhvMZJGoN++ErkymbDqCh6LYWydTPR6QzcgUlKEUDodKBuTu7FSrb57dykag=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iVeCh-0000fv-CY; Fri, 15 Nov 2019 16:12:11 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6529A27429D2; Fri, 15 Nov 2019 16:12:10 +0000 (GMT)
Date: Fri, 15 Nov 2019 16:12:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Message-ID: <20191115161210.GB4210@sirena.co.uk>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
 <20191115160819.15557-4-m.felsch@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20191115160819.15557-4-m.felsch@pengutronix.de>
X-Cookie: Tell me what to think!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, KCHSU0@nuvoton.com,
 robh+dt@kernel.org, kernel@pengutronix.de, thomas.fehrenbacher@siedle.de
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: nau8810: add aux input control,
 available on NAU8812
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
Content-Type: multipart/mixed; boundary="===============0893960639903847722=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0893960639903847722==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2019 at 05:08:19PM +0100, Marco Felsch wrote:

> This commit adds the support to control the aux-port on the nau8812
> devices. We don't need to differentiate the aux-port registers since
> those bitfields are set to '0' on the nau8810 devices [1,2].

It'd still be better to only register these controls if the device isn't
a nau8812 so that userspace doesn't see them.

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3OzlkACgkQJNaLcl1U
h9CzJAf/bweQhNi628v9qYg/EgvL3C6EqcxHS3yI139L2K4AVDVNomczL+iq/fRY
vDW1oFgcRDy98yNCgFL27Vjn+ocGIE0/7dirr5sjVKriS7HKlVpaMDdgKBqKN/TF
qcJtJ9fCYPL1IYyIT3LR8isCPQFxgzc6m5AIGAbKwFuTNlH0hK7fGuR2ZcNP9J/j
lF22G2iRZicU24GZTdDE27xAtvyKl9hLwkxrH3Ren1T2xuP6ouc78jN0fs9bzLxO
MapAv1vEoZPinvILQW8elIgkWn4jjCjszjDqYTMg7qoQTvw8c/UkYDi8Xky+oA1u
sO/YhdTe6+7pTnW5+Ngvl8TLVjyXPw==
=xfur
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--

--===============0893960639903847722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0893960639903847722==--
