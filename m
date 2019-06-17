Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBFE485F3
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 16:49:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4FB1171A;
	Mon, 17 Jun 2019 16:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4FB1171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560782962;
	bh=D90yJEsQiIPCYnNpq/EflqEIDvSJu5ml2aPBJJjKE08=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q5gTApZ/uk6qzH4I1/j5XcdQNV/GQr1KcVJliDAv/BKOQvfG1MZBFciD1Z9Y/z1pT
	 drIjlMVCjHjDL935izACW26m8HdqJDk3W3JIXUPgJvbpQam6JQpzsUFvPHEp7/vkfk
	 XrhaKXXpG9dqdjfe1+N0z/1tXw6FozillD/Rxe3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C18D6F896DF;
	Mon, 17 Jun 2019 16:47:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D1C9F896C7; Mon, 17 Jun 2019 16:47:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 289D5F80764
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 16:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 289D5F80764
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="aznmkQyE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H6/yaufmwSLHUgX2MSbj045PbyfCptlL4e7VIsSFx3s=; b=aznmkQyEOkn8tgeIGMqdgoztq
 qJl7/tQwp7k/+L3QMPXBC4nodH4pP6gSaBulcC/vhdx4B5o//8GBLiFVwl1eDWNHtoK3EQpzUXjXF
 cAO8Cf2b7uf6q87/DITbxCPFwCOrcS/mN56FHyZDxOEcPBEpO9ivU/WHllVjGeH+WvCFE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hcsuu-0001pk-EJ; Mon, 17 Jun 2019 14:47:28 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id ADCC6440046; Mon, 17 Jun 2019 15:47:27 +0100 (BST)
Date: Mon, 17 Jun 2019 15:47:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190617144727.GR5316@sirena.org.uk>
References: <20190528200255.15923-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190528200255.15923-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH] ASoC: Intel: use common helpers to
	detect CPUs
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
Content-Type: multipart/mixed; boundary="===============3296825607145648300=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3296825607145648300==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UuuTb5hZdWr4w/Ub"
Content-Disposition: inline


--UuuTb5hZdWr4w/Ub
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 28, 2019 at 03:02:55PM -0500, Pierre-Louis Bossart wrote:

> 2. is there a better way to do this for all Intel chips or do we keep
> this in sound/? Andy?

ARM has platform detection stuff in the architecture code, something
similar seems sensible for x86?

--UuuTb5hZdWr4w/Ub
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0Hp/4ACgkQJNaLcl1U
h9BQXwf6AiLrtgjV2fuE0szKqyv5VkcnkrEukEJfxaGSaArMy8f1zuab1VydWr59
8sHP5zlpF79CcgVL5CFHzGOGHRshS7BDnP3pY8lc1Tp0uGv4wOpZhD4vWgFnHZki
dqeExtm/IwCaYAQGyTdkMsgyxL6GofoSHiDSrNxtUvWa53oeGKAnWR9Hm/PTeABV
Nu9C0x/p2IPpaQ6Z4UeJSAMmjHewSqE1h13umzZTdH4vAaoxFCTozmdngIVwudzD
DQzpKEp78ckxvrEUutXIhYjsP6ynwQ/Apllp3qZTjDJSuW2uPsCwCLIPGm0xE/zR
5Qt030I39ikeNnxXyheOLomvqMRVJg==
=0VwX
-----END PGP SIGNATURE-----

--UuuTb5hZdWr4w/Ub--

--===============3296825607145648300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3296825607145648300==--
