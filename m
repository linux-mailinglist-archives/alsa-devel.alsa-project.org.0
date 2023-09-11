Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB00179A7DC
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 14:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E29983A;
	Mon, 11 Sep 2023 14:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E29983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694434342;
	bh=R+ql+mzGwM93y+MReTjjqW4uZhvIVp9cZ/7Q+YuOjf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TQ8zASFcliifiU+Z/j0HUXQ+d4kqxRC19tANe+F7aCaZRw4utRDeq0roPhDBOEb0Q
	 TStwcY3rwC6obKhiaTThB3BBSXACYam7O0Xc0oFFUPsTu3wzhzGIYUf1bzo2kIlzo2
	 SGdGXHRjjauRHJOMkESyvo1rju25sgBdRmwqN8Kc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB763F80431; Mon, 11 Sep 2023 14:11:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55C4DF80246;
	Mon, 11 Sep 2023 14:11:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23895F80425; Mon, 11 Sep 2023 14:11:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B00BF8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 14:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B00BF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jvJLyYjz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0E019CE137E;
	Mon, 11 Sep 2023 12:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C7EC433C8;
	Mon, 11 Sep 2023 12:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694434275;
	bh=R+ql+mzGwM93y+MReTjjqW4uZhvIVp9cZ/7Q+YuOjf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jvJLyYjzCnVwb66Q7aIf4Frmxb3Tc+AM3h9ijkk20KXu5nQE1FTLzJz8L9YJH9TJB
	 2uG0YXoj99CekIZmlt9VMQkhdudYozBzK4PGaNApqUosJYayC3yUvld2VvrBnm5vab
	 +50mjNHA1JmoE8e98xqkK05wsunF3DfYPbBz3Do9gwVcD4AHu/fPpB1Kmo2SDWfsYq
	 FutrJHByJrrVHRYR8W3RKGFtqq/AGaLOP2AXCFATo/RctMAPz/mkpes25H+BPPv5gE
	 bkPNyyDPs5+dOUyvVI41fy5QFDwCBl6f+kgOBYsDeiiE415e04v57opKcCtYzxqgrG
	 ZLAhtwEJAWq/w==
Date: Mon, 11 Sep 2023 13:11:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Joerg Schambacher <joerg.hifiberry@gmail.com>
Cc: a-krasser@ti.com, joerg@hifiberry.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Zhang Qilong <zhangqilong3@huawei.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: Adds support for TAS575x to the pcm512x driver
Message-ID: <ZP8D3QMXX0TyVYs9@finisterre.sirena.org.uk>
References: <20230907161207.14426-1-joerg.hifiberry@gmail.com>
 <a9c3d43a-af26-44a0-9352-4666107f9f56@sirena.org.uk>
 <ZPn4nsypsSXdB3J7@ubuntu>
 <bb3e5ccf-6eb5-4a36-9af0-b33f2db68445@sirena.org.uk>
 <ZP8BMkDeZakUyACL@ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XTxCuQJGmxqT6raY"
Content-Disposition: inline
In-Reply-To: <ZP8BMkDeZakUyACL@ubuntu>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: FM5FRFVMSEKDKCDARJZGETDYHYSK5ZYG
X-Message-ID-Hash: FM5FRFVMSEKDKCDARJZGETDYHYSK5ZYG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FM5FRFVMSEKDKCDARJZGETDYHYSK5ZYG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--XTxCuQJGmxqT6raY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 01:59:46PM +0200, Joerg Schambacher wrote:
> Am 07.09.2023 um 17:28 hat Mark Brown geschrieben:
> > On Thu, Sep 07, 2023 at 06:21:50PM +0200, Joerg Schambacher wrote:

> > > But in the case of the TAS-devices we even then need the PLL to
> > > drive the AMP clocks.

> > That's definitely a separate quirk, and does sound like it should be
> > driven from the bias management or DAPM more than hw_params.

> Then it makes sense to use a DT-param 'force_pll_on' and even
> remove the compatible string fixes from the patch series.

If this device always needs the PLL then we should just figure it out
=66rom the compatible rather than requiring a DT property which every
system with the device is going to need to set.

> Still, I think, this is the best part of the code to act on the PLL.
> Simply instead of checking 'do we need it or not' just let it run.
> What do you think?

It's probably fine.

--XTxCuQJGmxqT6raY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT/A90ACgkQJNaLcl1U
h9C9Vwf8CN87CIUnOdszx1yA2ch0s+QLbm/OlXB++k5xtAT7ZT2GAoWr93CkBwa7
KSV2AjgMVMsT7MYDaLoVLa9AVaWpT+Q2IQnaWNn4yoqfLOONAyc+WgKVgIaAPmYC
oSVrF2/hlk7Wlg2+xZwoXEYTCk+YdozTddQyAcUSVKVWclZSt3YE+ot3YWhmxlUh
i5LG2/KGKL3Yj8Q1GL2EOrZRvM3vqrmoiC5agHCaPfXsvObJImd7CnMgBQ5Zx/TF
F7lvgm44lRpwJVP006vdwelLCLO7L1hKEC4NOIBhsxELmQ9EgV+eUks5ADvZ1pcH
C+4ikfO+mg0em7+2oX/aIRVVHB3JVw==
=OddO
-----END PGP SIGNATURE-----

--XTxCuQJGmxqT6raY--
