Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F72C77B93B
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 15:00:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A767D3E;
	Mon, 14 Aug 2023 14:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A767D3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692018047;
	bh=LtHqR4yNgL7Btue5s0Mfv0totgeNy96+M5aN+/ZFmOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X3+yPmSwcQRUcWeZ/tIxzfpbD8IWoJOKCmNosi3195W3zhh37nHcJg3s8lCoq6/8k
	 HJ08rxer8HJAqGCcaGb+cCBH5X3+ikcSHi6JAGr+1RPVa6BwoaF5SAazHSFpOlOO+X
	 amiZEHbNVsxgYkpniZ0yQcHU9ChSUKXEJPQiwxYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13704F80074; Mon, 14 Aug 2023 14:59:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFD15F80254;
	Mon, 14 Aug 2023 14:59:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F13F3F8025F; Mon, 14 Aug 2023 14:59:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 851ABF80074
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 14:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 851ABF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Psu8xsv6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CAAC0650C7;
	Mon, 14 Aug 2023 12:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39074C433C9;
	Mon, 14 Aug 2023 12:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692017982;
	bh=LtHqR4yNgL7Btue5s0Mfv0totgeNy96+M5aN+/ZFmOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Psu8xsv6NXwtYJGq1c6t9ibfBp5frUF8sSiU+GCqLVaVq7hNXs1EFCE1HTqYHlz/U
	 KXM9uxOfO0KmIzuBB/P9LhIQeLLGRvuKHJB8LUwm+yV9h+IsLTdx9COxZWdIu5vi0F
	 9k04ShCArOCiGQYNXyv4Jh+yw6DASwZMcDFH/xZwJIEE8rApUEV/x0IEVm9xii8yAc
	 dtXHjJhvXPLgd56dWDzh87AzFFeJ9pNcY99xNEwUB8t2muuPlsyfj17A+tHstQCRjb
	 SmbIAGUMmo7u0tvLJDD3QTruDgrWuxC5frFNuQlm4zHA0HbERcC3iLWNwHtPL7ieNT
	 6Gw3VjSDrYO9Q==
Date: Mon, 14 Aug 2023 13:59:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/25] ASoC: component: Add generic PCM copy ops
Message-ID: <aa76de2e-0734-449f-bd46-afae43b8ff01@sirena.org.uk>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-19-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="grZUougk9zWM0gy0"
Content-Disposition: inline
In-Reply-To: <20230814115523.15279-19-tiwai@suse.de>
X-Cookie: FACILITY REJECTED 100044200000
Message-ID-Hash: NQ547NXRVD6DVUTSTWC2HUFNUUPR3TCV
X-Message-ID-Hash: NQ547NXRVD6DVUTSTWC2HUFNUUPR3TCV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQ547NXRVD6DVUTSTWC2HUFNUUPR3TCV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--grZUougk9zWM0gy0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 14, 2023 at 01:55:16PM +0200, Takashi Iwai wrote:
> For following the ALSA PCM core change, a new PCM copy ops is added
> toe ASoC component framework: snd_soc_component_driver receives the
> copy ops, and snd_soc_pcm_component_copy() helper is provided.

Reviewed-by: Mark Brown <broonie@kernel.org>

--grZUougk9zWM0gy0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTaJTkACgkQJNaLcl1U
h9CM6wf/T4m+QpauBQO3eir95Qj1RcDkydZq9yBmkQcHwR9GEJgvGMmK1jvm839j
cxaYzdvdiwTvC27YarOEPKMhEG+g5Q854av7iyti5cwukGvXGwqmScCH7wbAQWTz
eI81f1t7wa58sKuxUZ8s/DZG+l4ZEEdWB9LbN38/ZrB5qYlQ9jEujGUaA7wIEXEJ
NlmlFHJywQ62z3tHIM4WPDJw+soRy4r9x7HX0yxwKdsHerk43Rai6pIrcWEz6Hii
7mau+k/+PyrO/7yA0QuaG2kla/Kd/oVgNZMQ9kdIrSXl+TuDPpa0kba99K8WtXvl
J2Ar6sfL4BxaEil3OjpT7H7ByuF1xA==
=X7du
-----END PGP SIGNATURE-----

--grZUougk9zWM0gy0--
