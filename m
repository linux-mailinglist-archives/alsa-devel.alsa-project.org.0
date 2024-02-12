Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD698513C8
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 13:47:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A48C0A4B;
	Mon, 12 Feb 2024 13:47:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A48C0A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707742031;
	bh=T04eMKlRmhh0N7XBjNQYZVDQetsg6SmMJw4HxdbXeus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SV6QT6JvrXlLTTieDReF44ffA62ObzOLPJfIK4bQk3X+JXBZfyySD/bpMSpkNTcKr
	 l9PVKRAN/RUyMCFmFBqW/iJMdSAaiAddHTAL2wtmna0Jw6jyoev0kQuEsG8KzRs/th
	 QMK/ytazwyywAwpKGvKpDMJ6teGcRNImqETNWhHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0159CF80580; Mon, 12 Feb 2024 13:46:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8102AF80567;
	Mon, 12 Feb 2024 13:46:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A46FF8057C; Mon, 12 Feb 2024 13:46:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A47CFF8025A
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 13:46:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A47CFF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pMCnaUpl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C592860AF8;
	Mon, 12 Feb 2024 12:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41C8C433F1;
	Mon, 12 Feb 2024 12:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707741982;
	bh=T04eMKlRmhh0N7XBjNQYZVDQetsg6SmMJw4HxdbXeus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pMCnaUplbLxYvwaKJZlYICpgEO7jT+wkATFj5qV2jug7YnGu06+3bSUhvn3RGfkHa
	 pbYhbMdl4GyXfXMpb+C/UuLJwUOStz4TD2/pgKWx639zW8ATGBTqPS0c0xsxxBbLdP
	 z4yTlyOKLBKwpU0086yyX69ILC4+Ddeu21+gPj21Haz7tpMxLwR7Uo0Xsh7TqSPm+R
	 Y6YQJ1WcV8YZ7J9Ec8Il9S02Jrn5RULF2Z7U3sQoPpjXWlln8YbgBncX2g2D7X8xn2
	 LimC9mCc9rQOloighvlEfSFlPKvhXaHoqbGRD75umoSRzQ13dvbvhIZbiIYWCYcEUN
	 2aNB4tLCz86HQ==
Date: Mon, 12 Feb 2024 12:46:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Yinchuan Guo <guoych37@mail2.sysu.edu.cn>
Cc: linux-kernel@vger.kernel.org, lee.jones@linaro.org, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH] sound: codecs: fix typo 'reguest' to 'request'
Message-ID: <8ac806cd-cbf3-426f-86b4-280b3b219dc1@sirena.org.uk>
References: <20240212065014.3696356-1-guoych37@mail2.sysu.edu.cn>
 <20240212101820.18437-1-guoych37@mail2.sysu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ptXczeETsw1q7wE5"
Content-Disposition: inline
In-Reply-To: <20240212101820.18437-1-guoych37@mail2.sysu.edu.cn>
X-Cookie: Will stain.
Message-ID-Hash: MXAMFKK3XZ6A2UD5KNSJTN3ME2TSVA5K
X-Message-ID-Hash: MXAMFKK3XZ6A2UD5KNSJTN3ME2TSVA5K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXAMFKK3XZ6A2UD5KNSJTN3ME2TSVA5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ptXczeETsw1q7wE5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 12, 2024 at 06:18:20PM +0800, Yinchuan Guo wrote:
> This patch corrects a common misspelling of "request" as "reguest" found
> in the log messages across various files within sound/soc/codecs.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--ptXczeETsw1q7wE5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXKExkACgkQJNaLcl1U
h9C3nQf9EUFXfoDws1b190kMBs/Z0ap9A88voC/e4V0SNN/CLwha5LBfTZGJOuKb
rBAQ2hZziz/p4uFawh++cjKjDT621x+/RMibXRmF74AXU1Xz8JrN3gihhD6Qhlqh
AIU/TU+jwASDEdvJat7kqvjgOsJo11tnOXj7MVVOlolXVYTzpOJzknhyjxEldvdF
wMgx9h+pGoa+R/EnkkXSDWGBV3ASuesRIfMy/RQgBhyjDN8G6WqPwJDyW8Id5rGL
1SbPXWfQVzlrLDHIU+ysdRgu0WeMED8uG9xM8QBoXDYscSIu5wcqFaCPfeDgcRR6
HKF7TSMBmXxiR68Vz8u8qKr93OBK5g==
=HAkn
-----END PGP SIGNATURE-----

--ptXczeETsw1q7wE5--
