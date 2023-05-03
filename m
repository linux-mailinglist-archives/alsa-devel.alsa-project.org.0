Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FDA6F4E23
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 02:29:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE1A413DF;
	Wed,  3 May 2023 02:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE1A413DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683073740;
	bh=NYrACsssrmfPGmWOcmRZXfT33+ftG3IlffU7YP1nyHY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mHRFzaYa0t58XdqGmfBMxupybbphJ7LQrZP6A6OXtHCBcjdIDOgDX2SR18pcSGXVq
	 7qJYgT+J/B/pu4nYzbDMeJi9PKeslnqYd7DyQg9e4E3JJBpnbQiIPWiZkUlR7WmoZZ
	 SvS4Uny015kgGq7l3FEXbZ+bLbiD6NjNPwnWkYbI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 058EDF8032B;
	Wed,  3 May 2023 02:28:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29A0CF8049E; Wed,  3 May 2023 02:28:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13DFEF800EC
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 02:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13DFEF800EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tKLGj0WK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B599617EB;
	Wed,  3 May 2023 00:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E9BC433D2;
	Wed,  3 May 2023 00:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683073673;
	bh=NYrACsssrmfPGmWOcmRZXfT33+ftG3IlffU7YP1nyHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKLGj0WKZZ2Jx2liro9O4TKwiTokjOB7MujVV/4BMu708nhKYKULt7NqfT4I8zJ7u
	 haUCLNNiID4OoFA+dgqh0H2o58AmbGH7Bn+pZGlKx3wr338oqwqwUICg2RJ0Digp6d
	 /5EWpE8FlXGIjir90U1Pe+gwOgD6oNUymU9C040eNEyWmj86ngkArJemNNVruRXxzw
	 ZZrUnNBSiv4HLyzZivkUPBVA4Mu1xwErVMiNWPptQ5k3W7jx2pn06W1w70BDPEGMGv
	 K29KmhS20iGrZo6J3R7Tlj+Dp6AQcZf5GFfCAz+aoOsXxp0dA22X3uCTC/pPPQLFjj
	 WMQkzH4PR530g==
Date: Wed, 3 May 2023 09:27:48 +0900
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <13916275206@139.com>
Subject: Re: [PATCH v1 3/5] firmware: tasdevice_fmw: tasdevice firmware
 loading lib
Message-ID: <ZFGqhM0VYFdorkRa@finisterre.sirena.org.uk>
References: <20230502053235.27066-1-13916275206@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jHuLl3Qdr+Gp3RDN"
Content-Disposition: inline
In-Reply-To: <20230502053235.27066-1-13916275206@139.com>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: AUNHS47TX5BVQ2I73EODUU5W552C4SN5
X-Message-ID-Hash: AUNHS47TX5BVQ2I73EODUU5W552C4SN5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com, navada@ti.com,
 gentuser@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AUNHS47TX5BVQ2I73EODUU5W552C4SN5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--jHuLl3Qdr+Gp3RDN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 02, 2023 at 01:32:35PM +0800, Shenghao Ding wrote:
> Create tasdevice firmware lib.

>  drivers/firmware/Kconfig            |    1 +
>  drivers/firmware/Makefile           |    1 +
>  drivers/firmware/ti/Kconfig         |    5 +
>  drivers/firmware/ti/Makefile        |    3 +
>  drivers/firmware/ti/tasdevice-fmw.c | 2380 +++++++++++++++++++++++++++
>  5 files changed, 2390 insertions(+)

Given how large this part of the code for these devices is it definitely
makes sense to split it into a separate commit like you've done but are
there any non-audio devices in this series which will share the same
firmware style?  If not then it probably makes sense to keep the code in
sound/soc/codecs, though a separate file would still make sense.

There's some devices that do keep firmware interface code in the
firmware directory but in those cases the devices have other, non-audio,
functionality which also uses the firmware (eg, always on monitoring)
but I've not seen any of the tas devices like that.  If there are some
then the split you've made here makes sense.

--jHuLl3Qdr+Gp3RDN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRRqoEACgkQJNaLcl1U
h9DwJQf/c04X1IDM9RQnB9HFoA2w4Yrd+wID6cNDcMHE05So35+rSAErad/PhU1k
1pu6mTeujT/5RanZL3cElVkqNaKgGy3bY0Aewu4BB6Jp0AkkM9+uk02lG6KHsnB3
ZPWke1iHD1uMIyNYAUm9mQM3pTYCmva2EI9/k6vBfAcfuVhBWDgke6GabRPtoaeh
tpND2K9ckr41xRW0s8GW+SJ+dH9E88V66qGoqez28A/iHjYUupdwEpQAzl6d7R5U
ICP0sv/RgamEp6yYLT/dj+muh/+gbyanTYvfKDPLfGKKUB8c84gCn4sKbQpEDaSf
anNb6TU9LQsQRxu8cijdPQ0YwrAvYg==
=KUlJ
-----END PGP SIGNATURE-----

--jHuLl3Qdr+Gp3RDN--
