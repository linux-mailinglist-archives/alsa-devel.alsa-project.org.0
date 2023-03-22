Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDEF6C4F72
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 16:30:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05259E94;
	Wed, 22 Mar 2023 16:29:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05259E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679499031;
	bh=2zoPJMnWq/u/bTluQqdM/f2vCtvdx4CTaSygIbhGhJA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NEh788cZRmtFcEMPP3VCMrFLx1aoC+eWEJkqYZMWFYX+saymQ8VAcb21cy+jD/d54
	 mMIcp+YoNRvLHNBzws2/S1zyXydVsMuOicDPkGLkrzdGNsqxb7s2699IlG6nKWyihe
	 HP240NRZ1x2LdjWHY8b0iyMvCpewjyLjpTQOGbFI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1AD4F80254;
	Wed, 22 Mar 2023 16:29:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5370DF8027B; Wed, 22 Mar 2023 16:29:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3CA7F8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 16:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3CA7F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dqsa1Lc+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 77FC0CE1DEF;
	Wed, 22 Mar 2023 15:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E3CC433D2;
	Wed, 22 Mar 2023 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679498880;
	bh=2zoPJMnWq/u/bTluQqdM/f2vCtvdx4CTaSygIbhGhJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqsa1Lc+lWmwECLKMjcqQg1I7UfauF7FyMZBjAOtGkiLXfap7dxYrQV2YofrW0yGj
	 X/Q7oLweoY4D03Y25L4HSW3G5+RcflQNXRUC0kWiQloG90cdlPUgJNrmQfQjziX7cH
	 r1sNoPHemlSV7yqx5zQtrU6DdfhAGSRz+KK8em2SdQHbX4Mlt0+hosBx18oF9aQxoo
	 5HVfnolU6GTF1JWf9E/x2VqjFdlXFcBvhEEObeTRb7tmSTDRaBRef8Vs63jrqA9Chx
	 S+Es6cG2wmZ2Xrv3HtwpSHIIKcoxfXGLkRpgOqrZp2uVYsCcTvU80/hsONoAIYvm4y
	 R/cltOGI4iWkA==
Date: Wed, 22 Mar 2023 15:27:57 +0000
From: Mark Brown <broonie@kernel.org>
To: "Sarha, Jyri" <jyri.sarha@intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: SOF: ipc4/intel: Support for ChainDMA
Message-ID: <ZBsefQsoRHJDiju2@sirena.org.uk>
References: <20230322135927.7668-1-peter.ujfalusi@linux.intel.com>
 <ZBsK5mJUfHSyrlU5@sirena.org.uk>
 <578daea5b7bc0db3164c84e550b24bd724de9ebe.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Krty86AUnvl/yIiV"
Content-Disposition: inline
In-Reply-To: <578daea5b7bc0db3164c84e550b24bd724de9ebe.camel@intel.com>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: XZBF3OWCHKKAPDYJGWDXB2JU6RRUVBSV
X-Message-ID-Hash: XZBF3OWCHKKAPDYJGWDXB2JU6RRUVBSV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>, "Wang,
 Rander" <rander.wang@intel.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "error27@gmail.com" <error27@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZBF3OWCHKKAPDYJGWDXB2JU6RRUVBSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Krty86AUnvl/yIiV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 03:15:23PM +0000, Sarha, Jyri wrote:
> On Wed, 2023-03-22 at 14:04 +0000, Mark Brown wrote:

> > Please do not submit new versions of already applied patches, please
> > submit incremental updates to the existing code.=A0 Modifying existing
> > commits creates problems for other users building on top of those
> > commits so it's best practice to only change pubished git commits if
> > absolutely essential.

> Hi Mark,
> Would a git fixup patch do at this phase, or should we do just a
> regular patch with

To repeat what's quoted above "please submit incremental updates
to the existing code".

--Krty86AUnvl/yIiV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQbHnwACgkQJNaLcl1U
h9CvBgf+IHb6ZSl2PAmAyn4Hny1Yw65TBE9FO7E7RShE8/BtiNgRrAhCUZYyX3vl
q96rcHjb7/2SIyZgySbvnb9b547TJFze21YqzCMwZZaSwfFmo7ZsupauUW8LOpmq
NiqwOvlpR/0EwcPYKLJERCBfmdPxagpffMDI5prQIL41s6XWgPbZSOo2KI2E1bcs
23zQ54HG+BXevBTpgC+ftijp/fjkk5LyAmFRa4Ppp7mAzPcbd78QzZrcOp/WjMPU
SePd2tmallrcEds+O6OFtBVZGsKz190+zAOOQKdcnRHvB0collQP68AlHDqvoZ+m
9RxL0ZjZkMgOSRZXQ+i04Ke8aBBsqQ==
=ht+Q
-----END PGP SIGNATURE-----

--Krty86AUnvl/yIiV--
