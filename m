Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F45798630
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 12:51:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CB54832;
	Fri,  8 Sep 2023 12:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CB54832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694170298;
	bh=ZSWpv6f67wgG58fbLgFGlk1364L8vHRxR8dNE9OwY+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D7TjFBo1YBLzu9a0R1mok8jQWnriB6Suv1JBup9drxLtl3Blk5lzEohlbM02Mx6VD
	 NftT9E64WXkTF421KBAo4Cq5iy1Cf3zdyyVTrIaGECv+IU9q4gYNv/V80bqE0azR//
	 OGH8MnBQagRNKijliWKFDGk8yKuNeu+KQaDT5T14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79217F80552; Fri,  8 Sep 2023 12:50:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB363F8047D;
	Fri,  8 Sep 2023 12:50:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EAC5F80494; Fri,  8 Sep 2023 12:50:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E70D6F80236
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 12:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E70D6F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W7/f0fv2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 3EC77CE18C1;
	Fri,  8 Sep 2023 10:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA26C433C9;
	Fri,  8 Sep 2023 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694170229;
	bh=ZSWpv6f67wgG58fbLgFGlk1364L8vHRxR8dNE9OwY+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W7/f0fv2Fg24nYEenjrx/redQRUwV9ICopaR0NdmE4EV8hmRlprH4AkmoI2Jg24Tv
	 1lNz8Gthr4HyC4RRV1KeFcSv8t+iugglLM85m7ycYCKOmiIKRMEXQt5U/Q1HOtIw1m
	 cSwhYQMKTz1Dcq9POPLjBQJbcKckQxNNyDQItcqCm/lzjOSop5T3vow437FOW4fANf
	 4vEFscuGhAnxyuQaaRACxNohyqjpxjF8lBbjYX7yUhDyXASO5cFhrZrKRCPbf/k95t
	 FcJegCVBsgTtazhA75xX6x62nLaTI1kV9DAycmsTySt9zONA4rIpreeQfVzQ4HnfT3
	 FP8e5Kp3s487Q==
Date: Fri, 8 Sep 2023 11:50:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Myunguk Kim <mwkim@gaonchips.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Uw e =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ASoC: dwc: Add Single DMA mode support
Message-ID: <13ca65a8-c3cd-4bb3-b058-4d6303474748@sirena.org.uk>
References: <20230908035449.2211723-1-mwkim@gaonchips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qSFCahxkwBz/kXdc"
Content-Disposition: inline
In-Reply-To: <20230908035449.2211723-1-mwkim@gaonchips.com>
X-Cookie: My EARS are GONE!!
Message-ID-Hash: VLABOCIBBGR2BDQM65UFMA7FWOFMBX2W
X-Message-ID-Hash: VLABOCIBBGR2BDQM65UFMA7FWOFMBX2W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLABOCIBBGR2BDQM65UFMA7FWOFMBX2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qSFCahxkwBz/kXdc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 08, 2023 at 12:54:49PM +0900, Myunguk Kim wrote:

> +	#define DW_I2S_QUIRK_NOT_SUPPORT_BURST	(1 << 3)

_NO_BURST might be a slightly less awkward name.

> +		if (of_get_property(pdev->dev.of_node, "not-support-burst", NULL))
> +			dev->quirks |= DW_I2S_QUIRK_NOT_SUPPORT_BURST;

The new property needs to be documented.

--qSFCahxkwBz/kXdc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT6/G8ACgkQJNaLcl1U
h9CvTQf+KXCFcsxokWQOrmQY7s0TYYSztjz4+rbKZx4KzA5Dcsriw8E9a3inQ/hp
rzlQj4RN4u33D3ny5IaxKW7kZnc2vJxBpkf2J/SA7ulnAu2MRsX7KaO0quuTFhGD
+XQAQPAAYycBQXEaudOscT04BwtWabUVWE0MBYK9S4DiKV2l4+3z67VDaNf4OFa6
cGZErZAZhRCleWaZQPYaemKHYAi362V7cKblgz1Jd74lXdvn247ESddrOyD2l+GJ
KHd8NLYJ2Uuaf08wPdInfq4lehGZk1UIjrxOZgxGrgip8Bkz3Dgl5sImC34fbRXR
NuEEWixfKv/qEBWliEhfyvRBoZnOuw==
=Avmr
-----END PGP SIGNATURE-----

--qSFCahxkwBz/kXdc--
