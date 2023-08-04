Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 271AD7700DE
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 15:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0005D3E7;
	Fri,  4 Aug 2023 15:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0005D3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691154741;
	bh=f2/rWiiZ+BWOnBDUaju5TgK3fx+//iSl49gAZ5rDVNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LTFz37RIzMWFHcTm4FlwOVD0iYv+zLkcT9lh728PLV5lcrhgyXXIS4MUmQ8JmlUON
	 PugUMrl5j2nfZ5CWiQDugmgOKUbBQ9q/BzuZbDD+zqCzWV5e+NVn0HyGh+paWXAKYC
	 EL6UWqDE9XQe70bLiwJI9LfKdvZJ6wKdfc6p269M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6432DF80535; Fri,  4 Aug 2023 15:11:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D7C0F801D5;
	Fri,  4 Aug 2023 15:11:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3D6CF8025A; Fri,  4 Aug 2023 15:11:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A3309F80087
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 15:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3309F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IMZro10+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3AA3561BDF;
	Fri,  4 Aug 2023 13:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1E7C433C8;
	Fri,  4 Aug 2023 13:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691154674;
	bh=f2/rWiiZ+BWOnBDUaju5TgK3fx+//iSl49gAZ5rDVNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMZro10+B2k4gmweNm4CE5LN/6SBKu5OhUflU/VvQYH2x7i40okckpp48M95nYEci
	 9oNjuKrY1qEmsJg+XEhXulFTpGkyyr/W4l/9p5nlO+L7ELtxGPkUdw6///YTtCt3kL
	 do/TiZJ7K3E7e1Ml9D/rU753Wz8W20meD17h2sz6qItA5ZPbRHR94BKWkh/7jsQpVx
	 sqaqu493oYy9ackeXbASMyg4acPgNA5nJxbEnDfVYvIj+8XzLM0cNGf7zDQ7xMOyit
	 ZPRnBmieNpxj+TxSJsedXmMK3OGHZX9oqcyzYZ9c+/d5mP7iTxxpfqCwS1gr8x2aUf
	 V5xzm9RRUjMcw==
Date: Fri, 4 Aug 2023 14:11:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	alsa-devel@alsa-project.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH 04/27] ASoC: amd: acp3x-rt5682-max9836: Map missing jack
 kcontrols
Message-ID: <a0ba4144-7763-4d55-8517-f1c44fa4257e@sirena.org.uk>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
 <20230802175737.263412-5-alpernebiyasak@gmail.com>
 <277be798-9bd0-baa0-9e0d-8a7a9ac67f02@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aUxVXCjCALHmLMJ0"
Content-Disposition: inline
In-Reply-To: <277be798-9bd0-baa0-9e0d-8a7a9ac67f02@gmail.com>
X-Cookie: I'm hungry, time to eat lunch.
Message-ID-Hash: KVSBZIOJ4EM7QNWDSHHGEZLFYFMNVTU4
X-Message-ID-Hash: KVSBZIOJ4EM7QNWDSHHGEZLFYFMNVTU4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVSBZIOJ4EM7QNWDSHHGEZLFYFMNVTU4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--aUxVXCjCALHmLMJ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 04, 2023 at 05:04:52PM +0900, Akihiko Odaki wrote:

> Mark Brown has a raised question if the jack is really not driven as a line
> output[1], but I never answered him (sorry for that!) I don't know if the
> hardware is capable, but I think we better to remove it for now since the
> codec driver does not handle it.

> Mark, does it sound reasonable?

Sure.

--aUxVXCjCALHmLMJ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTM+OwACgkQJNaLcl1U
h9BG5Qf/Zh+JDihZs7ro532usaJFwZMp9Cb1GgiFE9rokNJ0kEQYEJtO/ho/6YR0
43E4WxyobGMN/Rn0mrkPQhLeRJ4ivilk5GvzZBSg27cbetAIzWyAAZMb+uEdK/yE
FVg/Yh7ZS4hIbym2E3MtN/KxVzSMNpAdrPv77AhVaXgMZyneSmF/aLn7S+Am3F5G
w6UFUB6znB1bcApjfP1uKoxAdxUD2MqZfE5TixaH/zpyciWyI1j9fzjQhb+Z615O
VHKkZTWwlt1AlEMn511/vOhTa6kGkFGI5SstyYFNugiRL0O7vSmHpK+rXjBAVQct
4xZdQxTvXrT2f0quFNGXKIuHjk2zGg==
=qIVR
-----END PGP SIGNATURE-----

--aUxVXCjCALHmLMJ0--
