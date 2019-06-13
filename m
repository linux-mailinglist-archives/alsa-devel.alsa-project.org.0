Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2476444C12
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:23:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8E0518BD;
	Thu, 13 Jun 2019 21:22:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8E0518BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560453792;
	bh=wSldHQ47ce7+RWzquIOj/MlsgoxmX1KSUbe/WM7hrhQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KmtJbM4StYwvNRHmThfS3zMn6WOhV8X5PgIKGsGtUN29W6C+3OOGYPsg7OIOlaHck
	 NfP+60eKZyY9YNpaDykfCvvyl2aPZHEJVcf6mVK4WTLOP7gyx2z27rzY5Txa+by7aO
	 Cr32uuaYRlICihcyY22hYHZU/hOMi6r3ePePpQXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CE51F89730;
	Thu, 13 Jun 2019 21:13:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C527F89714; Thu, 13 Jun 2019 21:13:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3409CF89703
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3409CF89703
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JQxZKUxQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sm8S5l1N/lmCwZqqVSyQxfstnDyAj8Qw9saaUEl4dlg=; b=JQxZKUxQT+cMiXCurCFNZ6wQW
 NSutX/uW0bT5ZZ1qSZiXqpsc1wESuwnpl2QDqiVUKBa5h6TFZudJkSReZ0ZcCVGS6VZUVNRQkcNs/
 pThsORQzB1ky5OzWQDYNqMW2ZMxiHG0Y2Pcc2PONcz/cAv3NWp29yqfk0XqRiRUDVUW3A=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbV9k-0005Tz-Am; Thu, 13 Jun 2019 19:13:04 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 63DC0440046; Thu, 13 Jun 2019 20:13:03 +0100 (BST)
Date: Thu, 13 Jun 2019 20:13:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190613191303.GX5316@sirena.org.uk>
References: <20190612164726.26768-1-pierre-louis.bossart@linux.intel.com>
 <20190612164726.26768-3-pierre-louis.bossart@linux.intel.com>
 <20190613184801.GV5316@sirena.org.uk>
 <s5hk1dpe283.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hk1dpe283.wl-tiwai@suse.de>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 2/3] ASoC: SOF: acpi: add module param
 to disable pm_runtime
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
Content-Type: multipart/mixed; boundary="===============7309909173404186475=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7309909173404186475==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U7NLafZe7Bh9OCap"
Content-Disposition: inline


--U7NLafZe7Bh9OCap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 13, 2019 at 09:04:28PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > I can't immediately find it right now but isn't there some generic way
> > of doing this in the runtime PM framework?  If not it seems like it'd be
> > a good thing to add, these can't be the only devices where it'd be
> > useful.

> Well, runtime PM can be fully controlled via sysfs, but the problem is
> that the driver declares itself being runtime-enabled.
> So, either we leave it default and let user-space enabling it (via
> udev or other way), or introduce some condition in the driver side.

I thought someone had added a command line parameter to do it based on
dev_name(), perhaps they were just talking about it or it was in some
BSP somewhere though.

--U7NLafZe7Bh9OCap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0CoD4ACgkQJNaLcl1U
h9CS7wf+NyiE06T0ELAkUK7p6KBurBosA0c15gTltBa+f60wfrOCwOWNWoNK/CY8
4CMdFtB0GQKXxyaIqXQGgsYj2rDD1WhT+pqBgkoYD1w9xGAfGVBduBuxXVHDmLnE
PpKhvokOO5ZO+jfyB+dWYykBzB9bfwrms0X3n+Rc3aUaINkUxkd/j5h640Pp+Q3f
sk1sAGwBkddCD+MtoN+eTvAETzF/hXnAFbrudEtgzIONJv2NA7K4xdz5e9qIrnSx
Xd/k3ThLnldJ5HxKyoj8Z1E7dICOwyCTVBvgOOc7AroYnS71L9SXZKDOl+7jVDv7
9mTkdYl7QDIlaed3nTtnVyOd0nNgdA==
=5FNq
-----END PGP SIGNATURE-----

--U7NLafZe7Bh9OCap--

--===============7309909173404186475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7309909173404186475==--
