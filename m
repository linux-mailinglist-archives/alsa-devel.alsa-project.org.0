Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 826A993FBC9
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 18:49:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD966852;
	Mon, 29 Jul 2024 18:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD966852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722271772;
	bh=BgcRqKiDCihQph7GkqrD4JQhL/HY9twKibTZZYxxhjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fXzPS/xajAttx6e0Lk5CzykDlGVivyP5XJNYsLbg+/q63K742crLuZmXqJ9oahc56
	 z3SmOOWk723bM0o3GHDNEqer9lsaMXgWxEHxSqrzUdVUaRU4h9W9ieYt4IOsC25vkz
	 UZfiIoK1CGIVipi8YMRu9HfPeO0dOpH5cGBfvW8g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3C0CF805AF; Mon, 29 Jul 2024 18:49:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46075F805B1;
	Mon, 29 Jul 2024 18:49:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA753F802DB; Mon, 29 Jul 2024 18:43:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18692F800E3
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 18:42:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18692F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=R5tqtdLZ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F039561B6F;
	Mon, 29 Jul 2024 16:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947B8C32786;
	Mon, 29 Jul 2024 16:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722271340;
	bh=BgcRqKiDCihQph7GkqrD4JQhL/HY9twKibTZZYxxhjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R5tqtdLZgPI+wH5vT8AwzFSQuutBwUQXSMlOpoJVm43rIqpMCbDHcD6aCiysLb12n
	 POGf1IPb0yXn78b312PT/Gu4MISy4OuGHTfQMCaOjO5J5WMlJWWWVFyHDrYXDoZsdO
	 SKzUl2HV7kDh3R73dz1SayQQgSjXb8TK1Bt8OLuSro89QVHzC+I9MBhtZ4Rdvk3U1y
	 6JY6szNEEemCjrl4BGJKmBEXlBSeD/Kf04B4FQttMTG1H9/Lebc/VtXTVGgDBVASPP
	 2I34eM/S/O3eeMHR3Fklnoij1uCO7KQaRHX0VAtnDDa0b8XJs/UN4BMO0oOs3ZVQ9W
	 H1G72iq/6w6DA==
Date: Mon, 29 Jul 2024 17:42:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	linux-kernel@vger.kernel.org, j-chadha@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
	Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
	cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com, antheas.dk@gmail.com
Subject: Re: [PATCH v1] ASoc: tas2781: Move tas2563_dvc_table into a separate
 Header file
Message-ID: <1dc0518a-f0b3-4617-9c79-ac903ca9ee33@sirena.org.uk>
References: <20240716061123.127-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uj2v2I2plHuUzS/C"
Content-Disposition: inline
In-Reply-To: <20240716061123.127-1-shenghao-ding@ti.com>
X-Cookie: Penalty for private use.
Message-ID-Hash: L2SQ262HNXNLPQHOTGXV3UZFVMXRN64C
X-Message-ID-Hash: L2SQ262HNXNLPQHOTGXV3UZFVMXRN64C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2SQ262HNXNLPQHOTGXV3UZFVMXRN64C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Uj2v2I2plHuUzS/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 16, 2024 at 02:11:21PM +0800, Shenghao Ding wrote:
> Move tas2563_dvc_table into a separate Header file, as only tas2781
> codec driver use this table, and hda side codec driver won't use it.

This doesn't apply against current code (or your other patch to this
driver from the same day), please check and resend?

--Uj2v2I2plHuUzS/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmanxmEACgkQJNaLcl1U
h9BzyAf8D0ct9/VEgNw15CMnmzG4y4KRg9EHMkwsoF+BaINwcHnkiwJNDpFxglMv
I5yVs+R11sSTd1ANo3WEAkqVBmSuRax/wnxG0Ffdq/vFCkqdneSMsBYLqLu5A28M
1uyy0XN6IG83iG9ctvMs7ArHhS3vXBYdLVBMbh5WnmjUV+B/+1GkcmTVSUFfgzYw
6lBI2zyWCLZ5+1FuwYQAvVpPu7OJn8c7zbzRLPJqja87nWCEimxy7bURkovKRCCj
J/+IDL2VNVmfKnsDg9NpN1gW+D/mFQBfFsBcjZ0r27dBJdqN/989mqqFDt+8otYt
AI8a2Kqf7KnKe6DYJzk0M86mqoHh5g==
=v+3f
-----END PGP SIGNATURE-----

--Uj2v2I2plHuUzS/C--
