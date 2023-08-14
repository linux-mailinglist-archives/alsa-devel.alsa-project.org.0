Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F9A77B9A0
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 15:20:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA32D82B;
	Mon, 14 Aug 2023 15:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA32D82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692019237;
	bh=FxU0j3fcm7taMz716mWc73u/I77Mp9w2Eue2bF2MZwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fQryaKi0NQgdQyoW1Tkkkb+OzFFy60r5doKTtUyqvLPYqvP3QqxM/YOhT3/kau1UW
	 wFrLKI/zEKwLRkb5aA+hdqs/HT+BSmEzpfqJSz5fT2ysxLjm/YjBgBndVLOzu1bP1K
	 Z7EtbJGRs+TReRu6pJ2Q4BbT0FGc0dH3vmPsqDFg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63C28F80557; Mon, 14 Aug 2023 15:19:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F72EF80553;
	Mon, 14 Aug 2023 15:19:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1815FF80557; Mon, 14 Aug 2023 15:19:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 855D0F80290
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 15:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 855D0F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TXmAl8Pr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA8A063970;
	Mon, 14 Aug 2023 13:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9092DC433C8;
	Mon, 14 Aug 2023 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692019150;
	bh=FxU0j3fcm7taMz716mWc73u/I77Mp9w2Eue2bF2MZwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TXmAl8Pr0Qjh7Rfj3+klvYyVb+jAw8Zty6rpP4eh21L1BT0WEtXbwtxF3mz5caOWM
	 1858fMQMi6JZYWmuBQAdwkwVhD0O3GIUE501RY181xPO2AbHAEh0YMX49IBz3ORaek
	 I5sYesWRhoGkJ7LQGbSxe5d70sMChE3Waz7yJ2auOdL8JJagXDCTqW1dTDxqO4QA1o
	 8yBGSo+NV6LnYFswHsaGNHkExKyOVFeUWnOgVjlF/Fk3lQMG87Pw19j4dddAE+7kAv
	 +YfCB9VLp2vCMiLPN1RJDyPv98kenhYwEl27BVXiXWUXn5F2U6C1o41TmXNkpaHzHt
	 hADSzHk7d9k+Q==
Date: Mon, 14 Aug 2023 14:19:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: Re: [PATCH 22/25] ASoC: dmaengine: Use iov_iter for process
 callback, too
Message-ID: <e9c5a4ff-ece3-465c-afd3-402a4b0efd8e@sirena.org.uk>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-23-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bH9Qky/QE42jqk3k"
Content-Disposition: inline
In-Reply-To: <20230814115523.15279-23-tiwai@suse.de>
X-Cookie: FACILITY REJECTED 100044200000
Message-ID-Hash: TQKT3EG2ITSPDZNLDUE7LRY64N72KACI
X-Message-ID-Hash: TQKT3EG2ITSPDZNLDUE7LRY64N72KACI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQKT3EG2ITSPDZNLDUE7LRY64N72KACI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bH9Qky/QE42jqk3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 14, 2023 at 01:55:20PM +0200, Takashi Iwai wrote:
> Along with the conversion to PCM copy ops, use the iov_iter for the
> pointer to be passed to the dmaengine process callback, too.  It
> avoids the direct reference of iter_iov_addr(), and it can potentially
> help for the drivers to access memory properly (although both atmel
> and stm drivers don't use the given buffer address at all for now).

Reviewed-by: Mark Brown <broonie@kernel.org>

--bH9Qky/QE42jqk3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTaKcgACgkQJNaLcl1U
h9Culgf/V8v9Xak3hh4h6lzC2b+3YbnR6yRTR3KPeC7k2xRigb9ertyFbT18N7Cv
MCUVmwaMCXk+pvClLw7md8c9z+O6juWo9KoRgee1upGPNYuWlqeQzPKIn+ZwD4/g
Ox64hRGSPv9utfVMiitN4D8ytpekJrNKwJ4qVUNnDC7vfvRWIL4tSzf7BoKamZSB
GzDTY0UnB6Nj7CkOHdgPgenAJuTgjyh/RlbDoxIjYi1ni72x5DV23W34uyz/dmAL
esR6RRCYt7H0lr9JiVjKOMwevoYqFZEFwSyCGf7RQ8IDqeyqPOWueee+LAbAmEP4
WWdBU7YengNxPSwpC87FIZl5w2Co9g==
=KpzI
-----END PGP SIGNATURE-----

--bH9Qky/QE42jqk3k--
