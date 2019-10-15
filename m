Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC138D758D
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 13:50:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CA4415E0;
	Tue, 15 Oct 2019 13:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CA4415E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571140245;
	bh=RMiG/OwGA+Yjj+z3VEArLATr2vsmcffGN8UzLK/gxBg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sx/iGrXVF8bUGrjUr0VqD56k9rmZg8Z660miRBlq3BQ9OQcKtUfLShI40L5N77V47
	 VZnkOkZoBh91ZEEdupG5w9HHV/7U4b/IgJ4Nr8Z1cUqws8g5vJPyZBSpWQkyJWre+N
	 ZzErtrFqOP7SP6x+UExw5bUyFhOKBeAedsxQTjr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09785F804A9;
	Tue, 15 Oct 2019 13:49:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F108CF804AA; Tue, 15 Oct 2019 13:48:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEE8CF8011D
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 13:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEE8CF8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sQoy2DFY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XovC9Fd62XjhLfN4wCR5FJF9dddJmhaM10zo4oaQMis=; b=sQoy2DFY0zkS3ePUwfkRWD7LN
 XjF9F8jGJERwMETzWX1PuuIpZXZTP74UEfqAXPHaA7phXtj59ymChM5SGU558P0lK9SIf1AXHbF2K
 OYbftzuPJLrEUBucULM0d/XPKlHgKrzn8o2zBHJP1bMRVpkFoncCTAZfzAhVMwb2f3lmk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iKLJv-00027Q-NP; Tue, 15 Oct 2019 11:48:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id BB07127419E4; Tue, 15 Oct 2019 12:48:54 +0100 (BST)
Date: Tue, 15 Oct 2019 12:48:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20191015114854.GB4030@sirena.co.uk>
References: <20191014102022.236013-1-tzungbi@google.com>
 <20191014180059.01.I374c311eaca0d47944a37b07acbe48fdb74f734d@changeid>
MIME-Version: 1.0
In-Reply-To: <20191014180059.01.I374c311eaca0d47944a37b07acbe48fdb74f734d@changeid>
X-Cookie: Yes, but which self do you want to be?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, robh+dt@kernel.org,
 enric.balletbo@collabora.com, bleung@google.com, dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v3 01/10] platform/chrome: cros_ec: remove
 unused EC feature
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
Content-Type: multipart/mixed; boundary="===============7070238556160168131=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7070238556160168131==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 14, 2019 at 06:20:13PM +0800, Tzung-Bi Shih wrote:
> Remove unused EC_FEATURE_AUDIO_CODEC.

What's the route to getting these platform/chrome changes reviewed?
They don't seem to have got any attention thus far and this one is right
at the start of the series.

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2lsiUACgkQJNaLcl1U
h9BH+Af/VoQYmxlIIQ22+R99CZ1J66203wVcnQ5aT5edsF12LFEwx/4iG4dKU6t8
xf0JGlUi/3Yfi+UVq/g2k+Zd5zPCK6j4ydCbrLiK8kCn8SNu+6w+2KcqC44rwcw0
+2UyLZKc8svUgtjpjvrmHOM2rJAAOP9ga8EGQEkCpv37+1q7mB9V/CxVm4LiTEbu
qtytgfntxj1STs+bKuLAAEaY7lEm7qVnA1qvBHhoI94LyDRLNEj3UC9f9jBXKZwX
4m67h40ZI/71kw+BYwZuif96uCPA9Yaryow0z3a1EMAWSjT9ZunKOUjs9KVovDPN
UFb+uRtknxPygNRWavTEI0rUt3F4Ng==
=lh/o
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--

--===============7070238556160168131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7070238556160168131==--
