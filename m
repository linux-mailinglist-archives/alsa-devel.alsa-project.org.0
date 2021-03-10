Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4025D3342F2
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 17:21:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB9221768;
	Wed, 10 Mar 2021 17:20:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB9221768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615393268;
	bh=MCWK3psBoFJjHRqBJ+BedqL5qFZKfMgJ4Ewfdui52Zc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N+xLCGi6R+ol+anBB0kn28hE/fTuRvlNQXNlbxiG63Q87uvQoMJWVrvgU2mniSPAv
	 zlwnGLnC7GnN9uSRKPZEiBbnp3sexXVuuwN/r9uAS9b7VYIZO3Zb/Wv4s46wof2+Nk
	 nfP3J7oQdahw2Q/JLXCnXZqiPETignSX5gJM+HAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3892AF801ED;
	Wed, 10 Mar 2021 17:19:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EF76F801D8; Wed, 10 Mar 2021 17:19:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22792F8012F
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 17:19:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22792F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bc5Xz9h+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5A8064F48;
 Wed, 10 Mar 2021 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615393166;
 bh=MCWK3psBoFJjHRqBJ+BedqL5qFZKfMgJ4Ewfdui52Zc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bc5Xz9h+ogOU8ASFdBZtnp/oUe5ileBhVfke4EZwuA7xIvdEL1W3CdyPMN7VMCgIm
 rhf6ObUazMXHgBD4ajr7AqAg59utJkaC7ZZLG3ayyPmmb4f5ikY/kc6m+oblLKv4aY
 QLhxNCLK7GzUNZHKW+SCfvonn3Cx647m802WOgysmdvmSaYFsuvdQZ15Q0KGI1O216
 lROvKd0A/YCVXAXidaurZyIBviX9seeaayhSrWALtU/nosjx7B7LrV4gy2lKDC4yur
 1Y8DH+ocAFJlMSoHsTccj4MjyOXVZtCj/aI/gpuFuSLuZMGiD7yEe90bK+IFxuRCkL
 zONdGlD/k8RAA==
Date: Wed, 10 Mar 2021 16:18:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-ID: <20210310161814.GA28564@sirena.org.uk>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
 <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
X-Cookie: Yow!  Are we laid back yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 09:44:07AM -0600, Pierre-Louis Bossart wrote:
> On 3/10/21 7:35 AM, Mark Brown wrote:

> > Just change it to a system level check for ACPI, checking for OF would
> > leave problems for board files or any other alternative firmware
> > interfaces.

> did you mean if (!IS_ENABLED(CONFIG_ACPI)) ?

Is there a runtime check?

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBI8UUACgkQJNaLcl1U
h9Bivgf+IeTLhrstnhmT7rt/Qmp3ovzK4sWPOWgMutpLjVu+cVAbSHdOUD0xZyiO
ndVV3pbv9yDWUwTMQt/uVqVUIk6KjsWueG5XaEQN7MMOlW2WGm/T5LiGnIhujn5A
uvBuEvVjQmoZMjyaA/5SAM2cXC2xENfDw7E/seJstkqW2Z+RK/7SstbfFuH5DsgD
cgEZ+LSfY2pE0jtjwY4X+eaZSpWbTiuHyjmtcEcpMTYJXp9sUWERss9+Zbkwld2y
Xf6ysrSvDpYf4ZmckSBjyrXAOEOGSUZXaxnL6Qls0GKlvNQlDVTnFs6WCpSN2hLE
GKMpzfSl0Kp4LLahAhGKU2aSuCsBlA==
=8ZmB
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
