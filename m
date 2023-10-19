Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 076897CF733
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 13:42:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BEAF1EC;
	Thu, 19 Oct 2023 13:41:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BEAF1EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697715728;
	bh=zFJ31eXbJDMkRLWAUkyjKDUm5+ZrWpDws7et1zq/7TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MNFq2KvozxN2wtu6fTlxHD/n/G951sf+c7x7AyUlVkssz+vdb/L5EHF28CWCL52Ok
	 zEerpist5yr/oS/msb+w0mGatBI7rD95A42keJO+wUtTkwCaRAZ7zT61Kb0I/VX8W0
	 8sR9VaiwTqHD2pAvmUZSnpNq3HrdOlvyAOvgH79E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAB57F8024E; Thu, 19 Oct 2023 13:41:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAB8BF800C9;
	Thu, 19 Oct 2023 13:41:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8080FF8027B; Thu, 19 Oct 2023 13:41:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E7DAF800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 13:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E7DAF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VDBcDBIi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9681260C92;
	Thu, 19 Oct 2023 11:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8D4C433CC;
	Thu, 19 Oct 2023 11:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697715662;
	bh=zFJ31eXbJDMkRLWAUkyjKDUm5+ZrWpDws7et1zq/7TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VDBcDBIifXtJCjbhtUZXa8vevpQJOxLdxlQcbNDujxz6ywYlRYDu+4Iiqy7inYDhV
	 vayn8Vg9VvABvpM7tX6Z+MBQRza9BytY9ghKdLfRAV/MruEbvUYkSm4IVvWcdhMBW5
	 QgZCDJYhVqJGZ/3Km45vyDSUV6nBy1sS6tC8NOroGvanL8InJyRBX7/FgQ1xRMZNZe
	 JizaRzTbsO2745WJs8uDUMBvXtEDKq4cPUofRV+P/uqS9YGD/4HuA4fQANmx+r12IZ
	 tWI4WJQLMARoF0cT5tm1Rlz1gISYxxsFiSuGmhzdidE0OkNSD10S1qp6THqHa0u5tJ
	 ofewMRgEk+ulQ==
Date: Thu, 19 Oct 2023 12:40:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: ti: ams-delta: Allow it to be test compiled
Message-ID: <9bbab4c8-f616-4abc-9eee-022c19c6921d@sirena.org.uk>
References: <20231008135601.542356-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rJpf5KhErWczI+JQ"
Content-Disposition: inline
In-Reply-To: <20231008135601.542356-1-jmkrzyszt@gmail.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: 3SZNLBBVCF2QACGHGNB7I5MIA7DUOML6
X-Message-ID-Hash: 3SZNLBBVCF2QACGHGNB7I5MIA7DUOML6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3SZNLBBVCF2QACGHGNB7I5MIA7DUOML6/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--rJpf5KhErWczI+JQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 08, 2023 at 03:53:10PM +0200, Janusz Krzysztofik wrote:
> The driver is now built only when MACH_AMS_DELTA is selected, which
> requires a very specific selection of ARCH settings.  As a consequence, it
> gets very little attention from build-bots, if not none.

Acked-by: Mark Brown <broonie@kernel.org>

--rJpf5KhErWczI+JQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUxFckACgkQJNaLcl1U
h9DHpwf/f4imUxP1IUlBS5zbmBYxSlrnJnvcq+nnx74N7CWo6LPYnn2/7hQHNOCu
XUBv1ekL42okvqVQ9iEXE92BtM0qkKmjminn6dsKuARZGJO/Wsqd5888h8cGvVF/
Tto+BTJ8Zvze/lBVhL3W8UACbeLRvZ54a4tVegAT7OqkqUAFs+SnrVujzy/8G4zb
mEb1NtbNnAHNh3fX726JlrCNW/jECc2cKrD5f3z//K+ixjxYfh5ldVajk7AV0kxD
iUOhqWmxTltKZzh9g/AXpWnS2x0W9enLmx1xhC07kEhWaVeTL5U2hHsOgF3U+DUr
f8K8/lguuC7ta6Svtkm5nc+9L+9Tdg==
=eB4A
-----END PGP SIGNATURE-----

--rJpf5KhErWczI+JQ--
