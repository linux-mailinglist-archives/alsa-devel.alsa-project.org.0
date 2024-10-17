Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ADC9A222F
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2024 14:28:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9798E1ED;
	Thu, 17 Oct 2024 14:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9798E1ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729168092;
	bh=yML8YLnaaxEbTZOnEVaz9cJvWjVJLT9ZoM8pWfFqnAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NlbetvnnAjBzNh8KXLJ2Q/VUQ3ANfzEw0mfQapVFUpsBTvvncRgH26LV2nPCOOYKo
	 8LdtLbFTqi8L9SEvgteeoP0nMxBIq5Bz9cixMAbSAlwdvVzz+PziHqSJaOAKd6W8nn
	 ViSdOU3tFt/bVO/TVcAncbrUgXTK27q8uGPZMBfo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 856CCF805B3; Thu, 17 Oct 2024 14:27:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE81EF80579;
	Thu, 17 Oct 2024 14:27:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADB89F80448; Thu, 17 Oct 2024 14:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2CD4F8016B
	for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2024 14:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2CD4F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N5VyLTfz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D3DAEA43DCB;
	Thu, 17 Oct 2024 12:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E65C4CEC3;
	Thu, 17 Oct 2024 12:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729168051;
	bh=yML8YLnaaxEbTZOnEVaz9cJvWjVJLT9ZoM8pWfFqnAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N5VyLTfz4HegLOGnLNKgp3gka/fENLvm+D10iNkmfvYP3WcZ9v9V1tboP0T81IKiA
	 RY/xE4YObwge5sKaJ99poSmkrvyVuvafhQDHaDlPoAqNSrN9TVOEAxuFLSk2SiZvHg
	 sZIkr4bKgLs0Avj5L1qEPdxVlHdIKbiLu4kCzWNqynYmU4KZE5plBiAThEfTsR+csQ
	 Q3iSHNfWGDi+rEoyg0hrc4EoTI3MKKFtTtS4mxi55/lmV7H/f4wL3LBfq9jlpoYnkI
	 uWZNgSeYQ0DvbCNcYzLcrw3QTK8bFJrvi50eQ9Mk6SglZpZAJpwbdaRRE0a6Ukfjnm
	 WVpyAqKVndO+Q==
Date: Thu, 17 Oct 2024 13:27:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Liu Jing <liujing@cmss.chinamobile.com>
Cc: peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Use card->dev in replace of the &pdev->dev argument in
 the dev_err function
Message-ID: <472cca80-5078-4da4-8956-5e4664cd4896@sirena.org.uk>
References: <20241015074938.6247-1-liujing@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/q42gE//8EX6uO5h"
Content-Disposition: inline
In-Reply-To: <20241015074938.6247-1-liujing@cmss.chinamobile.com>
X-Cookie: One picture is worth 128K words.
Message-ID-Hash: WCMRSCA25FQJMGEIFYPMPP27IN4GS4FL
X-Message-ID-Hash: WCMRSCA25FQJMGEIFYPMPP27IN4GS4FL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCMRSCA25FQJMGEIFYPMPP27IN4GS4FL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/q42gE//8EX6uO5h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 15, 2024 at 03:49:38PM +0800, Liu Jing wrote:
> Because card->dev = &pdev->dev is already defined in the rx51_soc_probe function,
> and then &pdev->dev is still used.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--/q42gE//8EX6uO5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcRAq0ACgkQJNaLcl1U
h9BkLAf7BD0R0IogvhM6zCSen+9sEo1tR8I0AA3KN5HzmTd/kYF6wH8RhJmSb9xW
VLdVMUpr459/nQlwyowLmzUvaEnL+r9dtu0B5w/+um+VNEAxc1Ij8PBl8b6WRmsp
AfuIO2089hOZ9u2epH+10orqPdYr7QlQuNhRxoChOw5+SvuAeHAk++TCOd1rCH7v
vboMNRKtr4Q756fx3Dh1hHk8Yo0IAcxwg8KrY8+I+0Y38ToKb/D/uezSR/qHt1do
ZaU4CsY86GyanpjU6v+KuUZ4JMIIRmnnkIk7ssq+SHKQYF5Pb44DeRF6x3JVs6EW
8HWR2sOeAiNk6nnSfJL88hDYcS69Ug==
=W4TK
-----END PGP SIGNATURE-----

--/q42gE//8EX6uO5h--
