Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B4EE2119
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 18:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FB481616;
	Wed, 23 Oct 2019 18:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FB481616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571849733;
	bh=P64vWsuHZSjpJlpC9rv/wzJ+I8M1h4Ivc6Xe6qcRBVQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QjxLtRd2WZYxJp57g9wCQzkC71nGqOTVq1jLwRjmFnUUlqjKcic3jK2Cr0ZDUdhXz
	 dm2UiGn8MGCuAWEXDArnK4pz2oC6ABswXcX7OHlDC0XxJvQbviMnZJkZH+ZZneuTfC
	 Qu1bfgcEJnPkDrjlFJR3YpzV51xYMs8ysf1I6XlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA358F8036F;
	Wed, 23 Oct 2019 18:53:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C1EDF80112; Wed, 23 Oct 2019 18:53:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C3E3F80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 18:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C3E3F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Cl+iBldr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cpkHeR86EndAZM+RImmgEIWAgddTj7DrZWD5l8HljkI=; b=Cl+iBldrs1dUm2LWeDxd1Mt1v
 X68omUwYH6mBR7H0Fk4PdzYCc5HGXKwsT9ud92IsHks1wa07b23foRgrpLdaSqmfcABWdmJi2Ks71
 5CR44bL2zBhOMFdsuUhq6DfwoBCDF9RUOH+Ics0DHSkPgb/OOmZqoG+7mFLB5OudLGTIE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNJtH-0000yn-Ah; Wed, 23 Oct 2019 16:53:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 85B4C2743021; Wed, 23 Oct 2019 17:53:42 +0100 (BST)
Date: Wed, 23 Oct 2019 17:53:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20191023165342.GK5723@sirena.co.uk>
References: <20191009181356.GO2036@sirena.org.uk>
 <20191022185906.GZ5554@sirena.co.uk>
 <1j36fjvmvr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1j36fjvmvr.fsf@starbuckisacylon.baylibre.com>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, alsa-devel@alsa-project.org,
 Curtis Malainey <cujomalainey@google.com>,
 Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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
Content-Type: multipart/mixed; boundary="===============1490743444788505647=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1490743444788505647==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Tv3+oRj6D9L8lW+H"
Content-Disposition: inline


--Tv3+oRj6D9L8lW+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2019 at 11:20:40AM +0200, Jerome Brunet wrote:

> I don't have a lot of experience with ASoC but I'd be happy to present
> some of use cases I struggled with while adding support for the Amlogic
> SoCs. Maybe this could serve as quick introduction to your part on
> componentisation ?

Ah, sorry - you had mentioned this before and I'd added it to the wrong
set of notes.  Yes, I think this'd be a good topic, let's add it.

--Tv3+oRj6D9L8lW+H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2whZUACgkQJNaLcl1U
h9CqvAf8DG524N0RJBKMWRnM8gp6It9CG3i2YUTlijm9etKxvnBUptoD/+wZNROh
HsrXwNKyY8GqdtK3BRduZJ64TCqORnsrlVHJQuGchn1hbvUZH6nnaPhBWgQbum98
oPIKQRcGhDi2HUaiNgnMsjAmsZJJl/ktAsb7xDY+HCGdYo9FeyuTH5JC+9GD6yvb
rFjVN7nB8pMhDOyUv8R2G/sFc1kYbbFTvqv2+/Soi2zPaE4D32kdUerMp/M5cqPo
DSQteVcMAgq0qaY42DIghadsde3EQ69CZG2KHcOArxtHuGnQW0YnOQn7TUJSCm6P
/bRWxNpkCVQ9ETKtUMAXU2StwZuseg==
=wpO1
-----END PGP SIGNATURE-----

--Tv3+oRj6D9L8lW+H--

--===============1490743444788505647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1490743444788505647==--
