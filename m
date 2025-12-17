Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D48CC72ED
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Dec 2025 11:56:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 985376022A;
	Wed, 17 Dec 2025 11:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 985376022A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765968984;
	bh=Uznq9mEUv6T74S4Xmp6qiieh29EWHGRHrevT8ui/oog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=flhLLn6EvJeXoy3Hh+RxA8j8LwtB+X7F7wTpbYdGCbEGWT/ntrkY/QuQdwAHWxRLY
	 /xloFalVyL7SJupzuMB/fxuqniIFGSLfp4MFKGKu0Y/AOhxuWZKhdenM+LlNGxPGMM
	 AEQkJNSjnpkUed9erUB+YjAk3ehiPe6jSqO0xqus=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BDF4F805DA; Wed, 17 Dec 2025 11:55:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2A0EF805D9;
	Wed, 17 Dec 2025 11:55:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBB3FF805A8; Wed, 17 Dec 2025 11:55:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D06B4F8013D
	for <alsa-devel@alsa-project.org>; Wed, 17 Dec 2025 11:54:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D06B4F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p9u5uSuw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7D0B4032D;
	Wed, 17 Dec 2025 10:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B6DC4CEF5;
	Wed, 17 Dec 2025 10:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765968896;
	bh=Uznq9mEUv6T74S4Xmp6qiieh29EWHGRHrevT8ui/oog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p9u5uSuwqz+y3cLwWfDjS+4Y4YSkibpmT5AkKpgF00lluHELcKpNZWGO1lLF8o0kG
	 0ewnPPyz6ddfxCerpLINVNUSSLF6bo/EHnbisKgyClK8ssNoAZtjjVfblg5Ii0mhZ0
	 XTOfwEcsrfywAGAujq472RYHc79eEvCh0229xqA8kAr3Tgc2+2mggNvw1ZDYB606Ue
	 qiTl7D7Nu5WnBhl/UREyT4cKlo0x5LpDpew1SDb9CwNMFeR/J2txH94BxQhrH+cgc6
	 WtByU3rfD8HtsWlv+UJyYwRkQSrkZPxv05/tMwMFlzGH/HBF/IovTYvOz3U+zhPMe0
	 KPfF7b7ky1XCg==
Date: Wed, 17 Dec 2025 10:54:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, linux-spi@vger.kernel.org,
	perex@perex.cz, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	flove@realtek.com, shumingf@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v10 3/3] ASoC: rt5575: Add the codec driver for the
 ALC5575
Message-ID: <921509e8-618f-46ed-9757-650bb37ff0ff@sirena.org.uk>
References: <20251216071853.3929135-1-oder_chiou@realtek.com>
 <20251216071853.3929135-4-oder_chiou@realtek.com>
 <81510775-c277-4dfc-bbe1-d3b75debc140@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KhJPFKIKSji/h6Ex"
Content-Disposition: inline
In-Reply-To: <81510775-c277-4dfc-bbe1-d3b75debc140@intel.com>
X-Cookie: To err is human, to moo bovine.
Message-ID-Hash: FDKZ7MSMOM7IJGLGKZFXWDTAHU42NENB
X-Message-ID-Hash: FDKZ7MSMOM7IJGLGKZFXWDTAHU42NENB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FDKZ7MSMOM7IJGLGKZFXWDTAHU42NENB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--KhJPFKIKSji/h6Ex
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 17, 2025 at 11:45:54AM +0100, Cezary Rojewski wrote:
> On 2025-12-16 8:18 AM, Oder Chiou wrote:

> > The ALC5575 integrates an audio DSP that typically loads its firmware
> > from an external flash via its own SPI host interface. In certain
> > hardware configurations, the firmware can alternatively be loaded
> > through the SPI client interface. The driver provides basic mute and
> > volume control functions. When the SPI client interface is enabled,
> > firmware loading is handled by the SPI driver.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> > +struct spi_device *rt5575_spi_get_device(struct device *dev)
> > +{
> > +	struct device_node *spi_np;
> > +	struct spi_controller *ctlr;

> Reorder to achieve reverse-christmas-tree notation. Waterfall to a number of
> functions found in this patch.

This is not a general requirement for ASoC, it's something specific to
the x86 and SOF stuff.

--KhJPFKIKSji/h6Ex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlCi/oACgkQJNaLcl1U
h9DifQf/Yz/49L9umyOcGn179d8e0YjBXmMCpoFzBUOdjWM+HhnuHGoPa6XGye6W
toeg2mJ5rJSmtdTWtrevVkbWK8LXUOufRXqHGIwVjMIZVgtVu/DBMj6gpALJS6tA
nxUKDmXnV2Qr3OYMUzgm2rHsPPLpleGy3VfXG21rzMOR2ZvECiF2LZ8NFVjJiHJ7
QUzEo0Dq5tN/3BgKIi8JDhUbWrb5CubEe06+/J4QlUtgZytsPuT9rH6tMuRvKefk
LNpDeZ8zSBHNSRuymuaBpQucvBhAiNWBrA+2uNf1bJf57t1eD1gM/SS1STj021+o
xaZ/agcfyfi5PdkYYC72CXqmVQqrZg==
=9MGi
-----END PGP SIGNATURE-----

--KhJPFKIKSji/h6Ex--
