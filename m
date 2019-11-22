Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C922410766C
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 18:28:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4052B1807;
	Fri, 22 Nov 2019 18:27:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4052B1807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574443724;
	bh=fA3P39ocJl0/qi7n6JEudWlZQkJjvnr5kwCX9h1DmtI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sI5FMXYVE0qWBIQwmBs2L1JcKsuU6eurziq+lyFhEsdgPIwmZDnglF159CV82nRNs
	 HAhFVP8OWFFhFYvUsQeC6ukMCG3qc2zOP2Ub/36WpYpTKvALYnh1KRyLZgfQzWFhSY
	 0KKFtYxpAuTBu15MYSlQt7RXrcjldjfzJstVuIVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D54A8F8013F;
	Fri, 22 Nov 2019 18:27:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B769F80140; Fri, 22 Nov 2019 18:26:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id BE920F800EF
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 18:26:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE920F800EF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85757FEC;
 Fri, 22 Nov 2019 09:26:53 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 022DE3F6C4;
 Fri, 22 Nov 2019 09:26:52 -0800 (PST)
Date: Fri, 22 Nov 2019 17:26:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20191122172651.GF6849@sirena.org.uk>
References: <1574336761-16717-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574336761-16717-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
In-Reply-To: <1574336761-16717-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: sillema sillema nika su
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 djkurtz@google.com, Alexander.Deucher@amd.com, Akshu.Agrawal@amd.com,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [RESEND PATCH v11 1/6] ASoC: amd:Create multiple
 I2S platform device endpoints
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
Content-Type: multipart/mixed; boundary="===============1532514972150117955=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1532514972150117955==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DO5DiztRLs659m5i"
Content-Disposition: inline


--DO5DiztRLs659m5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 21, 2019 at 05:15:56PM +0530, Ravulapati Vishnu vardhan rao wrote:
> Creates Platform Device endpoints for multiple
> I2S instances: SP and  BT endpoints device.
> Pass PCI resources like MMIO, irq to the platform devices.

Please when you're posting stuff don't put these RESEND tags on some
patches in the series, they're not helpful - having them in some but not
all patches is inconsistent, you're sending a new version of the series
here.

--DO5DiztRLs659m5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3YGloACgkQJNaLcl1U
h9Cv0wf7BLPxHi6VlmnTYgV2HFFERU+rkkk/A78kSRLvCcFbJT+mzHY7PvqTNDSi
G8OoUscWHgFVfVvsfGQV3fscMC9RFpQQJeKsw0/4Z9YPWhrkUZGlSnWJi0oW63oF
lmhUmzsmhCgIlSPHFcDZcNTuY0prLy9zEfQqlnk2zVWBJ5TTpK94bzio19HYKCK2
NgVJx8eFAyGRSDBC2hy2qxOYQ3gOARdwADsmq43KR1oVT2Ru66QZT6V6ZVgFurJr
unKYQoLepbAC4SHNMrMGIvTAdVJKJfl5/8kuRaWOrUCw8XSjerYeG2g1WxJwm/TD
u3Gnrw8NkkWUT3XcAFMbZ+vJcvokjw==
=+sSD
-----END PGP SIGNATURE-----

--DO5DiztRLs659m5i--

--===============1532514972150117955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1532514972150117955==--
