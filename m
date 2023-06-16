Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A90057339D0
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 21:26:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5106F836;
	Fri, 16 Jun 2023 21:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5106F836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686943584;
	bh=c1OnX/cRQqEAmas3vfAVpdSQTx656Jtoc+CNgeUnuok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f006OevY0sat68f3b+aRq7RJdF3Z+T8cSYaSX/VVaEy4duPSBa6mgPYRmHzaT+8Wv
	 p5f5q/kk/jlGUxfIR+3nhy7jgLUf8ePrv8KdhOViLRb8ciWQp4K44Wg4LtznYN0u7y
	 zEGvpCd+AAWcRTEvRqmqSbD1Qay71Avs2cg/ejMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDD2BF80132; Fri, 16 Jun 2023 21:25:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6A5AF80132;
	Fri, 16 Jun 2023 21:25:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBEC7F80149; Fri, 16 Jun 2023 21:25:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 534E0F80093;
	Fri, 16 Jun 2023 21:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 534E0F80093
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 3B2201C0E71; Fri, 16 Jun 2023 21:24:55 +0200 (CEST)
Date: Fri, 16 Jun 2023 21:24:54 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH AUTOSEL 6.1 28/57] ASoC: SOF: sof-client-probes: fix
 pm_runtime imbalance in error handling
Message-ID: <ZIy3BsIKVkfuolO6@duo.ucw.cz>
References: <20230525183607.1793983-1-sashal@kernel.org>
 <20230525183607.1793983-28-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2zJgghhj21IUPJmD"
Content-Disposition: inline
In-Reply-To: <20230525183607.1793983-28-sashal@kernel.org>
Message-ID-Hash: WKE4DTNEY2L2DTJLGT2LQKRTJUDALZ7Z
X-Message-ID-Hash: WKE4DTNEY2L2DTJLGT2LQKRTJUDALZ7Z
X-MailFrom: pavel@denx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKE4DTNEY2L2DTJLGT2LQKRTJUDALZ7Z/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2zJgghhj21IUPJmD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There are problems with sign-off chain:

> When an error occurs, we need to make sure the device can pm_runtime
> suspend instead of keeping it active.
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com
> Link: https://lore.kernel.org/r/20230512103315.8921-4-peter.ujfalusi@linu=
x.intel.com
> Signed-off-by: Mark Brown <broonie@kernel.org

">" is missing at the end of lines. Same issue exist with patch 29 in
the series.

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--2zJgghhj21IUPJmD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZIy3BgAKCRAw5/Bqldv6
8sX6AKCEkTFkpXdc6+RUh29AoVqI5UUGowCgrlkOt6/IHkzOxXnDBB5R0J0aT2s=
=ZGl3
-----END PGP SIGNATURE-----

--2zJgghhj21IUPJmD--
