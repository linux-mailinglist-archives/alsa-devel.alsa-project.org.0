Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5013B694608
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 13:39:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 353D8827;
	Mon, 13 Feb 2023 13:38:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 353D8827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676291986;
	bh=2SQ/LU4e1NX+vkEWCvcD2LJR3vXqnk9dn/dilBbnng4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XAGPm/xIlsc3WnbnIHpSJLGu7eTQYwfN2ktx4b3nHT9BYOf/s1TodvjjdXhbWftiP
	 QIdsq89yF6QAFrrbIGi9BqVHIjH8DOucJuSi+1/C2d/y95HaMEifelN4NKEIxMiHaV
	 GSmaU0uakpHcsV+w8/5WHQ4ImM58wGFYcMYMLfmc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9802F804B0;
	Mon, 13 Feb 2023 13:38:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC73DF804D6; Mon, 13 Feb 2023 13:38:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B796F80038
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 13:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B796F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JifwUng5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 84A9CB811A9;
	Mon, 13 Feb 2023 12:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D77C433D2;
	Mon, 13 Feb 2023 12:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676291927;
	bh=2SQ/LU4e1NX+vkEWCvcD2LJR3vXqnk9dn/dilBbnng4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JifwUng5qvgtyVqhifBmyQB2Ngkh3ybYoZtPPyTA+KRIT2y7akRB5tnXWWbTd87be
	 ls5pkznd3VBXtf9RrA5TDuWFspUXaHWgoqCMI/jJ4AGXgqebDlhGUq/9Wzp9q3wmc7
	 wsBfLWEPmhwVQLSZ151ANKYNd9//IURXHYBDNy5ehoRZgjj5BVxcqhKfaQJ/ODwHOh
	 vgAp/lPNQBFLhhgylu5vO5NWkwGQwroMTiTnHv1wmBI+QX2S0F60U9738H3wC8cfiX
	 mB8K553Us2t2yYErjWqze9xYJV04Hb3FNAgAoCqGbj0RH4pggEzXVdCCkwrcg+aX3E
	 k6UTV+j7FijRA==
Date: Mon, 13 Feb 2023 12:38:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandru Ardelean <alex@shruggie.ro>
Subject: Re: [PATCH] sound: soc: codec: tlv320adcx140: fix 'ti,gpio-config'
 DT property init
Message-ID: <Y+ovU4lfc1SjJJKT@sirena.org.uk>
References: <20230211191315.24554-1-alex@shruggie.ro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hH/FRTbnXZxk0HSj"
Content-Disposition: inline
In-Reply-To: <20230211191315.24554-1-alex@shruggie.ro>
X-Cookie: Serving suggestion.
Message-ID-Hash: AKQOXGCKT5XYQBQZ6NU4XAQCYPLLIPDB
X-Message-ID-Hash: AKQOXGCKT5XYQBQZ6NU4XAQCYPLLIPDB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 steffen.aschbacher@stihl.de, patrick.frick@stihl.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKQOXGCKT5XYQBQZ6NU4XAQCYPLLIPDB/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--hH/FRTbnXZxk0HSj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2023 at 09:13:15PM +0200, Alexandru Ardelean wrote:
> From: Steffen Aschbacher <steffen.aschbacher@stihl.de>
>=20
> When the 'ti,gpio-config' property is not defined, the
> device_property_count_u32() will return an error, rather than zero.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--hH/FRTbnXZxk0HSj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPqL1MACgkQJNaLcl1U
h9DBcAf+L+0n4HFrJZXTSpXPIhKxGNQ7B7uB2rhVPdN5j6BXh5PlsJQh9IOw1thk
AlPQVL7i96Gv+I0WDvwhM9vkQuM+M0ljFKFuxGCsU74cpfLYkOR+tzuu80VlEAoB
Td1kz56MeQZWjeNtkLci9IXlj8RWm8wIiNh/v1C4DoRNK1pfbpGaK2G5puOtYx6u
pUQUGrDckIonc/R7K6poje/QTIhuFJZwFFNZ2ZvvgR5qZNxbGDSckQTIrBX18D3l
ke75MMpf8WekYWRf6APrJi/KTU4P9jmM5eKrfKwi/8SgnJqW8am9zF3lOK41JreT
kIk5P6zV3CZVskZA19TYofJjQ3bGcg==
=/kjS
-----END PGP SIGNATURE-----

--hH/FRTbnXZxk0HSj--
