Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAE87900FA
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 18:53:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C93161FE;
	Fri,  1 Sep 2023 18:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C93161FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693587182;
	bh=G5CrlpdWTKkjHqnYiMzGcwFEr07EzcqlED2n4J8p2qQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eMP2Q00suNQQtktUoq0JweS0VQFV+FDOdM0/NmdARlK5n/ylsImIZN1n+BCB/kDUd
	 Ym4itaQ9qUPHsZlrbqh0fDY4+GF5cL6BRfoh9auewCTDIKfmuQBB3vDIGCQ7eXWyRz
	 wcYCopaBf7ocmpjcMhL7F1jue4EGn+80qovxrllo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28911F80074; Fri,  1 Sep 2023 18:52:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9672F8025F;
	Fri,  1 Sep 2023 18:52:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0998F8032D; Fri,  1 Sep 2023 18:52:07 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D8F60F80074
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 18:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F60F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QH5qo53k
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 901E5623DF;
	Fri,  1 Sep 2023 16:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF28C433B7;
	Fri,  1 Sep 2023 16:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693587122;
	bh=G5CrlpdWTKkjHqnYiMzGcwFEr07EzcqlED2n4J8p2qQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QH5qo53kt82Do9rF4cIccc0zy4qxrS+yPfxvsChjlWR/R0VpUS65wDtsrnEhDGCBt
	 yCHAbU1vm+VVqT6aWow2JSSTCklKrbpnjTYtuYuorLwZeG+UUadDHZp8P9iGj9l+Vn
	 MnLqydHejf/3aLEzSZVO5AzOeca3lQv2S9frC4Y/MkvNSUMMTAJy3f42y2JUVilv6g
	 mhMl4105/ykrFF314HNhiqBaGU/g6vPk0/8a1HLYvlugn2nUBpB4VwseA6P7ngjzYi
	 TzOv/88brkZ8j5FhaEwlT5b8ts1c14GSDItuLAGMGx2XUy3Wn8puxeiOa69ST4/3Wm
	 IotCQEAXEIyyg==
Date: Fri, 1 Sep 2023 17:51:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Waldek Andrukiewicz <waldek.social@pm.me>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 00/11] Fix support for System Suspend for CS35L41 HDA
Message-ID: <e85b7b2d-57f9-4696-84bf-601daf829c00@sirena.org.uk>
References: <03a70489-3a68-4c37-8f72-569bcd7463c4@pm.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1yiQGj2BBcqo9sws"
Content-Disposition: inline
In-Reply-To: <03a70489-3a68-4c37-8f72-569bcd7463c4@pm.me>
X-Cookie: Dealer prices may vary.
Message-ID-Hash: 7YTGOCRJV32C26EIAKTBQSBFPOXS272D
X-Message-ID-Hash: 7YTGOCRJV32C26EIAKTBQSBFPOXS272D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7YTGOCRJV32C26EIAKTBQSBFPOXS272D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--1yiQGj2BBcqo9sws
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 01, 2023 at 04:48:21PM +0000, Waldek Andrukiewicz wrote:

[An encrypted message which probably nobody can read, it's not even
encrypted to me even though I was a recipient]

--1yiQGj2BBcqo9sws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTyFqwACgkQJNaLcl1U
h9CV/gf9FGaWQtDXJLJS0psM6GoKWQK7WRl/EDhADd8oUBv2Klnmh6xzuXuqnVU6
xWhOvkETCVeSuFONCxsk8Q1Gjt6leZ+OF3eMQM17HWbk1mhrI3oOpjgkLK5iizeK
Ste3lDIBIUorBoaFVy1VeMZw0PhRoAs6630Brjq8hb3p9yn+lZGuW6qNuV3sFSYq
4kIweZU1DvYUUaQou1YcObMnn9hPj/NYbIQMjDy7adl5tM787RYRCWrdHkCQYdEN
MMoDCHmdHrchAhr+0+cky2NZA0Nq6ZRaiqhWPz8o2ZIkAwQlI86XQ/GJZDo7v0Y0
1VREjKVuR3nDhd940eknUvvmKSpkew==
=ZG5a
-----END PGP SIGNATURE-----

--1yiQGj2BBcqo9sws--
