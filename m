Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3321A757F19
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:12:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 690DE1F6;
	Tue, 18 Jul 2023 16:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 690DE1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689556;
	bh=GYbp7UBI7iFTj62OWBizSfS7AAbUCmizwOqllItI3GE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jl0PkN8Iy9CQw8iv7lC9Hwq26vKmNv0dEUOQ8zUH2RSuLdRMCxsQ2U0pWkwYerNFU
	 juU9Ila3EHO1EowgrCOcYQ1oAYM0K0Q+a/wWxv0qhv+m6OBF9+X4ibb5R939gXUUW+
	 0b4LaBSDJoCFpe+z6b9InLnRq1MUGomDcOmOmQv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E81FFF8047D; Tue, 18 Jul 2023 16:11:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BE0EF8027B;
	Tue, 18 Jul 2023 16:11:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0088F8032D; Tue, 18 Jul 2023 16:11:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E020F80153;
	Tue, 18 Jul 2023 16:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E020F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XAe2OAh/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E8FF615C3;
	Tue, 18 Jul 2023 14:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368AEC433C9;
	Tue, 18 Jul 2023 14:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689689469;
	bh=GYbp7UBI7iFTj62OWBizSfS7AAbUCmizwOqllItI3GE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XAe2OAh/mqiuLhMH8IGw7Lw1rb0YhPtNNx6B00jbm3/jkNhe11cuVweGTIfPiXckP
	 L80Rd9OIKDMi3xpqZZcvwdELCx/ARo5BQb/uSM4l/7bR6IFz0ViDVEw6KdL6md7bk2
	 n55T4qHy6xa/2y+gr34KZuDC4BywyTdRs4u1CXS7gd99pn++N7mY+ub4j0YogNJrh7
	 UUM6Nhct+qOi1KWf7WIu97FfsLPCn+C2Ih61uePShIFHDmnHAnxmVkpiy0ghL7Z3ad
	 4HVOOOV+91J4FZ4FCZyyjcrZMJOqU+DnmYUF/S+mJ486RTfnCIxkmXrNbceBQ3FxP0
	 lX8DG93xUUYog==
Date: Tue, 18 Jul 2023 15:11:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH 3/7] ASoC: Intel: avs: Move snd_hdac_i915_init to before
 probe_work.
Message-ID: <ce4da0ed-c938-49f7-be45-f65cbe1cbcc4@sirena.org.uk>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
 <20230718084522.116952-4-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bEiL2V7XbHOmNFoV"
Content-Disposition: inline
In-Reply-To: <20230718084522.116952-4-maarten.lankhorst@linux.intel.com>
X-Cookie: Nothing happens.
Message-ID-Hash: EZO5MBZ55ZREK3YKFBHB7AVUJIVJ37EE
X-Message-ID-Hash: EZO5MBZ55ZREK3YKFBHB7AVUJIVJ37EE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZO5MBZ55ZREK3YKFBHB7AVUJIVJ37EE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bEiL2V7XbHOmNFoV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 18, 2023 at 10:45:18AM +0200, Maarten Lankhorst wrote:
> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> the snd_hdac_i915_init into a workqueue. It's likely the whole workqueue
> can be destroyed, but I don't have the means to test this.

Acked-by: Mark Brown <broonie@kernel.org>

--bEiL2V7XbHOmNFoV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS2nXYACgkQJNaLcl1U
h9CKMAf/V/cVn57TQ7LJoUtQJ3S1r4tnvZWxjgaI/8+N9nM3+NM4RMV9Zp4lJ2Ar
fB+bZ342dedQvTeGOAb59imgrhKAk85sMfuc/HjVtWZj4qe48tARXy0qjU+65uLa
aytmtp4J1vJQt1NzZxTXJRUZwI3KRWAafbvao8eXXVymugajOqmRVZGNQGlOfXBs
uO7YUUvxgsxCDSXRG+8MiNRgXgkKhp06dgTVPYt30gNSNCTfZ9LSXSc3K//dEw7w
Fsroa+d3HSIcWzoVeEK6dED/snChGRFcQIvgx1dAjRerFzeNNNEKoberi0cXbI44
0PXFN9Cm9PzExS0NFom01Q8+eagbMg==
=zpvD
-----END PGP SIGNATURE-----

--bEiL2V7XbHOmNFoV--
