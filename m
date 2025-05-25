Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C1AAC3437
	for <lists+alsa-devel@lfdr.de>; Sun, 25 May 2025 13:46:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71167601E4;
	Sun, 25 May 2025 13:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71167601E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748173567;
	bh=SY0ftbZFIobDoHJn8g3WdAz8girb0mDRFyHZJZYNNa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rUJoG4/4VcS2Lx+/NY8CXgcRdf7eY77gv2VKbSipLBzqze7SaTNd8Z+QU+wGgqInj
	 OtEDoISQQZoBLy2nmdW+w2iJhDA6z03uSg7J19t2gHchOvffAPrr8bYbB+AIw5WhMh
	 C72hEu6NBtTy9Z+s4jtXhqb7ObPb6Am5W9mlW/W0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABAF0F805B3; Sun, 25 May 2025 13:45:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B715F805B2;
	Sun, 25 May 2025 13:45:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE1F2F80236; Sun, 25 May 2025 13:45:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D358F80072
	for <alsa-devel@alsa-project.org>; Sun, 25 May 2025 13:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D358F80072
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WSQBkozX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8FF844A91;
	Sun, 25 May 2025 11:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2902AC4CEEA;
	Sun, 25 May 2025 11:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748173522;
	bh=SY0ftbZFIobDoHJn8g3WdAz8girb0mDRFyHZJZYNNa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSQBkozXBmx4OUlP27Xdi4oLqFntruZzztD/S/q35AKi+1BSZ3EMa0nPrSHTmsAxk
	 oF/O5VFaT5kpF/NStUDpXOShmcp7GrvzidNJzTUREzdylwMl4jL06DeFqbWD7fo8Ih
	 jRdCeoTPhyODL5DBnI/zZLu4u30FJBgvomTdqWlLpnNMm/CzM+d9mspmzTcB25wVYu
	 G8d6UJjCo5iZUuQOHvqclCpLHC02VH2VcsL+LS62OEcscpv0bCGQXTrm6PxGaPzIoY
	 E0dYcHEldiflxKyEYcxN+e/ouPGaaZYqqHXlJtDlY1fKKXn3tumdVh0IBVWL3t+12j
	 P3zre/dak0wfA==
Date: Sun, 25 May 2025 12:45:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.15-rc7
Message-ID: <aDMCzg09v7yCE_uo@finisterre.sirena.org.uk>
References: <c5f1dacf2885ff4eb1c04fa0faadd0b9.broonie@kernel.org>
 <874ix9rva3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QGQA6oF+gPs2XJMM"
Content-Disposition: inline
In-Reply-To: <874ix9rva3.wl-tiwai@suse.de>
X-Cookie: Well begun is half done.
Message-ID-Hash: BOCK4WUZWU7WKZQWW5OXOHFP7URAZ2MR
X-Message-ID-Hash: BOCK4WUZWU7WKZQWW5OXOHFP7URAZ2MR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOCK4WUZWU7WKZQWW5OXOHFP7URAZ2MR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--QGQA6oF+gPs2XJMM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 25, 2025 at 09:42:28AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > A couple more small fixes for v6.15, both of which could also easily
> > wait until the merge window.

> This was already pulled.

Yes, sorry - my tooling doesn't deal well with me moving between
computers with pending pulls that didn't land in Linus' tree yet it
turns out.

--QGQA6oF+gPs2XJMM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgzAs0ACgkQJNaLcl1U
h9ACjAf/VKsYGGmhBuUsX/u4haU0Ji6iCWqi4CEK3thu4Qtswpz6S8F5Y6pP/Cnu
oZZNQQAi7nJ2jH2PhyEp19IGfDeN3ofng3U0EI0KnckOSRrvamLeJFaHpCDYXKhL
XHTGItOEw9tPOF0lPLfp9ZcA5cC1RKB0BXCt+RaKWa2p4kC19I6nqCYrW5nFsAo9
OAHtnnM8dzk0Q5zkI6wIwmBVloSkwwf3HLKt/0xZMzFUqL56NJtj+ZWJ0h1C1Lg3
Y3uf2iWihXLuRIf40Wk4bXkc7qnp0gQqOvsfaqV7SL4KVrYqRXkLRBAjAooobIbr
4VPgjCLJjIFf/xTStz0xXQb9JGamTA==
=xevk
-----END PGP SIGNATURE-----

--QGQA6oF+gPs2XJMM--
