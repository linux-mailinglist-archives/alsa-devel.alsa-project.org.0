Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817E914A4A
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:38:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43F99741;
	Mon, 24 Jun 2024 14:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43F99741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719232710;
	bh=5VPx4voAM1j1D9PzeWsrAkqElvUIEYBdZlBVSM6s6LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K9sSHqIF9pQfd1slZnof4sY1wWedGb6olv15OL+3TYTM59xn+5tISgGkCCYX5mKWm
	 2qxj4+QV5CCX8SwFHabZCHMAZBwR4wScwUfA9Tbhs8591uh51Y9RZgsQobWRTeKqMV
	 aGgoRLRSGqA4QQ9gPA/3uAEftPUuD7w3qUc6X214=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3822FF805A0; Mon, 24 Jun 2024 14:37:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FCD6F80423;
	Mon, 24 Jun 2024 14:37:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CABB3F80495; Mon, 24 Jun 2024 14:37:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CF5BF80154
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CF5BF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JR/w7tM5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2FDB0CE11AA;
	Mon, 24 Jun 2024 12:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22161C32781;
	Mon, 24 Jun 2024 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719232661;
	bh=5VPx4voAM1j1D9PzeWsrAkqElvUIEYBdZlBVSM6s6LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JR/w7tM5pfqe0FfoumNp+iJVobXORI3HI2C2LWn3w1IMh73DH21CX6Tl86TmYB0MF
	 O/c0pfVZjdJXWoJAzgrGQX+YUqAFgEK18RtCewVIgwRY4Grs9qg7DU5XEohFeeliww
	 KBPA6n6p06tfkx+2Npyz0I0fgAvUzcC1Bb2j6/ItqfXQRr4sOh+pC3w3yHFRUuLJQW
	 jRGs0fabQywc5l8bcvSGmwLVxNg0LEuwr4UDNcbDHwunhlLaViV2XBLUeKlIA33qpL
	 N+CUWK3JwsQ21u4gD5ZwNmp37sps/tEdeYVkYATRdyqiGHmzV+xiqOHJWADmVUpAAd
	 um4IYbvMuLBGw==
Date: Mon, 24 Jun 2024 13:37:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 2/4] ASoC: Intel: maxim-common: add max_98373_get_tx_mask
 function
Message-ID: <f3b5caee-a27e-42f9-b541-4f6bf8e8d2f2@sirena.org.uk>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
 <20240624121119.91552-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0XbT4Ni5LjwX/prS"
Content-Disposition: inline
In-Reply-To: <20240624121119.91552-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: Allow 6 to 8 weeks for delivery.
Message-ID-Hash: KBP674KQHXIFC3Z6FQ4HSMEPWYFV5R6B
X-Message-ID-Hash: KBP674KQHXIFC3Z6FQ4HSMEPWYFV5R6B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBP674KQHXIFC3Z6FQ4HSMEPWYFV5R6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--0XbT4Ni5LjwX/prS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 02:11:17PM +0200, Pierre-Louis Bossart wrote:
> From: Brent Lu <brent.lu@intel.com>
>=20
> Add a helper function max_98373_get_tx_mask() to get tx mask from
> max98373 ACPI device properties at runtime.

Similarly here.

--0XbT4Ni5LjwX/prS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5aJAACgkQJNaLcl1U
h9BwDAf+Ix6++u8cXGwWway2Gm2lKl9P0MaeP04OPNNlDMKYSdjxi3+20X4fYzeX
O690a4nWmsc3/YoCfUKP94J+LbK2HrZit1P0uRBxdz1E/ZvHXziYqFblLF9IcTPm
VnmYsN0K/EUbsnVNpy4OB5fUc8/b2Xx995RQg8AqORm3ALJvtQfTwW0a65zEUW7A
MUQ1v/+f7sev9QQ9w5BHCSfBHxXNw6xulzgQuDBhG5bnm6lFCl1nLQOc4wx6vk26
bWehSKMtnmsOkT3JIkz2lAajWzE7cYgFhudPzCmj+rpypMQxnlAG+7nqn32Nipxf
ZlVlM95oh9LDWQkeyghm07fke1lvvw==
=KjHY
-----END PGP SIGNATURE-----

--0XbT4Ni5LjwX/prS--
