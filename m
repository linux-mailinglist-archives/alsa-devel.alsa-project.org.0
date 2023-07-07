Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2976874B109
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 14:38:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33A253E7;
	Fri,  7 Jul 2023 14:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33A253E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688733513;
	bh=mbKtKR0hDOfsYUOd60G4dTNAhNP0rnZEhKEo7PpA4V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QOvyAFffDrAYEPB/BgDq4BeSkGPEDlIYZR2kQI2YTMdVzXf0DW3E/bgHXEtpyhtps
	 zljBq6xGlCEvGUKKlZYlkUmiV5Z9nLg9laIIhkOqSIhwbmJgacZGCQmNej6zgwVGTD
	 nJGAY06hHIYKWLdu9gWESR0q+1moYnLoQBjH1nVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B11E0F80124; Fri,  7 Jul 2023 14:37:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 002A7F80124;
	Fri,  7 Jul 2023 14:37:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27FF6F80125; Fri,  7 Jul 2023 14:37:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A3AFF80093
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 14:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A3AFF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aNit0vig
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 262C2618FB;
	Fri,  7 Jul 2023 12:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A995C433C9;
	Fri,  7 Jul 2023 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688733446;
	bh=mbKtKR0hDOfsYUOd60G4dTNAhNP0rnZEhKEo7PpA4V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aNit0vigHHp6kJop50zKvZLhCninNHuUv51E8A2M/HAcu4U6AxigDvOK3VHzYcc27
	 iulTRe9aU+L3G0VRNAGyHmrZEVmZNuqRHSGS6TJL+5P7acNhqJeKRFHousBnwkqJbD
	 kE5yQ3wUtizjtjgSs/usjN0zuOqkf7UeJZ1djz8GOEmmVTFUO4RNmb9PVe2KYA453S
	 OmEnnmGub1KgD+cOFKaV8QpALMKkYCq1HYfLxkGeGqz80F9rKs776WgOcXBJcHhgtv
	 t+kenDKJFKxbNk5FdJFcWv/NExLVkXDdAjzp1/iS/TzMJop8msfCvX2qVB1owFzLeO
	 H738e/iPLQzig==
Date: Fri, 7 Jul 2023 13:37:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: codecs: wcd938x: fix dB range for HPHL and HPHR
Message-ID: <a006bb43-eb8f-42ff-a111-a120a3676b92@sirena.org.uk>
References: <20230705125723.40464-1-srinivas.kandagatla@linaro.org>
 <ZKfAUOOcGoBanHHu@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oq9TbAv/U+d9U0n3"
Content-Disposition: inline
In-Reply-To: <ZKfAUOOcGoBanHHu@hovoldconsulting.com>
X-Cookie: Victory or defeat!
Message-ID-Hash: 7QSXTCMREKSPYIDYUF5K3EJCTIOUDPGI
X-Message-ID-Hash: 7QSXTCMREKSPYIDYUF5K3EJCTIOUDPGI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QSXTCMREKSPYIDYUF5K3EJCTIOUDPGI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Oq9TbAv/U+d9U0n3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 07, 2023 at 09:35:44AM +0200, Johan Hovold wrote:
> On Wed, Jul 05, 2023 at 01:57:23PM +0100, Srinivas Kandagatla wrote:

> > +static const DECLARE_TLV_DB_SCALE(line_gain, -3000, 150, -3000);

> This looks wrong, and indeed that forth argument appears to be a mute
> flag. I guess that one should have been 0 (false) here?

Yes, it is - it's for flagging if the lowest value is mute (many devices
integrate mute into a volume control).

> Headphone output also appears to be way too loud by default with this
> patch (alone) applied. Perhaps it's just the default mixer settings need
> to be updated to match?

Some of the discussion on IRC suggested that this might be the case.

--Oq9TbAv/U+d9U0n3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSoBwAACgkQJNaLcl1U
h9AnzQf+JyxvsKCayD52fTwBgQXf7YiLtnekXQaVpcyZ7dKwsUT7h0Pnp01wyq8N
PQdur2WE72RmuSn0Qi0GUxH633LL66Yxm9eMAnwoIvrM7iX0sK7EfuGz8tVSKCEE
1VRUYEDJE00q/CAvBIKZ79/D/cYNqjGYoOw0272ChF96RX/bdtUusc8p1KCuVmXT
VT+Pkdxr1iiApyNCtEvWLspdPGTWIZvQqCYvyz9HDWvtE8dNaiWvSzAlQUawDZoM
gT3lHCvA3Xhrr3rG39ZouHdnoSlHrXbuJJAJABeDVHYFRAqVpj1/Ld6rtbQzCQvB
pC1fLqmsZlCcGwLTUHtWhNMetyUNOQ==
=Qwsi
-----END PGP SIGNATURE-----

--Oq9TbAv/U+d9U0n3--
