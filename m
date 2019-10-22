Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B253E093B
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:39:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DED0C1684;
	Tue, 22 Oct 2019 18:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DED0C1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571762349;
	bh=kox8Y3mym6Q56OXbc1rsscw6189WV5Lpd7QtCFzF6rU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aVUrU+jlJOoMy3zauczOVNpiW+VgJktnOx8P5RH0XOnIbT3Eq7sE7gNI5+1xypezO
	 e5dNx3UF9DrFtqNsbEat/JDB8St4N1VIEuK2UaVagmhHU1yTJEsiBDx9lEFR+y78l5
	 va/yD9B71s+lX40OkY0cFn4L2/JTA5M0rDmNm94k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 195DDF8058C;
	Tue, 22 Oct 2019 18:37:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57103F805FB; Tue, 22 Oct 2019 18:37:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A25BF80112
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 18:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A25BF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="eOAcQcS9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KE3k2qtREHq2WSAx2j2NdF3H3/H8sD/ouUddWgPXv28=; b=eOAcQcS9c6+WTa+FPZOPzXMhe
 SMgi0tuc/9AnHyEr8LTJ0sXnHTPCz5zQxHp1UQvm6z7tgsKUQ0UrZfcnYNszrrsvPI6Oc96pOlZv7
 KpI0AHhvpC6xodzQa47uWAknJaV+4Y8z6bo+FW33y2TIHSSSsSkGNyr3fMb3HS8j7jOQc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMx9p-000736-QP; Tue, 22 Oct 2019 16:37:17 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 509272743259; Tue, 22 Oct 2019 17:37:17 +0100 (BST)
Date: Tue, 22 Oct 2019 17:37:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191022163717.GO5554@sirena.co.uk>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-17-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20191018154201.1276638-17-arnd@arndb.de>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 17/46] ARM: pxa: poodle: use platform data
 for poodle asoc driver
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
Content-Type: multipart/mixed; boundary="===============4948681784658410251=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4948681784658410251==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LwbuP8dfxhLLLUfV"
Content-Disposition: inline


--LwbuP8dfxhLLLUfV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2019 at 05:41:32PM +0200, Arnd Bergmann wrote:
> The poodle audio driver shows its age by using a custom
> gpio api for the "locomo" support chip.

Acked-by: Mark Brown <broonie@kernel.org>

--LwbuP8dfxhLLLUfV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2vMDwACgkQJNaLcl1U
h9DXTAf+PkYfGUBycQh1ObnY5bFiUcm4IhRh9mkwhL2PRO3lCRN+TN++wyL3vtDP
j9AV1y/qAcZDELhOX9eGoVocwR9EZdeJCbrFz5DVr9g5E7L41Ay26w36YQ8aWWzj
WHe2vbhfLclIUrnIeEKuEWXwpPXZOq1hC7jJ/ihh2wJGHVIRCO0MkZ+ZqUEUk3E2
86C3Z9OzamRZhOlie6EuqmhSw3gNQQdjjDGTOQvdC7zS2MazZxxNJTpOntv78Bs7
Vp+DtdJ7vT0vr8c7xCfWcWlgv2Bc4mq0ky/YJtIUAXJckc23KDsJjYbuynBlSTXC
eNjL3dLyNzIsUdsHUsh7h6YXjp9vAA==
=dGNL
-----END PGP SIGNATURE-----

--LwbuP8dfxhLLLUfV--

--===============4948681784658410251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4948681784658410251==--
