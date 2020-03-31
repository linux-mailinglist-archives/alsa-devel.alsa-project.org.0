Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E53019967F
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 14:27:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD3E21660;
	Tue, 31 Mar 2020 14:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD3E21660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585657654;
	bh=lEz1klH4TymFRjb7lKYsi1k0Zi49pYdqaWSFWXTIeuk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ltqEPXSnVJUcEQEcCXKe+QLlWlLEXyjCyytE/dCQPIkf9kZHKJe+7xF0SPNZQWXLi
	 jKnwU3Zny4SboA6DCrRNG8kFfY5Zd23IxPJLESgNt1C/ucCIwJVQBpTnwhyDu5AJCx
	 Ms9rCI03nv8CF5L3YbCUhCwpH0KV3bcQoczUA/e4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0BC0F80140;
	Tue, 31 Mar 2020 14:25:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82E45F80146; Tue, 31 Mar 2020 14:25:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E6C62F8010D;
 Tue, 31 Mar 2020 14:25:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6C62F8010D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EB9A31B;
 Tue, 31 Mar 2020 05:25:42 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 020F63F68F;
 Tue, 31 Mar 2020 05:25:42 -0700 (PDT)
Date: Tue, 31 Mar 2020 13:25:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 2/5] ASoC: SOF: imx: fix undefined reference issue
Message-ID: <20200331122540.GD4802@sirena.org.uk>
References: <20200319194957.9569-1-daniel.baluta@oss.nxp.com>
 <20200319194957.9569-3-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline
In-Reply-To: <20200319194957.9569-3-daniel.baluta@oss.nxp.com>
X-Cookie: It's later than you think.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-kernel@lists.infradead.org, pierre-louis.bossart@linux.intel.com,
 daniel.baluta@gmail.com, Daniel Baluta <daniel.baluta@nxp.com>,
 kai.vehmanen@linux.intel.com, devicetree@vger.kernel.org, festevam@gmail.com,
 s.hauer@pengutronix.de, yuehaibing@huawei.com,
 ranjani.sridharan@linux.intel.com, krzk@kernel.org, lgirdwood@gmail.com,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 alsa-devel@alsa-project.org, shawnguo@kernel.org, linux-kernel@vger.kernel.org,
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


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2020 at 09:49:54PM +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>

> Fixes: f9ad75468453 ("ASoC: SOF: imx: fix reverse CONFIG_SND_SOC_SOF_OF
> dependency")
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

This has you as the author but you list a signoff by Pierre before you?

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6DNsMACgkQJNaLcl1U
h9AAewf/SRLQsBBj6wlAv5rhKMVQLnmnQY5R9scerh2jz6AEv/pHxINQd4zTWjnh
pIhrebacgZCwofsY/n31xPI/thHIHJIo4bqgKIQs85UkXwCVHXXctSlyWKPsQz7y
yuwX5Wp7Yamg32an6JuCQo3KCVC5kZt9TMT36nkVKSyhdxmVAkDj7x78EjJRPBTV
1kvi+UzHvDghla+wt2olnvA5KfhNc2SlMi7hDBPtXAEnHr3XDwVoeDxIwobdLC4j
KK0gxmGaHrmB5darIqDjRJeRiG9uzurATnY2GJREkJHgOnRV3mZkeOeQ4yFMoAvG
iJphl8WUXrpNLg0rdwTMnxFHXL4fPg==
=aJV2
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
