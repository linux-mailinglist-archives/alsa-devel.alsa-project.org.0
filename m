Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E27499187A4
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 18:42:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1259D1912;
	Wed, 26 Jun 2024 18:41:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1259D1912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719420128;
	bh=c/aFHg+7fVsTXBrtC3LliLBWjCoT79TCbohtFpCUxd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S9Z/KYXAkziaXqXkhUfPflP7Lm8dBLcX/9Gat0qWcR0cLYHqjxEYuGW+mL32+YfMz
	 pFpD4HpEglMJS0JP/3jA4nXKidjfHnZShg7C5OdXDBgVuyJz2Ptw0qkQMkzCugICbS
	 4B+UmAhQEAHxo4gbDEGr3TXZGm2V5A6bO2I+dBso=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1289FF805A1; Wed, 26 Jun 2024 18:41:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CE79F805A1;
	Wed, 26 Jun 2024 18:41:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B564AF80423; Wed, 26 Jun 2024 18:41:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D89FF800ED
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 18:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D89FF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OWDPMpsh
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EB7DACE224C;
	Wed, 26 Jun 2024 16:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EA7C4AF09;
	Wed, 26 Jun 2024 16:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719420073;
	bh=c/aFHg+7fVsTXBrtC3LliLBWjCoT79TCbohtFpCUxd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWDPMpshFywTZNmr4eIoAZCXmJdByqIBeTNiO/pIVmbM+6Fh5BYeSyEPRmMzLts8o
	 iyVee5FKhnjN83Gvs/zefXBdt41O7spPEfNo7vJQIBEc//hdLZVavhYjSA2x87IhuT
	 m193PVT0A9MiJKRpGZh8/hPuTTf4Hk2JeH8RqIU4WIuIjZ1Jxw3IQABQFhP/eaNTYQ
	 Qj4xbL6fq+GS2UDnT0oytyVLp7kbH7YCszvM77j4muby0VblBBrJyTIrQbxm9UNudH
	 hHnBn0RavMj07vAnJ8wcm8rDfAj040uDOcBkJB634Nzx/m9H7KGyM7kkS6uQOqKUOm
	 JT5mDglJ83qmQ==
Date: Wed, 26 Jun 2024 17:41:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org, Maxim Kochetkov <fido_max@inbox.ru>
Subject: Re: [PATCH v2 1/5] ASoC: audio-graph-port: add link-trigger-order
Message-ID: <f243545d-5298-4634-bbbc-e87fdcd7140f@sirena.org.uk>
References: <87tthyzokk.wl-kuninori.morimoto.gx@renesas.com>
 <87sexizojx.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EM/5sgkJE17t5/u2"
Content-Disposition: inline
In-Reply-To: <87sexizojx.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Results vary by individual.
Message-ID-Hash: CDYZDJOVQGEQ3B26SVSV3S3YFD25HQ6J
X-Message-ID-Hash: CDYZDJOVQGEQ3B26SVSV3S3YFD25HQ6J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CDYZDJOVQGEQ3B26SVSV3S3YFD25HQ6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--EM/5sgkJE17t5/u2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2024 at 06:02:26AM +0000, Kuninori Morimoto wrote:

> Sound Card need to consider/adjust HW control ordering based on the
> combination of CPU/Codec. The controlling feature is already supported
> on ASoC, but Simple Audio Card / Audio Graph Card still not support it.
> Let's support it.

I'm really not thrilled about putting this in the DT bindings since it
feels like something which is likely to change depending on what the OS
is doing, at least sometimes.  OTOH I can't think of anything better
other than quirks and there are some cases where we just need a specific
order.

--EM/5sgkJE17t5/u2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ8RKQACgkQJNaLcl1U
h9BLqwf9FZePsD2QMltQBU6D+2Mi9CxBcap3E+/fhcqWp3giaRn1jaSi3mFGhPS7
1Nf/Q1asOhePg35L1eODPndStM8Pf2Dq8LgNR+UbFxT59VcIiNH3mYNLlH6HTlZs
oE1QLs8zUsGUwAusjB9Y9E5/5DXfMlFNmEP7ECCq76v3nu6F86AkVnPWN+hnTKkG
R8zGi5BfwpSfvRoDuBt+hqkEJKHsUrRKOJ4scNXfs/URp+b+A0psZM4geg1SEcpB
MhPG7HPS5uPd9dNt8MeYYzPR1dje4N8cYwjx9oScj+/sDPRsPFEfxuERh86HsHtA
/VfC/inrCiEzKaIBP2fiw0PwKPweBA==
=Hkyu
-----END PGP SIGNATURE-----

--EM/5sgkJE17t5/u2--
