Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE0871B10
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 17:07:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5804E18CB;
	Tue, 23 Jul 2019 17:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5804E18CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563894424;
	bh=gaIGqjbKSRVT9+xBYwpbqs76Xgfl2JDAYciEJ9BtZ+E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tBaFrLd9FEAy4aTmcbR6YY5lsGfHBEFneTESsSOxqG3ryRRZKPi212CKM/6/7mtms
	 crTdvcIe+ydm5wXA3rFqkLjtvS6TacY2M13KcdruwkfYePB8SQLEobpL5OR+VQgbvH
	 8eWrk+NlNTu8/RDil8rQeQkpWNwcsQVdWgwen0co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6947F80481;
	Tue, 23 Jul 2019 17:03:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81507F8044C; Tue, 23 Jul 2019 17:03:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06EEDF8044A
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 17:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06EEDF8044A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YcYxi2Ty"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fOOHMX9TwdZCKzXPk9Ixq51R+MTMHP7UhZwKKKLNpfw=; b=YcYxi2TyPLdrtOSzT338ZfjUE
 iw+7XqqZLuerZQraM9m1NPw3t3cUY+JPgJ0lS6KPTyNDl62fUVy4yPJkoDNuqSjumNP0dbyQ6vdPt
 UQRNVev4kiILWtut/mucTQWXXOTrd5pGTomkWvN0sGEz/epp9TFuEB/pXvLl4foIMmRJw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpwJj-00041N-5o; Tue, 23 Jul 2019 15:03:03 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 300E12742B59; Tue, 23 Jul 2019 16:03:02 +0100 (BST)
Date: Tue, 23 Jul 2019 16:03:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Message-ID: <20190723150302.GH5365@sirena.org.uk>
References: <20190722135209.30302-1-ckeepax@opensource.cirrus.com>
 <7a6ca46b-9ca7-6c91-6aa9-d1be785c64c5@intel.com>
 <20190723081706.GL54126@ediswmail.ad.cirrus.com>
 <026ea350-db7b-d78c-cae5-e03cf735607c@intel.com>
 <20190723150125.GP54126@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
In-Reply-To: <20190723150125.GP54126@ediswmail.ad.cirrus.com>
X-Cookie: Avoid contact with eyes.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v2] ASoC: madera: Read device tree
 configuration
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
Content-Type: multipart/mixed; boundary="===============3329091669038067503=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3329091669038067503==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tcC6YSqBgqqkz7Sb"
Content-Disposition: inline


--tcC6YSqBgqqkz7Sb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 23, 2019 at 04:01:25PM +0100, Charles Keepax wrote:

> Ah.. yes I follow. Yes this is intentional, all the DT fields in
> question are optional so the driver should proceed if even if they
> are corrupt or missing.

If they're present but unparsable you should probably say something
about that really.  That's clearly different to optional.

--tcC6YSqBgqqkz7Sb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl03IaUACgkQJNaLcl1U
h9CnLAgAgBMgulNbgO+mODCP3VqzAG+tRDZpD7cC5cCiV1x/aXNSfavPK2GNXrxg
qOHgdcKgDQI+IgBReSd9FoZ9MfxRzcm65GyCpAdNqksiV9yDzPZLdkp0hjwv6E4d
IQEf0AvesltIfos6J8qzi1/Calu2ongmihCSkm9DMaR1JTZBEsydBrNbZ2PH6VZ3
wxh/GK45jpJODP51VXStnU9kYb8KIiBI4B6qbOPb6uOrTd01t8PyLNR2rDg5TiCw
gy+lXg+wbjM8hymIPzEX/EqG/CWq1StEN1ZLj+FH9ieeXCONylqRn4gdWp7i4w2v
vK7VmVM2mdKhfwzDb6bre4SvwcqpUw==
=Gbh1
-----END PGP SIGNATURE-----

--tcC6YSqBgqqkz7Sb--

--===============3329091669038067503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3329091669038067503==--
