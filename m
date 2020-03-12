Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 583911837F8
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 18:48:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1139173C;
	Thu, 12 Mar 2020 18:47:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1139173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584035299;
	bh=0xugY3eBjcWN0mHlOPkR37sG1nv9DlkZJ2yQg22bCZ4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k3XIyfWr8LZolwXrD06+BM2rQ0ICzwXvAHdVSgKHT68jL8mzvrYLDNm7ch6mwaaTx
	 PpRJw4ykkofYx/rWrtKoUT1CcdsEia7Jh7n1B1yK8IySLBK1Xg5GpGu9RoHzdEesix
	 AFP1SMhOn5k+HG2vulBbj4cAex6uMIgG0dq+D4S0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7BBBF8021C;
	Thu, 12 Mar 2020 18:46:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A23DCF8020C; Thu, 12 Mar 2020 18:46:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C9C77F800BE
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 18:46:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9C77F800BE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C597930E;
 Thu, 12 Mar 2020 10:46:31 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4565A3F67D;
 Thu, 12 Mar 2020 10:46:31 -0700 (PDT)
Date: Thu, 12 Mar 2020 17:46:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v5 4/7] ASoC: fsl_asrc: rename asrc_priv to asrc
Message-ID: <20200312174629.GI4038@sirena.org.uk>
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <8282b290d39dd8dae5da02f5cbb3f647fa778aa0.1583725533.git.shengjiu.wang@nxp.com>
 <20200309213016.GC11333@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PWfwoUCx3AFJRUBq"
Content-Disposition: inline
In-Reply-To: <20200309213016.GC11333@Asurada-Nvidia.nvidia.com>
X-Cookie: Security check: INTRUDER ALERT!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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


--PWfwoUCx3AFJRUBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2020 at 02:30:17PM -0700, Nicolin Chen wrote:
> On Mon, Mar 09, 2020 at 11:58:31AM +0800, Shengjiu Wang wrote:
> > In order to move common structure to fsl_asrc_common.h
> > we change the name of asrc_priv to asrc, the asrc_priv
> > will be used by new struct fsl_asrc_priv.

> This actually could be a cleanup patch which comes as the
> first one in this series, so that we could ack it and get
> merged without depending on others. Maybe next version?

Yes, please.  Or even just send it separately.

--PWfwoUCx3AFJRUBq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5qdXQACgkQJNaLcl1U
h9BEJgf+LDZKX86NoQW0sAyHfoI5bU8JDqMp0vov4A8JY6xc4HBhugGfdjg8WRoa
CaqNzRLw0m6VFU+a/AxSv5OADsO1vkjA08+yXeuWr7wKxasqSAmBwq7tjsa9Cu7S
QB0UowCO1N3Zn7zeWYFoJxiJ1iPlz9rUTDLw6U50yckkct9JlCnTKLmPpO7q5SRN
DSqUC5+8Hc/SZGOSKLoYc1SFqFaNLUxuF7O2harTjFRbWeuEaptWcgmf2CeXgtI0
pFBfaexsGndY8dFMvwkNeD74Yctt4xnefQRXwbMsbfhDpJFdruxSXYNkBHYMsIUk
YzSFifSaFrNhKESXNDY0arVypHltMg==
=rfH4
-----END PGP SIGNATURE-----

--PWfwoUCx3AFJRUBq--
