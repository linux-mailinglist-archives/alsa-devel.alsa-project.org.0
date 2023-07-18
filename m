Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F67757EB2
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 15:57:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEE3E1D9;
	Tue, 18 Jul 2023 15:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEE3E1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689688676;
	bh=uRHw17lISI/6O8PQLrRIjO5Ns0f9TFT46g0OIHNJn5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UZHPw94O8qQGxotQihEtZ86LeYxT+p5lKnwLGaCfKx45wDMnhutwaPcUcFNZSOxuG
	 Uu2IFH/P949Ki3Tcisp0GV6xEgfWh7TsXww2knV9TEjy84BNcJtLVogH/+5yiDvzKD
	 1WvRDEA+HklVgJeNS8hAoMqelktB8hWsbKTERTIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E1EEF80535; Tue, 18 Jul 2023 15:57:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCD1FF8027B;
	Tue, 18 Jul 2023 15:57:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FB44F8032D; Tue, 18 Jul 2023 15:56:58 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C719F800D2
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 15:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C719F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QXu6w19B
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EE1A46158F;
	Tue, 18 Jul 2023 13:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284DBC433C8;
	Tue, 18 Jul 2023 13:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689688611;
	bh=uRHw17lISI/6O8PQLrRIjO5Ns0f9TFT46g0OIHNJn5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QXu6w19BXMzXrPbTHzzzZQWQ1I64YgFfFBKIYgGRHIs/22Ig0EHDPNyGhMjHVj1Nl
	 jW3yogs727B501ou3r1RDL7vlsJBWnIjhekmxvDmuC9Z3Xy4XJQvFwL5iTS/C5zZS/
	 3g7nc8VcEe+UIv4P0W4Qqi5Y9W7TBdnCgAb+khOHMfLCWUNAcYytgVOj+nTL5N4NGQ
	 W9TwfJLGX4m6oXzOhiRI/gltlWuTirmNI2YrowM37OQb/ORA32xszyco/PnbhvLeH0
	 ZxZcyqEQy7momdspSHxp5AA56BeqU14dcVjNktdQNHea4c1c/UvS46oNfdSElFSD4V
	 o1uyEQvGPOPDw==
Date: Tue, 18 Jul 2023 14:56:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] regmap: Add interface for checking if a register is
 cached
Message-ID: <f6f53056-8526-4a6f-bbb9-add5a77379e6@sirena.org.uk>
References: <20230717-regmap-cache-check-v1-0-73ef688afae3@kernel.org>
 <871qh5py9p.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/sGpDUSgYUUieymK"
Content-Disposition: inline
In-Reply-To: <871qh5py9p.wl-tiwai@suse.de>
X-Cookie: Nothing happens.
Message-ID-Hash: 7XZYY2PO2ZB3A2T6UU3AKR66CUHJ6NEM
X-Message-ID-Hash: 7XZYY2PO2ZB3A2T6UU3AKR66CUHJ6NEM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XZYY2PO2ZB3A2T6UU3AKR66CUHJ6NEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/sGpDUSgYUUieymK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 18, 2023 at 07:46:42AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > Mark Brown (3):
> >       regmap: Let users check if a register is cached
> >       regmap: Provide test for regcache_reg_present()
> >       ALSA: hda: Use regcache_reg_cached() rather than open coding

> Reviewed-by: Takashi Iwai <tiwai@suse.de>

> I suppose you'll take those from regmap.git?

Sure, it's probably easiest (and there's some annoying overlap with some
other work in there that'd make for conflicts otherwise).

--/sGpDUSgYUUieymK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS2mh4ACgkQJNaLcl1U
h9DtDgf+LEObVoThsA+VoBUvewEIj0VwHQii7Md+S9p1tzhEnOPMyNsQeP7fJKId
9yegXZh9Ky49/XcLaXdJDExPVXq2+JwemK4be7NBJ/XLfWpIhZrm5pg7J00jGptG
bDNm4Li8QzWmkEhX9LrvQB2W6RlXZ4V3af1bk/MEdzyaTEmHEEQZtCFQAjHKNeVN
wDCFSJvuCbB3zSlHVJbDjZsKfLU1dGRTPuA/o1u1bnZKK3tdMdP8TaV4kGSZQnyS
AiVGSMDoANyX79ed9QRPYPLCvW7AbSB+xuoi0qf++aNC0+FzDDnksEp1yHAdeWZq
ekWW+P2GoCtWdnLjcCeWB/NoZED12A==
=QtRN
-----END PGP SIGNATURE-----

--/sGpDUSgYUUieymK--
