Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 865ACB53B74
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Sep 2025 20:33:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3054860219;
	Thu, 11 Sep 2025 20:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3054860219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757615596;
	bh=HVawjMcQczynRglGSlCyy+kwMjziDRllYDRfqUgmecQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sVyxx/jaxMOjDlm2S76ieomUp217cD9l2NsQLCBmLyT+XAhkZ3+WHz3ur4oNz191c
	 nZle54AMJIPfHjT9ISJrkQoZQFdUfGgOGTuwq5Ep12UFob5axlqL/TR0Bj0BztLWwg
	 QbQhIFPV6bz6ZOUOs2KeiCWLN8SqM+sQwKwbOAoU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18627F805C1; Thu, 11 Sep 2025 20:32:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75C1EF805C0;
	Thu, 11 Sep 2025 20:32:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C29CCF80518; Thu, 11 Sep 2025 20:32:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73680F801F7
	for <alsa-devel@alsa-project.org>; Thu, 11 Sep 2025 20:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73680F801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fTlhMwFq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7828B437D0;
	Thu, 11 Sep 2025 18:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55962C4CEF0;
	Thu, 11 Sep 2025 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757615526;
	bh=HVawjMcQczynRglGSlCyy+kwMjziDRllYDRfqUgmecQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTlhMwFq+63syrURiIERJz6aKhuNRgLCWi/pHK97ZgyFSfmlPWyey5+fwBCdSW5Ht
	 ZbyPIuu2E/ePFfiHHuRMclEybQY4Jbd8lFix6gbTpRQPEb385sy4YySFOE0/044h+s
	 L0p5BHVYfJ85Vbq2RHy/QfDbZRHSTu2vhVoIhjgYiEWPSdp0zVwKxB4akdXKmu2R92
	 lSlzIKh++DVmPOg/uorXgdWfRXkjFxJnND+qw6zFnPa0bKl4dmZWoPrTCl4AsfB8E5
	 3BgsM2UxrdQrFrb6hK/hc4IULjkuet5CRL/4/AHARvBQ7sbZjPnEwF3b/aQMpZU6L8
	 Yw9aDTGEuYUog==
Date: Thu, 11 Sep 2025 19:32:00 +0100
From: Mark Brown <broonie@kernel.org>
To: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"Hampiholi, Vallabha" <v-hampiholi@ti.com>,
	"Xu, Baojun" <baojun.xu@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH v4 2/6] ASoC: ops: add
 snd_soc_get_volsw_clamped
Message-ID: <fcde8a20-dcd1-4f2f-8257-b8e29369305e@sirena.org.uk>
References: <20250911155704.2236-1-niranjan.hy@ti.com>
 <20250911155704.2236-2-niranjan.hy@ti.com>
 <652726cc-b286-4ba0-b49c-8b981d6d0244@sirena.org.uk>
 <41a87c2b7f21467d833b7eefde8e63a0@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wz+D+05ykIzKd/3V"
Content-Disposition: inline
In-Reply-To: <41a87c2b7f21467d833b7eefde8e63a0@ti.com>
X-Cookie: Your domestic life may be harmonious.
Message-ID-Hash: CGZAXKAAS2UFRBUYC6DLRBOUISOMLOE2
X-Message-ID-Hash: CGZAXKAAS2UFRBUYC6DLRBOUISOMLOE2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CGZAXKAAS2UFRBUYC6DLRBOUISOMLOE2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wz+D+05ykIzKd/3V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 05:21:14PM +0000, Holalu Yogendra, Niranjan wrote:
> > From: Mark Brown <broonie@kernel.org>

> > Why is this a separate API, what is the situation where we would want to
> > report an invalid value from a control?  I was thinking of just adding
> > this to the existing operations rather than adding separate ones that
> > need to be explicitly set.

>   Since few of the drivers as still using the original API, and was not s=
ure if
> everyone wanted to clamp the register value, did not want to disturb the
> original API snd_soc_get_volsw. Per my analysis, if register read fails d=
ue to=20
In what situation would anything want to report an invalid value?

> some issue (like IO) and, for some reason if register value was modified
> to have the value greater than mc->max value, the volume is report errone=
ously.
>   Are you thinking that this patch could be dropped and clamp the value t=
o max in =20
> 'soc_get_volsw' (as in 1st patch) and use the same API ? Please suggest.

Yes, everything should report valid values.  I/O errors should be
propagated as errors.

--wz+D+05ykIzKd/3V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjDFZ8ACgkQJNaLcl1U
h9DhDwf/VutNkY/S+yvt/e7kV3OOg13DJI2Uc58GTgBOZ47hylTbuSNRU1eNFmCN
gy6RwcjBoitXHIQ+snFV4EPHOzKwBYtKTvc97rS41zBEFm8bfWwQuT23CcT9rBTa
VHAz8PxWo/JoTa9o6URi6NAIWs8Pp3ijTqDV5RDveCpWtY9i4VJTFdfPlY8JAw94
52PDO0L+nUNb2bNgF6CevLZSRU+GxvegUFsAfbye9Ljo8283SmD6RZBtfXlQWJ/x
UZoPCwhvGhM1fSRH7l20fnSEoGMAzsK+CPOqMEJW5xLajqmvqzzCQhe35lyyFO79
T8VCl0FEi3j3YVC0vk0gHj7eTRbbqg==
=AhOl
-----END PGP SIGNATURE-----

--wz+D+05ykIzKd/3V--
