Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E43BE81B693
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 13:56:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2AFADEC;
	Thu, 21 Dec 2023 13:56:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2AFADEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703163381;
	bh=7NxpxM1STCMZ8Ns3Axc00mUiFhhRBcEYLIvZ8mqgJ+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JMRdGEO0mX6WyphN4aB2O7A7OkOCcFJRqMPHwYHYyc747zoA3YBXAXwdpdKvnTO0F
	 OLsQqoKKbCKh/p8gfu9HJxi1D/J2q62vzB1qJ516TgZov1GSBJlIEiau1JlYIqdqqP
	 ngjjUfgWcOcbPAtYZ0RIQbx+xGi7MhE5UzknbIIc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A984F80425; Thu, 21 Dec 2023 13:55:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 416D5F80571;
	Thu, 21 Dec 2023 13:55:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 046E2F80153; Thu, 21 Dec 2023 13:55:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA35CF800BD
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 13:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA35CF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZCslwi3G
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5D5E4B81D2D;
	Thu, 21 Dec 2023 12:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE2EC433C8;
	Thu, 21 Dec 2023 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703163337;
	bh=7NxpxM1STCMZ8Ns3Axc00mUiFhhRBcEYLIvZ8mqgJ+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZCslwi3GvMMaQxEaTeZGHOEFbcCU6AuRFQJ6RYpGW7hpi4KDBbZV1pstpAf7wWHPY
	 BM93nHNrkUIbxrxzLhthSeAmQX0xtBS2lbwxbrZ6pUiOF9RWzStLIwtlXkgPrQ5rWf
	 IKElmG672O0pocCtANJbDKH4LRMUqItWQTD0maTOUxwstEz086HmwJAJi/i+9HHyqV
	 tUy0+MFsRc8gfK8RXjhUY7fz6qq5FXTYINDrvPWchVcIOCgP+nVrFe00yWDB/LRfZQ
	 9tyCeM9FEmAIpXDsDCUnQ1DbdUAdayojwaveqMrlTN92+AvhW8q6BO2Rr8jeEOHvVK
	 UeKaRuO9sAaFA==
Date: Thu, 21 Dec 2023 12:55:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: starfive: Add drivers of Cadence
 Multi-Channel I2S Controller
Message-ID: <861f9b28-863d-48b0-8491-add4a286597e@sirena.org.uk>
References: <20231221033223.73201-1-xingyu.wu@starfivetech.com>
 <20231221033223.73201-3-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qiI6QTJLu38XlrMO"
Content-Disposition: inline
In-Reply-To: <20231221033223.73201-3-xingyu.wu@starfivetech.com>
X-Cookie: Results are not typical.
Message-ID-Hash: GOJ2QLGQOMONAL6HDPTR2CXEGS724PJE
X-Message-ID-Hash: GOJ2QLGQOMONAL6HDPTR2CXEGS724PJE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GOJ2QLGQOMONAL6HDPTR2CXEGS724PJE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qiI6QTJLu38XlrMO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 21, 2023 at 11:32:23AM +0800, Xingyu Wu wrote:

>  sound/soc/starfive/cdns-jh8100-i2s-pcm.c | 262 ++++++++
>  sound/soc/starfive/cdns-jh8100-i2s.c     | 727 +++++++++++++++++++++++
>  sound/soc/starfive/cdns-jh8100-i2s.h     | 171 ++++++

If this is a Cadence IP why is the entire driver SoC specific?

--qiI6QTJLu38XlrMO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWENcMACgkQJNaLcl1U
h9DmxQf/VKWNR8MkKD1nBaJ7Yag16lGPPoUKjVEA2U9WJHxwlAJ3QXQ5lsrIBeg4
yhP0BWeL9nEb5kF6zN02LHhXrsRxU7li5HUT0hS0CArT8uQjR/g2DEr5iIfNiBmb
+6gKFGsbitTZCdp4VYcmNjUYGOz/5Zl4ZzmXYxBtiZLoCaJgcSLEDJI6BOK8vNJb
/4fyTPW81F5T1Ww2lW9xSEW4sPaQCDYR1+SDNLd+tMZodWgOwLZ+QTUvdGEisUbk
QvjM9CcrWIs79/sCqHq052zO4bWnEL4w1lTcz+oojP8kEinpg9O7nQl3TMkh2OeV
ep3TrAzJvm3x176m5cODPhAJLYVlbg==
=xQrw
-----END PGP SIGNATURE-----

--qiI6QTJLu38XlrMO--
