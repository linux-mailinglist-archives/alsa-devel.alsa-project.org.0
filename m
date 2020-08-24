Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6579B25089D
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 20:58:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2747167D;
	Mon, 24 Aug 2020 20:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2747167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598295536;
	bh=o1tUIdH9Ap42442DQcL2dReZ1Lqyl3X+JxStUzi8Qhk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HdUqQvWt5aU1BBh7Cz6OlA0p5hdCPHhrli2zDN7uWGgDGvFvGZ47hF8Kr26uw8ZXi
	 1owoUV8qLBEqkblINJgLsEqe3lF4/+rcJLIpewgT53bSAgrvUuck/GnBXGbe/rA3Fq
	 ruBvlb1A9xUnCxchMogGBH0Un207IVUg/dkAuB9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0972F800B8;
	Mon, 24 Aug 2020 20:57:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8860F800B8; Mon, 24 Aug 2020 20:57:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0504DF800B8
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 20:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0504DF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WsPTFxcD"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E85F7206BE;
 Mon, 24 Aug 2020 18:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598295426;
 bh=o1tUIdH9Ap42442DQcL2dReZ1Lqyl3X+JxStUzi8Qhk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WsPTFxcDlgLaXYooScqJ1plWoz5gDiNvSvzGAsuyNjBbd9Q1HwzPfynqKfY9AY3//
 7j3cNbjAa1m/be7PRhc7mHk5DQrYw8LyDt+k/ySKfjQWNl+Qso182AYxvPfk4YQslz
 Dlpv6FHvax2ysHX5bkMWMtpKVrDJVMXtm07g7RJ8=
Date: Mon, 24 Aug 2020 19:56:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 06/14] ASoC: Intel: tgl_max98373: fix a runtime pm issue
 in multi-thread case
Message-ID: <20200824185631.GE4676@sirena.org.uk>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
 <20200821195603.215535-7-pierre-louis.bossart@linux.intel.com>
 <20200821215550.GK4870@sirena.org.uk>
 <9f8dca62-36b0-7ded-92f4-485441f900fc@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SNIs70sCzqvszXB4"
Content-Disposition: inline
In-Reply-To: <9f8dca62-36b0-7ded-92f4-485441f900fc@linux.intel.com>
X-Cookie: Weekend, where are you?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--SNIs70sCzqvszXB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 24, 2020 at 09:24:30AM -0500, Pierre-Louis Bossart wrote:

> Do you want me to resend with the tag, or can you apply it directly?

It's OK, I've got it.

--SNIs70sCzqvszXB4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9EDV8ACgkQJNaLcl1U
h9BWjAf/USlJ9QH9oobLrF7D1a2BXDgu/GZog/Z8C0xJ5QWAWb24aV8zIPDmRMsO
qetJtLC0wlRaZvEh5yRBDuXFKUwZSa/auZIKfp149IcOH7KJwS6NM3w99EZjabW+
JFJCm9INZEe1nyXlnHCHdpuTaX7XoBWukIOZERtRCO9sXcXinnChfERBq/ftnujC
zwjPGjAkVaTnBtJNAFJKFfMI/s288TCV+tthnt1ownp3Pn3MpaSTu4nbCPR61UmL
CP4rING2PeSsqdL1wwMQM/iBpg3AIpnluLR7Lpz0ZjOFWpFC8nSCJq5X0Am/iWsM
eeGmLvss6mW/gt2SQu7hH3y+bnsUng==
=Nqlj
-----END PGP SIGNATURE-----

--SNIs70sCzqvszXB4--
