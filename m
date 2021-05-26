Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20447391510
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 12:37:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAB45174A;
	Wed, 26 May 2021 12:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAB45174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622025424;
	bh=f1bEwHgcPM5TxbIp5xm+uW+c+nDWEA6OPC1OGvutXSQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OUiPzA4XEyVTK0aNCh5nDAN47WbBEj+nMa8FBDU2IKFOlU3KhpL5bqZTy4CyxpkJ4
	 MsNWQCf4Rgut8FtEEnSRhhZJ/sHt9u/UgFcgZx+9NZhLHh8h5+LkjhySGYjGrDcn6o
	 LHzyFIG9CR0Yq2OwrJ1WhTnDLc1lnam45oSSjG2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BF1CF8011B;
	Wed, 26 May 2021 12:35:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 876BDF8025C; Wed, 26 May 2021 12:35:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66979F80212
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 12:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66979F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tD8+eHSp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f1bEwHgcPM5TxbIp5xm+uW+c+nDWEA6OPC1OGvutXSQ=; b=tD8+eHSp9zQiC6+llsjCoCBTmX
 TkN6TByZLF8bNKOZ+rwUl4PKtVvIojGJnctRwNSj0RWNJJEN1mRLVG6SCC0u16IAQkT7dMoFA616k
 ymDav2XdxOFNXkn0qrtzsk1nrLN738wYuXmqXkSDAP5Td0M7WWNpu2mb1dzlTtbwB6kM=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1llqsr-005xkC-H7; Wed, 26 May 2021 10:35:29 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 900E7D05836; Wed, 26 May 2021 11:36:04 +0100 (BST)
Date: Wed, 26 May 2021 11:36:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH] ASoC: rt5659: Fix the lost powers for the HDA header
Message-ID: <YK4klHWowlYP+dh8@sirena.org.uk>
References: <1438e0d6e7af4593a060808b11c62d67@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hzMfNMR3DMoyWRkL"
Content-Disposition: inline
In-Reply-To: <1438e0d6e7af4593a060808b11c62d67@realtek.com>
X-Cookie: Ahead warp factor one, Mr. Sulu.
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "mkumard@nvidia.com" <mkumard@nvidia.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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


--hzMfNMR3DMoyWRkL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 26, 2021 at 10:10:15AM +0000, Jack Yu wrote:
> The patch fixes the lost powers for the HDA header.

What are the issues and how does this patch fix them?

--hzMfNMR3DMoyWRkL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCuJJMACgkQJNaLcl1U
h9B2QAf/dsXEEfPpP3sKHV5DGiX5ZUI7DdMsfu0W60ZrpHaXh/8zdXlx3/G60v4G
1stefPwD2KQPbv0I3BnNntnrnJID2EqUFkCPiHqMmPluvq/MpEszVqwEK+BDOhkz
sa+p7kGpXqHy5ko+4bKhMtAUFxpzMji6dXD56RC400Dvjo8KpioDxks+zf/bycpQ
HFou46DFS1OgxYxx3jTXKcpwwtoyMCCFi93eQLpIODp19LxC4DGFcz/4k6qiVBUa
JkEqSnMYh5bmcSmlHxiNl5AuXq8AZbcnulV2oyEWpNxhrJ4RILJ3gteYJKGmJMup
K8GB9iH98kFIznh7NrjM3FfC8qV+2Q==
=wJHl
-----END PGP SIGNATURE-----

--hzMfNMR3DMoyWRkL--
