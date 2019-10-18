Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C9EDCC8F
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 19:24:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43EA21654;
	Fri, 18 Oct 2019 19:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43EA21654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571419452;
	bh=4ojrHbUdX5xQ9Otb8spt/Sg5X/jVSWPOzWo1Ubl5jJ4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=anFgVTSMEqwWdjK7dHMMinqevrcOynznufPkGbjyPDVFP0ty1HCemcoQ9x+Aqy1kA
	 2JKfdGhOhz9DbcaQhbmISUokhYYsSBSx5dmxSSKCBzDa9EOAP5bvh28rNQL3NVm54u
	 Ti5fu1N+PG3pFLUZxbOqsZ7sIUF8DqhWdl1RtqGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A69AF80323;
	Fri, 18 Oct 2019 19:22:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD8B1F80362; Fri, 18 Oct 2019 19:22:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A939DF80322
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 19:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A939DF80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qqxu/nOj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YEUqwXf68rAn5s1l3tXa9+Nk4NAT0bB7VwakuvjxaLs=; b=qqxu/nOj/LYHzT/4No5A2w9Bt
 14EqFiyq8GyiJfeDqnzchr+4WwrOpkqpkoRNH8VJqlWa6fu1u4KVKbzZjgy+CiWCXFlb7nqFwNaZx
 PDCha66YmI8vpPsvEE8MBWHbIQRHMMKZqc6vK0CPeX1afZCocWnikDGFMK8UFOt6POnjA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iLVxG-00049W-8Z; Fri, 18 Oct 2019 17:22:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 166FA2741DEA; Fri, 18 Oct 2019 18:22:21 +0100 (BST)
Date: Fri, 18 Oct 2019 18:22:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20191018172220.GC4828@sirena.co.uk>
References: <20191017213539.00-tzungbi@google.com>
 <20191017213539.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
MIME-Version: 1.0
In-Reply-To: <20191017213539.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
X-Cookie: Smear the road with a runner!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, robh+dt@kernel.org,
 enric.balletbo@collabora.com, bleung@google.com, dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v4 07/10] ASoC: cros_ec_codec: support WoV
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
Content-Type: multipart/mixed; boundary="===============3044227401797896927=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3044227401797896927==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 17, 2019 at 10:00:12PM +0800, Tzung-Bi Shih wrote:
> 1. Get EC codec's capabilities.
> 2. Get and set SHM address if any.
> 3. Transmit language model to EC codec if needed.
> 4. Start to read audio data from EC codec if receives host event.

This breaks the build:

ld: sound/soc/codecs/cros_ec_codec.o: in function `calculate_sha256.isra.15':
cros_ec_codec.c:(.text+0x119d): undefined reference to `crypto_alloc_shash'
ld: cros_ec_codec.c:(.text+0x11c1): undefined reference to `crypto_shash_digest'
ld: cros_ec_codec.c:(.text+0x11df): undefined reference to `crypto_destroy_tfm'
make: *** [Makefile:1094: vmlinux] Error 1

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2p9MwACgkQJNaLcl1U
h9C6hQf/WgLMjwUC9ev2n7739zYINOiNlP2HiWhim675Y+ILwL3SO3kAdVwi+Ev5
IeBwkDqetGni8J+KbGWyYPE2LnmVjvOoCyH+6V8E/fHfkLPtXocG5UZL4DjVstTB
27MdU4tDUczYrk+mRVuaBnz9f8DHTIufhiaRiiO3r3QI8Kpf1ClZ/gnEez5b+y7T
lOPOFXopjOoH14AX3CztZbJjnGDJ9k5oFFMMkv7fjqtcnxbDHXCYs4cumAHYeqld
+8aHLp58m4Jcdjq3QYdaV1PTeJP2cGBRXsWoGiMJyYgcH5WALgdS3fLv+yIGSUx5
qbuLVXUou6jeu+irpsqUkcPm7JQzgw==
=MH7S
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--

--===============3044227401797896927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3044227401797896927==--
