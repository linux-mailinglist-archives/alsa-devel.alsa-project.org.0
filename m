Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2211996F7
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 15:05:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B79CA1657;
	Tue, 31 Mar 2020 15:04:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B79CA1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585659919;
	bh=EnBQqz1Zs0ivzG+fg1aNTGdyXL/Kj1Ictb4w4EVq7W4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rthDQ/LS9bz/odF1nn4djdoiSu/aIwUPCPivhr/MCLx6JAG4DgxFWOfQ/O6Uu+ZXj
	 rXSO7rwNbnpc6S7jCBGZmxFaBdYFR4qBT1XLE2gyS4yCseoHqDKNMfmaRly8Pb03Bm
	 zlH6kh8VlYjupm2/prYzxZnwq2ZA/TUV81k5OEDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9990F80146;
	Tue, 31 Mar 2020 15:03:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44272F80146; Tue, 31 Mar 2020 15:03:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 57A30F8010C;
 Tue, 31 Mar 2020 15:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57A30F8010C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38C5D31B;
 Tue, 31 Mar 2020 06:03:29 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA9483F71E;
 Tue, 31 Mar 2020 06:03:28 -0700 (PDT)
Date: Tue, 31 Mar 2020 14:03:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH 2/5] ASoC: SOF: imx: fix undefined reference issue
Message-ID: <20200331130327.GE4802@sirena.org.uk>
References: <20200319194957.9569-1-daniel.baluta@oss.nxp.com>
 <20200319194957.9569-3-daniel.baluta@oss.nxp.com>
 <20200331122540.GD4802@sirena.org.uk>
 <CAEnQRZD_Hjp2vsouUURuZ_zgAnnUXynq_L5YgCZAN4pFkcmGWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Content-Disposition: inline
In-Reply-To: <CAEnQRZD_Hjp2vsouUURuZ_zgAnnUXynq_L5YgCZAN4pFkcmGWQ@mail.gmail.com>
X-Cookie: It's later than you think.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, kai.vehmanen@linux.intel.com,
 Devicetree List <devicetree@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>, Yue Haibing <yuehaibing@huawei.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sound-open-firmware@alsa-project.org
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


--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2020 at 03:41:57PM +0300, Daniel Baluta wrote:
> On Tue, Mar 31, 2020 at 3:25 PM Mark Brown <broonie@kernel.org> wrote:

> > This has you as the author but you list a signoff by Pierre before you?

> Patch was initially designed by Pierre [1] when in the internal SOF
> tree we already had the I.MX8M patches.
> Whereas, in the current patch series I firstly fix the i.MX8 then I
> add support for i.MX8M.

> Should I go back and put Pierre as original author?

Yes, if you're forwarding a patch someone else wrote you should keep
their authorship.

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6DP54ACgkQJNaLcl1U
h9BNCwf8DKshKqaUb3H081iRZrUHWAJSZU+DnmiD5ENcYbns3F/gJNUhdt8nItvh
VRWzN4wsKM2ELUd0ktdzcRaxxQS52CBuw0JkJAsVMlOZ2UxE3hYBSe6HrT6gAvpf
BKcnouJmHOot/rGlw/Z+NtyCxEDQkqz24/+Jv63z6PRrnwb3DHDBJLhP8+FlJ2We
cKTS1TR290aRfdmPaXyPTiwxGolcGzf5ulXnmgi/0/ytRGd59Yi8IwbC/Cm1sbh7
rG+PE9vO5P2oHG8TBUUBAcGqO0nLtzn2UdkF6EVzM7IqcPr+QWeIdv9Fgo1b4BN8
h44Bx4448w4dpDXA6nidWLq33Zbe6Q==
=Aux6
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--
