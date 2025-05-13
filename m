Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EFEAB7F5E
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:54:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09D206200C;
	Thu, 15 May 2025 09:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09D206200C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295228;
	bh=EQnX7N7VffNVrUEjAuBT7cDtlGHqEXDs7ycwfatEYsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YlSCqrq4L2DKP2GaYpxX2DKRq0dIWAFrKIZVUYjkRTIoQcvLm9j0twNyEZX13xim2
	 vQfMVlyw3IVak/i+V3avXsipOIMxbC889vJhIX12b26gIWMvduFNov3MgOVW9+pu1c
	 WjdJcbsPNv2lpGGGfEromj3Na5/t/GM/11f5nT80=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05266F89B83; Tue, 13 May 2025 18:35:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB6D4F89B78;
	Tue, 13 May 2025 18:35:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F4093F89B75; Tue, 13 May 2025 18:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17883F89B73
	for <alsa-devel@alsa-project.org>; Tue, 13 May 2025 18:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17883F89B73
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=C5QW4Iwe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB8275C0501;
	Tue, 13 May 2025 16:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493A4C4CEE4;
	Tue, 13 May 2025 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747154149;
	bh=EQnX7N7VffNVrUEjAuBT7cDtlGHqEXDs7ycwfatEYsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5QW4IweRoXU3By//jssPj1I9br8RsDVzjl1KAPydZEkcWuTmqUbwqzloRY9mT2Tt
	 3AiYP824KQp/NsB67+cmmifNMNh6gauByfAnzeIwyoyQuIITpTwK+XhJOH2ENFpj7i
	 FZBWpRxYH68rfnurhgY/uUHkzvlIlepSIPMQXr8dK+VyhM7BG3ok49gFJRsiU0+gRp
	 nLmwi2SOcZSuWjkOI8z6ZBA6AdVu+6C+omgqIpzp5D/HdvuOX6GF1j/af4dhq5paZf
	 x18INHXg6eVfmH6Sk97bVsl+IuzurD90G5EVGYRuPx9H3Fg3acHt9BWjqGi56b/pWb
	 JaPq0CepZgrKg==
Date: Tue, 13 May 2025 18:35:46 +0200
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13564923607@139.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, baojun.xu@ti.com, Baojun.Xu@fpt.com,
	jesse-ji@ti.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4] ALSA: hda/tas2781: Fix the ld issue reported by
 kernel test robot
Message-ID: <aCN04pvw7-lzKosb@finisterre.sirena.org.uk>
References: <20250513085947.1121-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YDPNt9eOVWN6WI6E"
Content-Disposition: inline
In-Reply-To: <20250513085947.1121-1-shenghao-ding@ti.com>
X-Cookie: Well begun is half done.
Message-ID-Hash: K4HWBIPYYUYG2UORRQXXIZN72JR47LGK
X-Message-ID-Hash: K4HWBIPYYUYG2UORRQXXIZN72JR47LGK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K4HWBIPYYUYG2UORRQXXIZN72JR47LGK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YDPNt9eOVWN6WI6E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 13, 2025 at 04:59:47PM +0800, Shenghao Ding wrote:
> After commit 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c
> and leverage SND_SOC_TAS2781_FMWLIB")created a separated lib for i2c,
> However, tasdevice_remove() used for not only for I2C but for SPI being
> still in that lib caused ld issue.

Acked-by: Mark Brown <broonie@kernel.org>

Even though this is an ASoC patch the fixed commit is in Takashi's
tree so it needs to go via there.

--YDPNt9eOVWN6WI6E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgjdN8ACgkQJNaLcl1U
h9Aqcgf9GjMJs7qvO6//reow/cMgcAv28XBCykx6EvIeTGKl0rSf5aJdwO23jrMP
oBhg/VYwqSBTESrjhpIPhrewKpnbs5fr7peuAxz1TNYvwNeiI7BMgyEOopZcZvDV
62q8smhvPWzLe8p71eTOHD3XxOekmnqgxPjfEHRaJp0DcncekWSyy73Cp+z81KFz
RqTzDA06KFuflu5e/Ao+QieWdkyWlHjZqVqrYvkxiRMsJtZy2UNZaJ0jM94r0mWC
eN2c3lRgoRuroSUXDXI7zks6WA6YFGGe9ihzpZUX04DPlqmmM7OxrA5CcsCJu7fx
LZVekGXVzTc9goOsdVZ7LAd+U9CJEQ==
=hMy0
-----END PGP SIGNATURE-----

--YDPNt9eOVWN6WI6E--
