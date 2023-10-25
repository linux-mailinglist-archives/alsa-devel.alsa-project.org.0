Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 489097D71ED
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 18:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B51117F8;
	Wed, 25 Oct 2023 18:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B51117F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698252714;
	bh=tKfGS3mdC3h55btqOQSoMjiLwFTWyJK9WDQombLWJnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZBVqWbxDwFdwMphgc/B5jnKFGBBUkWbE9owgc5Fg2lHtrNE+cXTNSH28fTre5gDdn
	 TLccoU+mFN9FNZEx+fvl3Wbracc+3xDtsj1d81KHJBQcSspsREmXUIZbH6q22j6Zan
	 uQ+2YeXGmEd81tgrKJcrqJHrfc5eWYfl/GH9z2B8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23E27F8028D; Wed, 25 Oct 2023 18:51:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB10EF80157;
	Wed, 25 Oct 2023 18:51:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B32CF80165; Wed, 25 Oct 2023 18:51:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28839F8012B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 18:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28839F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k1S2IEoF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C7BCFCE38C5;
	Wed, 25 Oct 2023 16:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7D4C433C7;
	Wed, 25 Oct 2023 16:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698252650;
	bh=tKfGS3mdC3h55btqOQSoMjiLwFTWyJK9WDQombLWJnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1S2IEoFbdLqmXm/viWjpM6NKGNASRcjfX2fZJI4RHr2fDVRoiLCIqO3Boht2/nDi
	 RPR1y1Jw4HsMlpdfYqLMyy+KGQmcz14OZKmEthDgv3S5r1aye22NHTJnp0lh1fyrX/
	 ojJmHHOmdCLRdJWoz1TgalzSl6LeCPDbZdCgdm1yUxcO6J5IIQ8Oi5/K/kIUBGFVCa
	 vpb1yl3ikirmAwdu7etEsLVzlYtWvB8ruE5T6kr4Ug7m5+5HXXTRqwmkIPSU7K998P
	 5NYaIPm/NHdqaofNtP++lxb0Z6vOzg8OuimecgsX8Wn8WpVNfZq+YI8L4IL54XB6Vb
	 ohfhTfHfKJRuQ==
Date: Wed, 25 Oct 2023 17:50:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	mario.limonciello@amd.com, venkataprasad.potturu@amd.com,
	arungopal.kondaveeti@amd.com, mastan.katragadda@amd.com,
	juan.martinez@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	V Sujith Kumar Reddy <vsujithkumar.reddy@amd.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/13] ASoC: amd: acp: Add acp6.3 pci legacy driver
 support
Message-ID: <6737a19b-e7fe-4f71-8a78-bb6641ef067a@sirena.org.uk>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="38zF0B7y5SHLAe5+"
Content-Disposition: inline
In-Reply-To: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
X-Cookie: There's no time like the pleasant.
Message-ID-Hash: ADVBKAK7EH22GFGN3CFAUQS4QB5PONQY
X-Message-ID-Hash: ADVBKAK7EH22GFGN3CFAUQS4QB5PONQY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ADVBKAK7EH22GFGN3CFAUQS4QB5PONQY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--38zF0B7y5SHLAe5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 21, 2023 at 08:20:42PM +0530, Syed Saba Kareem wrote:
> Add pci legacy driver support and create platform driver for
> acp6.3 based platforms.

I've queued this series for CI - there were some valid concerns that
Amadeusz and Krzysztof raised but they're relatively minor, please send
incremental patches fixing these issues (assuming CI is fine).

--38zF0B7y5SHLAe5+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU5R2EACgkQJNaLcl1U
h9D2uwf/Va2K24zGuvAUR9qxV9KY8tpVbPjMNGc5Ir2a62mmQM/ZHNUpAZ4oNjdA
cxA+hZYK4zDT6xv92tIumgsRVA8IPHSC0mWrcHzHQhd7UllWSE4Od7l+OIY83jck
c8tplZIdX4u02e5JouzCtawktxXF6OhITSBhbGEo0gK09/LY4E0lWZdXW3h+/hxl
F8oytBa/vsdx0L9b+waZVBc7PpKxETvZV2Yb98UAzO6gWXbGC5Vx6WFOQubufMNe
V8GZLjwdCXXH4i0rvpt17JtMN7X2YMub8CacewUcZ9yU6a8TDaHoHiOBLOJ+sOCv
CgCuu59wH8Xg0sInTGhI6vyhEmaxgg==
=cbvt
-----END PGP SIGNATURE-----

--38zF0B7y5SHLAe5+--
