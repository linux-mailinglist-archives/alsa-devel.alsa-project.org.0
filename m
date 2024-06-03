Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F708D81F9
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 14:12:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9330C7F8;
	Mon,  3 Jun 2024 14:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9330C7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717416775;
	bh=lfdsBvkspToag3c/bUTNykKvotNjW4bx0y0kYS1g6DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nqs6liO8AsCoxKrEBjhQ7EXy2rqijjEqKckgOSMwYU+xysy5NQvwy+ZQ4RiZkg5l8
	 5Wl5YCGXxT1bxGTwDzxH1jZyNgHU7iH580UOlQNgMSa/cxPFZqVvqUVVXJMSaIEVe9
	 9VZaiYen/lLseH9k8vre1Schf1/YNOSDpCaMJ6TE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6861DF805AD; Mon,  3 Jun 2024 14:12:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22417F805A0;
	Mon,  3 Jun 2024 14:12:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A4C3F8025A; Mon,  3 Jun 2024 14:12:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C9CCF80088
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 14:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C9CCF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J+nACH0N
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 200A7CE0B7D;
	Mon,  3 Jun 2024 12:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BD0C32789;
	Mon,  3 Jun 2024 12:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717416719;
	bh=lfdsBvkspToag3c/bUTNykKvotNjW4bx0y0kYS1g6DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J+nACH0N3OERh+uTdpTd1+TVluP5kqPo1Oo6tP+KKUeE9/WuE3z4YTlDgEbmH21BT
	 y05bLUgOC9kWbCtFyTKUHDjyCuOp76EPRI4Ek1Elm8x73DFX4vxQNCam2Z5iNfe/i7
	 DgK57ezDygRoz1qvg80prkeWuwYbsAGEM/lw1FSZtn0IwWGS6V5bpELYdRihxIuEDu
	 yCzNwpkOKwxFA4Gpe4aTKPPb0fS8fagSmk8H+u+G4evgQcpDec454LGPaiDVosjDoD
	 L4lo8iXqMi9pGez80iYHdgyfF6yzIpwYJRPND3ajsezj5jioK2gwh6xO5byJJnE0Ob
	 flE6jrZ1Z5vbQ==
Date: Mon, 3 Jun 2024 13:11:53 +0100
From: Mark Brown <broonie@kernel.org>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"tiwai@suse.de" <tiwai@suse.de>, "Xu, Baojun" <baojun.xu@ti.com>,
	"soyer@irl.hu" <soyer@irl.hu>,
	"Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
	"yuhsuan@google.com" <yuhsuan@google.com>,
	"Yue, Jaden" <jaden-yue@ti.com>, "Lo, Henry" <henry.lo@ti.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"Hari, Raj" <s-hari@ti.com>,
	"zhourui@huaqin.com" <zhourui@huaqin.com>
Subject: Re: [EXTERNAL] Re: [PATCH v6] ASoC: tas2781: Fix wrong loading
 calibrated data sequence
Message-ID: <90d891b7-1978-4a6c-86c6-bb693ce764d0@sirena.org.uk>
References: <20240518141546.1742-1-shenghao-ding@ti.com>
 <171623322336.94469.13172149100331733795.b4-ty@kernel.org>
 <138b621eeccc47329ec5fc808790667f@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t56nSOAk9HiTDqnB"
Content-Disposition: inline
In-Reply-To: <138b621eeccc47329ec5fc808790667f@ti.com>
X-Cookie: Don't let your status become too quo!
Message-ID-Hash: BI4XZTNT2DU3EWXLY5LEQ2R6NU6JUZR3
X-Message-ID-Hash: BI4XZTNT2DU3EWXLY5LEQ2R6NU6JUZR3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BI4XZTNT2DU3EWXLY5LEQ2R6NU6JUZR3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--t56nSOAk9HiTDqnB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2024 at 01:11:39PM +0000, Ding, Shenghao wrote:

> One of my customers requested tas2781 driver in kernel 6.10 to be merged =
into kernel 6.1.=20
> I wondered how I  can handle this. May I resubmit the whole code into lat=
est 6.1 branch?
> Looking forward to your reply. Thanks.

You'd need to do something yourself - the stable kernels themselves
don't add new features, and I think v6.1 is not updated any more anyway.
The usual thing would be to do a backport and then publish it somehow,
some vendors have git trees they use (some use github), some share
patches via e-mail but there's a bunch of options there.

If this is for some OS vendor (or for use with a specific OS) you may be
able to work directly with them to add the driver, some OSs are open to
that but some aren't.

--t56nSOAk9HiTDqnB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZdswgACgkQJNaLcl1U
h9DcVgf/RD2+kBh2SKALVqSZ99xuZFSd990nWdqi3Aim8rirFq0UVLho/uxX8/9+
+LdSe+lxv7oe6obTwdi+HHSOGc6dT21CKgpTXNLEyMid6W44zfVbSJdD6f7g4CXD
35MolBudlb3YCMfWttDYYeLzeBH1WG2dT9v1CK5R5zbhUGStgkU3ckg/QStOV0n6
0yLlupgJnhL+VeBtqvxaqgj7DMbDcoyKK4Fo5z1R2/fyJt0pJey7fzk2vUZVwH62
Zg0P7cGy3P+T58UnYIrkLWOFxdQ4V3X67q10waHTOFk/X3pkS0zqsavhxBE4R+Bp
fWaKvle81uJXipvaT4SJs34ce76yfA==
=cwAZ
-----END PGP SIGNATURE-----

--t56nSOAk9HiTDqnB--
