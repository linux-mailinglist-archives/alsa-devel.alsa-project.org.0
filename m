Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90396726710
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 19:20:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F82E6C0;
	Wed,  7 Jun 2023 19:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F82E6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686158404;
	bh=P0OkWHh8T15luqUNzd510FGVW7eTaLgSpSEUuvgpiI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TB1gdCfPMMKeWwJnA7Z2lDru5yeiMzfTdg008lqu+ox5C+i3Q7zi6tmSupAbQYHY7
	 5pk47mlEFGrn/4poVlEOV1l4AOa4HHScMa278XNy93v1kM9GRgeDFYiQ0Mx2FwHSL1
	 wb6EQyHsGhV+V/iLTyKlcaKCN1c7ldVbUoNQPeVU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D44AF800C8; Wed,  7 Jun 2023 19:18:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97214F8016C;
	Wed,  7 Jun 2023 19:18:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64074F80199; Wed,  7 Jun 2023 19:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D09FEF800C8
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 19:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D09FEF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IDexj8hS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B083B63B0E;
	Wed,  7 Jun 2023 17:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12ACDC4339C;
	Wed,  7 Jun 2023 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686158313;
	bh=P0OkWHh8T15luqUNzd510FGVW7eTaLgSpSEUuvgpiI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IDexj8hSrNnBfvDK8OYasj+luacD8NknUk/OEPDtJx5KahKTyyPyHHm0+C8pZdKJF
	 UfCIYTMiAyYp061qvRpeBrBM7RVKVA3oJ9egPEbGqn9hJFwFLboQign3e/vASLcg3I
	 6U/UyFyOyU6RzRVMh0GjjUQ+azekuwaI4hbgTebKyoGMizfsxh4eyyKu1+8N6vffaE
	 NjY58RC3H7qE/d8xgyn7uHrgl9GLsre7Akx2jnJmDetzeZSinOfyLXTQ/SliiFvvQC
	 gVPJ+8QofhqwqBnZbMeHu5MeWaIhRucSXJJws4PARHsbRPicQpVKX/udesnEB3QSIh
	 IgGG9/u/bEFxA==
Date: Wed, 7 Jun 2023 18:18:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
	alsa-devel@alsa-project.org, bard.liao@intel.com,
	- <patches@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: add N cpus to M codecs dai link support
Message-ID: <042775c7-0d61-441b-8684-80960d041bdc@sirena.org.uk>
References: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
 <8411fd34-0326-ae92-1d1e-ff171318ebf2@opensource.cirrus.com>
 <c183a76f-38d9-8e20-af80-32b40e1caffa@linux.intel.com>
 <47053ebb-4157-49a2-bfeb-cf090d502a81@sirena.org.uk>
 <20230607170520.GM68926@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+ns40RvmSIKbIK9S"
Content-Disposition: inline
In-Reply-To: <20230607170520.GM68926@ediswmail.ad.cirrus.com>
X-Cookie: Keep away from edge.
Message-ID-Hash: OV7N3TVDLROTGSFU6DTXC25NFAEBNQUW
X-Message-ID-Hash: OV7N3TVDLROTGSFU6DTXC25NFAEBNQUW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OV7N3TVDLROTGSFU6DTXC25NFAEBNQUW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+ns40RvmSIKbIK9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 07, 2023 at 05:05:20PM +0000, Charles Keepax wrote:
> On Wed, Jun 07, 2023 at 05:22:45PM +0100, Mark Brown wrote:

> > > This is questionable when the CPUs are connected to different links.
> > > SoundWire is not a giant switch matrix, there's a clear parent-child
> > > dependency and limited scope.

> > > Example topology for a 2 link/4 amplifier solution.

> > Or a system with two distinct I2S DAIs (TDM is another thing).

> I guess the bit that slightly phases me here is, historically a
> DAI link has been the thing that specifies what is connected to
> what. What kinda happened when we added multi-cpu is we bent
> that assumption, at least for the N -> N case, and now even
> more so for the N -> M case, where only a subset of the DAI link
> is actually connected.

> If your system looks like:

> CPU A -> CODEC A
> CPU B -> CODEC B

> What makes this a single DAI link, rather than 2 DAI links? And
> does the information within the DAI link about what is connected
> to what not just start looking like DAI links?

Ah, indeed.  My expectation would be that for things on the same
physical set of wires we'd at some point be able to get to a point where
the the SoundWire routing would be exposed to userspace for control,
probably at the point where we get digital routing working (whenever in
the far far future that might be, it's only been a bit more than a
decade thus far).  I have to say Pierre's example looked like two
separate buses.

--+ns40RvmSIKbIK9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSAu+IACgkQJNaLcl1U
h9Cyfgf9HHW149VjVNhgRSiE6aKLOSKQW3JoBCXBk3TktE0xjUB+u0hdhsC4U9Z0
lidjiE0ShHwVrAX8J/1Q9HV4clCes4fHK0x8Ds1fiTCSwTL9isFY10908cqsgRJN
8gtIhKpQBpDf6V8DHzhh8y2krKfOgcVog0KoyMdnhEyoipbVpXgX2/pGFXpenvwQ
e7DMLx7NMfdT7sAsOW2bPZnj7H4BdIjba0dHnFsdbDlkz87I79h9tfdo10jK/CNs
vccmycSqj+J3Z4fR3oMEFdOUsf3au8AxxFTGrvO5rM1+T3A271CrDviEujINQVmH
r7x8QcWeIOqYERciuVduzNNfVkF6fw==
=Vdri
-----END PGP SIGNATURE-----

--+ns40RvmSIKbIK9S--
