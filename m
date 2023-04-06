Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 988776D9CED
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 18:01:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA42CF35;
	Thu,  6 Apr 2023 18:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA42CF35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680796888;
	bh=YbH5pAHew9fOuh4vCxf5Im2hZf8hp7x5j3qBpgAhYtc=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FjL9wl2TWLtTVwjAkA47llDQIFv0SDRy+cB9dJ0fcgOrNVtmhSpopXxwvfj6P+yW1
	 7J2xIHUEEwNhl8T9zWxXAWOPpdfvIYiqqrHi9NpcRLRy4pUXh1tRwt2zhqhlWtXcK6
	 cOJyzv0Xpr0MPbSMqn76E8x5i8A+sVXss6kioyAU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93287F8013D;
	Thu,  6 Apr 2023 18:00:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A53AEF80246; Thu,  6 Apr 2023 18:00:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D21BF80149
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 18:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D21BF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tmBhoUdr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0C52648CB;
	Thu,  6 Apr 2023 16:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2B1C433EF;
	Thu,  6 Apr 2023 16:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680796830;
	bh=YbH5pAHew9fOuh4vCxf5Im2hZf8hp7x5j3qBpgAhYtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmBhoUdrV8gPoCt9jghw2S9AGU6CR7wXLhGTzIOJ5JfFQujzWQQiEZS95I5Pc6VPc
	 Ent3fgEqECQGS25eg0EcohuR3eTETjL+CvZ03BQPBbs3msc+UZhdpKLh4wQySffgs/
	 K4Zea5WnC+8bGh+lKkbx5ShV0F1tKNW3t0fOupgnCraBafJj6qXwL/5byca7Z2teHL
	 6wZ9RbzRYrG+y6jooxD6LEs0ir7mnA/T5cGPNNJSXfwxMHCdfz3qNAAneu3R+uNvyu
	 hiGA33yJ7moMzxmUNR9Yis3QCVA8lqbPTNY3Pbcw6ZMYcB2ntWZ3AKrHmeDONz/8TI
	 8aAd/nPi3yZ8Q==
Date: Thu, 6 Apr 2023 17:00:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: ipc: Add no reply inline calls
Message-ID: <0c7a0919-16af-4979-af16-38ace677a88d@sirena.org.uk>
References: <20230406155026.18723-1-pierre-louis.bossart@linux.intel.com>
 <20230406155026.18723-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="70JmGiMtPH/VxKcl"
Content-Disposition: inline
In-Reply-To: <20230406155026.18723-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: Man and wife make one fool.
Message-ID-Hash: ZRAKVYQXP2N7KVX56OJIGFJR6EWOEOAA
X-Message-ID-Hash: ZRAKVYQXP2N7KVX56OJIGFJR6EWOEOAA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, tiwai@suse.de,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZRAKVYQXP2N7KVX56OJIGFJR6EWOEOAA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--70JmGiMtPH/VxKcl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 06, 2023 at 10:50:25AM -0500, Pierre-Louis Bossart wrote:

> +static inline int sof_client_ipc_tx_message_no_reply(struct sof_client_dev *cdev, void *ipc_msg)
> +{
> +	return sof_client_ipc_tx_message(cdev, ipc_msg, NULL, 0);
> +}
>  int sof_client_ipc_set_get_data(struct sof_client_dev *cdev, void *ipc_msg,

This looks like it's missing some blank lines but that appears to be the
existing idiom so let's not mind for now...

--70JmGiMtPH/VxKcl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQu7JYACgkQJNaLcl1U
h9Cl4Qf/TrajawhU0GhLBO4c8q3m7V5QrTZ9LdcaAV1w+hl5iHNBvo865BPig3QX
ofqQJqeKAhPU2GLK/QOnynsOoKRbNp79tRlJjKrCtDyQg5oDpyHSwCD6wYzaI1ig
qZtQeiWG3JFDXl3yEWITQu0F70bMKiMCvBw5dhrOlkhsPOCFE4PFk1VhFvPl3RqV
SqUnENctdTrYXYNAVQfO2g+RehY7jqyxtALDhLJMNlQmMmHTrqlNV/iPc6wuRQQm
8Srj2syoqbk9RZmrdETMXIxYqx7ECmFo8vLsggmBK8dKGswpNoEWEErC5coRoAc6
dhhqG55MIzMD0eEmzLaLX/2l+Iobmg==
=AXDs
-----END PGP SIGNATURE-----

--70JmGiMtPH/VxKcl--
