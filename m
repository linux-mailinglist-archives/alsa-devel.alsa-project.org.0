Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4089DBA84
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2024 16:31:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 967172C68;
	Thu, 28 Nov 2024 16:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 967172C68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732807908;
	bh=caA69x6QUAyZ/eXBBtCJk6xQcdI5mH/IcuVdWXMQYkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PWdA1RN44pc2mKCJB81vsPbxT9dcZ3CrBAp91+PVbDotHHtgqdaiZNMWdEAmkMVrn
	 Z2IlP/kI/hOFCjtJiyqx7HyhTRCfkBbcYJ13FjV49RxTFO57VsyLrZ7zN8VuOhjHls
	 h79cgjbppq0KkmfCMuX2IfjVhEeg0uvZeV6oY9Ag=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 368EEF805C1; Thu, 28 Nov 2024 16:31:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB1A9F805AE;
	Thu, 28 Nov 2024 16:31:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D200DF80236; Thu, 28 Nov 2024 16:31:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19F43F80134
	for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2024 16:31:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19F43F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h46E8anA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B23BEA41581;
	Thu, 28 Nov 2024 15:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C638BC4CECE;
	Thu, 28 Nov 2024 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732807867;
	bh=caA69x6QUAyZ/eXBBtCJk6xQcdI5mH/IcuVdWXMQYkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h46E8anAEw7U0AhUKZLSPRPhPXoPIHKcbr0aE426YXbEUtfCyIVigLu0d2QuXacHL
	 kaBxieGJaDGQLT6fPBQf2ufblekZezR7O9Lx/GYHpRNvfhN62Qvqu79A+8gz4xHhdZ
	 iGZPTz3IXoxTYZrTPc1twemDUFcISigMk0R1zC7eeB6sqOG5fjKyWhh/b+PfBXJ0ne
	 oseVvlbyvLF/R1r4RrUhCbD7NDcpeDx4bDvP34PpkDtYCRVolh8uI1Y6mI/FwxU0Xn
	 I1QsGQBuU+JzLUjmO69lTWe1K4zu6U4sMHU8TEyGsq9A2GKRbL9n4SZm9269DbfLOY
	 prl53gNNxLvbQ==
Date: Thu, 28 Nov 2024 15:31:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Maslanka <mmaslanka@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: Intel: avs: da7219: Remove suspend_pre() and
 resume_post()
Message-ID: <444630f5-1f0c-47ea-83c7-f267473be115@sirena.org.uk>
References: <10062d09-34c8-4e53-b5d7-f96a5b19f6f8@intel.com>
 <20241128151239.1666582-1-mmaslanka@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9qTyXkEkKJ2cvz5U"
Content-Disposition: inline
In-Reply-To: <20241128151239.1666582-1-mmaslanka@google.com>
X-Cookie: Close cover before striking.
Message-ID-Hash: BHXUWVOVZCRU7HKVAOUYRMNRS7OBXFZA
X-Message-ID-Hash: BHXUWVOVZCRU7HKVAOUYRMNRS7OBXFZA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BHXUWVOVZCRU7HKVAOUYRMNRS7OBXFZA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9qTyXkEkKJ2cvz5U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 28, 2024 at 03:12:32PM +0000, Marek Maslanka wrote:
> The presence of a plugged jack is not detected after resuming the device if the jack was plugged
> before the device was suspended. This problem is caused by calling the
> sound/soc/codecs/da7219-aad.c:da7219_aad_jack_det() function on resume, which forces the jack
> insertion state to be unplugged.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--9qTyXkEkKJ2cvz5U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdIjLQACgkQJNaLcl1U
h9CAoQf+MYRy+uhu/IADACa8/W5qZIcsxp8SOSlPDPS/oN7yYvI+TnXlTmEmUTuz
UIiJbgg7O1SZmFKyM5jR1jHGpDXlN9N1+5q7oxvFcaWR7XmgYpGhzFMkT238DPyq
538hghLgOAgcPDp2kD4gf2bwzGK8cHrh/tsppjGLsGc6Vila/AdN+dl1z/RN1wRK
OYuoIrMDdDOv+YT56Um6PBZfhFMKt226WA2bdvF+rjaQpAwude5auNBpR8VWl8Mb
O37HpDBj5/4A1oH+/RWNmbzRAd0wblAhkWA8Ji5VdgDx1dezudkn0wS/cppi58/K
UMmlY9EjtFmzrl/KyhHs+BiS5L0omw==
=B0Zs
-----END PGP SIGNATURE-----

--9qTyXkEkKJ2cvz5U--
