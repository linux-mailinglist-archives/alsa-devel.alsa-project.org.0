Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D75A7171A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Mar 2025 14:07:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51339601D8;
	Wed, 26 Mar 2025 14:07:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51339601D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742994435;
	bh=Cqq5jFzCIxmCfFNfx8fwKPnSTQb3kUzy1eRUhjzrldE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AvTA8tTfcmPZG0GfIVO9QF6oqCuoz3+WqyHW57LCdkjwENCiBj7mX1YhXjGu1dqyL
	 DVAmbGpOJ0GZ4gGhLbS8WtQMOMGz6mQtlknfovlxsqLB5z2186xM7vutJuD4/KIM3T
	 8KKmP2nIVlcEWPHjBdeMp8Wvu+FqT7OdU65BL9l8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2CF9F80169; Wed, 26 Mar 2025 14:06:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6604FF805B6;
	Wed, 26 Mar 2025 14:06:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3451F80171; Wed, 26 Mar 2025 14:06:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4DDCF8010B
	for <alsa-devel@alsa-project.org>; Wed, 26 Mar 2025 14:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4DDCF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gkisAdSx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D46AA43B11;
	Wed, 26 Mar 2025 13:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BF9C4CEE2;
	Wed, 26 Mar 2025 13:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742994390;
	bh=Cqq5jFzCIxmCfFNfx8fwKPnSTQb3kUzy1eRUhjzrldE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkisAdSxKmv+/MjMr5ErVd6QF7g74npArnonU+YNAJfW4r/9788VEzgL/SKlE+Sw6
	 IqTduXX573j6yK4HkYMY2IZzwQCWs6YPTe3uIl0gnuYoHtGkYUnmB//+4DzPwqzbaI
	 r27weNycZUflsBXAsTK7q4x7fDNTyXQfl3Q5R8B7o1W082A6/PZP2Zj7bbZx1Nb35k
	 P9Je9l1xHq9u9iLYlakBlh+vXjOgLekcHY8D9huepbSMJZPyweeLzk2iHEGcQL4UIQ
	 XQQxkCIIrnUn5JEMMZqjKRsRpSlPBGaAOBBTn+kvwYN1ifC4eQ6sMg7H3nUNWCZ+ZG
	 EkdlhIr6bUoGw==
Date: Wed, 26 Mar 2025 13:06:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Brady Norander <bradynorander@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Aleksandr Mishin <amishin@t-argos.ru>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 2/3] ASoC: amd: use new ACP dev names for DAI links
Message-ID: <4045f230-1fdb-4a2e-b2a7-2dfc088c1a03@sirena.org.uk>
References: <20250325211545.2099169-1-bradynorander@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T2l1mc34r2ShMavw"
Content-Disposition: inline
In-Reply-To: <20250325211545.2099169-1-bradynorander@gmail.com>
X-Cookie: To err is humor.
Message-ID-Hash: 2MHPVWFMYHHEEHIPG7GVAJNF6U73PSS2
X-Message-ID-Hash: 2MHPVWFMYHHEEHIPG7GVAJNF6U73PSS2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MHPVWFMYHHEEHIPG7GVAJNF6U73PSS2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--T2l1mc34r2ShMavw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 25, 2025 at 05:15:45PM -0400, Brady Norander wrote:
> The old names used automatic platform device ids, which means they could
> change. Use the new device names which will never change.

I've got this patch and another patch numbered 3 (but not properly
threaded with it) but not a patch 1.  What's going on here with
dependencies?

--T2l1mc34r2ShMavw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfj+9AACgkQJNaLcl1U
h9BbKgf9FssF3nnIHWH5FPoiteEcuogQ4BsueuLhkuqvS2WEMv13QmYNjmvQX8V7
46fhsyJnOnurd1bBx8R5G81IMH1OpVwX2fjubZ3vMAiIizCRFUjOFKgDreQ5gyQ6
Vy4FzzPgRpvHTLO4z40w/QHn8GCS8nTPjWYD4x+cdWKuEjsTw1wLRsnLWP+DljR8
qQ54VgeCXMT6csyjbS5fcDm5ejF49pZHjhP1Z7h4SRAKQfr/ShXr08jJDVnon27B
cb2SOsljdkCrMRnkLw7yqGZqNlXQxjldrwc5Ms95+k/K7LpeIa8D/5sWRgEuGKJK
+9XfW3rHBnlx3hI94terbCtTg0SHsw==
=NV3P
-----END PGP SIGNATURE-----

--T2l1mc34r2ShMavw--
