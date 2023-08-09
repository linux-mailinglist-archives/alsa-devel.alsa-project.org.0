Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B984B775E3E
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 13:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13AE1827;
	Wed,  9 Aug 2023 13:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13AE1827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691582014;
	bh=wrwa8A8AlbYmYkC474844ciWl9EHwCJ7VmVBeFy1c2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aWPqVoqd3GjYz02YtuD5NqLco2NxGDEZZi4uRzpuaebOc0Xd9BirD3H04Qy9xwcr6
	 E0DNS/0ImIHU0T3/0fG70WsoP7q+ciGKeazLOKN6PVTe2hE3adID8AsD22cnqVDfUw
	 8Iq4PySwxStH3uj262kcwDvyAUHFaKg526GsKKIY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10946F80536; Wed,  9 Aug 2023 13:52:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0350F80116;
	Wed,  9 Aug 2023 13:52:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D0EFF80134; Wed,  9 Aug 2023 13:52:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C91E7F800FB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 13:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C91E7F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jb0z/sZI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 525436377C;
	Wed,  9 Aug 2023 11:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDADAC433C7;
	Wed,  9 Aug 2023 11:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691581949;
	bh=wrwa8A8AlbYmYkC474844ciWl9EHwCJ7VmVBeFy1c2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jb0z/sZI20AKDBfyUi3kr2Gewf9f/d+oJGURXNGZO9mRSTGBffxTu1PxJtvLadv76
	 vvB0Qun2GaSEa/EnmeUKI8oJD3qzVQIu+jfojpCueJle6JLKlpFi8K1D+7XXuKzgyK
	 eFNjC983jW024ffCwN8LpjPPSEpGZkBCtgqxyoZlhSoZunIBsGiGDtTbNHk2AMQC/J
	 dxHZe/zkUQXTZ2djlyY1WtshjoruMjwySoS+tCrwVznQ86Gux4OvoKQPaPXIAy+p/p
	 +9dPhPd0r7a2Blo2M1NkTH0yU95kpsoC0Gqs73Eq3CminxFAmeol+jWQe5QYH/9jRk
	 816XwKLV5lE+Q==
Date: Wed, 9 Aug 2023 12:52:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	adrian.bonislawski@intel.com, yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Update the basecfg for copier
 earlier
Message-ID: <cacbebb1-8c0c-4a4a-82df-00e932df3e7b@sirena.org.uk>
References: <20230809092343.12666-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1dooXcuoUBMN3FAO"
Content-Disposition: inline
In-Reply-To: <20230809092343.12666-1-peter.ujfalusi@linux.intel.com>
X-Cookie: YOW!!  The land of the rising SONY!!
Message-ID-Hash: K44FECUSY2WXDHU6P3KVBGXYNB3M37UY
X-Message-ID-Hash: K44FECUSY2WXDHU6P3KVBGXYNB3M37UY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K44FECUSY2WXDHU6P3KVBGXYNB3M37UY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--1dooXcuoUBMN3FAO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 09, 2023 at 12:23:43PM +0300, Peter Ujfalusi wrote:
> The sof_ipc4_update_resource_usage() call updates the CPC value in basecfg
> and it must be done prior to making a copy of the copier configuration
> for the init message.
> Other module types do the resource update as last step or in case of a
> process module at the correct time, before the memcpy.

This doesn't apply against my for-6.5 branch, please check and resend.

--1dooXcuoUBMN3FAO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTTffcACgkQJNaLcl1U
h9AbSgf6AhIbxiVtH/mV3VHApvtsUoxUYbp1Na3zZRrjBcn1B+CKUJeMAVBksVKI
/zZecN4ue6mjLCje/OqlsfuJ1doXJkfDvPJRzIyUwUjjd33IuWj6wX8WP0+HVXBw
kSv0x0V1y5MWf0AYzVv+7atr5RtosmqmRK1mVLEsJP/czDPz5sxAnCje+rhop/IC
FKA9zS8F2HdQ2Kursy6lHqm+H+bYgPQBVaZQBmSzl3I06Bstr0vbc5iahAxBbNQL
hMuXda2H/e1EvVYv91yfeSHxcBI0z8XfyQVeVAuQQXKCjvfKToNTCj2LOHsCqPXO
7vivRkj1aUK6fOXfbGjj9TCTuER6dg==
=4kfh
-----END PGP SIGNATURE-----

--1dooXcuoUBMN3FAO--
