Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8448077B99D
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 15:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EF177F1;
	Mon, 14 Aug 2023 15:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EF177F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692019187;
	bh=lBqbTPCIMvZDXHrHAaZXck9FK5r0lL0nXE1rupaTgIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dY3nwqZ9GQML4sIziQ+/pUAxUmIYc55NXzANs4Ny3RfwKvWqaqmD8k1tmsdJhOxNK
	 0fy9EStSyjodYPkR7J1uG0UcgQIk+LzVPzq9FD6t5KOCLMteOih//t7qc9Ce3Gt5Vo
	 PQzPaNfGU+00UPb/lCpRgQaYUizDfZJWltzY7VZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 751AAF80549; Mon, 14 Aug 2023 15:18:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21845F801EB;
	Mon, 14 Aug 2023 15:18:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C017F8025F; Mon, 14 Aug 2023 15:18:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D38A4F80074
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 15:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D38A4F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hKnQYGWG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F32863970;
	Mon, 14 Aug 2023 13:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17D8C433C8;
	Mon, 14 Aug 2023 13:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692019127;
	bh=lBqbTPCIMvZDXHrHAaZXck9FK5r0lL0nXE1rupaTgIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hKnQYGWGGEUtyYQ2lP6MwQHbZCPqpe+fFSJExmHITCo++2h3V7IuFQjS40xFTOg+u
	 DIL/Pkm4Q0qPWWhrHUIA7nbd8Q7YCibqko63S/EV6VK/K996A90FLCwEt9UAAYFljo
	 wPkDkGTyZ9sCtNuXRyzprQdQvEaIhCezN8AGw3TPPuw/7wviOB5Lm6ZlBo0TsIgf1T
	 sk2vKyjXLMjgIBHAwp/MMSo1GHDtyXj8bVouAEoT28ti9jykrg7kt1sbjitkOEWKae
	 FXtJZqbzBm6tEebxx9V0Mq+fYS+FOy+lEc8jHauSNTMFmWkXEooRwyvDkCguauwUxL
	 iMLg5/4Sjbgew==
Date: Mon, 14 Aug 2023 14:18:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH 21/25] ASoC: dmaengine: Convert to generic PCM copy ops
Message-ID: <56372322-460e-4331-af61-5951ce3f5013@sirena.org.uk>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-22-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c7cW3ix30VSoX30X"
Content-Disposition: inline
In-Reply-To: <20230814115523.15279-22-tiwai@suse.de>
X-Cookie: FACILITY REJECTED 100044200000
Message-ID-Hash: W6CQLQNBJH36PR2KYLDLVLLQZ7QWOKOX
X-Message-ID-Hash: W6CQLQNBJH36PR2KYLDLVLLQZ7QWOKOX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W6CQLQNBJH36PR2KYLDLVLLQZ7QWOKOX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--c7cW3ix30VSoX30X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 01:55:19PM +0200, Takashi Iwai wrote:
> This patch converts the ASoC dmaenging driver code to use the new
> unified PCM copy callback.  It's a straightforward conversion from
> *_user() to *_iter() variants.
>=20
> The process callback is still using the direct pointer as of now, but
> it'll be converted in the next patch.

Reviewed-by: Mark Brown <broonie@kernel.org>

--c7cW3ix30VSoX30X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTaKbIACgkQJNaLcl1U
h9Cwbgf/Wcw9gGth/K9AprMY6o1jF8W9iYzkvvOfeN3GRvbP7cah8wLBAIa92Tkt
zBMV+EoKUs6GgZpwxwbOylX3rgxWMZtxepkFhJ3Tv/oVlXDmuNn7xHz0H/e8upPf
52X/s+rK/Nd5DplzpjnGIsKOUTfxgCKkFbQNHT7SkY7JDkABo453fMTofBPYhmPU
czs42jcgilGlDG37CK0bBlpN2gzU5Ad2BVDk4OXJxSevgVtd9VqkqcZ76oOSDcAf
aNXregRjk/kPIgfY0vYmBQYerWo8zuyYi63c+sfkQ+R5ZjVRMsfFUlH+28JZaS5z
tsWSGSfuOCQn81kRhHoSEdhsGc/mcA==
=DXqV
-----END PGP SIGNATURE-----

--c7cW3ix30VSoX30X--
