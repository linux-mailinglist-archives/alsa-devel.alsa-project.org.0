Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FCE14310D
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 18:48:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C7A1671;
	Mon, 20 Jan 2020 18:47:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C7A1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579542514;
	bh=+eLnneJSGuqR/dz1v6inVr2PieGPBKxlYKo4LoHMjY0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=au34LXZvhKwh6bhoj3T0Pzqa06pwuHtuxkuZzNY1DtVhZ6dZi091Jobgvwawrsh9d
	 7+6i2AGxvZ3qqm6oG1EHuVypzvV5kV/mXNlkzkZlZQ9z+W84hihlmQB+nwsV2Mth1k
	 2wRrYUm/YjaQQO45Z3q4KYXMBO4Eg7NVRV8iwZSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97FC0F8022D;
	Mon, 20 Jan 2020 18:46:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D343F8020C; Mon, 20 Jan 2020 18:46:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1D602F8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 18:46:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D602F8012F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20BF531B;
 Mon, 20 Jan 2020 09:46:39 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9349F3F68E;
 Mon, 20 Jan 2020 09:46:38 -0800 (PST)
Date: Mon, 20 Jan 2020 17:46:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20200120174636.GI6852@sirena.org.uk>
References: <20200120160801.53089-1-andriy.shevchenko@linux.intel.com>
 <20200120160801.53089-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200120160801.53089-9-andriy.shevchenko@linux.intel.com>
X-Cookie: I invented skydiving in 1989!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 x86@kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH v2 8/9] ASoC: rt5645: Switch DMI table
 match to a test of variable
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
Content-Type: multipart/mixed; boundary="===============8042850965643662536=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8042850965643662536==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KrHCbChajFcK0yQE"
Content-Disposition: inline


--KrHCbChajFcK0yQE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2020 at 06:08:00PM +0200, Andy Shevchenko wrote:
> Since we have a common x86 quirk that provides an exported variable,
> use it instead of local DMI table match.

Acked-by: Mark Brown <broonie@kernel.org>

--KrHCbChajFcK0yQE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4l53wACgkQJNaLcl1U
h9DIrwf6AsprEx6YCK24bZdaV78Npclx27lelAxU1lZFUxtb9LDQpSeDKlfMxwS6
y6Onh8a4whYq1rRKC5VhhhIxlmRnZStNOPj67ZAguIOGYudh3gLGdptGDbfYJ4uP
iCqZM8VCvStSlRUBEhrrBXjgXooJSX3YbarO8bt2Z7IAxi9yitgXW69aAHqy5j51
PxWPDL5AyAVxnBCWUdxbeb3h3NRE6q5DdaCZGbNrAjxky0tAXKPfWHQ/7MfqQlYa
ET8Z6S4iEt0JMiTQot8TIHKoTlv6mhQpfnciriNDxxt9bIAnUFv0Qxqw4+Y1tdE5
SwoeSenvdt67uSM6SFXKP+Nj8vrneQ==
=OzLd
-----END PGP SIGNATURE-----

--KrHCbChajFcK0yQE--

--===============8042850965643662536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8042850965643662536==--
