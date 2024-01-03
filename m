Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3006823481
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 19:32:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 362C5E9A;
	Wed,  3 Jan 2024 19:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 362C5E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704306723;
	bh=hngD+IDMCG5UNcY50O5jUIC2dfyxPIe5eyQlBYdFUr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e/slX+e0HTEhO+Vdumc9NdLCW+ii9cEffbFJ/wsoCJgDP8PZsmpmP3GbuC/E1hJiI
	 JZUd06iSfkjTE7Ih0a21/HuuDSNNvM0mAGiEqwKnndBNPT7aANGcLpVloerpsBiGki
	 XAw2jJg/s8Zm8FmcyU5vqKf1xN7Uq/FnzL2Q45e0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33D60F805A0; Wed,  3 Jan 2024 19:31:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C5A5F80564;
	Wed,  3 Jan 2024 19:31:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77B42F80537; Wed,  3 Jan 2024 19:31:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6E74F80533
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 19:31:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6E74F80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=etyECy0X
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5ED5F61579;
	Wed,  3 Jan 2024 18:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B131C433C7;
	Wed,  3 Jan 2024 18:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704306667;
	bh=hngD+IDMCG5UNcY50O5jUIC2dfyxPIe5eyQlBYdFUr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etyECy0X/5DzXMxH8hftxAv025gWeYUOJfvwVqvbixE3Ip4xKl1IrL0JHYCYb0wL8
	 AyrVSvtzjBqmR61R9QiKdKoBV+G89G+s5+5kAK8CXh/KTUkZXVxAjYkHI/oSTby0Pk
	 6O4EsOanROyzxzRa3WnoZavh5pUCjj3F0chZIPPOJau1HUexpRkAXJSPyn1KAufw4e
	 uoyQVYA4s19TKbgQSnUXtGdMnqUjaLWc8amHNE6mYPpSbybcM0mQWw/uXObmdTtuyT
	 Bi+DNIK/ixR1E7DO6yfYKTUlu3wgnK0QX+m/4NmsDGfr1can8EWQUkuvh0BMjrM3tW
	 Sg6Xk/1eWQFnw==
Date: Wed, 3 Jan 2024 18:31:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Oops in hdac_hda_dev_probe (6.7-rc7)
Message-ID: <ZZWn5vWeWe0BYFfY@finisterre.sirena.org.uk>
References: <ZYvUIxtrqBQZbNlC@shine.dominikbrodowski.net>
 <87sf3lxiet.wl-tiwai@suse.de>
 <ZY7kosArPqhlCfOA@shine.dominikbrodowski.net>
 <874jg1x7ao.wl-tiwai@suse.de>
 <ZY_Gb8-rncuOjRq-@shine.dominikbrodowski.net>
 <87plyovwg7.wl-tiwai@suse.de>
 <3260e806-a708-4462-9d4e-346e54143a65@linux.intel.com>
 <87y1d8ulxv.wl-tiwai@suse.de>
 <87o7e2a3hr.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BfbeOu7ghkN4iRpV"
Content-Disposition: inline
In-Reply-To: <87o7e2a3hr.wl-tiwai@suse.de>
X-Cookie: You might have mail.
Message-ID-Hash: JNATUC44MCMCPFQO3LFXVHURDDOOY7BZ
X-Message-ID-Hash: JNATUC44MCMCPFQO3LFXVHURDDOOY7BZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNATUC44MCMCPFQO3LFXVHURDDOOY7BZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--BfbeOu7ghkN4iRpV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 03, 2024 at 03:36:00PM +0100, Takashi Iwai wrote:

> > > Mark, Takashi, can you pick the fix for 6.7 (it is in -next)? I think we
> > > might have time for it to land?

> > Oh that landed to Mark's for-next branch, i.e. only for 6.8.
> > Mark, please cherry-pick and send a PR before 6.7 final.

If you're trying to attract my attention a comment deep in a thread
about HDA probably isn't the way to do it, there's a very good chance
I'm just deleting them unread given how much random HDA stuff I seem to
get CCed on these days :/ .

> I ended up with cherry-picking by myself now.

> I'm going to send a PR to Linus for 6.7 final in tomorrow.

I have some critical fixes I should be posting just now and sending a PR
for later today (unfortunately the board that's impacted has some
ethernet issues in the bootloader which is really slowing down tests
here).

--BfbeOu7ghkN4iRpV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWVp+YACgkQJNaLcl1U
h9AAIwf/Qzap4+U79NRRmhcs4FVob+v57O/mHIzX8S6LB53NGVey9KARMwFrFV9O
C5JKz/NVo68HRvG79ed9XP92r360aPRzdTsUaNRH/q2n7d9W8qaRJVDO9oYY0mA5
uq517mTtY4AhMK/QodecrEySvjgwzVQNL42YS4CvUiFYXnpUJwR3p07E4WzHIcpZ
dMa/tXPPVnHMWg1bDPyCPeOgoHwTGVuu6Wauk1ZUNvO/StRNbmX9IMVnguTkkx+7
E5ouzPwkxmgXNyEZmfYW9LKGoLqphZ+d9kXaTWEVPO7b8xic9hjb4C+Wte9ASHYf
JcMZrunllwufIpMXDAhlLXpphs579A==
=IoKw
-----END PGP SIGNATURE-----

--BfbeOu7ghkN4iRpV--
