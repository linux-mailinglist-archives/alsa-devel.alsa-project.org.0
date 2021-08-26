Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D13943F8AE4
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 17:20:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6515016C9;
	Thu, 26 Aug 2021 17:19:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6515016C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629991233;
	bh=a2jZzUEbjZVXbA+cy+TfRCKZHYIX3mbus8lC77FvA9I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dKmmPF5xN5A5hvPav5WwkjKfzgp4pMxsy0FvJlpVtORXHhEaAGhJJd+cihs4VUml+
	 oFDDQU63r5Rj88WjkoH0bs4qoJjGxKNnLWE2ZdFyMwkfr/ooqISHeTgu3cCVMMz3JF
	 Owi+TjUh4/uwsPRMBYj/7/tG8Q5deRVNQEChH+Go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5048F800FD;
	Thu, 26 Aug 2021 17:19:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A35EF801D8; Thu, 26 Aug 2021 17:19:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C502F8013F
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 17:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C502F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bMHA0Yhv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F3wLWK2f3zgkMtabw1PHf88uoy84ssAIxzwxp7+SL9Q=; b=bMHA0YhvUdYc5qzCUodAFUpkuG
 NY+rLvmCRbwyetqIvYaDoRRu3ODU12KqVQxxUORLc0xrfolFUCflYGP6IFElfdKK49C6UhKZ34k7z
 QkbTliMagbxVL7i/7lVwve3q3z7DZmapaRPi1L6R8rpmYl0gcjaCPFTMGe4t2/b8TW6w=;
Received: from 94.196.67.80.threembb.co.uk ([94.196.67.80]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1mJH9q-00FTj4-2L; Thu, 26 Aug 2021 15:19:10 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id BA531D078FD; Thu, 26 Aug 2021 16:11:22 +0100 (BST)
Date: Thu, 26 Aug 2021 16:11:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: mt8192: re-add audio afe
 document
Message-ID: <YSevGntb3mmYlZGE@sirena.org.uk>
References: <20210826141314.3720975-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4q4ccqmi5+se8Jc4"
Content-Disposition: inline
In-Reply-To: <20210826141314.3720975-1-tzungbi@google.com>
X-Cookie: I can relate to that.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 jiaxin.yu@mediatek.com
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


--4q4ccqmi5+se8Jc4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 26, 2021 at 10:13:14PM +0800, Tzung-Bi Shih wrote:

> The dependency has merged.  Re-adds back the document.

What is the dependency and where wsa it merged?

--4q4ccqmi5+se8Jc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEnrwcACgkQJNaLcl1U
h9AB7wgAge6zpGbqQxVERgYA6jszHXVf8Sr9SWJ3vANiDFbGS0fASDH5sndrryv7
7/U+kLHaDkNfweo56uQnoVgh05ijmJCI1+1aatDkXJrAjoZtTJYGgsemxJlz05sM
yj0fMCyNXvCpUHyfLlWx/At7xwm7IvVKeH2qz+wMFOTmJDVBHhSEaFa/ENNLyoyd
+frEUkd6QfNqGPz7pISRMmSDCZ47pDzHqd9EWIDOblvwm3/RzvvHUrFZMxQehQEF
+aJEfE8ZgOCMgFrS+KdcaKFPCUEdxWqH6lZkSTvyOdXGd53nrnB8b9x9BeQ4ypHU
vioPVwZPouihI4sxnomLQ5gzbjjmLQ==
=RMeP
-----END PGP SIGNATURE-----

--4q4ccqmi5+se8Jc4--
