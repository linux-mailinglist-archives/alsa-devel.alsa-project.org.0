Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 256E787CF87
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 15:55:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79E652317;
	Fri, 15 Mar 2024 15:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79E652317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710514548;
	bh=wpqIUwnNLWbIy1Zvw8blSo1JlKbndzcJuNOieCu2HqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E+ZjbXFaMu/KnkNs/ajKo032lZnd75YUKRUQSx0cgXajlF4GtkP2n33IidvlYBe2V
	 M/bLMGqrzb5REpeU9kVUZ7c79Owfu5w3LO0757Um7Wae8a7yvfc1nNHau5nIeOLrOB
	 S8dOccesXRuc0NcYchnN5uwT5ixVMVSoMkbW3mkg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AC72F805AE; Fri, 15 Mar 2024 15:55:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1C6FF8057F;
	Fri, 15 Mar 2024 15:55:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07A8AF8028D; Fri, 15 Mar 2024 15:55:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D2B6F80093
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 15:55:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D2B6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oJf9ywlx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 693FDCE20BE;
	Fri, 15 Mar 2024 14:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4979C433F1;
	Fri, 15 Mar 2024 14:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710514496;
	bh=wpqIUwnNLWbIy1Zvw8blSo1JlKbndzcJuNOieCu2HqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJf9ywlxeebUGm5lGowLDQIprnpa21rM3k9zG//vZtyYRSfB12aid3EbbaKNikdWU
	 suAfBiOrvPAUV5fJUGyOYhuTW2JvvaxXO2GQ77MheCnaDoT2ma0zyXXObXaql4jmsb
	 Tqip77HGMgvF1isYlmA/yPck4M0NyBZ6ZsWp2FpleUs4B4QxlxC6eAQn5672rThdEn
	 fjy7KIEzadIzf+GtGeelzqslmpmgbTIl8gBsohHeEsCtkI+AWLxc/0PzE0ryShaSVH
	 LLgRjlyZKxusS0VD5yXJcu5E0iGvfPFw09Y1jpnI0BeT7jN/vQ4WheUxLvSOVU0C/R
	 ngIYI8uCVlwTw==
Date: Fri, 15 Mar 2024 14:54:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com, christophercordahi@nanometrics.ca
Subject: Re: [PATCH 09/13] ASoC: ti: davinci-i2s: Enable unexpected frame
 pulses detection
Message-ID: <9b3091e7-53ea-46f8-9dbc-a3896e920a97@sirena.org.uk>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-10-bastien.curutchet@bootlin.com>
 <51866f62-460d-4035-bcf1-b9f03cf9be0b@sirena.org.uk>
 <13faa6c8-ad4f-4f81-935a-5ea74621d373@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2KhnnhvxjBoPFAUT"
Content-Disposition: inline
In-Reply-To: <13faa6c8-ad4f-4f81-935a-5ea74621d373@bootlin.com>
X-Cookie: A well-known friend is a treasure.
Message-ID-Hash: LTOF2HLDTNGGFPWDHCQAPUXWUXBP6I7K
X-Message-ID-Hash: LTOF2HLDTNGGFPWDHCQAPUXWUXBP6I7K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LTOF2HLDTNGGFPWDHCQAPUXWUXBP6I7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2KhnnhvxjBoPFAUT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 15, 2024 at 03:45:24PM +0100, Bastien Curutchet wrote:
> On 3/15/24 15:09, Mark Brown wrote:
> > On Fri, Mar 15, 2024 at 12:27:41PM +0100, Bastien Curutchet wrote:

> > > McBSP can generate an SYNCERR when unexpected frame pulses are
> > > detected. The driver always disables this feature and ignore the
> > > unexpected frame pulses.

> > What does "unexpected" mean?

> Unexpected frame sync pulse is defined in datasheet as a sync pulse that
> occurs <N> bit clocks earlier than the last transmitted bit of the previous
> frame. The <N> can be configured through registers.

> > > Enable the generation of SYNCERR by the McBSP according to the
> > > 'ti,enable-sync-err' device-tree property.

> > Why would this be optional, and how is this reported - I'm not seeing
> > any interrupt handling updates?

> It is possible to deliberately ignore them and that is what is done today in
> the driver.
> This is reported as a status bit in a register. An interrupt can indeed be
> generated from this but I'm not using it (now at least).
> I use the fact that McBSP automatically drops previous element and starts a
> new reception when an unexpected frame pulse occurs.

That sounds like a very standard behaviour for incorrect clocking.  I
don't think this needs configuration at all, just enable this mode.

--2KhnnhvxjBoPFAUT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0YToACgkQJNaLcl1U
h9DXzQf/SiZqlmZT6xmjS1bCVvJ6Goxl8aWHFYwkoXqqlqIa3nAeHYUUyXV05kI3
Q9wNkk5YWPwDi4hHCkO8/XTvDtnobNBT51YqIWsgLquWdHyHehjGdvhqMkxN/eGi
vJ2v+789u9CPM5hry0dMXgBTxlDG5G1b5GWoGe7rjYEdoCDDTNJo56JRpCk3T/GX
g001ZFQgk2tZUyaGgBEjF1cFzWY2WocYH5l5nhhALRHQ+H0zP75++neQ19ydZkC0
Y4R+CzYDoWn/jvgrf5ng/n+o66WW97stC12kMTjiodnTpaCWSF7Bk+qk1WqLoWAJ
uu2o1O7QEGyyJWz+4GuiRyuMupFGbw==
=aZq6
-----END PGP SIGNATURE-----

--2KhnnhvxjBoPFAUT--
