Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CE885AAF8
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Feb 2024 19:29:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D0A993A;
	Mon, 19 Feb 2024 19:29:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D0A993A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708367394;
	bh=QN80O6Hd4SYisWubwEwh/1R3fa4UIIJenRLDUxFbOBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B2dc+Sl2RB97/QxMFPU0cuS0FloOw3fpUqwLXYo4X6Gf7lr8BraKfb5DWsICwUdcG
	 0Scl1EXEUDWH3dWWYb+7RBOwiL+9lD8WvocRst4tAHplnkHPOhk4qo2E4V7BPd9Pvw
	 zDyMQebya5lLlZ5pzP6h3ndqe7Kg58pUllzSxCQA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BBFEF805AC; Mon, 19 Feb 2024 19:29:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E973F805A1;
	Mon, 19 Feb 2024 19:29:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB1DAF80496; Mon, 19 Feb 2024 19:29:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3416F8019B
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 19:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3416F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Lg9UeeJ9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ABA13CE0205;
	Mon, 19 Feb 2024 18:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC7FC433C7;
	Mon, 19 Feb 2024 18:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708367338;
	bh=QN80O6Hd4SYisWubwEwh/1R3fa4UIIJenRLDUxFbOBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lg9UeeJ9o9Wgg7Kpe5w3mYuDV9Br7ganoNolSo3SnKH94jeZC++NwyGvPi2Dki89g
	 oFZR/8IVkqpmPcizom4GYUg4dNINunckKUNE1VzXXa2xJPszwKQ1/KOzOuIo6m5frF
	 U+39cLmxx38rZPFud7XBJb7WOAhMrnadmSukZh5Q9aMPpvwTQlMGKJots9yXhmPQSs
	 vM7VSmmRPa452fKaGkIG+y8Z8uJd+6TtIMxTvGgrlNhyjVPBtiQCpx4F/lA6PdBsVj
	 9tbGeuYv7IBKDlHLwvsBzIbx+92vKeDI0OvtSn8D4XebCdm0u3STPqfJqdVRLP+GIy
	 0wLLrQo7rG0Qw==
Date: Mon, 19 Feb 2024 18:28:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>, andriy.shevchenko@linux.intel.com,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, bard.liao@intel.com,
	mengdong.lin@intel.com, yung-chuan.liao@linux.intel.com,
	baojun.xu@ti.com, kevin-lu@ti.com, tiwai@suse.de
Subject: Re: [PATCH v8] ASoc: tas2783: Add tas2783 codec driver
Message-ID: <0afeaf24-ba02-413c-810a-90cebd002a3f@sirena.org.uk>
References: <20240219022153.553-1-shenghao-ding@ti.com>
 <646973c48c4ee30c92de98aa027992e8ccdd325d.camel@irl.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RoSbG8iRlMkrNIk6"
Content-Disposition: inline
In-Reply-To: <646973c48c4ee30c92de98aa027992e8ccdd325d.camel@irl.hu>
X-Cookie: Kleeneness is next to Godelness.
Message-ID-Hash: LZNAMVQ7B3V5IFX2Q4EZY6XAQZIK5B47
X-Message-ID-Hash: LZNAMVQ7B3V5IFX2Q4EZY6XAQZIK5B47
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LZNAMVQ7B3V5IFX2Q4EZY6XAQZIK5B47/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RoSbG8iRlMkrNIk6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 07:06:23PM +0100, Gergo Koteles wrote:
> Hi Shenghao,
>=20
> On Mon, 2024-02-19 at 10:21 +0800, Shenghao Ding wrote:
> > The tas2783 is a smart audio amplifier with integrated MIPI SoundWire
> > interface (Version 1.2.1 compliant), I2C, and I2S/TDM interfaces design=
ed
> > for portable applications. An on-chip DSP supports Texas Instruments
> > SmartAmp speaker protection algorithm. The integrated speaker voltage a=
nd
> > current sense provides for real-time monitoring of lodspeakers.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--RoSbG8iRlMkrNIk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXTneQACgkQJNaLcl1U
h9Arywf9E0yAQ5zlYJuPvwD9xlUbowPRrfOwjunt/jB4BQoZcztIogL1luBWd0QJ
RcTGdCEk1Kn/jnawn0M8k6bTiYV+qPRmzBHQ47fgOrELRZODluTklY389Nj8R2+7
SXGM3qH7Y/CV28O36MBtk/CLMzR15JD2QhMFxZlusPAO3E6vyKleV0tIF835Rycl
xJzIY/xc1tQEzSMuerK/3t7JiIVg3XdP5uDuRJsPFdAoi9d+gVaTTtxYQFky0LXh
Nh+5olIsOfD4/NWj+rLmGWZrEWPcEvSMgp0i9wvLSrshX1WWff1v0tZg4IqyMIWY
PIj9+b6El1lFcbQfxY/LfdnAg0oR3Q==
=me1z
-----END PGP SIGNATURE-----

--RoSbG8iRlMkrNIk6--
