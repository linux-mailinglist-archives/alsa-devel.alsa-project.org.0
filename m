Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BA915935C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 16:40:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98D4615F2;
	Tue, 11 Feb 2020 16:39:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98D4615F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581435637;
	bh=xJMCxDUAKk6BwGxialvlrbGrjnl5S8jSLXFrgQaoElk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=beM2BubNPPJUDRW2sLlXVqDyUrvVLnNKYc5UzxnACdiz5LDK6GFBjHTLhIXFr4MSx
	 YHn9SLyWKUZchPzBs0NRwKO4tG/zuEzRp504bVooaINnYdxFdGsUd0WfjIBZAefNU5
	 boUlzRmdBdHbbZw5/yWHghYjNGLdjJJlIACGD5xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 791FDF80145;
	Tue, 11 Feb 2020 16:38:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A636F80145; Tue, 11 Feb 2020 16:38:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 94BF3F800E7
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:38:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94BF3F800E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 400CF30E;
 Tue, 11 Feb 2020 07:38:49 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B88483F68E;
 Tue, 11 Feb 2020 07:38:48 -0800 (PST)
Date: Tue, 11 Feb 2020 15:38:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20200211153847.GK4543@sirena.org.uk>
References: <1581426768-8937-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
In-Reply-To: <1581426768-8937-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: amd: Buffer Size instead of MAX
	Buffer
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
Content-Type: multipart/mixed; boundary="===============3418200923953766448=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3418200923953766448==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lildS9pRFgpM/xzO"
Content-Disposition: inline


--lildS9pRFgpM/xzO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 11, 2020 at 06:42:28PM +0530, Ravulapati Vishnu vardhan rao wrote:

> Because of MAX BUFFER size in register,when user/app give small
> buffer size produces noise of old data in buffer.
> This patch rectifies this noise when using different
> buffer sizes less than MAX BUFFER.

In what way does this patch fix the issue?  I looks like it's moving a
buffer size setting from DMA to I2S but it's not clear why or how this
fixes the issue, or indeed what the actual issue that's causing what are
presumably underruns is?

--lildS9pRFgpM/xzO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5CyoYACgkQJNaLcl1U
h9DyKAf/ZqhMDhn36gZKS7USGUlNR9zhfLFj4h/Cwx4a0d+eNSjpmYaELKeXq060
kbOYE49cI3V4OnSDP1yoDQ7Tsuz9hQzebIzC+0KJdpCRIGyU10lKhK1pDI8JV3lK
vFofPqpWSGaTUj8abYbTHXyQf2T2ZPQqm14Sx7FQgPSnXI6M0gfo4I9hEyT4oe0E
NJqNs6e8uSUerJdPSDfSeV2hR04V8A8MEd4g4kjDM4ktTqmyv0HetsXFMiAfH3wF
ws4lB18nTxEDkvq1pZL/3Vfp5GVs8HVU1qWcJHgtUoZ5yLFUAF96MnAhPabLz2xH
V6keJYLuBDl29iEV1T20hO9NFdt7aQ==
=Evcz
-----END PGP SIGNATURE-----

--lildS9pRFgpM/xzO--

--===============3418200923953766448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3418200923953766448==--
