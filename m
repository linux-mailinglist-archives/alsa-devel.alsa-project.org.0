Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D5B9906A9
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2024 16:51:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42B157F8;
	Fri,  4 Oct 2024 16:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42B157F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728053475;
	bh=Yz2WKEs5JKzMFngVQWLTNZ4WwJlmpb/O/oE0G1GqrIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ne/F+dIzUyenY5PiTnlwUGt7gFk0Enq2pXbDgbVchPs1Gu7fwcYr8KZ1Beqda13Yd
	 T93Uz63l6a9irHxCqJZFoYkuSfPo9oQj7Io1vcQc3Y0gT2XX5OiH0KVxkoqKMR0j6E
	 9OwI3jGJwe3BPRgvSFqt/HEuyN+5s1mleDSV0UvI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0028F80104; Fri,  4 Oct 2024 16:50:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39E35F8057A;
	Fri,  4 Oct 2024 16:50:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F468F80517; Fri,  4 Oct 2024 16:50:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15393F80104
	for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2024 16:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15393F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uBv9TR/E
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 843005C5DFD;
	Fri,  4 Oct 2024 14:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB91DC4CEC6;
	Fri,  4 Oct 2024 14:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728053415;
	bh=Yz2WKEs5JKzMFngVQWLTNZ4WwJlmpb/O/oE0G1GqrIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBv9TR/ETEp7HCpzqyoseNb7rbm0S+HFDcwnB3a4QkiGRv8O+QTTynNDWYhbKsKMk
	 CWBtyfNUhD7Yu9/5jVbdKjyicC4u4yzDC7WouyQFladI30nK+a4oBiYXCDjPK7IvSE
	 lnPwjLrCIpAscRMzk10mUlN/QnUtyipkVoRtAPgZ++TCL+LisGNtRYxg2tWlc3Aipa
	 ANImvR9OaPdxKvJSPVga2wEkJdyC+YDlEKezP8s/lY1hB5RZRydqVFQJgISB+mUUTG
	 Ztg8HRaLD7EcskQhBwjvQpnpZkz+wbiELnAh02cUDb32LX+5t+tjexNKV/cqESHW4m
	 EGTe8XtVAHDWQ==
Date: Fri, 4 Oct 2024 15:50:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.orgs, skhan@linuxfoundation.org,
	anupnewsmail@gmail.com
Subject: Re: [PATCH] Fix unsigned int compared against 0
Message-ID: <1bae2b5e-b9fb-4c21-9364-452f9a6a6daa@sirena.org.uk>
References: <20241004141046.61265-1-advaitdhamorikar@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+8tEJtJ8YA5fPvdg"
Content-Disposition: inline
In-Reply-To: <20241004141046.61265-1-advaitdhamorikar@gmail.com>
X-Cookie: A bachelor is an unaltared male.
Message-ID-Hash: AIOKQ5GTNY56BTGNGCAWLSREMEIR45J3
X-Message-ID-Hash: AIOKQ5GTNY56BTGNGCAWLSREMEIR45J3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AIOKQ5GTNY56BTGNGCAWLSREMEIR45J3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+8tEJtJ8YA5fPvdg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 04, 2024 at 07:40:46PM +0530, Advait Dhamorikar wrote:
> An unsigned value held by offset can never be
> negative, so this test will always evaluate
> the same way and is therefore redundant.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--+8tEJtJ8YA5fPvdg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcAAKEACgkQJNaLcl1U
h9DdYgf+KN0f/pQLCvoWXEiRjFWJWeIcRJ+8ruGF7J8U/FvqN/yzJkgJHVTjlMgm
Y84lmov8Qk9Is+k2Drdnvlve6xY7hoFc56wCvGnh8PMAq48hGedzqddaNJAyAwMR
seXLfPO/oFjl42ba3e19je68Ws8NyKTEq6OXOoCvqgix72JEUUpVwHiylnb5BC/X
Fsn0v3dbbojM82yinMH+VHCdI+cpJvEkD5hK5E5QJtvGTDnaPH81xaWjzsfYEZaW
yLAI6KvAupIoab1WHHXWB5eZU/08bSULLxpTMtQNgen5fDwz6s9TEkmkIiSaoOop
N4gNlPBFiEhYGOcYXTxxJTCjKB45mg==
=NvRR
-----END PGP SIGNATURE-----

--+8tEJtJ8YA5fPvdg--
