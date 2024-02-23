Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F39A1861B56
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 19:16:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A1A850;
	Fri, 23 Feb 2024 19:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A1A850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708712191;
	bh=qL3O5yBmHIcp4OFTSD22SaNMNSh4DEFGM7j4NFlupJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YvSgFFMstxgsQxxw7styDV1gah0kMwAQFqL3bdfEXiS4c6Yh2q4cD0FxD+w0yNSxK
	 gIxhhRbR2ql7mdvTDJ9HxDd1HzyAVFoniQc5Hve0UW9EMC0b5xprOs5prQwj4qkAbq
	 c0jMi+RvK5h5lqEnircBx6NZ080YfX4CE30ePwtY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BE04F8057F; Fri, 23 Feb 2024 19:15:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D929F80104;
	Fri, 23 Feb 2024 19:15:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39F8AF80496; Fri, 23 Feb 2024 19:15:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B37FCF80104
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 19:15:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B37FCF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EpWDTU88
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D773FCE2DD6;
	Fri, 23 Feb 2024 18:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4013C433F1;
	Fri, 23 Feb 2024 18:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708712146;
	bh=qL3O5yBmHIcp4OFTSD22SaNMNSh4DEFGM7j4NFlupJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EpWDTU88qgW68ykgUBwVe7363w9Mdx7jdvRfZFA1vFH/HEfhuHnoLOxBhpDxNECdP
	 ucWnjM54vIGZtblrWKrVvCIdIxBZoj9f5Q8lGm8D590qDUZuVTxNgDQBaUInxGqNxh
	 L8GcLFhBIxfgkT2GToC8DtPytOS/flph9Zl0PTgf7DX/QRP1RUeI04sOnig/u6iSnR
	 PkzxhH/Jb93Fb51PCiMfhg1e41GUZL1Tdy/BtcOXOM0Qri0CQrRt7ioN0B0ShIHpcq
	 +v39nKbb+ofKmmtoJK0uaodk3hcph339l92DDyhw3eiA3xUBr3Yd9ZmA59kfTrd/OM
	 lsY8/yDLcLKHg==
Date: Fri, 23 Feb 2024 18:15:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v2 6/6] ASoC: cs-amp-lib: Add KUnit test for calibration
 helpers
Message-ID: <ZdjgzqyrNOysFldQ@finisterre.sirena.org.uk>
References: <20240223153910.2063698-1-rf@opensource.cirrus.com>
 <20240223153910.2063698-7-rf@opensource.cirrus.com>
 <ZdjMIVYp7Qb/Tt9d@finisterre.sirena.org.uk>
 <956f2b88-8b52-45b3-a27d-fa8e75a02642@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="taWa+zNeeuI9vMOx"
Content-Disposition: inline
In-Reply-To: <956f2b88-8b52-45b3-a27d-fa8e75a02642@opensource.cirrus.com>
X-Cookie: You might have mail.
Message-ID-Hash: GSLGQAMLI6X3WDWVC35PD5YDY7AUMHTF
X-Message-ID-Hash: GSLGQAMLI6X3WDWVC35PD5YDY7AUMHTF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSLGQAMLI6X3WDWVC35PD5YDY7AUMHTF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--taWa+zNeeuI9vMOx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 23, 2024 at 05:02:03PM +0000, Richard Fitzgerald wrote:

> Can you skip this patch and take the others (assuming you are happy with
> them) and I'll fixup and resubmit this test later.

The series is already in CI without this patch.

--taWa+zNeeuI9vMOx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXY4MsACgkQJNaLcl1U
h9AlgAf/XjfgmirxL71nShnAv5faVLtI8hjyefwEoWIwfU+iwvUSw1RQaHZtrV+Y
da0wvY1xm5SKIdWaeXkrHzcvuDaOilA6viztm1+anb/Lbgd7py/07HirJAJvxO4x
mgmsW4T8gh8f5chQBlTD6di8aQlnCiB2ZoVHNzxX5CpkjY8iLF3x1uJOHCgCZAPM
wklV2oYIYNrYv65Scq+eLcIKeHf/nn1n9kAQPNSg+ZBxMyJEOnSZp+F7bCPQY79J
eU4MDMbXXo0TFP4GeuVyOlM1ezHFM453e9P0BRIyBDyOOjYsY7AvKpTczu9q1SiG
5jFK7bNwnFPzaYC8B8xxp6ObMoJMrQ==
=vAW4
-----END PGP SIGNATURE-----

--taWa+zNeeuI9vMOx--
