Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAE2787B84
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:32:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46602857;
	Fri, 25 Aug 2023 00:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46602857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692916327;
	bh=lMYg7ZsbG4eKet8ee/CTYuzT7y56RV2AG4TVKXYILro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kPs+pFqPiCZJgZzftfpPdX1KY0kbI5Q8LTwVdRliqvyEI1nm/N0taYzc4xxbP8Ayb
	 T+NHKmeRIxE0ODrF3HHzbP77kr61sYnrfkB4APcPEQm1N7IUxarMGYnIoPJqkdrD9K
	 M4KqJYtUQiLaXHJAi+OTBw6zcBum4maFq35YoRbk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02A79F8055C; Fri, 25 Aug 2023 00:31:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AACCCF8023B;
	Fri, 25 Aug 2023 00:31:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94A2CF80537; Fri, 25 Aug 2023 00:31:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87213F800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 00:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87213F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QQeSSKAg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F31CF61721;
	Thu, 24 Aug 2023 22:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8416C433C8;
	Thu, 24 Aug 2023 22:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692916267;
	bh=lMYg7ZsbG4eKet8ee/CTYuzT7y56RV2AG4TVKXYILro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQeSSKAgcJbRqv90Du5D3IJ8xiOqJUfXsNvuO/gjVr700MtgjQVHlUdT7NotzprbK
	 e5WgO7aCv4p7fmld3CwhAv3NIesOfuA0im7YAZpVOijdEGBna2We8jz+lPnFewPr03
	 id2KEF34dkQdAcPgsvioGx5nYldlt+gbWRPNHV7CPL0utNwDTik71ThV6RZzfzUqGs
	 t50pdLTQ69UrFG0HGAVmMOKKP+n/Z8r6keIQzfzLhgZJiHojqfOZhh77nXiEFoRZV3
	 r6LPAsU9DzXu1DqpJlJUVP/ni65Y6raLy0hCyC4jQie72AlAVuu2YRZzwqjShgvjyh
	 Jtb+uBFSKyX+Q==
Date: Thu, 24 Aug 2023 23:30:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH 12/17] ASoC: Intel Skylake: Switch to new stream-format
 interface
Message-ID: <ZOfaGAcQvi4lcHlD@finisterre.sirena.org.uk>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
 <20230823080546.2224713-13-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vOaM9UlsQyKhlgn2"
Content-Disposition: inline
In-Reply-To: <20230823080546.2224713-13-cezary.rojewski@intel.com>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: KAH6TKWFWGWUMIJUR7LHFKL7MT4DXKXG
X-Message-ID-Hash: KAH6TKWFWGWUMIJUR7LHFKL7MT4DXKXG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAH6TKWFWGWUMIJUR7LHFKL7MT4DXKXG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vOaM9UlsQyKhlgn2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 10:05:41AM +0200, Cezary Rojewski wrote:
> To provide option for selecting different bit-per-sample than just the
> maximum one, use the new format calculation mechanism.

Acked-by: Mark Brown <broonie@kernel.org>

--vOaM9UlsQyKhlgn2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTn2hcACgkQJNaLcl1U
h9DUuAf5AXwPEKoRlW+TObj3dZ/Cse1uitEMDnfTfsjc7QMS5045UA90erjI2w5e
4WuigoCj9XDHYWak0rKL/ohScbLeLV5Mi0HSruy2MnQSz1104RqzOzpOn1z+kFFp
7dGQtbxcPrp8NtY2P64alk//1Ut0yH6D/K936KHIlEzjCp9cVdWPRG1Fv3PMsxvd
PzOcrj8eCH3N/lvzogul/XNOASiQN8eBx2cZqaA7X8HpeFBVAewwrTR5eFRva17C
qinMu2wrqqOLp6oyLn0xFSjA2xp7cmqCZobTJ39ibq/54VgGSfOWvdRoyFTIiYKf
gljOP3RF0sMj56aM6dbg+1eFi8jDZg==
=pSp8
-----END PGP SIGNATURE-----

--vOaM9UlsQyKhlgn2--
