Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7467177C4CA
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 02:54:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97B5874C;
	Tue, 15 Aug 2023 02:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97B5874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692060880;
	bh=KggDOXeF4ksN+SZQTvXyDuHZeY4YU/Ww+VBIeg0Ja3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FSS+Z2sZPWqYxHn27BzzZMZEnjg8bKBktAxfbEJIybbzqQPErvcGto8GJc0l9287b
	 RAhi9XNLk1/rngwDzELH95JO6fRhjbwzbVGDgPN9iRTpwraKblcoiqUImtDFINCLWv
	 Wq00Ue6FuA80iilJJYzxpAgV2kdSbTi6JmCFhmXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F20F7F80074; Tue, 15 Aug 2023 02:53:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84E5CF801EB;
	Tue, 15 Aug 2023 02:53:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02CEBF80254; Tue, 15 Aug 2023 02:53:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61DBEF800EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 02:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61DBEF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UzoW2ZNr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C136D62835;
	Tue, 15 Aug 2023 00:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C796FC433C8;
	Tue, 15 Aug 2023 00:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060799;
	bh=KggDOXeF4ksN+SZQTvXyDuHZeY4YU/Ww+VBIeg0Ja3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UzoW2ZNricxdqpu8SxRjWLqZVNi3+6XNCvm80Vs2HNLr/wXHY/joKuYEZMyaIbde9
	 vErCZyw+mhEXcsxppumsjWjFv4Btc+eMOy+zzxJ2bcyKcKPN86ZBsccC++Mwh6oNhA
	 01yXH8ywSV3SEpd+zHQnLFIjv6FbFiiZ21HOaoiXOt6FCYYPyehtsODOUV+hFDnNiw
	 iG3st2ICzwLM5OqZXs5RDm5zGLRzREUSrm15ZDTkdksICT6Hn0g+gJ7HaSpgqyzqGP
	 cGkARRBiVohsFL6iUYP9DbQcyvhNd0//8YPmKv4mcUiT5998e6ZppukfYMEycjmQGd
	 +wUtzPXVZ0+mA==
Date: Tue, 15 Aug 2023 01:53:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Brady Norander <bradynorander@gmail.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org, cezary.rojewski@intel.com,
	amadeuszx.slawinski@linux.intel.com, perex@perex.cz, tiwai@suse.de
Subject: Re: [PATCH] ALSA: hda: intel-dsp-cfg: Add Chromebook quirk to ADL/RPL
Message-ID: <ZNrMe9mOkNEQu3mf@finisterre.sirena.org.uk>
References: <20230814012637.487602-1-bradynorander@gmail.com>
 <b5fcf342-dd26-2cad-26dc-f6774f627668@linux.intel.com>
 <ZNrGFfMegOWTuLkk@arch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+LIP958ydqzRmRjd"
Content-Disposition: inline
In-Reply-To: <ZNrGFfMegOWTuLkk@arch>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: UCXW5N3KIMK6CYAGB6TS7XZUCY4QYVTJ
X-Message-ID-Hash: UCXW5N3KIMK6CYAGB6TS7XZUCY4QYVTJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCXW5N3KIMK6CYAGB6TS7XZUCY4QYVTJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+LIP958ydqzRmRjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 14, 2023 at 08:25:57PM -0400, Brady Norander wrote:

> Not at all. Just one thing I'm confused about, if I send a v2 patch,
> should it be a reply to my original thread or a new thread?

New thread please.

--+LIP958ydqzRmRjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTazHsACgkQJNaLcl1U
h9Agdgf9EOK2LQTpLGC9wtLUB3IW2fl++1qkiXNhgKegGrYqnDdV7Mpcmp6rKyxD
52au+iMvCaQIsa2Reah6TJ981omfzi/YMLaNIaq0auc+T+hzzjy/JRz2sPALEuvH
A5XTXl+fJj8yKhPssHOsXmeja+fjPACoNA+8Uyg9CVz8V+1QGlgZuhQr4Ybfju58
gaxVadU8qPcf6q3kALJhMZQvyxvCfYb4GQemHAmVT8JKWs0TuhtqTQ11D37Nxyec
/L9u+91pL5/4t87goN3j4vzo51+x2fAPqMjFgXSEweQVRqWSFSzpgtttqMKJ23GJ
qW8JyM8We3rB0Er0MPgGLxJouHWi6w==
=ZNfm
-----END PGP SIGNATURE-----

--+LIP958ydqzRmRjd--
