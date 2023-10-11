Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D657C5F13
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 23:22:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B3B1E10;
	Wed, 11 Oct 2023 23:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B3B1E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697059371;
	bh=AVRwgDQBx8JR4FI59OdGoNJiJ8cIUcgjj4IXSMlvioQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nelA3CNxduP+KHpJk5nKxCiSUXVuHWjVepm4vPGGEfSVYSYLZWCvKkBqFI5bLAe2E
	 qu3BysdYiFyfIaUJOBKEe2aqug16uxvxQBfmTNdBB1qfvdR7UfVK4AmY8nRtTgzKyF
	 8I3mkBh4bEUtffZF8R8sEiiqapWHMShT1IUPDXxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA227F80553; Wed, 11 Oct 2023 23:22:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A86CF8027B;
	Wed, 11 Oct 2023 23:22:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B2E2F802BE; Wed, 11 Oct 2023 23:21:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A9C2F8015B
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 23:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A9C2F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FeuXDh0P
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF1DF61993;
	Wed, 11 Oct 2023 21:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91DAC433C7;
	Wed, 11 Oct 2023 21:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697059300;
	bh=AVRwgDQBx8JR4FI59OdGoNJiJ8cIUcgjj4IXSMlvioQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FeuXDh0Pe588U/HI3BCDaX6/Siicbxz/VlUUPwNzcB1plpChg61yRxaACWVX/bjSC
	 nE+bO3Enh9zLr1XTmn8fs3TB86TrpmoJitanCKs7mKDUtfwu4NVWMpZKg4UYSjJ6PR
	 iKOXjQH5t3NmEXPQk0drsmr9nEvgsXE0u3AOh9r0kNXveyTarxxueqkiNNLq7JU3jk
	 3HiJONE5kHoL17J76por3LVwuqyLpztPecYx2kZCVzeOMZbpN7FQ43vmu9rHskAXu2
	 Dxkib8VXSvqRiYme9D+JO6GhZ8TLtx/LGd0RqSFvGjXzJGVF9yMOFPGD5QH4uAweK9
	 1VfwaI6sLQqWw==
Date: Wed, 11 Oct 2023 22:21:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: sound-card-common: List DAPM
 endpoints ignoring system suspend
Message-ID: <f639c88d-371a-4c72-a906-47d643b24ca8@sirena.org.uk>
References: <20231011114759.1073757-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BGyLCGLG2m53YbE3"
Content-Disposition: inline
In-Reply-To: <20231011114759.1073757-1-chancel.liu@nxp.com>
X-Cookie: What an artist dies with me!
Message-ID-Hash: QBERDUPYB7AM7UJPUFRHHH4OI32BWT3T
X-Message-ID-Hash: QBERDUPYB7AM7UJPUFRHHH4OI32BWT3T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBERDUPYB7AM7UJPUFRHHH4OI32BWT3T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--BGyLCGLG2m53YbE3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 11, 2023 at 07:47:58PM +0800, Chancel Liu wrote:

> +  lpa-widgets:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of DAPM endpoints which mark paths between these endpoints should
> +      not be disabled when system enters in suspend state. LPA means low power
> +      audio case. For example on asymmetric multiprocessor, there are Cortex-A

I suspect that the DT maintainers would prefer that this description be
workshopped a bit to remove the Linux specifics.  I think the key thing
here is that these are endpoints that can be active over suspend of the
main application processor that the current operating system is running
(system DT stuff is an interesting corner case here...), and the example
is probably a bit specific.  Other bindings use "audio sound widgets"
rather than "DAPM widgets".

We also shouldn't see that these endpoints "should not be disabled"
since that implies that they should be left on even if they aren't
active which isn't quite the case, instead it's that we can continue
playing an audio stream through them in suspend.

--BGyLCGLG2m53YbE3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUnEdwACgkQJNaLcl1U
h9D14gf+M9bhmpfCPDRUmqCUaPutP6E3jikRfcnDJMN9NCqZQlZqmvNPDkZwflpC
0ANUsCcytMbUuzBoQIYoSCtfFDer2msQyvVQxVsM9P1zwX7Qfbal8vTlZGk4ysr7
p81AT1+S+qs9386uzQSK+WFqMoEEZYzgOY8GDvdEZFl2I1JlfB6+f47nyxYwYylv
GD1iiiRKguqj0FMRWINIxBRehf+/SSZ2dLu6lYVAl2ZlGkKZgtJAylmDGVVHWAiG
YWYHw1UUmuTqUtdcsHd0h5Yz1fv5QWhhOSaGSLrrzg58vMBhsC/JfP+ntn7pF5eD
Wi4I4SBZmZibAjPsU4MD29pkvvjasQ==
=c0uT
-----END PGP SIGNATURE-----

--BGyLCGLG2m53YbE3--
