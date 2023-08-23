Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB684785CB1
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 17:52:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 405B584B;
	Wed, 23 Aug 2023 17:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 405B584B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692805958;
	bh=ADd7oP1/d6c3aMgL14nq5nf0xJcSv5Z92YrLo2vXc+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ia++dd3RQsSlrcp2MUZm00KSYzlBk6kQDSqApbmgV2Gz9lRe7hi341nm2Gl5tjCe4
	 5fZyQrSUGBzTxPO+ePGSv1dWJKIdTYxcG5684n2Ci870sDvio/DyuNJHDb9srOZyTU
	 d7nMSfNj5joPcii7+r0+5k+IEaqtWsPih7N6UtZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 047A7F80552; Wed, 23 Aug 2023 17:51:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D8DBF8025F;
	Wed, 23 Aug 2023 17:51:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AC37F8023B; Wed, 23 Aug 2023 17:51:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5159F80537
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 17:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5159F80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D0Nn8KkX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8E6A8629C7;
	Wed, 23 Aug 2023 15:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5236C433C8;
	Wed, 23 Aug 2023 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692805870;
	bh=ADd7oP1/d6c3aMgL14nq5nf0xJcSv5Z92YrLo2vXc+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0Nn8KkX888lKSilqWK8lqv0YMZVwtNhyxd5E4r9zzLidxs9n0j9WZruAB3jWJYk/
	 sy+wnYP2VA6UnkdZabC3WwRhIrBTTzPFjz2eTNSolzH4a/XbWhNOZw6reQsUBmpMqH
	 aeOb2Nm4hLDHybFqD1sdMoB55lAbl/t51fgyc3cE2PyB7iDadIw7AajUVJyyLlKCdJ
	 HLo+305rjRj94qQbddu33zj/xlfB6X1LvVbfBAt/OEkAxvoj04f+7w98UFTQofBmt7
	 FOXIs6pTXQSJvEEyPr3v247l69Cay3XDuqCSo1ufbicFYsYUQKM9j5w8e13flHrGiH
	 gMMiRiUlw3kng==
Date: Wed, 23 Aug 2023 16:51:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Yong Zhi <yong.zhi@intel.com>, ye xingchen <ye.xingchen@zte.com.cn>,
	"balamurugan . c" <balamurugan.c@intel.com>,
	Libin Yang <libin.yang@intel.com>, Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	David Lin <CTLIN0@nuvoton.com>, Brent Lu <brent.lu@intel.com>,
	Takashi Iwai <tiwai@suse.com>, Terry Cheong <htcheong@chromium.org>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Gongjun Song <gongjun.song@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, apoorv <apoorv@intel.com>,
	alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1] Revert "ASoC: Intel: Add rpl_nau8318_8825 driver"
Message-ID: <2ebbcb7a-bc0d-4f62-9f4b-706f0270b71a@sirena.org.uk>
References: 
 <20230823040755.2217942-1-ajye_huang@compal.corp-partner.google.com>
 <dd6d51b0-cc60-4fb7-932d-1117143d1715@sirena.org.uk>
 <CALprXBYxrwBW6HLP5MwYhFh1_Skei+pLbXd7yNAEuhLTQJLVPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gs3xv5excqw7RFrX"
Content-Disposition: inline
In-Reply-To: 
 <CALprXBYxrwBW6HLP5MwYhFh1_Skei+pLbXd7yNAEuhLTQJLVPg@mail.gmail.com>
X-Cookie: Some optional equipment shown.
Message-ID-Hash: PSWJVYCR3WNYL2EAD5OAITR5WTLT3FNS
X-Message-ID-Hash: PSWJVYCR3WNYL2EAD5OAITR5WTLT3FNS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSWJVYCR3WNYL2EAD5OAITR5WTLT3FNS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--gs3xv5excqw7RFrX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 11:45:09PM +0800, Ajye Huang wrote:

> Please allow me to explain in more detail.
> The 6b8b6892e434 should not be applied into file0yZ50U branch of broonie/ci.git.

That's my CI tree, things in there aren't going anywhere unless they
pass testing.

--gs3xv5excqw7RFrX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTmKuUACgkQJNaLcl1U
h9Aj7Qf+OO9n7pFmDLqmTaZ+TUXsgXxHBU7c2buA+pHaL6GdSYX9Z4BSey6nKNpY
Byr0X9nXoDSeVReO9AhK3aPz1FwlkR8oyI8OQgg1tvSm5eF8rvs7KXtBnwA1xvaA
spaEizonya+TtLhmESmTyQPpxDXqdfscAwEDOgJh4I/lf6rQpcUPknPFrWXYaVJC
9DScI9v70bDXBdEiM01pOe/59gtnfxoWtLu6svNGRNaRIJtLsrf5YZP4I1pquUIN
U0dn9g2I9S0qL/g92/k+DgPszGBpKTzlRWUICmejKyqtjRJuxhdJorU3NArd0L4+
DAXGQbW0vkxQyRszEJ2O4mjYJBnpLw==
=Kv8M
-----END PGP SIGNATURE-----

--gs3xv5excqw7RFrX--
