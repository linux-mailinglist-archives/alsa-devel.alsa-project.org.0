Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8074914432C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:28:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AD2A166C;
	Tue, 21 Jan 2020 18:28:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AD2A166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579627733;
	bh=uAuPBPZVySCKwNacwTYOizlDfe6iHdphingqiHgLQuw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k77E9yocWHbycpecq5ZO3mQAZAhHeUxS0a9QoIz+R1SJ1WUeO63xvm0UuYxQnPaGC
	 xzpqFE17Of0AlV+ujEE0+PbDzvWnH6hnPIiVH5AwWc892o/bS2EF6Ugo+Nzll2KjGp
	 X5R8FMVLzmh3MAActjevk/5nvjfzfOGYkHh616MY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D452F801ED;
	Tue, 21 Jan 2020 18:27:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7438CF801D9; Tue, 21 Jan 2020 18:27:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2A2D5F800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:27:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A2D5F800E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3040E30E;
 Tue, 21 Jan 2020 09:26:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A064B3F6C4;
 Tue, 21 Jan 2020 09:26:58 -0800 (PST)
Date: Tue, 21 Jan 2020 17:26:57 +0000
From: Mark Brown <broonie@kernel.org>
To: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20200121172657.GK4656@sirena.org.uk>
References: <1579603421-24571-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20200121165925.GH4656@sirena.org.uk>
 <DM6PR12MB3868B9744A40D41450155534E70D0@DM6PR12MB3868.namprd12.prod.outlook.com>
 <20200121170811.GJ4656@sirena.org.uk>
 <DM6PR12MB386893EE3876B51B35A1787BE70D0@DM6PR12MB3868.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB386893EE3876B51B35A1787BE70D0@DM6PR12MB3868.namprd12.prod.outlook.com>
X-Cookie: You too can wear a nose mitten.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: amd: Fix for Subsequent Playback
	issue.
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
Content-Type: multipart/mixed; boundary="===============6302148324100255553=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6302148324100255553==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zPXeIxDajdrcF2en"
Content-Disposition: inline


--zPXeIxDajdrcF2en
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 21, 2020 at 05:12:42PM +0000, RAVULAPATI, VISHNU VARDHAN RAO wrote:

Please fix your mailer to quote replies normally, it's hard to read your
mails.

> In what way is it part of the fix?  This at least needs some sort of
> explanation somewhere, the changelog at least if not the code.

> When we play subsequently we hear last played sound for moment.kfree clears the structure.

If the rtd is still being referenced after the kfree() you have a use
after free bug so there's a serious problem there and this change is
introducing a bug, you can only free things if they are not in use.  At
a bare minimum I need the changelog to clearly explain what the cause of
the clicks is and how the change fixes that.

--zPXeIxDajdrcF2en
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4nNGAACgkQJNaLcl1U
h9CM4wf9HXTZtK9+VuEbzuneGipxxDkweRo9fNWDmS99cGqfZ4b02i/Cudd1lseC
UFrh2Wdi+7RL5mSZhaGqi9XSgfgrl+rVPtX/MTKZ81OjzU49YIoMBf7jGi5Hvt7f
8wfoyzpnQ+mPecpWLQr9K2krccs2I/H40U/qOY9YHYraAKq1sM3qYZL0jKa45PYH
CL80QIqHSVKyf6k3aptNYv045aqVKyZ992lSmGBa2zud+kdsUEimJNtado1bm3fX
QSthv9uf8J3sOBJZ76yjDPRt9miQ1qt8DSsPCw+dJ9zONy8ZSVN68EshAhFhqMvH
khbp0nAECP4U9cdYcWW2Ni2gaNqSVA==
=Bp1m
-----END PGP SIGNATURE-----

--zPXeIxDajdrcF2en--

--===============6302148324100255553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6302148324100255553==--
