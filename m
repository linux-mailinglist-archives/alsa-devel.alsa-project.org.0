Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2FB7F1364
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 13:33:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE39BA4A;
	Mon, 20 Nov 2023 13:32:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE39BA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700483585;
	bh=VpMPOPnBOLwfyHymSSUGd+phFrwbtBpjEwHwsuBlbMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ps3JcakT7whIpQHBdmGVx4ycFAGFyQSAuFMickHOeekMW/F5Sj/tbrcMNKHMeuZmv
	 VvYQnzel2elmOyICgUBrvPqcS3ASIh1Ibj4VRB8I1s1/lM19XwCxqXgszxX5FEXutW
	 Y+mXIBOCzMLr3dXE6E1duTVcIuzCH5fdf48dLzb8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ECB9F80093; Mon, 20 Nov 2023 13:32:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98834F80249;
	Mon, 20 Nov 2023 13:32:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3C38F80254; Mon, 20 Nov 2023 13:32:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7704BF80114
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 13:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7704BF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MWDhq05V
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA6E76116E;
	Mon, 20 Nov 2023 12:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2356EC433C7;
	Mon, 20 Nov 2023 12:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700483521;
	bh=VpMPOPnBOLwfyHymSSUGd+phFrwbtBpjEwHwsuBlbMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWDhq05VMoKau5vnLggUuY/d5j9oy9QIWFlMqRLO1Ag3AFMP3y5Is71d0hvAxBF84
	 XRUR5gewxyQNWKd2Kv51/jmCh2dxJMgJEZ7RIGGM5tTJ4bDiduTmT/FttJk6ocf2tF
	 ynZPwUCZv6vJYvK9ttzi6DHE4OH7uJUPqrGpxWRpni82g+91CMPL54c/YC4CqX0Y4f
	 /hrF0FFYxHeupA1TQ4DniLGIskO9eRS9wGm4npBqLbcT9ktwVwzAfqV6zsepBdLjuL
	 xomg1+0KiacXGP1uZ4I8kCW0g9vjeK4xFFp87CQWIZj4ePZWmDPcJ0zWjlQHLVukzC
	 Z+g0CUVLpdnog==
Date: Mon, 20 Nov 2023 12:31:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] ASoC: cs43130: Allow driver to work without IRQ
 thread
Message-ID: <7d8bf03f-e9a5-405b-8753-a360f46a04df@sirena.org.uk>
References: <20231120104153.76248-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EzncKgt07jbCVykN"
Content-Disposition: inline
In-Reply-To: <20231120104153.76248-1-mstrozek@opensource.cirrus.com>
X-Cookie: <Manoj> I *like* the chicken
Message-ID-Hash: WFTS3GXD5ADCL4XE6PIMX7PVQOVB34EW
X-Message-ID-Hash: WFTS3GXD5ADCL4XE6PIMX7PVQOVB34EW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WFTS3GXD5ADCL4XE6PIMX7PVQOVB34EW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--EzncKgt07jbCVykN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 20, 2023 at 10:41:53AM +0000, Maciej Strozek wrote:
> This is to support systems without physical IRQ connection. The device
> only requires the IRQ for a couple of internal delays, this polling
> mechanism is a fallback when no IRQ is specified.

Your changelog here doesn't describe the change - is then intention here
to remove the IRQ thread (and presumably open code?) or to make
interrupts entirely optional?

I'm assuming there aren't six more patches in this series?  The whole
point in numbering patches is to order things, if you're only sending
one patch you don't need numbering at all.

--EzncKgt07jbCVykN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVbUbsACgkQJNaLcl1U
h9C57gf+OEQRsK3uPH+3kIvhWgpooIAYMV7UzScIDl8wRnQhxGviU2Oct85qI5cG
P1zEHfPMM/oqJbwUOF3W1jkhGYNkMxyF5gNoWuF4aZwiyW2jYPXwp/DPNt91Ahbr
+fvedg7bLZHzBTJ2jCWdTlNVMuUetCFafrbTbIYJnAGMKO3j+Sp0HEyT2/kfHx9J
Nfq4TDOTUbN/sOoL/UzpIMCqgGhDl6P1hjtm2EV64zJ1XFxrzzfVetRpaO4+Avgn
NfDBNsJjEZk6c3usl0u/fLbS3SxYkgqRtZXqKqlwHQcyqVLApgFmgv6aN59QaKdO
kCAiub3Df+k7nUtAs/AKR4iZLf924w==
=Nli+
-----END PGP SIGNATURE-----

--EzncKgt07jbCVykN--
