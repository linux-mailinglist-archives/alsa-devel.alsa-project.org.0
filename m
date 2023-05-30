Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED63271664B
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 17:11:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 497873E7;
	Tue, 30 May 2023 17:10:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 497873E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685459464;
	bh=wryI4tdQDgbZWVnUP9w85TteWPxdbDUHs17eIPd3Pk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kKSFoKNf1G2Lhkxr+20T0WQog5IKKHxKnK+LSLfDV0a3EdlQMDCdQ+/GRGZWZ5eGA
	 0uOK+adykvukITuH/ygudukrdQMhT26FfPAr3dIuzXXafxjy4fHdpP+x5kteoqxArh
	 l1m4wxAzXiPlQXpiTVMHX0/fFDtL7L/FFguIBDEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DEE5F80528; Tue, 30 May 2023 17:09:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B77D1F8026A;
	Tue, 30 May 2023 17:09:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE65BF8042F; Tue, 30 May 2023 17:09:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1417F8016B;
	Tue, 30 May 2023 17:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1417F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q7dz+Zin
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E562D63217;
	Tue, 30 May 2023 15:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6969EC433A0;
	Tue, 30 May 2023 15:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685459379;
	bh=wryI4tdQDgbZWVnUP9w85TteWPxdbDUHs17eIPd3Pk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7dz+ZinnwzYE7sWrtr7UN6CTapRrQ7nMmnaxCwm3B4Dl9MK8Xx1Uw0fdQJPLqEyC
	 FcFruwtX8AQtl/NU0aebiEUR/qnDC8yrTW3otN26bhjpQxxhLQ0d2J4/f1Tn/ALDQO
	 be+0Ct0JCWXif91bjcs0QbmikRjd8TmLTISejZyppKl8kZdLcXe5Q3JwNUDzFHbQh5
	 ZwrdjNE5HutW/5jHjsrnw08qi8oxI8KAqHTKZwZkDRwXAb+Oh1Nmp8RchT4DdJL2S9
	 6NPAo2d/v8CM7yuaBS9wqqgnEhKfH3zA+ZpAQd+iuthmPx6Ka0hdmuTeRIwoEUQBI3
	 I3nt9spqjBzKg==
Date: Tue, 30 May 2023 16:09:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Lu Hongfei <luhongfei@vivo.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
	"moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
	open list <linux-kernel@vger.kernel.org>,
	opensource.kernel@vivo.com
Subject: Re: [PATCH] sound: Fix incorrect calculation of object size by sizeof
Message-ID: <bf2b90ef-2753-48c7-901a-837408f3ea15@sirena.org.uk>
References: <20230530072648.13998-1-luhongfei@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pJveqnZYymoAzsuI"
Content-Disposition: inline
In-Reply-To: <20230530072648.13998-1-luhongfei@vivo.com>
X-Cookie: I've read SEVEN MILLION books!!
Message-ID-Hash: BXUPKBFKFLABQVFW2GCGEKCVARK7QSVS
X-Message-ID-Hash: BXUPKBFKFLABQVFW2GCGEKCVARK7QSVS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BXUPKBFKFLABQVFW2GCGEKCVARK7QSVS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pJveqnZYymoAzsuI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 30, 2023 at 03:26:48PM +0800, Lu Hongfei wrote:

>  sound/soc/sof/ipc4-topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  mode change 100644 => 100755 sound/soc/sof/ipc4-topology.c

Why is there a change in the file mode here?

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--pJveqnZYymoAzsuI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR2EawACgkQJNaLcl1U
h9Dd0Qf/SD5QP7FL+QiJqk6A+gNJFHxv9SGXVWLm/wU6Fx00qWrYSu/dVSGBq7Iz
41skSTsgcYcvvXUxZFTSqnO7DJGigEaOExkE9aqAxod2EIdSU6NnZlLBLbEYyNmQ
DQXMnX4GYtx0OhuDGX3JTFfldz7AoffO5w16D31r+l9zQhBNC/oOi5M96EirA0oX
c5V7C+oPeEPZg89afv0pSOtc1Orkqvwis5BR9idkDYn5lQtR8CNrW6lo5p4iN4uF
baunbDALk038fqMEAPXb7RB19dUMT+NNQXguz8iBkwZlD2AIyLSqLNfedzbDjWcu
Z83/zupMP+A0HiMawpqMPeULo+5aEA==
=uufS
-----END PGP SIGNATURE-----

--pJveqnZYymoAzsuI--
