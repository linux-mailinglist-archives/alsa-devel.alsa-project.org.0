Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CE415A5C8
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 11:10:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF9C71679;
	Wed, 12 Feb 2020 11:09:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF9C71679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581502199;
	bh=IgH+cPTdJO3it65SrKeMr6HrPOg/JWyGvTLfOR54opc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S9kJJTx+l+eQXIrO6eXPRkO7QEflgwrTRdyl4yaLwnW15hHX/ylxHetY2a/Z65jfB
	 dD9VGPSP2yv2XaNSRiSwsRMBY4f5CwmXB6D4XruyD/Ch82s/8Sa6YlPmnM0PmB/KQT
	 nCN/rncPsC55Im8YB83mXHj3zgU0LIiXJNTfiIr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5050F800E7;
	Wed, 12 Feb 2020 11:08:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07666F80157; Wed, 12 Feb 2020 11:08:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4B0DDF800E7
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 11:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B0DDF800E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60D3930E;
 Wed, 12 Feb 2020 02:08:12 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCC6E3F68F;
 Wed, 12 Feb 2020 02:08:11 -0800 (PST)
Date: Wed, 12 Feb 2020 10:08:10 +0000
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Message-ID: <20200212100810.GA4028@sirena.org.uk>
References: <1654227.8mz0SueHsU@kreacher>
 <197693303.hiACyxC3Vm@kreacher>
MIME-Version: 1.0
In-Reply-To: <197693303.hiACyxC3Vm@kreacher>
X-Cookie: Violence is molding.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Linux PM <linux-pm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Amit Kucheria <amit.kucheria@linaro.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH 24/28] sound: Call cpu_latency_qos_*()
 instead of pm_qos_*()
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
Content-Type: multipart/mixed; boundary="===============5991984098092810200=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5991984098092810200==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2020 at 12:34:15AM +0100, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>=20
> Call cpu_latency_qos_add/update/remove_request() and
> cpu_latency_qos_request_active() instead of
> pm_qos_add/update/remove_request() and pm_qos_request_active(),
> respectively, because the latter are going to be dropped.

What's the story with dependencies here, I only have this patch and not
the cover letter?

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5DzocACgkQJNaLcl1U
h9CdQwf/Q2e/vTZXZOGkQc4SmmLKO8vWdGP403zQCNWSaKnp8IbFP281lmCkdON+
JzyFvlSUWFUEE8U7sSIuzWo7dLQurQkEq1O2klXl8W4HXo0W+8MZtsfFWQHt48ST
vCwe03qod15tZiXHwCfZzIxrwpM5/GfyX9EvFpa7BXCrHPkYs6R9Nr6W6txlwVQC
2Ase3vHCV8SycxbO7t5i4IYkKbjqhy9w/tw0SC+CtUVYCPKwnNXOMESjAnlKeec+
lpaW2Csy6UPWrWTPI8+03haZjxWMAk1zeL3F1ke8jYRCJly/2msG2px7DU1fKXRM
4mHpdaPzJIFLlB4tZFcse46+9ckXyQ==
=Qcri
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--

--===============5991984098092810200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5991984098092810200==--
