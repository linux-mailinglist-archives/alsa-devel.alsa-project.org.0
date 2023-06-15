Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B91D731D33
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 17:57:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 612E4827;
	Thu, 15 Jun 2023 17:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 612E4827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686844665;
	bh=81m9Vmffhc3FqRRrO4ay/UJLQnvq0BnK8Q/r/d8P7L8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y49NZKDH/kD86tLSW06J3mguTIIb7ydmwXJ/FmeWJRWVBDalpfpJeaPiwmhgzSkya
	 7oPN1yM9BAmLDnaFxIzL+w+C/hDpnl7P9YBa6jKOMyF2qxAOE5IodVqHtnjWkzvLA2
	 YDNV4rKZGG12YZeWbrwHJC9kc9yGqmr6dmPdTUhs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43DC7F80301; Thu, 15 Jun 2023 17:56:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A744CF80130;
	Thu, 15 Jun 2023 17:56:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C8A8F80149; Thu, 15 Jun 2023 17:56:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F312F800ED
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 17:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F312F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TI2UIp6z
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6CED460BCB;
	Thu, 15 Jun 2023 15:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D58C433C8;
	Thu, 15 Jun 2023 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686844583;
	bh=81m9Vmffhc3FqRRrO4ay/UJLQnvq0BnK8Q/r/d8P7L8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TI2UIp6zI24NA0wCak9uyhggg/zcJ09fUad71oE2r72K5RCL+Yyk861RfzkEKS9FG
	 dXLNhvlSVKBN5sDOh0rlhqtVxnRjdpCflGXCZ3eR6+EPwpLFviqx1hFDR/yrGEmzNP
	 0tKTksMtiClVD8LH6/pp9IDv76lDEPUgjr/sFCB8Gos7J84yW6WOoyw69bERUqsu3e
	 38Y3oxi5kAKD8n1u32ZBhFt5vaKla/jvLlCGCEv82O0lm3SFtmsFrKHn3gkBhi4Qar
	 eg5YOYJCaVynvxB/3AebNgI2Eqw2Lt8r+1McmlThRsbpvvkNsFS2VTqY5W6KrK94y4
	 Q8ZFWIfObO0RQ==
Date: Thu, 15 Jun 2023 16:56:13 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
	Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4 4/9] ASoC: amd: ps: add SoundWire dma driver dma ops
Message-ID: <bf711135-8959-4ea6-b1e7-4adcb11dab67@sirena.org.uk>
References: <20230612095903.2113464-1-Vijendar.Mukunda@amd.com>
 <20230612095903.2113464-5-Vijendar.Mukunda@amd.com>
 <0dbd1c24-0006-7956-9b82-780c7f005927@linux.intel.com>
 <36242cca-b20f-03dc-2d3b-62a797291af7@amd.com>
 <2c4fb68a-70f7-6d75-951b-ee7fd209fa8b@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kUsvJ1h86RzSufS+"
Content-Disposition: inline
In-Reply-To: <2c4fb68a-70f7-6d75-951b-ee7fd209fa8b@amd.com>
X-Cookie: You are false data.
Message-ID-Hash: NAAGEUTEOFXFMQV3AH6U4D5W2K5IETSV
X-Message-ID-Hash: NAAGEUTEOFXFMQV3AH6U4D5W2K5IETSV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NAAGEUTEOFXFMQV3AH6U4D5W2K5IETSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--kUsvJ1h86RzSufS+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 15, 2023 at 09:20:08PM +0530, Mukunda,Vijendar wrote:
> On 13/06/23 12:30, Mukunda,Vijendar wrote:
> > On 12/06/23 23:36, Pierre-Louis Bossart wrote:
> >>> +#define SDW_PLAYBACK_MIN_NUM_PERIODS    2
> >>> +#define SDW_PLAYBACK_MAX_NUM_PERIODS    8

Not seeing any new text in this mail?

--kUsvJ1h86RzSufS+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSLNJwACgkQJNaLcl1U
h9Ahogf+JLkkhAqsPebM24o79GcLJ7Mn4RC6lzjRNbjVJmn1JBi8jRcxcZ7I8lm4
6u9gx2T+V0TQIwH21NgvDEKSXDJZFm7D1I8A8/nIYeI7PUqA+k1MMC9HFXi5K8S/
KzpUV2jGc6e4OaEhL0OFXazl6+fkaMvidAfNKoGLQTQYB6nY+teOCGg6aJ+IfvP6
AP7htfr+bLtDZiJlPwKt+SUMtVwgr8/Nps7HsNLvzYG6YQT+K8P3JZixWS2RJg+O
UgQUK30E73e96NVKUjDJfutmkfkXZKcTiPdW9OsAY5CgHQbZswxc+/TVUCq4c+sb
jxpssmwBg9eWz85wUqGdGjUN4RDz9A==
=99Av
-----END PGP SIGNATURE-----

--kUsvJ1h86RzSufS+--
