Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EEA959D62
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 15:05:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 398A2829;
	Wed, 21 Aug 2024 15:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 398A2829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724245541;
	bh=vZAApvjCMCqZv9JqC6MYsdspUHQeAIj+2fRecG8DuFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t2t8XHAKFrCXoypJrDRfR1yAyjGOCKeftNoIR9G5h0ZczUqeFC5iDhGmpPSGOc5av
	 7hn16cgOzTTA1VwDFamzmlQ0Z8K/dgK5MXYN0FieqMEvYSRvWhzqb0RajT7z8Q+aWS
	 2+bNC8GTw4TjX+MfOca/CHcXHEKHi5hFwr2+yinY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4299F805BB; Wed, 21 Aug 2024 15:05:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46927F80496;
	Wed, 21 Aug 2024 15:05:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AAD4F80496; Wed, 21 Aug 2024 15:05:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFCFFF8025E
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 15:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFCFFF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GldKKBpN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 02560CE0E33;
	Wed, 21 Aug 2024 13:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A85AC32782;
	Wed, 21 Aug 2024 13:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724245490;
	bh=vZAApvjCMCqZv9JqC6MYsdspUHQeAIj+2fRecG8DuFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GldKKBpNqFF8p7qZXynyAmPecMvtIuZ8W+XE4rhMX0kY0qAGj3pvAI7u5GG3c28NM
	 /b/QL+OVW+yBK4klt93+sU+0ZqviYNWXKMtYqWzd5hHqGr66CiOKHbfyAyqx8ZOEgg
	 ZH9jObGFUlr6WglDrZFS+o+GZcuRsssnK/EJ1FfE+kIaQhvYyoaT76ZShI8uAdXlms
	 yc9S0hpPNl8ABQPGqgP+i7aIkyPJ8iSAIwbY3UAIHsIex1Lxm7k7Ghoah9hWeBUfdh
	 ie6qcMXGqSRPYPyP/QD26lYSpsjGME57cdWtEkYZORaOJc/UvVXnuaXWIDe04voHTj
	 U7oQYvoF3J2Zw==
Date: Wed, 21 Aug 2024 14:04:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, Baojun.Xu@fpt.com,
	judyhsiao@google.com, navada@ti.com, cujomalainey@google.com,
	aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com, antheas.dk@gmail.com,
	Jerry2.Huang@lcfuturecenter.com, jim.shil@goertek.com
Subject: Re: [PATCH v1] ASoC: tas2781: Remove unnecessary line feed for
 tasdevice_codec_remove
Message-ID: <9ea73c73-2d89-4fce-83e8-3f74c007bea8@sirena.org.uk>
References: <20240821072527.1294-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V9ZQeXdzHby7YQ/F"
Content-Disposition: inline
In-Reply-To: <20240821072527.1294-1-baojun.xu@ti.com>
X-Cookie: You are false data.
Message-ID-Hash: W45HMONTNWX552NA3HWU6PEG4KSY5K4J
X-Message-ID-Hash: W45HMONTNWX552NA3HWU6PEG4KSY5K4J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W45HMONTNWX552NA3HWU6PEG4KSY5K4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--V9ZQeXdzHby7YQ/F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2024 at 03:25:27PM +0800, Baojun Xu wrote:

> Remove unnecessary line feed for tasdevice_codec_remove.
> Add comma at the end the last member of the array.

These are two unrelated changes, they should really have been sent as
separate patches.  Please pay attention to this, it's a constant problem
with your changes.

--V9ZQeXdzHby7YQ/F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbF5ekACgkQJNaLcl1U
h9C0Owf/bUo57tC2GYl/t7y+rQovxOFJFM5MJwjgeYVnSRfAfwN9mW0xVZo1ahUf
JHva9/cW/yAgbq/S+6Y1wkVKhKuSqYtcOLLubZzasoGCStJsJCpHTv6kM2b7oHW0
ARutcuPInppVGeGuzHkpzh82lDdQKC7BVTx1uCsJuePX7ac0lRlvxplsfdOF04RH
PF202NTEIEkvni6eK/PslKbrxND8GffKPwjltFs0UEqyrtpq1J80aIQethY7c48O
rJGJuRywSrO+UgIS9IC8xgIG/yMM8KjTr5jyWwfpRAYc0f+40YKoJtYBshHXRYUL
G/SJqmohcQMB2dCk3CTTV3bUAwZ9uQ==
=zj66
-----END PGP SIGNATURE-----

--V9ZQeXdzHby7YQ/F--
