Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E9C73E0A9
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 15:30:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ED8D86E;
	Mon, 26 Jun 2023 15:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ED8D86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687786252;
	bh=ehLHb1RaOcUfG+7IZea2m2p8XSolF2Z1Rc+ScCZMMSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h/wcN+NknQnS1LyQkcA4rDMLwdl/pvQVJKdssYWZGJNx/wMROf70/I2IUQpypgG1N
	 W0YantSbDmMf/M1HWAWlRVFrb7OT2jClh+ox0OIxEAmh+NU1azdMKROTzYSo6gF6bR
	 4q6XYzc8EbEvL9bb7iRynxapOJJkDZbPKNOfLEWI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A22EBF80169; Mon, 26 Jun 2023 15:30:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3941F80093;
	Mon, 26 Jun 2023 15:30:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4574BF80246; Mon, 26 Jun 2023 15:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27CACF80093
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 15:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27CACF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GbQvr5gh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1263260EA9;
	Mon, 26 Jun 2023 13:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A88C433C0;
	Mon, 26 Jun 2023 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687786184;
	bh=ehLHb1RaOcUfG+7IZea2m2p8XSolF2Z1Rc+ScCZMMSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GbQvr5ghOUDaGI288BIeJ6JwK7aOMs1W33UezDpEXEIR75+EC40Z+/A6qAODDiMPL
	 6UIgOecebxc9sTXCyVEOoBabNM1J50ZSsbqZspLYkKa1W9U2kvEzNVR/gPFCpxLG83
	 y1176v09ngDEC/LHktFAFtvkc7WqFjRszbwZDAt5b80IDnsJBb7FFq38LJ+w+hYEye
	 cWB53DG2bOp2kGazx72O4qP9/cVJ83lc/7vNWv0rEAyh41AZ/oLqERTIwh5Q3vC2o/
	 zIIrL4k2UNjjIJBXbziWOGwgAA6LxuCpL2iSzxnDIongdSR14g+9LRz4j0uw3axAaI
	 QMWe3Td43BocQ==
Date: Mon, 26 Jun 2023 14:29:38 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	oder_chiou@realtek.com,
	Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	vinod.koul@linaro.org, "vkoul@kernel.org" <vkoul@kernel.org>,
	"Katragadda, Mastan" <mastan.katragadda@amd.com>,
	"kondaveeti, Arungopal" <arungopal.kondaveeti@amd.com>,
	"Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [BUG] ASoC: Use the maple tree register cache for RealTek
 SoundWire CODECs
Message-ID: <d305c960-afe8-49b0-8583-a3f168311cf5@sirena.org.uk>
References: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
 <b8af4050-85e7-6974-9c44-c26cb6962972@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7GcTA/om1rjWkCw3"
Content-Disposition: inline
In-Reply-To: <b8af4050-85e7-6974-9c44-c26cb6962972@amd.com>
X-Cookie: Nihilism should commence with oneself.
Message-ID-Hash: K6QRPGQZNTSPKPAZKP6FM6ZCU2HSJZJZ
X-Message-ID-Hash: K6QRPGQZNTSPKPAZKP6FM6ZCU2HSJZJZ
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6QRPGQZNTSPKPAZKP6FM6ZCU2HSJZJZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7GcTA/om1rjWkCw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 26, 2023 at 07:00:31PM +0530, Mukunda,Vijendar wrote:

> With cache type changing to maple tree for SoundWire Codec patch series, we are observing
> rcu warnings with AMD SoundWire stack.

Do you you have 0cc6578048e0980 ("regmap: maple: Drop the RCU read lock
while syncing registers") in your tree when testing?

> Below are the pastebin links for rcu warnings dmesg logs.

> https://pastebin.com/6sadwNCw <https://pastebin.com/6sadwNCw>

Please include at least some of the actual warning in your emails so
they are directly readable.

--7GcTA/om1rjWkCw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSZksEACgkQJNaLcl1U
h9CFvQf9EiUzY0LKzTIS6a9H0r1rIGY6rY1qIU2UbyalhKtUMfBrETx/nNUYqW4v
qSZWLqgHJNE4/xiiw/ImNHeNsnHaa0X8TeXLND2NBqMGqZRVW+54oXPnF3LEvvj2
L2tAH5jZd/Sk0FD0DnFiAjyaoffRPjix5NBzxyx3yMaIlgD/AJZFYFGbMMTCesgd
9pry2MrSUn1Kf8QasNohLN2/Cpc43zIpS7Bo6dUDyLf2fagOYkkz47kgiRc0AQXR
TjbHbtpKxZsxS5/u8LRgIdBpoFL1+qh8G2nqz6xpwyr1vMPmCBYGfHqqufba8ShC
gVsuilMxWNLrc1TabY2Hvy/tqNDGQQ==
=KzPm
-----END PGP SIGNATURE-----

--7GcTA/om1rjWkCw3--
