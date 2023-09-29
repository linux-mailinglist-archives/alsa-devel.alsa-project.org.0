Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9C67B36CD
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 17:27:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FD4CDF5;
	Fri, 29 Sep 2023 17:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FD4CDF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696001248;
	bh=1uWI/HKeZ39XlHxXsGDtE/NQKB9oNAo507xTe7RoeW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iClktgD2DCMW0N8BiddaWGGFoGHsoJyhU7oCQ7X9AsPtIp7dtfPrk+/n8WDtcCBmR
	 VlpIPL9x12UZpHao6kJ60nX2/0cp2mQDvMidFhQBm1/hpbi+62/p0E3C0Kwuf0olc0
	 gP5Lq5fGnCqG3wjpDekbsD5/jlnfIKd0IVrTLfJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B4B3F8055A; Fri, 29 Sep 2023 17:26:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47478F8055A;
	Fri, 29 Sep 2023 17:26:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63D00F8055B; Fri, 29 Sep 2023 17:26:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CD23F80552;
	Fri, 29 Sep 2023 17:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CD23F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XFflkkDA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A067CE243B;
	Fri, 29 Sep 2023 15:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77470C433C8;
	Fri, 29 Sep 2023 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696001153;
	bh=1uWI/HKeZ39XlHxXsGDtE/NQKB9oNAo507xTe7RoeW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFflkkDAZYLohwshQUtjacZij6ttS0tiDi8W1TSZrN1UM6L7Vu5llaD2SEbkyRpwQ
	 UjTgfCmhe5c4L4NZQz0GlPNCtL9E4jqBFT2hP/RPxg61jqdUDLEvbexoVyNkiEwgFG
	 YrOmvXnFt0S73Xn8v+mI++Cx0ysrPLxJnmzlsgarF/dVKygbq3PlrF0vh4cbimVtGI
	 n5aGDoEee1CrgH7iFYpn8biAxEYtCAaK1eZVQ/mMfUX7dw4fAT3aANHejP88H3OJyR
	 An+tLLXI8s0O1BCM8/9CWNUwBfx+TbumiXIvQJe2MqfUtNyivI1RtgNFcBnOwktX9i
	 34wNiBP0gCy0A==
Date: Fri, 29 Sep 2023 17:25:51 +0200
From: Mark Brown <broonie@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v5 01/12] ASoC/SOF/core: Ensure sof_ops_free() is still
 called when probe never ran.
Message-ID: <ZRbsf9yD8r11F6DL@finisterre.sirena.org.uk>
References: <20230929145123.233838-1-maarten.lankhorst@linux.intel.com>
 <20230929145123.233838-2-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qd9T3iGoAIV0YcIs"
Content-Disposition: inline
In-Reply-To: <20230929145123.233838-2-maarten.lankhorst@linux.intel.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: UJN6V27KCPZ2OSOQ55F3FJMMPXPCQAJD
X-Message-ID-Hash: UJN6V27KCPZ2OSOQ55F3FJMMPXPCQAJD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJN6V27KCPZ2OSOQ55F3FJMMPXPCQAJD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Qd9T3iGoAIV0YcIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 29, 2023 at 04:51:15PM +0200, Maarten Lankhorst wrote:
> In an effort to not call sof_ops_free twice, we stopped running it when
> probe was aborted.

Acked-by: Mark Brown <broonie@kernel.org>

--Qd9T3iGoAIV0YcIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUW7H4ACgkQJNaLcl1U
h9Bp1gf/Z3D4fi2MOszGZL6o2HGo6TgiB/VbRfXvFFZJa+hjx+pvBTId1ioluOpm
LToU1SpkiRTLWRjA8fxxzRwJmGQhBQJyuo4cbAlcm4pwZ6lV0phxm+W1MmZKXKAz
1NrTwefwGj68txXO5JdDW+w7XF1l1ddazN5zWLBl/kiGKLE5RoIEIVMfR8CARFY9
jfyR6igGzW8Ob7zPkJRXPi69xpqJmWZoCwed2KdB4q2OPq5chJ7tMp9iVe2Cd4tl
YdQP3XLtkmtkX4YBzvcwbOC9yqmZ3mdLHQIIe+WO+sBZtWO6bh88YWpgvQtZVZ8m
FFW4k+PPpS/debehX60OETjxneOlqQ==
=S0Jb
-----END PGP SIGNATURE-----

--Qd9T3iGoAIV0YcIs--
