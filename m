Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1B1766040
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 01:28:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97C7C828;
	Fri, 28 Jul 2023 01:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97C7C828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690500511;
	bh=eYdamAR9IwNb7ZMcaqS76Bws/3YygfXLjnMwqsbDt88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gyNhd/KMH+lvqb/QEyrRB9nHY1uSJbnIiLd/9f+dHFuAsgAcuH0pJHorteIIHBtM/
	 ZOux7MGfLf+74+sSdh6LFVWj1eaueXlDf83MOEN+Ga+xeHaOv8j0iVzcEUPHySeWSJ
	 +HVu+yO5Q8uEot84+TOUQ2U/SlEWNxpuEd+HcaYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE637F80310; Fri, 28 Jul 2023 01:27:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 755ABF80163;
	Fri, 28 Jul 2023 01:27:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF789F8019B; Fri, 28 Jul 2023 01:27:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9FB3F80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 01:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9FB3F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kgbNFW1j
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A002961F8E;
	Thu, 27 Jul 2023 23:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20150C433CB;
	Thu, 27 Jul 2023 23:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690500451;
	bh=eYdamAR9IwNb7ZMcaqS76Bws/3YygfXLjnMwqsbDt88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgbNFW1jLhTadTo3OTjnsqbgl3HuNukpcDRdVejd5Q0AzhKYtmSSB8gEcOv9RWhlX
	 gdt70k+LRoxcUmqN/XEwp4duSqHqIhTyyWsT1fLCjTh8jn+/y9LIq9Kcg2c3YRakXn
	 m3RamsQof3ye6ZhkQDdNu9GeUVZPIPN6kPol5k/Idh997KJqyyMbELCM1/mU9yW8of
	 hk3/TaMe7upwvEmND6rtQOSrYfEnpGX6Hl1tCdBn0aw7rMUQb1FdBI3mo1CMAIeQVx
	 Qoibh4W3GBpWN1od4KpUwqUGnlf4W1FWMDj30jRMsjZuJ7lAjOk21HArg0YxAHYq3P
	 XiHijmKsie/5A==
Date: Fri, 28 Jul 2023 00:27:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: Intel: Skylake: replace deprecated strncpy with
 strscpy
Message-ID: <f0f0ebe4-55fb-4861-a94c-77c82ec600c5@sirena.org.uk>
References: 
 <20230726-asoc-intel-skylake-remove-deprecated-strncpy-v1-1-020e04184c7d@google.com>
 <20230727-asoc-intel-skylake-remove-deprecated-strncpy-v2-1-152830093921@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fxdzMHT9nHAlz0DB"
Content-Disposition: inline
In-Reply-To: 
 <20230727-asoc-intel-skylake-remove-deprecated-strncpy-v2-1-152830093921@google.com>
X-Cookie: Go 'way!  You're bothering me!
Message-ID-Hash: FW62Y3FPL2KYZWLWJZFHUG3NZS7TPTV6
X-Message-ID-Hash: FW62Y3FPL2KYZWLWJZFHUG3NZS7TPTV6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FW62Y3FPL2KYZWLWJZFHUG3NZS7TPTV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--fxdzMHT9nHAlz0DB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 08:30:18PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
>=20
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ the case for `strncpy`!

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--fxdzMHT9nHAlz0DB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTC/VwACgkQJNaLcl1U
h9BKtQf+PU+B7WMVvB7nKGZnwnltRf1hOqO+ppLtmCXfk99XwgbXWOnUINT6wWH8
rqz+nkDW5ENnOOk1EVwQ1ZhlFbJjQhKa6GtrywDD3j69RP8MljzUJB9U1aqemxlM
g2ZbR9w+dkv1BR/tbYavi/OceU/0f4BOYEAMCv94GOEh55dCbXcJPVC+QU4zjORa
LY+hg4QCm9+h6KL8bwUpim02/gfJ94NugdogkyB31Ct/d87gH53GGnrJRU7x7nB2
UcDs6mPmCH9QSxupNP0S5Zy9VA5yl06ahKnW9YvFiEmRLQJ00An+Pam5Cjrwsfa/
3gihyIbKLSxc4IGD9kJDuCTDJuz2Gg==
=wnJm
-----END PGP SIGNATURE-----

--fxdzMHT9nHAlz0DB--
