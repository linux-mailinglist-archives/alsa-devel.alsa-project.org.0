Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D8126348
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 14:17:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6AE5826;
	Thu, 19 Dec 2019 14:16:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6AE5826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576761468;
	bh=qwCVA0yll8zX1ldSYS5eFSoYPA2O1ei1e84bbJHMKQc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IWKvB8OAlIPVuFV7ptBxOkHwwpqccLoOClZVF/UOdRjMI0C4L7VFtcgXpPyIixDF8
	 guWqqxBvEg0W3PrTnWTmFsn3Rd2iYlK34sKikdsvx0DJ+sfMTqA6sKEG5moTycPKqt
	 6/VAUVB788i+njefr9or76Ja++oQtspVWZmCT3qE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C4EBF80218;
	Thu, 19 Dec 2019 14:16:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85F01F80234; Thu, 19 Dec 2019 14:16:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6B216F8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 14:15:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B216F8014F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9FC5328;
 Thu, 19 Dec 2019 05:15:57 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D56373F67D;
 Thu, 19 Dec 2019 05:15:56 -0800 (PST)
Date: Thu, 19 Dec 2019 13:15:54 +0000
From: Mark Brown <broonie@kernel.org>
To: vishnu <vravulap@amd.com>
Message-ID: <20191219131554.GF5047@sirena.org.uk>
References: <1575553053-18344-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1575553053-18344-8-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <3688990f-0ac3-08bf-20b8-93a4ab17441e@amd.com>
MIME-Version: 1.0
In-Reply-To: <3688990f-0ac3-08bf-20b8-93a4ab17441e@amd.com>
X-Cookie: I smell a RANCID CORN DOG!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 pierre-louis.bossart@linux.intel.com,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Alexander.Deucher@amd.com,
 djkurtz@google.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, "Tabian,
 Reza" <Reza.Tabian@amd.com>
Subject: Re: [alsa-devel] [PATCH v14 7/7] ASoC: amd MMAP_INTERLEAVED Support
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
Content-Type: multipart/mixed; boundary="===============6467988475995695344=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6467988475995695344==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sDKAb4OeUBrWWL6P"
Content-Disposition: inline


--sDKAb4OeUBrWWL6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 11:59:56AM +0530, vishnu wrote:
> Hi Mark,
>=20
> Patches have been reviewed by Dan and pierre-louis.bossart@linux.intel.com

I see no reviewed-by tags on most of this.

> Please can you upstream these please.

No, I will review them first.  Given the problems that have been seen on
previous reviews I don't intend to rush that.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--sDKAb4OeUBrWWL6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl37eAkACgkQJNaLcl1U
h9CVpAf+K32nHGUcXJWEpJjWpcGVQiWjEjbsF9z+jhCBspPCGKsl08RI1cXbo87P
/OjYMebtkwJqflBz5c947lIF2SA9ofMD6uu4y+C5/JfaSDkz2XtRElnRNQq568rz
CsuEikfk3MDeZ8atNXGeh/U/qT5QnJT/9pjUSTiQv0E1dn/fnke715mrjuMLuGGa
WSfl5qgHp7mOF5rGb63PcI4pWK0vo+fs8X+pbOOrR1+IluSE6qSU1aqdggo/4mTA
rzGDIb2FyaMSmhL5muM4atXu02VHkosSZ4Ae9nqY8rWQta9a2tkKyzF+rqJmJTjd
CfpApBIsMtlhkNb4gQ/rAPtXJBkrAQ==
=XtBZ
-----END PGP SIGNATURE-----

--sDKAb4OeUBrWWL6P--

--===============6467988475995695344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6467988475995695344==--
