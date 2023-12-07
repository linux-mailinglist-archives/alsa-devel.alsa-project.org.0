Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B8A80899F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 14:56:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE110206;
	Thu,  7 Dec 2023 14:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE110206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701957384;
	bh=0KrrLtNYr2L6iRo6TQxtDmuTIiNc7jPNPVUjnkZZ2OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y+MJybKcL5Q2AcHs+9C16BljOStDLS7nt74bAqcJ/8jdRwfMUTDCmmNWTTXpV09AQ
	 hqUBXglepFxNJTeaCn9HWCKP2IjnqXJCqkapD+6y1ywa1d3RmQSRrJecdidazjomcA
	 xLyZUiBmywtJT5bdrQ6FTbBYnVoAiUDmqDqbUiLw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49E2FF8057E; Thu,  7 Dec 2023 14:55:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0376F80570;
	Thu,  7 Dec 2023 14:55:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3222FF8024E; Thu,  7 Dec 2023 14:55:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27689F800E4
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 14:55:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27689F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gLtWGywF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC1976211D;
	Thu,  7 Dec 2023 13:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8708EC433C9;
	Thu,  7 Dec 2023 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701957330;
	bh=0KrrLtNYr2L6iRo6TQxtDmuTIiNc7jPNPVUjnkZZ2OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLtWGywFZE7qALmYlEMriM5oRyFuYS8oM860kgCVEDSkhPTY9xV0YjSmrn2nW3EmT
	 6qEqD7MQ55czhDHomsXZ5Ga1yRbS7fG9oAr53qnEATXHfeUW97H5VJnx6V7CQgk8Cb
	 ttYAkd5k7PtT4oX9A9aDiAyE8auX2tnt4WMBkcn+vhreR3swq0ZulGB3yk5xtP03fg
	 F2Ix9otfo7ow3oVet5trJOjDxNDrRX6wA7Vh3l5g8qmpp5zW+YmV06VFPRDpZzVoCW
	 2ZLtDKkh+Eqb1NHpeSb6ASWPAhA+FiUCFpm6qLuau/pHiO1Vosv1Cs74I60lcN/+4N
	 JFcNQkrLCvJYw==
Date: Thu, 7 Dec 2023 13:55:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 00/16] ALSA: hda/tas2781: Add tas2563 support
Message-ID: <85b7456d-7cf3-4885-8e71-111df53e35fe@sirena.org.uk>
References: <cover.1701906455.git.soyer@irl.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x4mx+umngiD/xm1Q"
Content-Disposition: inline
In-Reply-To: <cover.1701906455.git.soyer@irl.hu>
X-Cookie: Two is company, three is an orgy.
Message-ID-Hash: Q4DH4QCPZYSU2UGBYNSGLGPHRD3X3X6S
X-Message-ID-Hash: Q4DH4QCPZYSU2UGBYNSGLGPHRD3X3X6S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4DH4QCPZYSU2UGBYNSGLGPHRD3X3X6S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--x4mx+umngiD/xm1Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 07, 2023 at 01:58:22AM +0100, Gergo Koteles wrote:

> Gergo Koteles (16):
>   ASoC: tas2781: add support for fw version 0x0503
>   ALSA: hda/tas2781: leave hda_component in usable state
>   ASoC: tas2781: disable regmap regcache
>   ALSA: hda/tas2781: handle missing calibration data
>   ALSA: hda/tas2781: fix typos in comment
>   ASoC: tas2781: add ptrs to calibration functions
>   ALSA: hda/tas2781: load_calibration just load
>   ASoC: tas2781: add configurable global_addr
>   ALSA: hda/tas2781: add TAS2563 support for 14ARB7
>   ASoC: tas2781: check negative indexes
>   ASoC: tas2781: use 0 as default prog/conf index
>   ASoC: tas2781: move set_drv_data outside tasdevice_init
>   ALSA: hda/tas2781: remove sound controls in unbind
>   ALSA: hda/tas2781: call cleaner functions only once
>   ALSA: hda/tas2781: reset the amp before component_add
>   ALSA: hda/tas2781: configure the amp after firmware load

Please don't randomly interleave ASoC and ALSA patches like this without
some strong need, it just makes everything harder to manage.

--x4mx+umngiD/xm1Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVxzswACgkQJNaLcl1U
h9AAwgf/S1XgZH7WfZcBLXTVYHiD+Hk9bDC9mmz+SWbgVNkJlWHATgTUwzAZof6f
FW7+hz4+FIhFhDLA+lO3dw9hXfozLQtXbx+jq5E4x9+1AOZuqOVCQfHORpknKrmC
DFa4JEmhF8y2NgK+dLZOzV03e24iceKKyLAVndB+zJ7kp6EzqPL+5hnRGKb6jYBD
GKj/uOGg2p++UNL3Z8Q6bP06w5k3wPiA1l5gXS2NOJVQ7WEW6tFQsVmFjzPvnvFi
WINgsBqRF3oBlaRrc7eVsg85p50hMDt7piwY8lxf64mJHOstQ6yVSXWEM76XwFh9
pnuRa0K/vHizRTDQm6LbYBJcbo7jwA==
=qYy/
-----END PGP SIGNATURE-----

--x4mx+umngiD/xm1Q--
