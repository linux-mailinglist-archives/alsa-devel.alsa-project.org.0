Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB59C7DCDE3
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 14:31:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9A4886;
	Tue, 31 Oct 2023 14:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9A4886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698759071;
	bh=W14KRYEwnTh8Pmu7IMmo1snNOn1M2aSvbqZ2rA4RjiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iFQW3KvegJCtqUf0BXNz7BxZFt46T50WudmS8iL8DilNg+fGG89whzxpcxX6dKltJ
	 wu2njNG5Sx4WRRmNILJL3FMZv5hYJ1dKMgDxbAG+QMyLASlGFXRVYRbh+ErBRlwek8
	 sVPEphQzAzczU74dn2bpFhpiUsqnbPoqzawlFQzI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AC92F800FA; Tue, 31 Oct 2023 14:30:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10391F8016D;
	Tue, 31 Oct 2023 14:30:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4AD5F8020D; Tue, 31 Oct 2023 14:30:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D813DF80166
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 14:30:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D813DF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DIP99vtw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4A29BB80E9A;
	Tue, 31 Oct 2023 13:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995B8C433C7;
	Tue, 31 Oct 2023 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698759004;
	bh=W14KRYEwnTh8Pmu7IMmo1snNOn1M2aSvbqZ2rA4RjiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DIP99vtwKZ4BNywb9aIFK+mOni2rrzbUXxqMQN0ZNtdYoJnSrkWwrSr86amUZAGx3
	 Wf08SqkkeARHNX7Rt/z84bEEz9/ADsPQxqzh94oZlMjOFIabDEUgpmqUzgjk8PTJXP
	 zY/RPPHatg2IJihPF8Cx3ORAIpvOzXc+4pqqxWWFO/o5798U+a4o++a3dRyLn+yY+f
	 JQ817UnvMOkJcggeEwUB3GQ6OFpJVu9NQ11NcRDmOCdm4sw5FaYDDY/GUhl4LJ9997
	 4OXBpDurOAQq8LhptNmWAdGi3izPJF6j4N+6xZlRf+TBDENf9ScwyNRZunks0vS4RS
	 KY86T2WwOIRCA==
Date: Tue, 31 Oct 2023 13:29:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
	Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682s: Add LDO control for dacref
Message-ID: <ad79bd27-5c1f-48b9-b0b5-bb5c48cbd56c@sirena.org.uk>
References: <496805f7ca084e9dbcf7140cbe83ed4b@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="04LDvObmPtlfWbGU"
Content-Disposition: inline
In-Reply-To: <496805f7ca084e9dbcf7140cbe83ed4b@realtek.com>
X-Cookie: Is it clean in other dimensions?
Message-ID-Hash: 7ZXEGGE4N3FNJIQHSZ4MWJUEZSF7JSL3
X-Message-ID-Hash: 7ZXEGGE4N3FNJIQHSZ4MWJUEZSF7JSL3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZXEGGE4N3FNJIQHSZ4MWJUEZSF7JSL3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--04LDvObmPtlfWbGU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 31, 2023 at 02:08:10AM +0000, Jack Yu wrote:

> +/* LDO output select */
> +static const char * const rt5682s_ldo_output_select[] = {
> +	"1.607V", "1.5V", "1.406V", "1.731V"
> +};

This feels like something that might be a better fit for firmware based
selection - how would someone set a value for this, and why might it
vary at runtime?  I'm a bit unclear as to what the control does so this
might be the best thing but perhaps not.

--04LDvObmPtlfWbGU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVBAVYACgkQJNaLcl1U
h9BL3Af9FkV6yf1MZEbtkbMSTatqc2a/ilOhaNDJQdEC7fo5Px+4PDBOsfylWP/h
WEFQ7kJBypg+RO1FwY2xTz6D/8gng0kX59NGhJkkRS79rC30JZlGLw1q9wCmezyy
WnkBw3QnwOh9ig1ZpXhIFilNWxIz4TOBTvI/tHBU4YWU9ibQ58ZSPryDcI6KqTru
mouQjTAchfe9S4hPzw3iRC74ftyYoQsM/y9UaSb/37WTzQusyQQ2FaIdM48YMr+A
LSDO+QuwRQzxUDW4utMs2UvkZq2DGSJvEniWiehTA46P+xAOCbzskBqWqsVv+EXD
uPCyZnRqUhy55rpTpOzvOEdrK/Ku2w==
=bD/6
-----END PGP SIGNATURE-----

--04LDvObmPtlfWbGU--
